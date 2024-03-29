/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_rank_movement], [dbo].[tr_set_location_code]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_by_date_no_joins], [dbo].[dtr_get_dtr_for_import], [dbo].[dtr_get_employee], [dbo].[dtr_import_dtr], [dbo].[dtr_load_exported_dtr], [dbo].[dtr_log_time], [dbo].[hris_dd_get_allowance_types], [dbo].[hris_get_allowance_types_by_location], [dbo].[hris_get_empaddress_h], [dbo].[hris_get_empaddress_p], [dbo].[hris_get_empcontact_h], [dbo].[hris_get_empcontact_p], [dbo].[hris_get_empemergency], [dbo].[hris_get_empfamily], [dbo].[hris_get_employee], [dbo].[hris_get_employees], [dbo].[hris_get_latest_paf], [dbo].[hris_get_latest_paf_allowances], [dbo].[hris_get_paf], [dbo].[hris_get_paf_list], [dbo].[sec_delete_roles], [dbo].[sec_generate_username], [dbo].[sec_get_pin], [dbo].[sec_get_user], [dbo].[sec_get_user_rights], [dbo].[sec_get_user_roles]

    tables:
        [dbo].[dtr], [dbo].[empeducation], [dbo].[empskill], [dbo].[locationallowancetype], [dbo].[paf], [dbo].[sysuserrole], [dbo].[t_overridetype]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	14/02/2015 9:20:01 PM

   LEGAL:	2014[Insert Company Name]

   ------------------------------------------------------------ */

SET NOEXEC OFF
SET ANSI_WARNINGS ON
SET XACT_ABORT ON
SET IMPLICIT_TRANSACTIONS OFF
SET ARITHABORT ON
SET NOCOUNT ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
GO
USE [HRIS_Live]
GO

BEGIN TRAN
GO

