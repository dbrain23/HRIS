/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    procedures:
        [dbo].[dtr_log_time], [dbo].[sec_get_pin], [dbo].[sys_get_sysconfig]

    tables:
        [dbo].[branch], [dbo].[dtr]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	11/05/2014 9:58:39 PM

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
USE [LogBox_Live]
GO

BEGIN TRAN
GO

-- Drop Procedure [dbo].[dtr_log_time]
Print 'Drop Procedure [dbo].[dtr_log_time]'
GO
DROP PROCEDURE [dbo].[dtr_log_time]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF__dtr__branch_code__70A8B9AE from [dbo].[dtr]
Print 'Drop Default Constraint DF__dtr__branch_code__70A8B9AE from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [DF__dtr__branch_code__70A8B9AE]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column area_code to [dbo].[branch]
Print 'Add Column area_code to [dbo].[branch]'
GO
ALTER TABLE [dbo].[branch]
	ADD [area_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sec_get_pin]
Print 'Create Procedure [dbo].[sec_get_pin]'
GO

CREATE PROCEDURE dbo.sec_get_pin
	@user_id int
AS
BEGIN
	select pin
	  from employee e (nolock)
	 where e.employee_id = @user_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sys_get_sysconfig]
Print 'Create Procedure [dbo].[sys_get_sysconfig]'
GO

CREATE PROCEDURE dbo.sys_get_sysconfig
AS
BEGIN
	select *
	  from sysconfig sc (nolock)
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column dtrstatus_code on [dbo].[dtr]
Print 'Alter Column dtrstatus_code on [dbo].[dtr]'
GO
UPDATE [dbo].[dtr] SET [dtrstatus_code]=('OPN') WHERE [dtrstatus_code] IS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[dtr]
	 ALTER COLUMN [dtrstatus_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column branch_code on [dbo].[dtr]
Print 'Alter Column branch_code on [dbo].[dtr]'
GO
UPDATE [dbo].[dtr] SET [branch_code]=([dbo].[fn_get_sysconfig_value]('BRANCH_CODE')) WHERE [branch_code] IS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[dtr]
	 ALTER COLUMN [branch_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtr_branch_code to [dbo].[dtr]
Print 'Add Default Constraint DF_dtr_branch_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD
	CONSTRAINT [DF_dtr_branch_code]
	DEFAULT ([dbo].[fn_get_sysconfig_value]('BRANCH_CODE')) FOR [branch_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtr_dtrstatus_code to [dbo].[dtr]
Print 'Add Default Constraint DF_dtr_dtrstatus_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD
	CONSTRAINT [DF_dtr_dtrstatus_code]
	DEFAULT ('OPN') FOR [dtrstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Index IX_dtr on [dbo].[dtr]
Print 'Create Index IX_dtr on [dbo].[dtr]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtr]
	ON [dbo].[dtr] ([branch_code], [remote_dtr_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_log_time]
Print 'Create Procedure [dbo].[dtr_log_time]'
GO


CREATE PROCEDURE [dbo].[dtr_log_time]
	@employee_id integer,
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
	
	-- get current date
	set @current_date = GETDATE()
	
	-- get DTR date
	set @dtr_date = CONVERT(date, @current_date, 101)
	-- get current time
	set @dtr_time = CONVERT(time, @current_date)
	-- get minimum timeout
	set @min_timeout_interval = dbo.fn_get_sysconfig_value('MIN_TIMEOUT_INTERVAL') 
	
	-- check if current date's log is complete
	-- meaning employee has logged his/her time
	-- employee can only have 2 "logs" 
	-- per day
	-- for both AM and PM 
	select @logged = COUNT(dtr_id)
	  from dtr d (nolock)
	 where d.dtr_date = @dtr_date
	   and d.employee_id = @employee_id  
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 --and @dtr_time < '17:00:00'
	begin
	  insert 
	    into dtr
			 (dtr_date,
			 employee_id,
			 time_in,
			 time_out,
			 dtr_snapshot_in,
			 dtr_snapshot_out,
			 dtr_remarks) 
	  values (@dtr_date
			 ,@employee_id
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
	     and d.employee_id = @employee_id 
	     and d.time_out is null  
	  
	  -- there is no orphaned record
	  -- AM time log is complete
	  -- create log for PM 
	  if @orphaned = 0 and @logged = 1
	  begin
		  insert 
			into dtr 
				 (dtr_date,
				 employee_id,
				 time_in,
				 time_out,
				 dtr_snapshot_in,
				 dtr_snapshot_out,
				 dtr_remarks)
		  values (@dtr_date
				 ,@employee_id
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
	  else if @orphaned = 1
	  begin
		update dtr
		   set time_out = @dtr_time,
			   dtr_snapshot_out = @dtr_snapshot
		 where dtr_date = @dtr_date
		   and employee_id = @employee_id
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
	 where e.employee_id = @employee_id
END



GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_branch_area on [dbo].[branch]
Print 'Create Foreign Key FK_branch_area on [dbo].[branch]'
GO
ALTER TABLE [dbo].[branch]
	WITH CHECK
	ADD CONSTRAINT [FK_branch_area]
	FOREIGN KEY ([area_code]) REFERENCES [dbo].[area] ([area_code])
ALTER TABLE [dbo].[branch]
	CHECK CONSTRAINT [FK_branch_area]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_branch on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_branch on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_branch]
	FOREIGN KEY ([branch_code]) REFERENCES [dbo].[branch] ([branch_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_branch]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_t_dtrstatus on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_dtrstatus on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_dtrstatus]
	FOREIGN KEY ([dtrstatus_code]) REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_dtrstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

