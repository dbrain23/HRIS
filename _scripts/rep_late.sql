		
		declare @date_from datetime,
				@date_until datetime,
				@login_am time(0),
				@logout_am time(0),
				@login_pm time(0),
				@logout_pm time(0),
				@date_param datetime -- for getting work time period

		-- get the dates
		set @date_from = '2018-06-01'
		set @date_until = '2018-06-30'


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
		from dbo.dtr_fn_get_dtr(@date_from,@date_until,null,1)
		where datename(dw, dtr_date) not in ('Saturday','Sunday')

		-- get saturdays
		select *
		into #dtr_saturday
		from dbo.dtr_fn_get_dtr(@date_from,@date_until,null,1)
		where datename(dw, dtr_date) = 'Saturday'

		-- get all undertime
		select * 
		into #undertime_all
		from dtrundertime u (nolock)
		where dtr_date 
		between @date_from and @date_until
			and u.timestatus_code = 'APP'

		-- get overtime
			  
		-- get late AM
		select sum(datediff(ss,@login_am,la.time_in_am) / 60.00) late_am,
			   la.id_num,
			   la.dtr_date,
			   la.time_in_am
		  into #lateam
	      from #dtr la (nolock)
	 left join #undertime_all u
	        on u.dtr_date = la.dtr_date
		   and u.id_num = la.id_num
		   and u.am_pm = 'A'
		 where (datediff(ss,@login_am,la.time_in_am) / 60.00) >= 11.00
		   and la.time_in_am < @logout_am
		   and DATEPART(DW, la.dtr_date) <> 7
		   and coalesce(u.time_from,la.time_in_am) > @login_am
	  group by la.id_num,
	           la.dtr_date,
			   la.time_in_am

		-- get late PM
		select sum(datediff(ss,@login_pm,lp.time_in_pm) / 60.00) late_pm,
			   lp.id_num,
			   lp.dtr_date,
			   lp.time_in_pm
		  into #latepm
		  from #dtr lp (nolock)
	 left join #undertime_all u
	   	    on u.dtr_date = lp.dtr_date
		   and u.id_num = lp.id_num
		   and u.am_pm = 'P'
		 where (datediff(ss,@login_pm,lp.time_in_pm) / 60.00) >= 11.00
	   	   and lp.time_in_pm > @logout_am
		   and DATEPART(DW, lp.dtr_date) <> 7
		   and coalesce(u.time_from,lp.time_in_pm) > @login_pm
	  group by lp.id_num,
	           lp.dtr_date,
			   lp.time_in_pm
			
		-- get late saturday
		select sum(datediff(ss,'08:00',ls.time_in_am) / 60.00) late_sat,
			   ls.id_num,
			   ls.dtr_date,
			   ls.time_in_am
		  into #latesat
		  from #dtr_saturday ls (nolock)
	 left join #undertime_all u
			on u.dtr_date = ls.dtr_date
		   and u.id_num = ls.id_num
		   and u.am_pm = 'A'
		 where (datediff(ss,'08:00', ls.time_in_am) / 60.00) >= 11.00
		   and ls.time_in_am < '12:00'
			-- and DATEPART(DW, ls.dtr_date) = 7
		   and coalesce(u.time_from,ls.time_in_am) > '08:00'
	  group by ls.id_num,
			   ls.dtr_date,
			   ls.time_in_am

		-- get undertime AM
		select u.dtr_date,
			   (datediff(ss,time_from,time_until) / 60.00) undertime,
			   r.undertime_reason_name,
			   u.id_num,
			   time_from,
			   time_until,
			   is_paid
		  into #undertimeam
		  from dtrundertime u (nolock)
		  join t_undertimereason r (nolock)
			on r.undertime_reason_code = u.undertime_reason_code
		 where u.dtr_date between @date_from and @date_until
		   and u.timestatus_code = 'APP'
		   and u.am_pm = 'A'

		-- get undertime PM
		select u.dtr_date,
			   (datediff(ss,time_from,time_until) / 60.00) undertime,
			   r.undertime_reason_name,
			   u.id_num,
			   time_from,
			   time_until,
			   is_paid
		  into #undertimepm
		  from dtrundertime u (nolock)
		  join t_undertimereason r (nolock)
			on r.undertime_reason_code = u.undertime_reason_code
		 where u.dtr_date between @date_from and @date_until
		   and u.timestatus_code = 'APP'
		   and u.am_pm = 'P'

		-- result table
		declare @report table
		(
			id_num varchar(12),
			dtr_date datetime,
			am_pm char(1),
			late int
		)

		-- insert late AM with no corresponding undertime AM
		insert @report
		select la.id_num,
			   la.dtr_date,
			   'A',
			   la.late_am
		  from #lateam la

		-- insert late PM with no corresponding undertime PM
		insert @report
		select lp.id_num,
			   lp.dtr_date,
			   'P',
			   lp.late_pm
		  from #latepm lp

		-- insert saturday late AM with no corresponding undertime AM
		insert @report
		select ls.id_num,
			   ls.dtr_date,
			   'A',
			   ls.late_sat
		  from #latesat ls

		-- employee details
		select *
		  into #employees
		  from dbo.paf_fn_active_employees(@date_from,@date_until)

		-- return
		select (convert(varchar(10),@date_from,101) + ' - ' + convert(varchar(10),@date_until,101)) period,
			   e.employee_name,
			   e.location_code,
			   e.empstatus_code,
			   l.location_name,
			   (convert(varchar(10),r.dtr_date,101) + isnull(' ' + am_pm,'')) dtr_date,
			   (case when isnull(r.late,0) = 0 then '-' else convert(varchar,convert(money,r.late),1) end) late
		  from @report r
		  join #employees e (nolock)
			on e.id_num = r.id_num
		  join location l (nolock)
			on l.location_code = e.location_code
	  order by l.location_name,
			   employee_name, 
			   r.dtr_date,
			   am_pm

		drop table #dtr
		drop table #dtr_saturday
		drop table #lateam
		drop table #latepm
		drop table #latesat
		drop table #undertime_all
		drop table #undertimeam
		drop table #undertimepm
		drop table #employees