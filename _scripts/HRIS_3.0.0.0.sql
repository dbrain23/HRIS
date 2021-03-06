USE HRIS
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[dtr_fn_get_days_covered]
(
	@dtr_date_from datetime,
	@dtr_date_until datetime
)
RETURNS @days TABLE
(
	days_covered int,
	saturdays int,
	sundays int
)
AS
BEGIN
	-- this function returns both the number of days, Saturdays and Sundays
	-- alternatively, DATEDIFF can be used to get the number of days
	-- however, instead of using another function (in this case DATEDIFF), this function has been utilised

	declare @days_covered int = 0,
		    @saturdays int = 0,
			@sundays int = 0,
	        @d datetime

	set @d = @dtr_date_from
	
	while @d <= @dtr_date_until
	begin
	  if datename(dw, @d) = 'Sunday'
		set @sundays = @sundays + 1

	  if datename(dw, @d) = 'Saturday'
	    set @saturdays = @saturdays + 1 

	  set @d = dateadd(dd, 1, @d)

	  set @days_covered = @days_covered + 1
	end 

	insert @days
	select @days_covered,
	       @saturdays,
		   @sundays

	return
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 6/09/2015 9:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
	@override_only smallint = 0
AS
BEGIN
	create table #dtr
	(
		id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
		employee_name varchar(250),
		dtr_date datetime,
		time_in_am time,
		time_out_am time,
		am_status varchar(15),
    	time_in_pm time,
		time_out_pm time,
		pm_status varchar(15),
		total_hours_am decimal(4,2),
		total_hours_pm decimal(4,2),
		location_code char(3)
		primary key (id_num, dtr_date)
	)

	declare @current_date datetime

	-- constants for min and max login/out times
	declare @LOGIN_AM time(0),
	        @LOGIN_PM time(0),
			@LOGOUT_AM time(0),
			@LOGOUT_PM time(0)

	-- get current date
	set @current_date = GETDATE()

	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon
	if @current_date < '2015-10-01'
	begin
		set @LOGIN_AM = '08:00:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGOUT_PM = '17:00:00'
	end
	else
	begin
		set @LOGIN_AM = '08:30:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGOUT_PM = '17:30:00'
	end
	
	-- morning log
	-- with or without afternoon log
	insert into #dtr
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in, @current_date) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in, @current_date) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, @current_date) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, @current_date) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_am.id_num
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= @LOGOUT_AM --'12:00:00'
			   and (ISNULL(@id_num,'') = '' or d.id_num = @id_num)) d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < @LOGOUT_AM --'12:00:00'
	   and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
  
  -- afternoon log
  -- without morning log
  insert into #dtr
  select e.id_num,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in, @current_date) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, @current_date) d_pm_only,
		  d_pm_only.location_code
	 from dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.id_num = d_pm_only.id_num
	where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
	  and d_pm_only.time_in > @LOGOUT_AM --'12:00:00'
	  and not exists (select 1 
	                    from #dtr d  
	                   where d.id_num = e.id_num)
	  and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
	                   
	-- get inclusive dates
	;with inclusive_dates
	as
	(
		select @dtr_date_from as dt
		union all
		select dateadd(day, 1, dt)
		  from inclusive_dates
		 where dt < @dtr_date_until
	)
	
	-- select result
	-- join date with the dtr table
	select i.dt, 
	       id_num,
		   employee_name,
		   dtr_date,
		   isnull(convert(varchar(5),time_in_am),'-') time_in_am,
		   isnull(convert(varchar(5),time_out_am),'-') time_out_am,
		   am_status,
		   isnull(convert(varchar(5),time_in_pm),'-') time_in_pm,
		   isnull(convert(varchar(5),time_out_pm),'-') time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		   location_code
	  from inclusive_dates i
 left join (
				select *
				  from #dtr
				 where (ISNULL(@id_num,'') = '' or id_num = @id_num)
		   ) d
        on d.dtr_date = i.dt
     where ((ISNULL(@override_only,0) = 0)
			or
			(exists (select 1
					   from dtroverride dto (nolock)
					  where	dto.dtr_date = i.dt
					    and dto.id_num = d.id_num
			))
			)
	
	drop table #dtr
     
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[pr_dd_payroll_period]
AS
BEGIN
	select payroll_code,
	       (convert(varchar(10),pc.payroll_from,101) + ' - ' + convert(varchar(10),pc.payroll_until,101)) payroll_period
	  from payrollcode pc (nolock)
  order by pc.payroll_until desc
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_get_payroll]
	@payroll_code char(15)
	,@location_code char(3)
