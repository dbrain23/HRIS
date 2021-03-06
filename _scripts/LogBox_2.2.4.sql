USE LogBox
GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_total_hours]    Script Date: 6/09/2015 9:08:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[dtr_fn_get_total_hours]
(
	@time_in time,
	@time_out time,
	@current_date datetime
)
RETURNS decimal(4,2)
AS
BEGIN
	declare @total_hours decimal(4,2)

	-- constants for min and max login/out times
	declare @LOGIN_AM time(0),
			@LOGIN_AM_PLUS_ALLOWANCE time(0),
	        @LOGIN_PM time(0),
			@LOGIN_PM_PLUS_ALLOWANCE time(0),
			@LOGOUT_AM time(0),
			@LOGOUT_PM time(0)

	-- NOTE:
	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon
	if @current_date < '2015-10-01'
	begin
		set @LOGIN_AM = '08:00:00'
		set @LOGIN_AM_PLUS_ALLOWANCE = '08:11:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGIN_PM_PLUS_ALLOWANCE = '13:11:00'
		set @LOGOUT_PM = '17:00:00'
	end
	else
	begin
		set @LOGIN_AM = '08:30:00'
		set @LOGIN_AM_PLUS_ALLOWANCE = '08:41:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGIN_PM_PLUS_ALLOWANCE = '13:11:00'
		set @LOGOUT_PM = '17:30:00'
	end

	-- morning
	if (@time_in < @LOGOUT_AM) --'12:00:00')
	begin
		if (@time_in < @LOGIN_AM_PLUS_ALLOWANCE) --'08:11:00')
			set @time_in = @LOGIN_AM --'08:00:00'
		
		if (isnull(@time_out,@time_in) > @LOGOUT_AM) -- '12:00:00')
			set @time_out = @LOGOUT_AM -- '12:00:00'
		else if (isnull(@time_out,@time_in) < @LOGIN_AM_PLUS_ALLOWANCE) -- '08:11:00')
			set @time_out = @time_in
	end	
	else
	-- afternoon
	begin 
		if (@time_in < @LOGIN_PM_PLUS_ALLOWANCE) --'13:11:00')
			set @time_in = @LOGIN_PM -- '13:00:00'
		else if (@time_in > @LOGOUT_PM) -- '17:00:00')
			set @time_in = @LOGOUT_PM -- '17:00:00'	
			
		if (isnull(@time_out,@time_in) > @LOGOUT_PM) -- '17:00:00')
			set @time_out = @LOGOUT_PM -- '17:00:00'
		else if (isnull(@time_out,@time_in) < @LOGIN_PM_PLUS_ALLOWANCE) -- '13:11:00')
			set @time_out = @time_in
	end
	
	set @total_hours = DATEDIFF(minute,@time_in,isnull(@time_out,@time_in)) / 60.0

	return isnull(@total_hours,0)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[dtr_fn_get_log_status]
(
	@time_in time,
	@current_date datetime
)
RETURNS varchar(15)
AS
BEGIN
	-- Declare the return variable here
	declare @log_status varchar(15)
	
	-- NOTE:
	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon

	if @current_date < '2015-10-01'
	begin
		if (@time_in between '08:10:59' and '11:59:59') or (@time_in between '13:10:59' and '17:00:00')
			set @log_status = 'UNDERTIME'
		else if (@time_in between '08:00:59' and '08:10:01') or (@time_in between '13:00:59' and '13:10:01')
			set @log_status = 'LATE'
	end
	else
	begin
		if (@time_in between '08:40:59' and '11:59:59') or (@time_in between '13:10:59' and '17:30:00')
			set @log_status = 'UNDERTIME'
		else if (@time_in between '08:30:59' and '08:40:01') or (@time_in between '13:00:59' and '13:10:01')
			set @log_status = 'LATE'
	end
	
	-- Return the result of the function
	return @log_status
END
GO
/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 6/09/2015 9:08:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[dtr_log_time]
	@id_num varchar(12),
	@dtr_snapshot varchar(250)
AS
BEGIN
    declare @current_date datetime
	declare @dtr_date date
	declare @dtr_time time(0)
	declare @logged integer
	declare @orphaned integer
	declare @post_message varchar(100) = 'Time posted successfully.'
	declare @log_status varchar(10)
	declare @min_timeout_interval decimal(4,2)
	declare @total_hours decimal(4,2)
	declare @log_complete smallint = 0

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
	
	-- get DTR date
	set @dtr_date = CONVERT(date, @current_date, 101)
	-- get current time
	set @dtr_time = CONVERT(time, @current_date)
	-- get minimum timeout
	set @min_timeout_interval = isnull(dbo.fn_get_sysconfig_value('MIN_TIMEOUT_INTERVAL'),0) / 60.0
	
	-- check if current date's log is complete
	-- meaning employee has logged his/her time
	-- employee can only have 2 "logs" per day
	-- for both AM and PM 
	select @logged = COUNT(dtr_id)
	  from dtr d (nolock)
	 where d.dtr_date = @dtr_date
	   and d.id_num = @id_num
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 and @dtr_time < @LOGOUT_PM --'17:00:00'
	begin
	  insert 
	    into dtr
			 (dtr_date,
			 id_num,
			 time_in,
			 time_out,
			 dtr_snapshot_in,
			 dtr_snapshot_out,
			 dtr_remarks) 
	  values (@dtr_date
			 ,@id_num
			 ,@dtr_time
			 ,null
			 ,@dtr_snapshot
			 ,null
			 ,null)
			 
	  -- log status
	  set @log_status = 'IN'
	  set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2)) 
	end
	else if @logged <= 2
	begin 
	  -- check for orphaned record then UPDATE, otherwise INSERT
	  select @orphaned = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num
	     and d.time_out is null 
	  
	  -- get total hours
	  -- total hours is used to compare
	  -- with interval..do not allow to log time if hours is less than interval
	  select @total_hours = DATEDIFF(minute,d.time_in,@dtr_time) / 60.0
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num 
	     and d.time_out is null
	     
	  -- check if afternoon log is complete
	  -- do not allow to log time if afternoon log is complete
	  select @log_complete = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num
	     and d.time_in > @LOGOUT_AM --'12:00:00'
	     and d.time_out is not null
	     
	  -- there is no orphaned record
	  -- AM time log is complete
	  -- create log for PM 
	  if @orphaned = 0 and @logged = 1 and @log_complete = 0
	  begin
		  insert 
			into dtr 
				 (dtr_date,
				 id_num,
				 time_in,
				 time_out,
				 dtr_snapshot_in,
				 dtr_snapshot_out,
				 dtr_remarks)
		  values (@dtr_date
				 ,@id_num
				 ,@dtr_time
				 ,null
				 ,@dtr_snapshot
				 ,null
				 ,null)
				 
		-- log status
	    set @log_status = 'IN'
		set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  -- complete the time log
	  -- update "time_out" field
	  else if (@orphaned = 1) 
	   and (@total_hours >= @min_timeout_interval)
	  begin
		update dtr
		   set time_out = @dtr_time,
			   dtr_snapshot_out = @dtr_snapshot
		 where dtr_date = @dtr_date
		   and id_num = @id_num
		   and time_out is null  
		   
		-- log status
	    set @log_status = 'OUT'
		set @post_message = 'Out - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  else
	  begin
	    -- log status
	    set @log_status = 'REJECTED'
	    set @post_message = 'Rejected - '
	  end
	end
	
	-- return
	select (employee_lastname + ', ' + employee_firstname) employee_name
		   ,@post_message post_message
		   ,@log_status log_status
	  from employee e (nolock)
	 where e.id_num = @id_num
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



