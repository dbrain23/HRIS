/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_rank_movement]

    procedures:
        [dbo].[dtr_log_time], [dbo].[hris_dd_get_am_pm], [dbo].[hris_dd_get_leave_status], [dbo].[hris_dd_get_leave_types], [dbo].[hris_dd_get_leaveapp_status], [dbo].[hris_get_leave], [dbo].[hris_get_leave_types], [dbo].[hris_get_leaveapplication_status], [dbo].[hris_get_leavedetail], [dbo].[hris_get_leaves]

    tables:
        [dbo].[employee], [dbo].[leave], [dbo].[leavecredit], [dbo].[leavedetail], [dbo].[paf], [dbo].[pafallowance], [dbo].[pafcomponent], [dbo].[sysroleprivilege], [dbo].[sysuserrole], [dbo].[t_allowancetype], [dbo].[t_leaveapplicationstatus], [dbo].[t_leavetype], [dbo].[t_position]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	4/06/2014 9:41:25 PM

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

-- Drop Reference FK_leavedetail_leave from [dbo].[leavedetail]
Print 'Drop Reference FK_leavedetail_leave from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [FK_leavedetail_leave]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leave_employee from [dbo].[leave]
Print 'Drop Foreign Key FK_leave_employee from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [FK_leave_employee]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leave_t_leavestatus from [dbo].[leave]
Print 'Drop Foreign Key FK_leave_t_leavestatus from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [FK_leave_t_leavestatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leave_t_leavetype from [dbo].[leave]
Print 'Drop Foreign Key FK_leave_t_leavetype from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [FK_leave_t_leavetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leavecredit_employee from [dbo].[leavecredit]
Print 'Drop Foreign Key FK_leavecredit_employee from [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [FK_leavecredit_employee]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leavedetail_t_leavestatus from [dbo].[leavedetail]
Print 'Drop Foreign Key FK_leavedetail_t_leavestatus from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [FK_leavedetail_t_leavestatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leavedetail_t_leavetype from [dbo].[leavedetail]
Print 'Drop Foreign Key FK_leavedetail_t_leavetype from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [FK_leavedetail_t_leavetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_paf_t_empstatus from [dbo].[paf]
Print 'Drop Foreign Key FK_paf_t_empstatus from [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_t_empstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_paf_t_positionstatus from [dbo].[paf]
Print 'Drop Foreign Key FK_paf_t_positionstatus from [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_t_positionstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_paf_paf from [dbo].[paf]
Print 'Drop Foreign Key FK_paf_paf from [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_paf]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_pafallowance_t_allowancetype from [dbo].[pafallowance]
Print 'Drop Foreign Key FK_pafallowance_t_allowancetype from [dbo].[pafallowance]'
GO
ALTER TABLE [dbo].[pafallowance] DROP CONSTRAINT [FK_pafallowance_t_allowancetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_pafcomponent_t_pafcomptype from [dbo].[pafcomponent]
Print 'Drop Foreign Key FK_pafcomponent_t_pafcomptype from [dbo].[pafcomponent]'
GO
ALTER TABLE [dbo].[pafcomponent] DROP CONSTRAINT [FK_pafcomponent_t_pafcomptype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysroleprivilege_sysprivilege from [dbo].[sysroleprivilege]
Print 'Drop Foreign Key FK_sysroleprivilege_sysprivilege from [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysroleprivilege_sysrole from [dbo].[sysroleprivilege]
Print 'Drop Foreign Key FK_sysroleprivilege_sysrole from [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysrole]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysuserrole_sysuser from [dbo].[sysuserrole]
Print 'Drop Foreign Key FK_sysuserrole_sysuser from [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysuser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_t_allowancetype_t_allowancetype from [dbo].[t_allowancetype]
Print 'Drop Foreign Key FK_t_allowancetype_t_allowancetype from [dbo].[t_allowancetype]'
GO
ALTER TABLE [dbo].[t_allowancetype] DROP CONSTRAINT [FK_t_allowancetype_t_allowancetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_t_position_t_level from [dbo].[t_position]
Print 'Drop Foreign Key FK_t_position_t_level from [dbo].[t_position]'
GO
ALTER TABLE [dbo].[t_position] DROP CONSTRAINT [FK_t_position_t_level]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Trigger [dbo].[tr_rank_movement]
Print 'Drop Trigger [dbo].[tr_rank_movement]'
GO
DROP TRIGGER [dbo].[tr_rank_movement]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[dtr_log_time]
Print 'Drop Procedure [dbo].[dtr_log_time]'
GO
DROP PROCEDURE [dbo].[dtr_log_time]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_leavedetail_is_halfday from [dbo].[leavedetail]
Print 'Drop Default Constraint DF_leavedetail_is_halfday from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [DF_leavedetail_is_halfday]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_leavedetail from [dbo].[leavedetail]
Print 'Drop Primary Key PK_leavedetail from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [PK_leavedetail]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column leavetype_code from [dbo].[leavedetail]
Print 'Drop Column leavetype_code from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP COLUMN [leavetype_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column leavedetail_id from [dbo].[leavedetail]
Print 'Drop Column leavedetail_id from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP COLUMN [leavedetail_id]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Index IX_leavecredit_year from [dbo].[leavecredit]
Print 'Drop Index IX_leavecredit_year from [dbo].[leavecredit]'
GO
DROP INDEX [IX_leavecredit_year] ON [dbo].[leavecredit]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_leavecredit from [dbo].[leavecredit]
Print 'Drop Primary Key PK_leavecredit from [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [PK_leavecredit]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_leaveapplication_is_halfday from [dbo].[leave]
Print 'Drop Default Constraint DF_leaveapplication_is_halfday from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [DF_leaveapplication_is_halfday]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_leave_is_cancelled from [dbo].[leave]
Print 'Drop Default Constraint DF_leave_is_cancelled from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [DF_leave_is_cancelled]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_leave from [dbo].[leave]
Print 'Drop Primary Key PK_leave from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [PK_leave]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_leaveapplicationstatus]
Print 'Create Table [dbo].[t_leaveapplicationstatus]'
GO
CREATE TABLE [dbo].[t_leaveapplicationstatus] (
		[leaveappstatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leaveappstatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leaveappstatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[close_record]                   [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_leaveapplicationstatus to [dbo].[t_leaveapplicationstatus]
Print 'Add Primary Key PK_t_leaveapplicationstatus to [dbo].[t_leaveapplicationstatus]'
GO
ALTER TABLE [dbo].[t_leaveapplicationstatus]
	ADD
	CONSTRAINT [PK_t_leaveapplicationstatus]
	PRIMARY KEY
	CLUSTERED
	([leaveappstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_t_leaveapplicationstatus_is_closed to [dbo].[t_leaveapplicationstatus]
Print 'Add Default Constraint DF_t_leaveapplicationstatus_is_closed to [dbo].[t_leaveapplicationstatus]'
GO
ALTER TABLE [dbo].[t_leaveapplicationstatus]
	ADD
	CONSTRAINT [DF_t_leaveapplicationstatus_is_closed]
	DEFAULT ((0)) FOR [close_record]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_leaveapplicationstatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column max_days to [dbo].[t_leavetype]
Print 'Add Column max_days to [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype]
	ADD [max_days] [smallint] NOT NULL
	CONSTRAINT [DF_t_leavetype_max_days] DEFAULT ((0))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_am_pm]
Print 'Create Procedure [dbo].[hris_dd_get_am_pm]'
GO

CREATE PROCEDURE dbo.hris_dd_get_am_pm
AS
BEGIN
	select 'A' value, 
	       'AM' display
	union
	select 'P' value,
	       'PM' display
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leave_types]
Print 'Create Procedure [dbo].[hris_get_leave_types]'
GO

-- =============================================
CREATE PROCEDURE dbo.hris_get_leave_types
AS
BEGIN
	select *
	  from t_leavetype lt (nolock)
  order by lt.leavetype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leaveapplication_status]
Print 'Create Procedure [dbo].[hris_get_leaveapplication_status]'
GO

-- =============================================
CREATE PROCEDURE dbo.hris_get_leaveapplication_status
AS
BEGIN
	select *
	  from t_leaveapplicationstatus las (nolock)
  order by las.leaveappstatus_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_leaveapp_status]
Print 'Create Procedure [dbo].[hris_dd_get_leaveapp_status]'
GO

CREATE PROCEDURE dbo.hris_dd_get_leaveapp_status
AS
BEGIN
	select leaveappstatus_code,
	       leaveappstatus_name
	  from t_leaveapplicationstatus las (nolock)
  order by las.leaveappstatus_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_leave_status]
Print 'Create Procedure [dbo].[hris_dd_get_leave_status]'
GO

CREATE PROCEDURE dbo.hris_dd_get_leave_status
AS
BEGIN
	select ls.leavestatus_code,
	       ls.leavestatus_name
	  from t_leavestatus ls (nolock)
  order by ls.leavestatus_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_leave_types]
Print 'Create Procedure [dbo].[hris_dd_get_leave_types]'
GO
CREATE PROCEDURE dbo.hris_dd_get_leave_types
AS
BEGIN
	select leavetype_code,
		   leavetype_name
	  from t_leavetype lt (nolock)
  order by lt.leavetype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
EXEC sp_rename @objname = N'[dbo].[leavecredit]', @newname = N'temp1266103551', @objtype = 'OBJECT'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[leavecredit]
Print 'Create Table [dbo].[leavecredit]'
GO
CREATE TABLE [dbo].[leavecredit] (
		[year]               [int] NOT NULL,
		[employee_id]        [int] NOT NULL,
		[leavetype_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_credits]      [int] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[leavecredit] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp1266103551 into the table [dbo].[leavecredit]
-- Restore data
IF OBJECT_ID('[dbo].temp1266103551') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[leavecredit]') AND [type]='U')
EXEC sp_executesql N'
INSERT INTO [dbo].[leavecredit] ([year], [employee_id], [leave_credits])
   SELECT [year], [employee_id], [leave_credits] FROM [dbo].temp1266103551
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[leavecredit] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_leavecredit_1 to [dbo].[leavecredit]
Print 'Add Primary Key PK_leavecredit_1 to [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit]
	ADD
	CONSTRAINT [PK_leavecredit_1]
	PRIMARY KEY
	CLUSTERED
	([year], [employee_id], [leavetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Index IX_leavecredit_year on [dbo].[leavecredit]
Print 'Create Index IX_leavecredit_year on [dbo].[leavecredit]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_leavecredit_year]
	ON [dbo].[leavecredit] ([year])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp1266103551
IF OBJECT_ID('[dbo].temp1266103551') IS NOT NULL DROP TABLE [dbo].temp1266103551
GO

EXEC sp_rename @objname = N'[dbo].[leave]', @newname = N'temp645577338', @objtype = 'OBJECT'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[leave]
Print 'Create Table [dbo].[leave]'
GO
CREATE TABLE [dbo].[leave] (
		[leave_id]                   [int] IDENTITY(1, 1) NOT NULL,
		[leave_application_date]     [datetime] NOT NULL,
		[employee_id]                [int] NOT NULL,
		[leavetype_code]             [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_reason]               [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[justification]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[leaveappstatus_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_remarks]              [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_cancelled]               [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leave_is_cancelled to [dbo].[leave]
Print 'Add Default Constraint DF_leave_is_cancelled to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD
	CONSTRAINT [DF_leave_is_cancelled]
	DEFAULT ((0)) FOR [is_cancelled]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[leave] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp645577338 into the table [dbo].[leave]
-- Restore data
IF OBJECT_ID('[dbo].temp645577338') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[leave]') AND [type]='U')
EXEC sp_executesql N'
SET IDENTITY_INSERT [dbo].[leave] ON
INSERT INTO [dbo].[leave] ([leave_id], [leave_application_date], [employee_id], [leavetype_code], [leave_remarks], [is_cancelled])
   SELECT [leave_id], CAST([leave_application_date] AS [datetime]), [employee_id], [leavetype_code], [leave_remarks], [is_cancelled] FROM [dbo].temp645577338
SET IDENTITY_INSERT [dbo].[leave] OFF
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_leave to [dbo].[leave]
Print 'Add Primary Key PK_leave to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD
	CONSTRAINT [PK_leave]
	PRIMARY KEY
	CLUSTERED
	([leave_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp645577338
IF OBJECT_ID('[dbo].temp645577338') IS NOT NULL DROP TABLE [dbo].temp645577338
GO

-- Alter Column leavestatus_code on [dbo].[leavedetail]
Print 'Alter Column leavestatus_code on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	 ALTER COLUMN [leavestatus_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column is_halfday on [dbo].[leavedetail]
Print 'Alter Column is_halfday on [dbo].[leavedetail]'
GO
UPDATE [dbo].[leavedetail] SET [is_halfday]=((0)) WHERE [is_halfday] IS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[leavedetail]
	 ALTER COLUMN [is_halfday] [smallint] NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column leave_date on [dbo].[leavedetail]
Print 'Alter Column leave_date on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	 ALTER COLUMN [leave_date] [datetime] NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column am_pm to [dbo].[leavedetail]
Print 'Add Column am_pm to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD [am_pm] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	CONSTRAINT [DF_leavedetail_am_pm] DEFAULT ('W')
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_leavedetail to [dbo].[leavedetail]
Print 'Add Primary Key PK_leavedetail to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [PK_leavedetail]
	PRIMARY KEY
	CLUSTERED
	([leave_id], [leave_date], [am_pm])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leavedetail_is_halfday to [dbo].[leavedetail]
Print 'Add Default Constraint DF_leavedetail_is_halfday to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [DF_leavedetail_is_halfday]
	DEFAULT ((0)) FOR [is_halfday]
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
	   and d.employee_id = @employee_id  
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 and @dtr_time < '17:00:00'
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
	  
	  -- get total hours
	  -- total hours is used to compare
	  -- with interval..do not allow to log time if hours is less than interval
	  select @total_hours = DATEDIFF(minute,d.time_in,@dtr_time) / 60.0
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.employee_id = @employee_id 
	     and d.time_out is null
	     
	  -- check if afternoon log is complete
	  -- do not allow to log time if afternoon log is complete
	  select @log_complete = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.employee_id = @employee_id
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
	  else if (@orphaned = 1) 
	   and (@total_hours >= @min_timeout_interval)
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leave]
Print 'Create Procedure [dbo].[hris_get_leave]'
GO

CREATE PROCEDURE dbo.hris_get_leave
	@leave_id integer
AS
BEGIN
	select *
	  from leave l (nolock)
	 where l.leave_id = @leave_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leaves]
Print 'Create Procedure [dbo].[hris_get_leaves]'
GO

CREATE PROCEDURE dbo.hris_get_leaves
	@employee_id int
AS
BEGIN
	select *
	  from leave l (nolock)
	 where l.employee_id = @employee_id
  order by l.leave_application_date desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leavedetail]
Print 'Create Procedure [dbo].[hris_get_leavedetail]'
GO

CREATE PROCEDURE dbo.hris_get_leavedetail
	@leave_id integer
AS
BEGIN
	select *
	  from leavedetail ld (nolock)
	 where ld.leave_id = @leave_id
  order by ld.leave_date
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_rank_movement]
Print 'Create Trigger [dbo].[tr_rank_movement]'
GO
CREATE TRIGGER [dbo].[tr_rank_movement] 
   ON  dbo.paf 
   AFTER INSERT
AS 
BEGIN
    declare @paf_id int,
            @employee_id int,
            @old_position char(3),
	        @new_position char(3),
	        @old_rank int,
	        @new_rank int,
	        @rank_movement int,
	        @initial int
	
	-- get details of inserted PAF        
	select @paf_id = paf_id,
		   @employee_id = employee_id,
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
     where pf.employee_id = @employee_id
       and isnull(pf.is_cancelled,0) = 0
     
    if @initial = 1 set @old_rank = @new_rank
    else
    begin 
		-- get previous position
		select top 1 @old_position = pf.position_code 
		  from paf pf (nolock)
		 where pf.employee_id = @employee_id
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
-- Create Foreign Key FK_employee_t_religion on [dbo].[employee]
Print 'Create Foreign Key FK_employee_t_religion on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	WITH CHECK
	ADD CONSTRAINT [FK_employee_t_religion]
	FOREIGN KEY ([religion_id]) REFERENCES [dbo].[t_religion] ([religion_id])
ALTER TABLE [dbo].[employee]
	CHECK CONSTRAINT [FK_employee_t_religion]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_employee on [dbo].[leave]
Print 'Create Foreign Key FK_leave_employee on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_employee]
	FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([employee_id])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_t_leaveapplicationstatus on [dbo].[leave]
Print 'Create Foreign Key FK_leave_t_leaveapplicationstatus on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_t_leaveapplicationstatus]
	FOREIGN KEY ([leaveappstatus_code]) REFERENCES [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_t_leaveapplicationstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_t_leavetype on [dbo].[leave]
Print 'Create Foreign Key FK_leave_t_leavetype on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_t_leavetype]
	FOREIGN KEY ([leavetype_code]) REFERENCES [dbo].[t_leavetype] ([leavetype_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_t_leavetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Reference FK_leavedetail_leave on [dbo].[leave]
Print 'Create Reference FK_leavedetail_leave on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD CONSTRAINT [FK_leavedetail_leave]
	FOREIGN KEY ([leave_id]) REFERENCES [dbo].[leave] ([leave_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavecredit_employee on [dbo].[leavecredit]
Print 'Create Foreign Key FK_leavecredit_employee on [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit]
	WITH CHECK
	ADD CONSTRAINT [FK_leavecredit_employee]
	FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([employee_id])
ALTER TABLE [dbo].[leavecredit]
	CHECK CONSTRAINT [FK_leavecredit_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavecredit_t_leavetype on [dbo].[leavecredit]
Print 'Create Foreign Key FK_leavecredit_t_leavetype on [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit]
	WITH CHECK
	ADD CONSTRAINT [FK_leavecredit_t_leavetype]
	FOREIGN KEY ([leavetype_code]) REFERENCES [dbo].[t_leavetype] ([leavetype_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[leavecredit]
	CHECK CONSTRAINT [FK_leavecredit_t_leavetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_t_leavestatus on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_t_leavestatus on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_t_leavestatus]
	FOREIGN KEY ([leavestatus_code]) REFERENCES [dbo].[t_leavestatus] ([leavestatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_t_leavestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_t_empstatus on [dbo].[paf]
Print 'Create Foreign Key FK_paf_t_empstatus on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_t_empstatus]
	FOREIGN KEY ([empstatus_code]) REFERENCES [dbo].[t_empstatus] ([empstatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_t_empstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_t_salaryfrequency on [dbo].[paf]
Print 'Create Foreign Key FK_paf_t_salaryfrequency on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_t_salaryfrequency]
	FOREIGN KEY ([frequency_code]) REFERENCES [dbo].[t_salaryfrequency] ([frequency_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_t_salaryfrequency]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_sysuser1 on [dbo].[paf]
Print 'Create Foreign Key FK_paf_sysuser1 on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_sysuser1]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([user_id])
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_t_positionstatus on [dbo].[paf]
Print 'Create Foreign Key FK_paf_t_positionstatus on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_t_positionstatus]
	FOREIGN KEY ([posstatus_code]) REFERENCES [dbo].[t_positionstatus] ([posstatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_t_positionstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_sysuser on [dbo].[paf]
Print 'Create Foreign Key FK_paf_sysuser on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([user_id])
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_pafallowance_t_allowancetype on [dbo].[pafallowance]
Print 'Create Foreign Key FK_pafallowance_t_allowancetype on [dbo].[pafallowance]'
GO
ALTER TABLE [dbo].[pafallowance]
	WITH CHECK
	ADD CONSTRAINT [FK_pafallowance_t_allowancetype]
	FOREIGN KEY ([allowancetype_code]) REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[pafallowance]
	CHECK CONSTRAINT [FK_pafallowance_t_allowancetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_pafcomponent_t_pafcomptype on [dbo].[pafcomponent]
Print 'Create Foreign Key FK_pafcomponent_t_pafcomptype on [dbo].[pafcomponent]'
GO
ALTER TABLE [dbo].[pafcomponent]
	WITH CHECK
	ADD CONSTRAINT [FK_pafcomponent_t_pafcomptype]
	FOREIGN KEY ([pafcomp_type_code]) REFERENCES [dbo].[t_pafcomptype] ([pafcomp_type_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[pafcomponent]
	CHECK CONSTRAINT [FK_pafcomponent_t_pafcomptype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysroleprivilege_sysprivilege on [dbo].[sysroleprivilege]
Print 'Create Foreign Key FK_sysroleprivilege_sysprivilege on [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege]
	WITH CHECK
	ADD CONSTRAINT [FK_sysroleprivilege_sysprivilege]
	FOREIGN KEY ([privilege_code]) REFERENCES [dbo].[sysprivilege] ([privilege_code])
	ON DELETE CASCADE
ALTER TABLE [dbo].[sysroleprivilege]
	CHECK CONSTRAINT [FK_sysroleprivilege_sysprivilege]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysroleprivilege_sysrole on [dbo].[sysroleprivilege]
Print 'Create Foreign Key FK_sysroleprivilege_sysrole on [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege]
	WITH CHECK
	ADD CONSTRAINT [FK_sysroleprivilege_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
	ON DELETE CASCADE
ALTER TABLE [dbo].[sysroleprivilege]
	CHECK CONSTRAINT [FK_sysroleprivilege_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysuserrole_sysuser on [dbo].[sysuserrole]
Print 'Create Foreign Key FK_sysuserrole_sysuser on [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole]
	WITH CHECK
	ADD CONSTRAINT [FK_sysuserrole_sysuser]
	FOREIGN KEY ([user_id]) REFERENCES [dbo].[sysuser] ([user_id])
	ON DELETE CASCADE
ALTER TABLE [dbo].[sysuserrole]
	CHECK CONSTRAINT [FK_sysuserrole_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_position_t_level on [dbo].[t_position]
Print 'Create Foreign Key FK_t_position_t_level on [dbo].[t_position]'
GO
ALTER TABLE [dbo].[t_position]
	WITH CHECK
	ADD CONSTRAINT [FK_t_position_t_level]
	FOREIGN KEY ([level_code]) REFERENCES [dbo].[t_level] ([level_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[t_position]
	CHECK CONSTRAINT [FK_t_position_t_level]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

