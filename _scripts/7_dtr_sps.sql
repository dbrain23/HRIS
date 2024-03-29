/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 02/15/2015 18:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from date,
	@dtr_date_until date,
	@id_num varchar(12)
AS
BEGIN
	declare @dtr table
	(
		id_num varchar(12),
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
	)
	
	-- morning log
	-- with or without afternoon log
	insert into @dtr
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out) total_hours_pm,
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
			   and d.time_in >= '12:00:00') d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < '12:00:00'
  
  -- afternoon log
  -- without morning log
  insert into @dtr
  select e.id_num,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out) d_pm_only,
		  d_pm_only.location_code
	 from dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.id_num = d_pm_only.id_num
	where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
	  and d_pm_only.time_in > '12:00:00'
	  and not exists (select 1 
	                    from @dtr d  
	                   where d.id_num = e.id_num)
	
	select id_num,
		   employee_name,
		   dtr_date,
		   convert(varchar(5),time_in_am) time_in_am,
		   convert(varchar(5),time_out_am) time_out_am,
		   am_status,
		   convert(varchar(5),time_in_pm) time_in_pm,
		   convert(varchar(5),time_out_pm) time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		    location_code
	  from @dtr d
	 where (ISNULL(@id_num,0) = 0 or d.id_num = @id_num)
  order by d.time_out_pm desc,
		   d.time_in_pm desc,
		   d.time_out_am desc,
		   d.time_in_am desc
END

GO