-- Drop Primary Key PK_empeducation from [dbo].[empeducation]
Print 'Drop Primary Key PK_empeducation from [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation] DROP CONSTRAINT [PK_empeducation]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_empskill from [dbo].[empskill]
Print 'Drop Primary Key PK_empskill from [dbo].[empskill]'
GO
ALTER TABLE [dbo].[empskill] DROP CONSTRAINT [PK_empskill]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_overridetype]
Print 'Create Table [dbo].[t_overridetype]'
GO
CREATE TABLE [dbo].[t_overridetype] (
		[overridetype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[overridetype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[overridetype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_overridetype to [dbo].[t_overridetype]
Print 'Add Primary Key PK_t_overridetype to [dbo].[t_overridetype]'
GO
ALTER TABLE [dbo].[t_overridetype]
	ADD
	CONSTRAINT [PK_t_overridetype]
	PRIMARY KEY
	CLUSTERED
	([overridetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_overridetype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_empskill_1 to [dbo].[empskill]
Print 'Add Primary Key PK_empskill_1 to [dbo].[empskill]'
GO
ALTER TABLE [dbo].[empskill]
	ADD
	CONSTRAINT [PK_empskill_1]
	PRIMARY KEY
	CLUSTERED
	([id_num], [skill_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column overriden_by to [dbo].[dtr]
Print 'Add Column overriden_by to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD [overriden_by] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column override_date to [dbo].[dtr]
Print 'Add Column override_date to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD [override_date] [int] NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column overridetype_code to [dbo].[dtr]
Print 'Add Column overridetype_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD [overridetype_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column created_by on [dbo].[paf]
Print 'Alter Column created_by on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	 ALTER COLUMN [created_by] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column modified_by on [dbo].[paf]
Print 'Alter Column modified_by on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	 ALTER COLUMN [modified_by] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[locationallowancetype]
Print 'Create Table [dbo].[locationallowancetype]'
GO
CREATE TABLE [dbo].[locationallowancetype] (
		[location_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[allowancetype_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[allowance_amount]       [decimal](10, 2) NULL,
		[valid_from]             [datetime] NOT NULL,
		[valid_until]            [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_locationallowance to [dbo].[locationallowancetype]
Print 'Add Primary Key PK_locationallowance to [dbo].[locationallowancetype]'
GO
ALTER TABLE [dbo].[locationallowancetype]
	ADD
	CONSTRAINT [PK_locationallowance]
	PRIMARY KEY
	CLUSTERED
	([allowancetype_code], [location_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_locationallowancetype_valid_from to [dbo].[locationallowancetype]
Print 'Add Default Constraint DF_locationallowancetype_valid_from to [dbo].[locationallowancetype]'
GO
ALTER TABLE [dbo].[locationallowancetype]
	ADD
	CONSTRAINT [DF_locationallowancetype_valid_from]
	DEFAULT (getdate()) FOR [valid_from]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[locationallowancetype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_empeducation_1 to [dbo].[empeducation]
Print 'Add Primary Key PK_empeducation_1 to [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	ADD
	CONSTRAINT [PK_empeducation_1]
	PRIMARY KEY
	CLUSTERED
	([id_num], [attainment_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_get_employee]
Print 'Alter Procedure [dbo].[dtr_get_employee]'
GO


ALTER PROCEDURE [dbo].[dtr_get_employee]
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_log_time]
Print 'Alter Procedure [dbo].[dtr_log_time]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_allowance_types_by_location]
Print 'Create Procedure [dbo].[hris_get_allowance_types_by_location]'
GO

CREATE PROCEDURE [dbo].[hris_get_allowance_types_by_location]
	@location_code char(3)
AS
BEGIN
	select *
	  from locationallowancetype la (nolock)
	 where la.location_code = @location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_get_by_date]
Print 'Alter Procedure [dbo].[dtr_get_by_date]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_get_user_roles]
Print 'Alter Procedure [dbo].[sec_get_user_roles]'
GO

ALTER PROCEDURE [dbo].[sec_get_user_roles]
	@id_num varchar(12)
AS
BEGIN
     -- assigned roles
	 select *
	   from sysuserrole ur (nolock)
	  where ur.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_get_user]
Print 'Alter Procedure [dbo].[sec_get_user]'
GO

ALTER PROCEDURE [dbo].[sec_get_user]
	@id_num varchar(12)
AS
BEGIN
	select * 
	  from sysuser u (nolock)
	 where u.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_delete_roles]
Print 'Alter Procedure [dbo].[sec_delete_roles]'
GO

ALTER PROCEDURE [dbo].[sec_delete_roles]
	@id_num varchar(12)
AS
BEGIN
	delete 
	  from sysuserrole
	 where id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_generate_username]
Print 'Alter Procedure [dbo].[sec_generate_username]'
GO
ALTER PROCEDURE [dbo].[sec_generate_username]
	@id_num varchar(12)
AS
BEGIN
	declare @firstname varchar(50)
	declare @lastname varchar(50)
	
	select @firstname = employee_firstname,
		   @lastname = employee_lastname
	  from employee (nolock)
	 where id_num = @id_num
	 
	declare @username varchar(25)
	
	-- get initials of name and concatenate id number
	set @username = LEFT(@firstname,1) + LEFT(@lastname,1) + @id_num
	
	select @username
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_get_by_date_no_joins]
Print 'Alter Procedure [dbo].[dtr_get_by_date_no_joins]'
GO

ALTER PROCEDURE [dbo].[dtr_get_by_date_no_joins] 
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_get_user_rights]
Print 'Alter Procedure [dbo].[sec_get_user_rights]'
GO

ALTER PROCEDURE [dbo].[sec_get_user_rights]
	@id_num varchar(12)
AS
BEGIN
	select distinct privilege_code
	  from sysroleprivilege rp (nolock)
	  join sysuserrole ur (nolock) 
	    on ur.role_code = rp.role_code and ur.id_num = @id_num
	  
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_employees]
Print 'Alter Procedure [dbo].[hris_get_employees]'
GO
ALTER PROCEDURE [dbo].[hris_get_employees]
	@lastname varchar(50),
	@firstname varchar(50),
	@option int
AS
BEGIN

	if @lastname = '' 
	  set @lastname = null
	 
	if @firstname = ''
	  set @firstname = null
	  
	-- partial
	if @option = 1
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (e.employee_lastname like '%' + @lastname + '%'))
		   and (@firstname is null or (e.employee_firstname like '%' + @firstname + '%'))
	  order by e.employee_lastname,
			   e.employee_firstname
	end 
	else if @option = 2
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (lower(e.employee_lastname) = lower(@lastname)))
		   and (@firstname is null or (lower(e.employee_firstname) = (@firstname)))
	  order by e.employee_lastname,
			   e.employee_firstname
	end
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_employee]
Print 'Alter Procedure [dbo].[hris_get_employee]'
GO
ALTER PROCEDURE [dbo].[hris_get_employee]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from employee e (nolock)
	 where e.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_load_exported_dtr]
Print 'Alter Procedure [dbo].[dtr_load_exported_dtr]'
GO

ALTER PROCEDURE [dbo].[dtr_load_exported_dtr]
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_get_dtr_for_import]
Print 'Alter Procedure [dbo].[dtr_get_dtr_for_import]'
GO

ALTER PROCEDURE [dbo].[dtr_get_dtr_for_import]
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[dtr_import_dtr]
Print 'Alter Procedure [dbo].[dtr_import_dtr]'
GO

ALTER PROCEDURE [dbo].[dtr_import_dtr]
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_dd_get_allowance_types]
Print 'Alter Procedure [dbo].[hris_dd_get_allowance_types]'
GO
ALTER PROCEDURE [dbo].[hris_dd_get_allowance_types]
AS
BEGIN
	select at.allowancetype_code,
	       at.allowancetype_name,
	       lat.location_code
	  from t_allowancetype at (nolock)
	  join locationallowancetype lat (nolock)
	    on lat.allowancetype_code = at.allowancetype_code
  order by at.allowancetype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[sec_get_pin]
Print 'Alter Procedure [dbo].[sec_get_pin]'
GO

ALTER PROCEDURE [dbo].[sec_get_pin]
	@id_num int
AS
BEGIN
	select pin
	  from employee e (nolock)
	 where e.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empfamily]
Print 'Alter Procedure [dbo].[hris_get_empfamily]'
GO
ALTER PROCEDURE [dbo].[hris_get_empfamily]
	@id_num int
AS
BEGIN
	select *
	  from empfamily ef (nolock)
	 where ef.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empemergency]
