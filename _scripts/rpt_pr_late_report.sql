


ALTER PROCEDURE [dbo].[rpt_pr_late_report]
	@payroll_code char(15),
	@date_from datetime,
	@date_until datetime
AS
BEGIN
		declare @login_am time(0),
				@logout_am time(0),
				@login_pm time(0),
				@logout_pm time(0),
				@date_param datetime, -- for getting work time period
				@date_from_new datetime,
				@date_until_new datetime

		-- get the dates
		if isnull(@payroll_code,'') <> '' 
		begin
			select @date_from_new = payroll_from,
				   @date_until_new = payroll_until
			  from dbo.pr_fn_get_payroll_details(@payroll_code)
		end
		else
		begin
		  set @date_from_new = @date_from
		  set @date_until_new = @date_until
		end

		set @date_param = getdate()
		if datename(dw, @date_param) = 'Saturday' set @date_param = DATEADD(day, -1, @date_param)

		-- get login time for late comparison
		select @login_am = LOGIN_AM,
			   @logout_am = LOGOUT_AM,
			   @login_pm = LOGIN_PM,
			   @logout_pm = LOGOUT_PM
		  from dbo.dtr_fn_get_times(@date_param) -- originally @date_until was used.. this will be a recurring issue when parameter is a Saturday.. find a solution!!!

		select *
		into #dtr
		from dbo.dtr_fn_get_dtr(@date_from_new,@date_until_new,null,1)
		where datename(dw, dtr_date) not in ('Saturday','Sunday')

		-- get saturdays
		select *
		into #dtr_saturday
		from dbo.dtr_fn_get_dtr(@date_from_new,@date_until_new,null,1)
		where datename(dw, dtr_date) = 'Saturday'

		-- get all undertime
		select * 
		into #undertime_all
		from dtrundertime u (nolock)
		where dtr_date 
		between @date_from_new and @date_until_new
			and u.timestatus_code = 'APP'
			  
		-- get late AM
		select la.time_in_am,
			   la.id_num,
			   la.dtr_date
		  into #lateam
	      from #dtr la (nolock)
	 left join #undertime_all u
	        on u.dtr_date = la.dtr_date
		   and u.id_num = la.id_num
		   and u.am_pm = 'A'
		 where (datediff(ss,@login_am,la.time_in_am) / 60.00) >= 1.00
		   and la.time_in_am < @logout_am
		   and DATEPART(DW, la.dtr_date) <> 7
		   and coalesce(u.time_from,la.time_in_am) > @login_am
	  group by la.id_num,
	           la.dtr_date,
			   la.time_in_am

		-- get late PM
		select lp.time_in_pm,
			   lp.id_num,
			   lp.dtr_date
		  into #latepm
		  from #dtr lp (nolock)
	 left join #undertime_all u
	   	    on u.dtr_date = lp.dtr_date
		   and u.id_num = lp.id_num
		   and u.am_pm = 'P'
		 where (datediff(ss,@login_pm,lp.time_in_pm) / 60.00) >= 1.00
	   	   and lp.time_in_pm > @logout_am
		   and DATEPART(DW, lp.dtr_date) <> 7
		   and coalesce(u.time_from,lp.time_in_pm) > @login_pm
	  group by lp.id_num,
	           lp.dtr_date,
			   lp.time_in_pm
			
	-- get late saturday
	select ls.time_in_am,
		   ls.id_num,
		   ls.dtr_date
	  into #latesat
	  from #dtr_saturday ls (nolock)
 left join #undertime_all u
		on u.dtr_date = ls.dtr_date
	   and u.id_num = ls.id_num
	   and u.am_pm = 'A'
	 where (datediff(ss,'08:00', ls.time_in_am) / 60.00) >= 1.00
	   and ls.time_in_am < '12:00'
		-- and DATEPART(DW, ls.dtr_date) = 7
	   and coalesce(u.time_from,ls.time_in_am) > '08:00'
  group by ls.id_num,
           ls.dtr_date,
		   ls.time_in_am

	-- get undertime AM
	select u.dtr_date,
		   u.id_num,
		   time_from,
		   is_paid,
		   u.am_pm
	  into #undertimeam
	  from dtrundertime u (nolock)
	 where u.dtr_date between @date_from_new and @date_until_new
	   and u.timestatus_code = 'APP'
	   and u.am_pm = 'A'

	-- get undertime PM
	select u.dtr_date,
		   u.id_num,
		   time_from,
		   is_paid,
		   u.am_pm
	  into #undertimepm
	  from dtrundertime u (nolock)
	 where u.dtr_date between @date_from_new and @date_until_new
	   and u.timestatus_code = 'APP'
	   and u.am_pm = 'P'

	-- result table
	declare @report table
	(
		id_num varchar(12),
		dtr_date datetime,
		time_in time
	)

	-- insert late AM 
	insert @report
	select la.id_num,
	       la.dtr_date,
		   la.time_in_am
	  from #lateam la 

	-- insert saturday late AM with no corresponding undertime AM
	insert @report
	select ls.id_num,
	       ls.dtr_date,
		   ls.time_in_am
	  from #latesat ls
	-- where not exists (select 1 from @report r where r.dtr_date = ls.dtr_date and am_pm = 'A' and r.id_num = ls.id_num)

	-- employee details
	select *
	  into #employees
	  from dbo.paf_fn_active_employees(@date_from_new,@date_until_new)

	-- return
	select (convert(varchar(10),@date_from_new,101) + ' - ' + convert(varchar(10),@date_until_new,101)) date_period,
		   e.employee_name,
		   e.location_code,
		   l.location_name,
		   dtr_date,
		   time_in
	  from @report r
	  join #employees e (nolock)
	    on e.id_num = r.id_num
	  join location l (nolock)
	    on l.location_code = e.location_code
  order by l.location_name,
           r.dtr_date,
		   employee_name

	drop table #dtr
	drop table #dtr_saturday
	drop table #lateam
	drop table #latepm
	drop table #latesat
	drop table #undertime_all
	drop table #undertimeam
	drop table #undertimepm
	drop table #employees

END