AS
BEGIN
	declare @dtr_date_from datetime,
	        @dtr_date_until datetime,
			@days_covered int,
			@saturdays int, 
			@sundays int
			 
	create table #dtr
	(
		id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
		dtr_date datetime,
		time_in_am time,
		time_out_am time,
		time_in_pm time,
		time_out_pm time,
		total_hours_am decimal(4,2),
		total_hours_pm decimal(4,2),
		location_code char(3)
		primary key (id_num, dtr_date)
	)

	create table #employee
	(
		id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS primary key,
		employee_name varchar(250),
		location_code char(3)  collate SQL_Latin1_General_CP1_CI_AS,
		salary decimal(10,2),
		frequency_code char(3)
	)

	-- get date range
	select @dtr_date_from = payroll_from,
	       @dtr_date_until = payroll_until
	  from payrollcode pc (nolock)
	 where pc.payroll_code = @payroll_code 

	-- get number of days required and number of saturdays
	select @days_covered = days_covered,
	       @saturdays = saturdays, 
		   @sundays = sundays
	  from dbo.dtr_fn_get_days_covered(@dtr_date_from, @dtr_date_until)


	-- get the employees affected by the date range
	-- use the paf table
	insert into #employee
	select e.id_num,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   location_code,
		   salary,
		   frequency_code
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
     where isnull(p.effective_until,@dtr_date_until) between @dtr_date_from and @dtr_date_until
	   and p.effective_date <= @dtr_date_from
	   and isnull(p.is_cancelled,0) = 0
	
	-- morning log
	-- with or without afternoon log
	insert into #dtr
	select d_am.id_num,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, @dtr_date_until) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, @dtr_date_until) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= '12:00:00') d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < '12:00:00'
  
	-- afternoon log
	-- without morning log
	insert into #dtr
	select d_pm_only.id_num,
	       d_pm_only.dtr_date,
		   null as time_in_am,
		   null as time_out_am,
		   d_pm_only.time_in as time_in_pm,
		   d_pm_only.time_out as time_out_pm,
		   0 total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, @dtr_date_until) d_pm_only,
		   d_pm_only.location_code
	  from dtr d_pm_only (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_pm_only.id_num
	 where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
   	   and d_pm_only.time_in > '12:00:00'
	   and not exists (select 1 
						 from #dtr d  
						where d.id_num = e.id_num)  
					  
	select te.id_num,
	       te.employee_name,
		   te.location_code,
		   l.location_name,
		   te.salary,
		   te.frequency_code,
		   @days_covered days_covered,
		   @saturdays saturdays,
		   sum(total_hours_am) + sum(total_hours_pm) total_hours
	  into #hours
	  from #dtr td
right join #employee te
	    on td.id_num = te.id_num
	  join location l (nolock)
	    on l.location_code = te.location_code
  group by te.id_num, 
	       te.employee_name, 
		   te.location_code, 
		   l.location_name,
		   te.salary,
		   te.frequency_code           

	-- hours
	select *,
	       (case when ((total_hours / 8.00) + @saturdays + @sundays) > @days_covered
		    then @days_covered 
			else ((total_hours / 8.00) + @saturdays + @sundays)
			end 
		   ) days_actual
	  into #actual
	  from #hours
     
	-- gross
	select *,
	       round((case when ac.frequency_code = 'MLY'
		   then (salary / 2.00) - ((days_covered - days_actual) * (salary * 12 / 365.00))
		   else salary * days_actual * 1.00  
		   end
		   ),2) as gross
	 into #payroll
	 from #actual ac

	-- payroll
	select pr.*,
	       sf.frequency_name,
	       (convert(varchar(10),@dtr_date_from,101) + ' - ' + convert(varchar(10),@dtr_date_until,101)) period,
	       dbo.pr_fn_get_sss_contribution(salary) as sss_contribution
	  from #payroll pr
	  join t_salaryfrequency sf (nolock)
	    on sf.frequency_code = pr.frequency_code collate SQL_Latin1_General_CP1_CI_AS
 order by employee_name 
	
	drop table #employee
	drop table #dtr
	drop table #hours
	drop table #actual
	drop table #payroll

END