Print 'Alter Procedure [dbo].[hris_get_empemergency]'
GO
ALTER PROCEDURE [dbo].[hris_get_empemergency]
	@id_num int
AS
BEGIN
	select *
	  from empemergency ee (nolock)
	 where ee.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empcontact_p]
Print 'Alter Procedure [dbo].[hris_get_empcontact_p]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_get_empcontact_p]
	@id_num int
AS
BEGIN
	select *
	  from empcontact ec (nolock)
	 where ec.id_num = @id_num
	   and contact_type = 'P'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empcontact_h]
Print 'Alter Procedure [dbo].[hris_get_empcontact_h]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_get_empcontact_h]
	@id_num int
AS
BEGIN
	select *
	  from empcontact ec (nolock)
	 where ec.id_num = @id_num
	   and contact_type = 'H'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empaddress_p]
Print 'Alter Procedure [dbo].[hris_get_empaddress_p]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_get_empaddress_p]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empaddress ea (nolock)
	 where ea.id_num = @id_num
	   and address_type = 'P'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_empaddress_h]
Print 'Alter Procedure [dbo].[hris_get_empaddress_h]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_get_empaddress_h]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empaddress ea (nolock)
	 where ea.id_num = @id_num
	   and address_type = 'H'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_paf]
Print 'Alter Procedure [dbo].[hris_get_paf]'
GO
ALTER PROCEDURE [dbo].[hris_get_paf]
	@paf_id int
AS
BEGIN
	select p.paf_id,
		   p.effective_date,
		   p.effective_until,
		   p.id_num,
		   p.salary,
		   p.frequency_code,
		   p.position_code,
		   p.empstatus_code,
		   p.posstatus_code,
		   p.location_code,
		   p.department_code,
		   p.paf_remarks,
		   p.created_by,
		   p.created_date,
		   p.modified_by,
		   p.modified_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.is_cancelled
	  from paf p (nolock)
	 where paf_id = @paf_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_latest_paf]