/****** Object:  StoredProcedure [dbo].[dtr_get_by_date_no_joins]    Script Date: 02/15/2015 18:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_get_by_date_no_joins]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_get_by_date_no_joins]
GO


/****** Object:  StoredProcedure [dbo].[dtr_get_by_date_no_joins]    Script Date: 02/15/2015 18:57:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_by_date_no_joins] 
	@dtr_date_from date,
	@dtr_date_until date
AS
BEGIN
	select dtr_id,
	       location_code,
	       dtr_date,
	       id_num,
	       time_in,
	       time_out,
	       dtr_snapshot_in,
	       dtr_snapshot_out,
	       dtr_remarks,
	       dtrstatus_code 
	  from dtr d (nolock)
	 where d.dtr_date between @dtr_date_from and @dtr_date_until 
END
GO

/****** Object:  StoredProcedure [dbo].[dtr_get_dtr_for_import]    Script Date: 02/15/2015 18:58:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_get_dtr_for_import]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_get_dtr_for_import]
GO


/****** Object:  StoredProcedure [dbo].[dtr_get_dtr_for_import]    Script Date: 02/15/2015 18:58:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_dtr_for_import]
AS
BEGIN
	declare @dtr table
	(
		id_num varchar(12),
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
	)
	
	-- morning log
	-- with or without afternoon log
	insert into @dtr
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out) total_hours_pm,
		   d_am.location_code
	  from ##dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_am.id_num
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from ##dtr d (nolock)
			 where d.time_in >= '12:00:00') d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.time_in < '12:00:00'
  
  -- afternoon log
  -- without morning log
  insert into @dtr
  select e.id_num,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out) d_pm_only,
		  d_pm_only.location_code
	 from ##dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.id_num = d_pm_only.id_num
	where d_pm_only.time_in > '12:00:00'
	  and not exists (select 1 
	                    from @dtr d  
	                   where d.employee_id = e.employee_id)
	
	select id_num,
		   employee_name,
		   dtr_date,
		   convert(varchar(5),time_in_am) time_in_am,
		   convert(varchar(5),time_out_am) time_out_am,
		   am_status,
		   convert(varchar(5),time_in_pm) time_in_pm,
		   convert(varchar(5),time_out_pm) time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		    location_code
	  from @dtr d
  order by d.time_out_pm desc,
		   d.time_in_pm desc,
		   d.time_out_am desc,
		   d.time_in_am desc
END

GO

/****** Object:  StoredProcedure [dbo].[dtr_get_employee]    Script Date: 02/15/2015 18:58:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_get_employee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_get_employee]
GO

/****** Object:  StoredProcedure [dbo].[dtr_get_employee]    Script Date: 02/15/2015 18:58:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[dtr_get_employee]
	@id_num varchar(12),
	@pin char(4)
AS
BEGIN
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from employee e (nolock)
	 where e.id_num = @id_num
	   and e.pin = @pin
END


GO

/****** Object:  StoredProcedure [dbo].[dtr_import_dtr]    Script Date: 02/15/2015 18:58:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_import_dtr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_import_dtr]
GO

/****** Object:  StoredProcedure [dbo].[dtr_import_dtr]    Script Date: 02/15/2015 18:58:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_import_dtr]
AS
BEGIN
	declare @location_code char(3)
	
	if OBJECT_ID('tempdb..##dtr') IS NOT NULL
	begin
		select top 1
			   @location_code = location_code
		  from ##dtr
			
		insert 
		  into dtr
				(location_code,
				remote_dtr_id,
				dtr_date,
				id_num,
				time_in,
				time_out,
				dtr_snapshot_in,
				dtr_snapshot_out,
				dtr_remarks,
				dtrstatus_code)
		 select dt.location_code,
				dt.dtr_id,
				dt.dtr_date,
				dt.id_num,
				dt.time_in,
				dt.time_out,
				dt.dtr_snapshot_in,
				dt.dtr_snapshot_out,
				dt.dtr_remarks,
				'IMP'
		   from ##dtr dt
	  left join dtr d (nolock) on d.remote_dtr_id = dt.dtr_id and d.location_code = @location_code
		  where ISNULL(d.dtr_id,0) = 0
     end
END

GO

/****** Object:  StoredProcedure [dbo].[dtr_load_exported_dtr]    Script Date: 02/15/2015 18:59:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_load_exported_dtr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_load_exported_dtr]
GO

/****** Object:  StoredProcedure [dbo].[dtr_load_exported_dtr]    Script Date: 02/15/2015 18:59:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_load_exported_dtr]
	@dtr_id int,
	@location_code char(3),
	@dtr_date date,
	@id_num int,
	@time_in varchar(25),
	@time_out varchar(25),
	@dtr_snapshot_in varchar(250),
	@dtr_snapshot_out varchar(250),
	@dtr_remarks varchar(250),
	@dtrstatus_code char(3)
AS
BEGIN
    if OBJECT_ID('tempdb..##dtr') IS NULL
	begin	
	create table ##dtr
		(
			dtr_id int,
			location_code char(3),
			dtr_date date,
			id_num varchar(12),
			time_in time(7),
			time_out time(7),
			dtr_snapshot_in varchar(250),
			dtr_snapshot_out varchar(250),
			dtr_remarks varchar(250),
			dtrstatus_code char(3)
		)
	end
	
	insert 
	  into ##dtr
	values (@dtr_id,
			@location_code,
			@dtr_date,
			@id_num,
			@time_in,
			nullif(@time_out,''),
			@dtr_snapshot_in,
			@dtr_snapshot_out,
			@dtr_remarks,
			@dtrstatus_code)
END

GO

/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 02/15/2015 18:59:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr_log_time]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dtr_log_time]
GO

/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 02/15/2015 18:59:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[dtr_log_time]
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
	
	-- get current date
	set @current_date = GETDATE()
	
	-- get DTR date
	set @dtr_date = CONVERT(date, @current_date, 101)
	-- get current time
	set @dtr_time = CONVERT(time, @current_date)
	-- get minimum timeout
	set @min_timeout_interval = isnull(dbo.fn_get_sysconfig_value('MIN_TIMEOUT_INTERVAL'),0) / 60.0
	
	-- check if current date's log is complete
	-- meaning employee has logged his/her time
	-- employee can only have 2 "logs" 
	-- per day
	-- for both AM and PM 
	select @logged = COUNT(dtr_id)
	  from dtr d (nolock)
	 where d.dtr_date = @dtr_date
	   and d.id_num = @id_num
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 and @dtr_time < '17:00:00'
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
	     and d.time_in > '12:00:00'
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