Print 'Alter Procedure [dbo].[hris_get_latest_paf]'
GO
ALTER PROCEDURE [dbo].[hris_get_latest_paf]
	@id_num int
AS
BEGIN
	select top 1 *
	  from paf p (nolock)
	 where p.id_num = @id_num
	   and isnull(p.is_cancelled,0) = 0
  order by p.effective_date desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_paf_list]
Print 'Alter Procedure [dbo].[hris_get_paf_list]'
GO
ALTER PROCEDURE [dbo].[hris_get_paf_list]
	@id_num varchar(12),
	@user_id_num varchar(12)
AS
BEGIN
	select p.paf_id,
		   e.id_num,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   ps.position_name,
		   pst.posstatus_name,
		   es.empstatus_name,
		   l.location_name,
		   p.salary,
		   p.effective_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement
	  from paf p (nolock)
	  join employee e (nolock) on e.id_num = p.id_num
	  join t_position ps (nolock) on ps.position_code = p.position_code
	  join t_empstatus es (nolock) on es.empstatus_code = p.empstatus_code
	  join t_positionstatus pst (nolock) on pst.posstatus_code = p.posstatus_code
	  join location l (nolock) on l.location_code = p.location_code
	 where (ISNULL(@id_num,'') = '' or p.id_num = @id_num)
	   and (ps.level_code in ( 
							   select distinct level_code
							     from sysroleprivilege rp (nolock)
							     join sysuserrole ur (nolock) 
								   on ur.role_code = rp.role_code and ur.id_num = @user_id_num
							     join sysrolelevel rl (nolock)
								   on rl.role_code = rp.role_code
							    where rp.privilege_code = 'PAF_VIEW')
							 ) 
  order by p.paf_id desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_latest_paf_allowances]
Print 'Alter Procedure [dbo].[hris_get_latest_paf_allowances]'
GO
ALTER PROCEDURE [dbo].[hris_get_latest_paf_allowances]
	@paf_id int
AS
BEGIN
	select *
	  from pafallowance pa (nolock)
	  join (select lat.allowancetype_code
		      from locationallowancetype lat (nolock)
		      join paf p (nolock) 
		        on p.location_code = lat.location_code
		     where p.paf_id = @paf_id
		   ) a
		on a.allowancetype_code = pa.allowancetype_code
	 where pa.paf_id = @paf_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Trigger [dbo].[tr_set_location_code]
Print 'Alter Trigger [dbo].[tr_set_location_code]'
GO
ALTER TRIGGER [dbo].[tr_set_location_code] 
   ON  dbo.dtr
   AFTER INSERT
AS 
BEGIN
	declare @location_code char(3),
		    @id_num varchar(12),
		    @use_paf_location varchar(30)
			
	select @location_code = location_code,
		   @id_num = id_num
	  from inserted
	  
	if ISNULL(@location_code,'') = '' 
	begin
		-- check if paf table exists
		if (exists (select 1
		              from INFORMATION_SCHEMA.TABLES 
                     where TABLE_SCHEMA = 'dbo' 
                       and  TABLE_NAME = 'paf'))
		begin
			-- get the location from paf
		    select top 1 @location_code = location_code 
			  from paf p (nolock)
			 where p.id_num = @id_num
			   and ISNULL(is_cancelled,0) = 0
		  order by p.effective_date desc
		end
		else
		begin
			set @use_paf_location = isnull(dbo.fn_get_sysconfig_value('USE_PAF_LOCATION'),0)
			
			if ISNULL(@use_paf_location,0) = 0
				set @location_code = dbo.fn_get_sysconfig_value('LOCATION_CODE')
			else
				set @location_code = null
		end

		update dtr
			   set location_code = @location_code
			 where dtr_id = (select dtr_id 
		   					   from inserted)
	end
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Trigger [dbo].[tr_rank_movement]
Print 'Alter Trigger [dbo].[tr_rank_movement]'
GO
ALTER TRIGGER [dbo].[tr_rank_movement] 
   ON  dbo.paf 
   AFTER INSERT
AS 
BEGIN
    declare @paf_id int,
            @id_num int,
            @old_position char(3),
	        @new_position char(3),
	        @old_rank int,
	        @new_rank int,
	        @rank_movement int,
	        @initial int
	
	-- get details of inserted PAF        
	select @paf_id = paf_id,
		   @id_num = id_num,
		   @new_position = position_code
      from inserted
      
    -- get rank of new position
    select @new_rank = "rank"
      from t_level l (nolock)
      join t_position p (nolock) on p.level_code = l.level_code
     where p.position_code = @new_position
     
    -- check if paf is initial
    select @initial = COUNT(paf_id)
      from paf pf (nolock) 
     where pf.id_num = @id_num
       and isnull(pf.is_cancelled,0) = 0
     
    if @initial = 1 set @old_rank = @new_rank
    else
    begin 
		-- get previous position
		select top 1 @old_position = pf.position_code 
		  from paf pf (nolock)
		 where pf.id_num = @id_num
		   and pf.paf_id <> @paf_id
		   and isnull(pf.is_cancelled,0) = 0
	  order by pf.effective_date desc, pf.paf_id desc
	  
		-- get rank of previous position
		select @old_rank = "rank"
		  from t_level l (nolock)
		  join t_position p (nolock) on p.level_code = l.level_code
		 where p.position_code = @old_position
	end
	 
	-- compare rank
	if @new_rank = @old_rank set @rank_movement = 0 -- no change
	else if @new_rank > @old_rank set @rank_movement = -1 -- demotion
	else set @rank_movement = 1 -- promotion
	
	-- update rank_movement column of INSERTED paf
	update paf
	   set rank_movement = @rank_movement
	 where paf_id = @paf_id 

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_t_overridetype on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_overridetype on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_overridetype]
	FOREIGN KEY ([overridetype_code]) REFERENCES [dbo].[t_overridetype] ([overridetype_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_overridetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_locationallowancetype_location on [dbo].[locationallowancetype]
Print 'Create Foreign Key FK_locationallowancetype_location on [dbo].[locationallowancetype]'
GO
ALTER TABLE [dbo].[locationallowancetype]
	WITH CHECK
	ADD CONSTRAINT [FK_locationallowancetype_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
ALTER TABLE [dbo].[locationallowancetype]
	CHECK CONSTRAINT [FK_locationallowancetype_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_locationallowancetype_t_allowancetype on [dbo].[locationallowancetype]
Print 'Create Foreign Key FK_locationallowancetype_t_allowancetype on [dbo].[locationallowancetype]'
GO
ALTER TABLE [dbo].[locationallowancetype]
	WITH CHECK
	ADD CONSTRAINT [FK_locationallowancetype_t_allowancetype]
	FOREIGN KEY ([allowancetype_code]) REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
ALTER TABLE [dbo].[locationallowancetype]
	CHECK CONSTRAINT [FK_locationallowancetype_t_allowancetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysuserrole_sysrole on [dbo].[sysuserrole]
Print 'Create Foreign Key FK_sysuserrole_sysrole on [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole]
	WITH CHECK
	ADD CONSTRAINT [FK_sysuserrole_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysuserrole]
	CHECK CONSTRAINT [FK_sysuserrole_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Extended Property MS_Description on [dbo].[locationallowancetype]
Print 'Create Extended Property MS_Description on [dbo].[locationallowancetype]'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sets the allowance for the specified location. Null means users need to set this values when adding a new paf record.', 'SCHEMA', N'dbo', 'TABLE', N'locationallowancetype', 'COLUMN', N'allowance_amount'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

ALTER PROCEDURE [dbo].[hris_dd_get_allowance_types]
AS
BEGIN
	select at.allowancetype_code,
	       at.allowancetype_name,
	       lat.location_code
	  from t_allowancetype at (nolock)
 left join locationallowancetype lat (nolock)
	    on lat.allowancetype_code = at.allowancetype_code
  order by at.allowancetype_name
END

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

