/* ------------------------------------------------------------

DESCRIPTION: Schema synchronization script for object(s) \r\n
    triggers:
        [dbo].[tr_delete_synched_record], [dbo].[tr_set_pin]

    procedures:
        [dbo].[dtr_change_roster_status], [dbo].[dtr_get_employees], [dbo].[dtr_get_override_by_date_am], [dbo].[dtr_get_override_by_date_pm], [dbo].[dtr_get_overtime], [dbo].[dtr_get_roster], [dbo].[dtr_get_rosterdetail], [dbo].[dtr_get_undertime], [dbo].[hris_change_leave_status], [dbo].[hris_dd_get_am_pm], [dbo].[hris_dd_get_blood_types], [dbo].[hris_dd_get_civil_status], [dbo].[hris_dd_get_gender], [dbo].[hris_dd_get_leave_reasons], [dbo].[hris_dd_get_leave_status], [dbo].[hris_dd_get_leave_types], [dbo].[hris_dd_get_leaveapp_status], [dbo].[hris_dd_get_override_reasons], [dbo].[hris_dd_get_overtime_reasons], [dbo].[hris_dd_get_religions], [dbo].[hris_dd_get_time_status], [dbo].[hris_dd_get_undertime_reasons], [dbo].[hris_get_employee], [dbo].[hris_get_leavedetail], [dbo].[hris_get_leaves], [dbo].[hris_get_overridereasons], [dbo].[hris_get_overtime_reasons], [dbo].[hris_get_undertime_reasons], [dbo].[sec_get_user_rights]

    tables:
        [dbo].[dtroverride], [dbo].[dtrovertime], [dbo].[dtrundertime], [dbo].[leave], [dbo].[leavedetail], [dbo].[roster], [dbo].[rosterdetail], [dbo].[t_leaveapplicationstatus], [dbo].[t_leavereason], [dbo].[t_leavestatus], [dbo].[t_leavetype], [dbo].[t_overtimereason], [dbo].[t_rosterdetailstatus], [dbo].[t_timestatus], [dbo].[t_undertimereason], [dbo].[undertime]

    functions:
        [dbo].[dtr_fn_get_location_code]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert author name]

   DATE:	19/08/2015 9:35:20 PM

   LEGAL:	2015 [Insert company name]

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
USE [LogBox]
GO

BEGIN TRAN
GO

-- Drop Foreign Key FK_dtroverride_t_syncstatus from [dbo].[dtroverride]
Print 'Drop Foreign Key FK_dtroverride_t_syncstatus from [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride] DROP CONSTRAINT [FK_dtroverride_t_syncstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_dtroverride_syncstatus_code from [dbo].[dtroverride]
Print 'Drop Default Constraint DF_dtroverride_syncstatus_code from [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride] DROP CONSTRAINT [DF_dtroverride_syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_overtimereason]
Print 'Create Table [dbo].[t_overtimereason]'
GO
CREATE TABLE [dbo].[t_overtimereason] (
		[overtime_reason_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[overtime_reason_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[overtime_reason_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_overtimereason to [dbo].[t_overtimereason]
Print 'Add Primary Key PK_t_overtimereason to [dbo].[t_overtimereason]'
GO
ALTER TABLE [dbo].[t_overtimereason]
	ADD
	CONSTRAINT [PK_t_overtimereason]
	PRIMARY KEY
	CLUSTERED
	([overtime_reason_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_overtimereason] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_leavestatus]
Print 'Create Table [dbo].[t_leavestatus]'
GO
CREATE TABLE [dbo].[t_leavestatus] (
		[leavestatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavestatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavestatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_leavestatus to [dbo].[t_leavestatus]
Print 'Add Primary Key PK_t_leavestatus to [dbo].[t_leavestatus]'
GO
ALTER TABLE [dbo].[t_leavestatus]
	ADD
	CONSTRAINT [PK_t_leavestatus]
	PRIMARY KEY
	CLUSTERED
	([leavestatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_leavestatus] SET (LOCK_ESCALATION = TABLE)
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_leavetype]
Print 'Create Table [dbo].[t_leavetype]'
GO
CREATE TABLE [dbo].[t_leavetype] (
		[leavetype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavetype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavetype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[max_days]                  [float] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_leavetype to [dbo].[t_leavetype]
Print 'Add Primary Key PK_t_leavetype to [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype]
	ADD
	CONSTRAINT [PK_t_leavetype]
	PRIMARY KEY
	CLUSTERED
	([leavetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_t_leavetype_max_days to [dbo].[t_leavetype]
Print 'Add Default Constraint DF_t_leavetype_max_days to [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype]
	ADD
	CONSTRAINT [DF_t_leavetype_max_days]
	DEFAULT ((0)) FOR [max_days]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_leavetype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_undertimereason]
Print 'Create Table [dbo].[t_undertimereason]'
GO
CREATE TABLE [dbo].[t_undertimereason] (
		[undertime_reason_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[undertime_reason_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[undertime_reason_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_undertimereason to [dbo].[t_undertimereason]
Print 'Add Primary Key PK_t_undertimereason to [dbo].[t_undertimereason]'
GO
ALTER TABLE [dbo].[t_undertimereason]
	ADD
	CONSTRAINT [PK_t_undertimereason]
	PRIMARY KEY
	CLUSTERED
	([undertime_reason_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_undertimereason] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_timestatus]
Print 'Create Table [dbo].[t_timestatus]'
GO
CREATE TABLE [dbo].[t_timestatus] (
		[timestatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[timestatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[timestatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_timestatus to [dbo].[t_timestatus]
Print 'Add Primary Key PK_t_timestatus to [dbo].[t_timestatus]'
GO
ALTER TABLE [dbo].[t_timestatus]
	ADD
	CONSTRAINT [PK_t_timestatus]
	PRIMARY KEY
	CLUSTERED
	([timestatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_timestatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_rosterdetailstatus]
Print 'Create Table [dbo].[t_rosterdetailstatus]'
GO
CREATE TABLE [dbo].[t_rosterdetailstatus] (
		[rdstatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[rdstatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[rdstatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_rosterdetailstatus to [dbo].[t_rosterdetailstatus]
Print 'Add Primary Key PK_t_rosterdetailstatus to [dbo].[t_rosterdetailstatus]'
GO
ALTER TABLE [dbo].[t_rosterdetailstatus]
	ADD
	CONSTRAINT [PK_t_rosterdetailstatus]
	PRIMARY KEY
	CLUSTERED
	([rdstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_rosterdetailstatus] SET (LOCK_ESCALATION = TABLE)
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
-- Create Procedure [dbo].[hris_dd_get_blood_types]
Print 'Create Procedure [dbo].[hris_dd_get_blood_types]'
GO
CREATE PROCEDURE [dbo].[hris_dd_get_blood_types]
AS
BEGIN
	declare @temp_blood_types table(
		value char(2),
		display varchar(12)
	)
	
	insert @temp_blood_types
	select 'AA','Type A'
	union
	select 'AB','Type AB'
	union
	select 'BB','Type B'
	union
	select 'OO','Type O'
	
	select * 
	  from @temp_blood_types
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_gender]
Print 'Create Procedure [dbo].[hris_dd_get_gender]'
GO
CREATE PROCEDURE [dbo].[hris_dd_get_gender]
AS
BEGIN
	declare @temp_gender table(
		value char(1),
		display varchar(12)
	)
	
	insert @temp_gender
	select 'M','Male'
	union
	select 'F','Female'
	
	select * 
	  from @temp_gender
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_civil_status]
Print 'Create Procedure [dbo].[hris_dd_get_civil_status]'
GO
CREATE PROCEDURE [dbo].[hris_dd_get_civil_status]
AS
BEGIN
	declare @temp_civil_status table(
		value char(3),
		display varchar(12)
	)
	
	insert @temp_civil_status
	select 'SGL','Single'
	union
	select 'MRD','Married'
	union
	select 'SEP','Separated'
	union
	select 'WDW','Widowed'
	
	select * 
	  from @temp_civil_status
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_leavereason]
Print 'Create Table [dbo].[t_leavereason]'
GO
CREATE TABLE [dbo].[t_leavereason] (
		[leavereason_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavereason_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavereason_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[parent_reason_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[leavetype_code]              [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_leavereason to [dbo].[t_leavereason]
Print 'Add Primary Key PK_t_leavereason to [dbo].[t_leavereason]'
GO
ALTER TABLE [dbo].[t_leavereason]
	ADD
	CONSTRAINT [PK_t_leavereason]
	PRIMARY KEY
	CLUSTERED
	([leavereason_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_leavereason] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[roster]
Print 'Create Table [dbo].[roster]'
GO
CREATE TABLE [dbo].[roster] (
		[roster_id]             [int] IDENTITY(1, 1) NOT NULL,
		[location_code]         [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[roster_date]           [date] NOT NULL,
		[rosterstatus_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_by]            [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]          [datetime] NOT NULL,
		[initialised_by]        [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[initialised_date]      [datetime] NULL,
		[finalised_by]          [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[finalised_date]        [datetime] NULL,
		[syncstatus_code]       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_roster_1 to [dbo].[roster]
Print 'Add Primary Key PK_roster_1 to [dbo].[roster]'
GO
ALTER TABLE [dbo].[roster]
	ADD
	CONSTRAINT [PK_roster_1]
	PRIMARY KEY
	CLUSTERED
	([roster_id], [location_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_roster_created_date_1 to [dbo].[roster]
Print 'Add Default Constraint DF_roster_created_date_1 to [dbo].[roster]'
GO
ALTER TABLE [dbo].[roster]
	ADD
	CONSTRAINT [DF_roster_created_date_1]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_roster_rosterstatus_code to [dbo].[roster]
Print 'Add Default Constraint DF_roster_rosterstatus_code to [dbo].[roster]'
GO
ALTER TABLE [dbo].[roster]
	ADD
	CONSTRAINT [DF_roster_rosterstatus_code]
	DEFAULT ('RIP') FOR [rosterstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_roster_syncstatus_code_1 to [dbo].[roster]
Print 'Add Default Constraint DF_roster_syncstatus_code_1 to [dbo].[roster]'
GO
ALTER TABLE [dbo].[roster]
	ADD
	CONSTRAINT [DF_roster_syncstatus_code_1]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[roster] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[undertime]
Print 'Create Table [dbo].[undertime]'
GO
CREATE TABLE [dbo].[undertime] (
		[undertime_id]             [int] IDENTITY(1, 1) NOT NULL,
		[employee_id]              [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[undertime_date]           [date] NOT NULL,
		[time_from]                [time](7) NOT NULL,
		[time_until]               [time](7) NOT NULL,
		[undertime_remarks]        [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[undertimestatus_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[syncstatus_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_undertime to [dbo].[undertime]
Print 'Add Primary Key PK_undertime to [dbo].[undertime]'
GO
ALTER TABLE [dbo].[undertime]
	ADD
	CONSTRAINT [PK_undertime]
	PRIMARY KEY
	CLUSTERED
	([undertime_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_undertime_syncstatus_code to [dbo].[undertime]
Print 'Add Default Constraint DF_undertime_syncstatus_code to [dbo].[undertime]'
GO
ALTER TABLE [dbo].[undertime]
	ADD
	CONSTRAINT [DF_undertime_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_undertime_undertimestatus_code to [dbo].[undertime]
Print 'Add Default Constraint DF_undertime_undertimestatus_code to [dbo].[undertime]'
GO
ALTER TABLE [dbo].[undertime]
	ADD
	CONSTRAINT [DF_undertime_undertimestatus_code]
	DEFAULT ('PND') FOR [undertimestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[undertime] SET (LOCK_ESCALATION = TABLE)
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_undertime_reasons]
Print 'Create Procedure [dbo].[hris_get_undertime_reasons]'
GO


CREATE PROCEDURE [dbo].[hris_get_undertime_reasons]
AS
BEGIN
	select *
	  from t_undertimereason ut (nolock)
  order by ut.undertime_reason_name
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_religions]
Print 'Create Procedure [dbo].[hris_dd_get_religions]'
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_religions]
AS
BEGIN
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 't_religion')) 
	begin 
		select r.religion_id,
			   r.religion_name
		  from t_religion r (nolock)
	  order by r.religion_name	  
	end
	else
	begin
		select null,
		       null
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
-- Alter Procedure [dbo].[hris_dd_get_time_status]
Print 'Alter Procedure [dbo].[hris_dd_get_time_status]'
GO

ALTER PROCEDURE [dbo].[hris_dd_get_time_status]
AS
BEGIN
	select ts.timestatus_code,
	       ts.timestatus_name
	  from t_timestatus ts (nolock)
  order by ts.timestatus_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_undertime_reasons]
Print 'Create Procedure [dbo].[hris_dd_get_undertime_reasons]'
GO

CREATE PROCEDURE [dbo].[hris_dd_get_undertime_reasons]
AS
BEGIN
	select ut.undertime_reason_code,
	       ut.undertime_reason_name
	  from t_undertimereason ut (nolock)
  order by ut.undertime_reason_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_overtime_reasons]
Print 'Create Procedure [dbo].[hris_get_overtime_reasons]'
GO


CREATE PROCEDURE [dbo].[hris_get_overtime_reasons]
AS
BEGIN
	select *
	  from t_overtimereason ot (nolock)
  order by ot.overtime_reason_name
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_override_reasons]
Print 'Create Procedure [dbo].[hris_dd_get_override_reasons]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.hris_dd_get_override_reasons
AS
BEGIN
	select ovr.override_reason_code,
	       override_reason_name
	  from t_overridereason ovr (nolock)
  order by ovr.override_reason_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_overridereasons]
Print 'Create Procedure [dbo].[hris_get_overridereasons]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.hris_get_overridereasons
AS
BEGIN
	select *
	  from t_overridereason (nolock) ovr
  order by ovr.override_reason_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_dd_get_overtime_reasons]
Print 'Alter Procedure [dbo].[hris_dd_get_overtime_reasons]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_dd_get_overtime_reasons]
AS
BEGIN
	select ovr.overtime_reason_code,
	       overtime_reason_name
	  from t_overtimereason ovr (nolock)
  order by ovr.overtime_reason_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column syncstatus_code on [dbo].[dtroverride]
Print 'Alter Column syncstatus_code on [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	 ALTER COLUMN [syncstatus_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column overriden_by on [dbo].[dtroverride]
Print 'Alter Column overriden_by on [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	 ALTER COLUMN [overriden_by] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column location_code to [dbo].[dtroverride]
Print 'Add Column location_code to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD [location_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	CONSTRAINT [DF_dtroverride_location_code] DEFAULT ([dbo].[fn_get_sysconfig_value]('LOCATION_CODE'))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column is_cancelled to [dbo].[dtroverride]
Print 'Add Column is_cancelled to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD [is_cancelled] [smallint] NOT NULL
	CONSTRAINT [DF_dtroverride_is_cancelled] DEFAULT ((0))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column modified_by to [dbo].[dtroverride]
Print 'Add Column modified_by to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD [modified_by] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column modified_date to [dbo].[dtroverride]
Print 'Add Column modified_date to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD [modified_date] [datetime] NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtroverride_override_date to [dbo].[dtroverride]
Print 'Add Default Constraint DF_dtroverride_override_date to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD
	CONSTRAINT [DF_dtroverride_override_date]
	DEFAULT (getdate()) FOR [override_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtroverride_syncstatus_code to [dbo].[dtroverride]
Print 'Add Default Constraint DF_dtroverride_syncstatus_code to [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	ADD
	CONSTRAINT [DF_dtroverride_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[dtr_fn_get_location_code]
Print 'Create Function [dbo].[dtr_fn_get_location_code]'
GO

CREATE FUNCTION [dbo].[dtr_fn_get_location_code]
(
)
RETURNS char(3)
AS
BEGIN
	declare	@location_code char(3)
			
	set @location_code = dbo.fn_get_sysconfig_value('LOCATION_CODE')
    	
	return @location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_leave_reasons]
Print 'Create Procedure [dbo].[hris_dd_get_leave_reasons]'
GO

CREATE PROCEDURE [dbo].[hris_dd_get_leave_reasons]
AS
BEGIN
	select lr.leavereason_code,
	       lr.leavereason_name,
	       (lr.leavereason_code + ' - ' + lr.leavereason_name) leavereason_name_long
	  from t_leavereason lr (nolock)
  order by lr.leavereason_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_change_roster_status]
Print 'Create Procedure [dbo].[dtr_change_roster_status]'
GO

CREATE PROCEDURE [dbo].[dtr_change_roster_status]
	@roster_date_from datetime,
	@roster_date_until datetime,
	@roster_status_code char(3),
	@id_num varchar(12)
AS
BEGIN
	if @roster_status_code = 'INI'
	begin
		update roster
		   set rosterstatus_code = @roster_status_code,
			   initialised_by = @id_num,
			   initialised_date = GETDATE()
		 where roster_date 
	   between @roster_date_from
		   and @roster_date_until
    end
    else if @roster_status_code = 'FIN'
	begin
		update roster
		   set rosterstatus_code = @roster_status_code,
			   finalised_by = @id_num,
			   finalised_date = GETDATE()
		 where roster_date 
	   between @roster_date_from
		   and @roster_date_until
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
-- Create Procedure [dbo].[hris_get_employee]
Print 'Create Procedure [dbo].[hris_get_employee]'
GO
CREATE PROCEDURE [dbo].[hris_get_employee]
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
-- Alter Trigger [dbo].[tr_set_pin]
Print 'Alter Trigger [dbo].[tr_set_pin]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER dbo.tr_set_pin
   ON  dbo.employee
   AFTER INSERT
AS 
BEGIN
	declare @id_num varchar(12),
	        @pin char(2)
	
	select @id_num = id_num,
	       @pin = pin
	  from inserted 
	
	if ISNULL(@pin,'') = ''
      update employee 
         set pin = SUBSTRING(id_num,1,2)
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
-- Create Table [dbo].[dtrovertime]
Print 'Create Table [dbo].[dtrovertime]'
GO
CREATE TABLE [dbo].[dtrovertime] (
		[dtr_date]                 [date] NOT NULL,
		[id_num]                   [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[time_from]                [time](7) NOT NULL,
		[time_until]               [time](7) NOT NULL,
		[overtime_reason_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_by]               [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]             [datetime] NOT NULL,
		[modified_by]              [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]            [datetime] NULL,
		[syncstatus_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[timestatus_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[status_changed_by]        [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[status_changed_date]      [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_dtrovertime to [dbo].[dtrovertime]
Print 'Add Primary Key PK_dtrovertime to [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	ADD
	CONSTRAINT [PK_dtrovertime]
	PRIMARY KEY
	CLUSTERED
	([dtr_date], [id_num])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrovertime_created_date to [dbo].[dtrovertime]
Print 'Add Default Constraint DF_dtrovertime_created_date to [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	ADD
	CONSTRAINT [DF_dtrovertime_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrovertime_syncstatus_code to [dbo].[dtrovertime]
Print 'Add Default Constraint DF_dtrovertime_syncstatus_code to [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	ADD
	CONSTRAINT [DF_dtrovertime_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrovertime_timestatus_code to [dbo].[dtrovertime]
Print 'Add Default Constraint DF_dtrovertime_timestatus_code to [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	ADD
	CONSTRAINT [DF_dtrovertime_timestatus_code]
	DEFAULT ('PND') FOR [timestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[dtrovertime] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[dtrundertime]
Print 'Create Table [dbo].[dtrundertime]'
GO
CREATE TABLE [dbo].[dtrundertime] (
		[dtr_date]                  [date] NOT NULL,
		[id_num]                    [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[time_from]                 [time](7) NOT NULL,
		[time_until]                [time](7) NOT NULL,
		[undertime_reason_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_by]                [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]              [datetime] NOT NULL,
		[modified_by]               [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]             [datetime] NULL,
		[syncstatus_code]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[timestatus_code]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[status_changed_by]         [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[status_changed_date]       [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_dtrundertime to [dbo].[dtrundertime]
Print 'Add Primary Key PK_dtrundertime to [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	ADD
	CONSTRAINT [PK_dtrundertime]
	PRIMARY KEY
	CLUSTERED
	([dtr_date], [id_num])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrundertime_created_date to [dbo].[dtrundertime]
Print 'Add Default Constraint DF_dtrundertime_created_date to [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	ADD
	CONSTRAINT [DF_dtrundertime_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrundertime_syncstatus_code to [dbo].[dtrundertime]
Print 'Add Default Constraint DF_dtrundertime_syncstatus_code to [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	ADD
	CONSTRAINT [DF_dtrundertime_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtrundertime_timestatus_code to [dbo].[dtrundertime]
Print 'Add Default Constraint DF_dtrundertime_timestatus_code to [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	ADD
	CONSTRAINT [DF_dtrundertime_timestatus_code]
	DEFAULT ('PND') FOR [timestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[dtrundertime] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
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
		[location_code]              [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_application_date]     [datetime] NOT NULL,
		[id_num]                     [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavetype_code]             [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[justification]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[leaveappstatus_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_remarks]              [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created_by]                 [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]               [datetime] NOT NULL,
		[modified_by]                [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]              [datetime] NULL,
		[status_changed_by]          [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[status_changed_date]        [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_leave to [dbo].[leave]
Print 'Add Primary Key PK_leave to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD
	CONSTRAINT [PK_leave]
	PRIMARY KEY
	CLUSTERED
	([leave_id], [location_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leave_created_date to [dbo].[leave]
Print 'Add Default Constraint DF_leave_created_date to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD
	CONSTRAINT [DF_leave_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leave_location_code to [dbo].[leave]
Print 'Add Default Constraint DF_leave_location_code to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD
	CONSTRAINT [DF_leave_location_code]
	DEFAULT ([dbo].[fn_get_sysconfig_value]('LOCATION_CODE')) FOR [location_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[leave] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[rosterdetail]
Print 'Create Table [dbo].[rosterdetail]'
GO
CREATE TABLE [dbo].[rosterdetail] (
		[rd_id]                   [int] IDENTITY(1, 1) NOT NULL,
		[remote_rd_id]            [int] NULL,
		[roster_id]               [int] NOT NULL,
		[location_code]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id_num]                  [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[parent_roster_id]        [int] NULL,
		[change_reason]           [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[roster_remarks]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created_by]              [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]            [datetime] NOT NULL,
		[rdstatus_code]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[status_changed_by]       [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[status_changed_date]     [datetime] NULL,
		[syncstatus_code]         [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_rosterdetail_1 to [dbo].[rosterdetail]
Print 'Add Primary Key PK_rosterdetail_1 to [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	ADD
	CONSTRAINT [PK_rosterdetail_1]
	PRIMARY KEY
	CLUSTERED
	([rd_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_roster_created_date to [dbo].[rosterdetail]
Print 'Add Default Constraint DF_roster_created_date to [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	ADD
	CONSTRAINT [DF_roster_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_roster_syncstatus_code to [dbo].[rosterdetail]
Print 'Add Default Constraint DF_roster_syncstatus_code to [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	ADD
	CONSTRAINT [DF_roster_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_rosterdetail_rdstatus_code to [dbo].[rosterdetail]
Print 'Add Default Constraint DF_rosterdetail_rdstatus_code to [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	ADD
	CONSTRAINT [DF_rosterdetail_rdstatus_code]
	DEFAULT ('ACT') FOR [rdstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[rosterdetail] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_employees]
Print 'Create Procedure [dbo].[dtr_get_employees]'
GO

CREATE PROCEDURE [dbo].[dtr_get_employees]
	@dtr_date_from datetime,
	@dtr_date_until datetime
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
	 
	-- result 
	select distinct id_num,
	       employee_name
	  from @dtr
  order by employee_name  
  
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_override_by_date_am]
Print 'Create Procedure [dbo].[dtr_get_override_by_date_am]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dtr_get_override_by_date_am]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtroverride dto (nolock)
	 where dto.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((isnull(@id_num,'') = '') or (dto.id_num = @id_num ))
	   and dto.am_pm = 'A'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_override_by_date_pm]
Print 'Create Procedure [dbo].[dtr_get_override_by_date_pm]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dtr_get_override_by_date_pm]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtroverride dto (nolock)
	 where dto.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((isnull(@id_num,'') = '') or (dto.id_num = @id_num ))
	   and dto.am_pm = 'P'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_roster]
Print 'Create Procedure [dbo].[dtr_get_roster]'
GO

CREATE PROCEDURE [dbo].[dtr_get_roster]
	@first_day datetime,
	@location_code char(3)
AS
BEGIN
	declare @last_day datetime
	
	set @last_day = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@first_day)+1,0))
	
	-- get all days
	;WITH saturdays AS 
	(
		select @first_day as currDate
		
		union all
		
		select dateadd(d, 1 ,saturdays.currDate)
		  from saturdays
		 where dateadd(d,1,saturdays.currDate) < @last_day
	)

	select s.currDate,
	       ISNULL(r.roster_id,-1) roster_id,
	       ISNULL(r.rosterstatus_code,'RIP') rosterstatus_code,
	       r.*
	  from saturdays s
 left join (select *
              from roster rs (nolock)
             where (rs.roster_date 
           between @first_day
               and @last_day)
               and (rs.location_code = isnull(@location_code,dbo.dtr_fn_get_location_code()))) r
        on r.roster_date = s.currDate
	 where datepart(WEEKDAY,currDate) = 7

	OPTION (MaxRecursion 32)
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sec_get_user_rights]
Print 'Create Procedure [dbo].[sec_get_user_rights]'
GO

CREATE PROCEDURE [dbo].[sec_get_user_rights]
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
-- Alter Trigger [dbo].[tr_delete_synched_record]
Print 'Alter Trigger [dbo].[tr_delete_synched_record]'
GO
ALTER TRIGGER [dbo].[tr_delete_synched_record]
   ON  [dbo].[wsmessageout]
   AFTER update
AS 
BEGIN
	declare @eventObject char(3),
			@pkEventObject varchar(30),
			@messageStatusCode char(3)
			
	select @eventObject = event_object,
		   @pkEventObject = pk_event_object,
		   @messageStatusCode = messagestatus_code
	  from inserted
	  
	if @messageStatusCode = 'SYN'
	begin
	    -- update the corresponding record
	    if @eventObject = 'DTR'
	    begin
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = cast(@pkEventObject as int)
		end
		
		-- then delete from the wsmessageout table
		delete wsmessageout
		 where event_object = @eventObject
		   and pk_event_object = @pkEventObject
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
-- Create Table [dbo].[leavedetail]
Print 'Create Table [dbo].[leavedetail]'
GO
CREATE TABLE [dbo].[leavedetail] (
		[leave_id]                [int] NOT NULL,
		[location_code]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_date]              [datetime] NOT NULL,
		[am_pm]                   [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_paid]                 [smallint] NOT NULL,
		[leavestatus_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leavereason_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[leave_remarks]           [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created_by]              [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]            [datetime] NOT NULL,
		[modified_by]             [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]           [datetime] NULL,
		[status_changed_by]       [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[status_changed_date]     [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_leavedetail_1 to [dbo].[leavedetail]
Print 'Add Primary Key PK_leavedetail_1 to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [PK_leavedetail_1]
	PRIMARY KEY
	CLUSTERED
	([leave_id], [location_code], [leave_date])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leavedetail_created_date to [dbo].[leavedetail]
Print 'Add Default Constraint DF_leavedetail_created_date to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [DF_leavedetail_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leavedetail_is_paid to [dbo].[leavedetail]
Print 'Add Default Constraint DF_leavedetail_is_paid to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [DF_leavedetail_is_paid]
	DEFAULT ((1)) FOR [is_paid]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_leavedetail_leavestatus_code to [dbo].[leavedetail]
Print 'Add Default Constraint DF_leavedetail_leavestatus_code to [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	ADD
	CONSTRAINT [DF_leavedetail_leavestatus_code]
	DEFAULT ('PND') FOR [leavestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[leavedetail] SET (LOCK_ESCALATION = TABLE)
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

CREATE PROCEDURE [dbo].[hris_get_leaves]
	@from_date datetime,
	@until_date datetime,
	@id_num varchar(12)
AS
BEGIN
    -- set date parameters to today's date when null
    set @from_date = cast(ISNULL(@from_date, getdate()) as DATE)
    set @until_date = cast(ISNULL(@until_date, getdate()) as DATE)
	
	select l.*,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   lt.leavetype_name
	  from leave l (nolock)
	  join employee e (nolock)
	    on e.id_num = l.id_num
	  join t_leavetype lt (nolock)
	    on lt.leavetype_code = l.leavetype_code
	 where (isnull(@id_num,'') = '' or l.id_num = @id_num)
	   and (l.leave_application_date between @from_date and @until_date)
  order by l.leave_application_date, e.employee_lastname + e.employee_firstname
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_undertime]
Print 'Create Procedure [dbo].[dtr_get_undertime]'
GO

CREATE PROCEDURE [dbo].[dtr_get_undertime]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrundertime dut (nolock)
	 where dut.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dut.id_num = @id_num))
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_overtime]
Print 'Create Procedure [dbo].[dtr_get_overtime]'
GO

CREATE PROCEDURE [dbo].[dtr_get_overtime]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrovertime dov (nolock)
	 where dov.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dov.id_num = @id_num))
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_rosterdetail]
Print 'Create Procedure [dbo].[dtr_get_rosterdetail]'
GO

CREATE PROCEDURE [dbo].[dtr_get_rosterdetail]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@location_code char(3)
AS
BEGIN
	declare @finalised int
	
	-- get number of finalised records
	-- more than 0 means all are finalised
	-- this sets the "roster cells" to read-only or otherwise
	set @finalised = (select COUNT(1)
	                    from roster r (nolock)
	                   where r.roster_date 
	                 between @dtr_date_from
	                     and @dtr_date_until
	                     and r.location_code = isnull(@location_code,dbo.dtr_fn_get_location_code())
	                     and r.syncstatus_code = 'FIN')
	                     
    -- use dtr in the FROM clause
    -- this would retrieve all employees 
    -- including those with no roster records
    select distinct d.id_num as dtr_id_num,
           (e.employee_lastname + ', ' + employee_firstname) employee_name,
           r.*,
           @finalised
      from dtr d (nolock)
      join employee e (nolock)
        on e.id_num = d.id_num
 left join (select rd.*,
	               rs.roster_date 
              from roster rs  (nolock)
              join rosterdetail rd (nolock)
                on rd.roster_id = rs.roster_id 
               and rd.location_code = rs.location_code
             where (rs.roster_date 
           between @dtr_date_from
               and @dtr_date_until)
               and (rd.location_code = isnull(@location_code,dbo.dtr_fn_get_location_code()))
               and rd.rdstatus_code = 'ACT') r
        on r.id_num = d.id_num
     where d.dtr_date 
   between DATEADD(m, -6, @dtr_date_from)
       and @dtr_date_until
  order by employee_name
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

CREATE PROCEDURE [dbo].[hris_get_leavedetail]
	@leave_id integer,
	@location_code char(3)
AS
BEGIN
	select *
	  from leavedetail ld (nolock)
	 where ld.leave_id = @leave_id
	   and ld.location_code = @location_code
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
-- Create Procedure [dbo].[hris_change_leave_status]
Print 'Create Procedure [dbo].[hris_change_leave_status]'
GO

CREATE PROCEDURE [dbo].[hris_change_leave_status]
	@leave_id int,
	@location_code char(3),
	@leavestatus_code char(3)
AS
BEGIN
	update leavedetail
	   set leavestatus_code = @leavestatus_code
	 where leave_id = @leave_id
	   and location_code = @location_code  
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtroverride_t_syncstatus on [dbo].[dtroverride]
Print 'Create Foreign Key FK_dtroverride_t_syncstatus on [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride]
	WITH CHECK
	ADD CONSTRAINT [FK_dtroverride_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[dtroverride]
	CHECK CONSTRAINT [FK_dtroverride_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_employee on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_employee on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_sysuser on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_sysuser on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_sysuser1 on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_sysuser1 on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_sysuser1]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_sysuser2 on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_sysuser2 on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_sysuser2]
	FOREIGN KEY ([status_changed_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_sysuser2]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_t_overtimereason on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_t_overtimereason on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_t_overtimereason]
	FOREIGN KEY ([overtime_reason_code]) REFERENCES [dbo].[t_overtimereason] ([overtime_reason_code])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_t_overtimereason]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_t_syncstatus on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_t_syncstatus on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrovertime_t_timestatus on [dbo].[dtrovertime]
Print 'Create Foreign Key FK_dtrovertime_t_timestatus on [dbo].[dtrovertime]'
GO
ALTER TABLE [dbo].[dtrovertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrovertime_t_timestatus]
	FOREIGN KEY ([timestatus_code]) REFERENCES [dbo].[t_timestatus] ([timestatus_code])
ALTER TABLE [dbo].[dtrovertime]
	CHECK CONSTRAINT [FK_dtrovertime_t_timestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_employee on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_employee on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_sysuser on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_sysuser on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_sysuser1 on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_sysuser1 on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_sysuser1]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_sysuser2 on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_sysuser2 on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_sysuser2]
	FOREIGN KEY ([status_changed_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_sysuser2]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_t_syncstatus on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_t_syncstatus on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_t_timestatus on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_t_timestatus on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_t_timestatus]
	FOREIGN KEY ([timestatus_code]) REFERENCES [dbo].[t_timestatus] ([timestatus_code])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_t_timestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtrundertime_t_undertimereason on [dbo].[dtrundertime]
Print 'Create Foreign Key FK_dtrundertime_t_undertimereason on [dbo].[dtrundertime]'
GO
ALTER TABLE [dbo].[dtrundertime]
	WITH CHECK
	ADD CONSTRAINT [FK_dtrundertime_t_undertimereason]
	FOREIGN KEY ([undertime_reason_code]) REFERENCES [dbo].[t_undertimereason] ([undertime_reason_code])
ALTER TABLE [dbo].[dtrundertime]
	CHECK CONSTRAINT [FK_dtrundertime_t_undertimereason]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_employee on [dbo].[leave]
Print 'Create Foreign Key FK_leave_employee on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_sysuser on [dbo].[leave]
Print 'Create Foreign Key FK_leave_sysuser on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_sysuser1 on [dbo].[leave]
Print 'Create Foreign Key FK_leave_sysuser1 on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_sysuser1]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_sysuser2 on [dbo].[leave]
Print 'Create Foreign Key FK_leave_sysuser2 on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_sysuser2]
	FOREIGN KEY ([status_changed_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_sysuser2]

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
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_t_leaveapplicationstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_leave on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_leave on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_leave]
	FOREIGN KEY ([leave_id], [location_code]) REFERENCES [dbo].[leave] ([leave_id], [location_code])
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_leave]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_sysuser on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_sysuser on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_sysuser1 on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_sysuser1 on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_sysuser1]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_sysuser2 on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_sysuser2 on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_sysuser2]
	FOREIGN KEY ([status_changed_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_sysuser2]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leavedetail_t_leavereason on [dbo].[leavedetail]
Print 'Create Foreign Key FK_leavedetail_t_leavereason on [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail]
	WITH CHECK
	ADD CONSTRAINT [FK_leavedetail_t_leavereason]
	FOREIGN KEY ([leavereason_code]) REFERENCES [dbo].[t_leavereason] ([leavereason_code])
ALTER TABLE [dbo].[leavedetail]
	CHECK CONSTRAINT [FK_leavedetail_t_leavereason]

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
-- Create Foreign Key FK_roster_t_syncstatus1 on [dbo].[roster]
Print 'Create Foreign Key FK_roster_t_syncstatus1 on [dbo].[roster]'
GO
ALTER TABLE [dbo].[roster]
	WITH CHECK
	ADD CONSTRAINT [FK_roster_t_syncstatus1]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[roster]
	CHECK CONSTRAINT [FK_roster_t_syncstatus1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_roster_employee on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_roster_employee on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_roster_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_roster_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_roster_t_syncstatus on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_roster_t_syncstatus on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_roster_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_roster_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_rosterdetail_roster on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_rosterdetail_roster on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_rosterdetail_roster]
	FOREIGN KEY ([roster_id], [location_code]) REFERENCES [dbo].[roster] ([roster_id], [location_code])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_rosterdetail_roster]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_rosterdetail_roster1 on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_rosterdetail_roster1 on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_rosterdetail_roster1]
	FOREIGN KEY ([roster_id], [location_code]) REFERENCES [dbo].[roster] ([roster_id], [location_code])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_rosterdetail_roster1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_rosterdetail_sysuser on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_rosterdetail_sysuser on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_rosterdetail_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_rosterdetail_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_rosterdetail_sysuser1 on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_rosterdetail_sysuser1 on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_rosterdetail_sysuser1]
	FOREIGN KEY ([status_changed_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_rosterdetail_sysuser1]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_rosterdetail_t_rosterdetailstatus on [dbo].[rosterdetail]
Print 'Create Foreign Key FK_rosterdetail_t_rosterdetailstatus on [dbo].[rosterdetail]'
GO
ALTER TABLE [dbo].[rosterdetail]
	WITH CHECK
	ADD CONSTRAINT [FK_rosterdetail_t_rosterdetailstatus]
	FOREIGN KEY ([rdstatus_code]) REFERENCES [dbo].[t_rosterdetailstatus] ([rdstatus_code])
ALTER TABLE [dbo].[rosterdetail]
	CHECK CONSTRAINT [FK_rosterdetail_t_rosterdetailstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_leavereason_t_leavereason on [dbo].[t_leavereason]
Print 'Create Foreign Key FK_t_leavereason_t_leavereason on [dbo].[t_leavereason]'
GO
ALTER TABLE [dbo].[t_leavereason]
	WITH CHECK
	ADD CONSTRAINT [FK_t_leavereason_t_leavereason]
	FOREIGN KEY ([parent_reason_code]) REFERENCES [dbo].[t_leavereason] ([leavereason_code])
ALTER TABLE [dbo].[t_leavereason]
	CHECK CONSTRAINT [FK_t_leavereason_t_leavereason]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_leavereason_t_leavetype on [dbo].[t_leavereason]
Print 'Create Foreign Key FK_t_leavereason_t_leavetype on [dbo].[t_leavereason]'
GO
ALTER TABLE [dbo].[t_leavereason]
	WITH CHECK
	ADD CONSTRAINT [FK_t_leavereason_t_leavetype]
	FOREIGN KEY ([leavetype_code]) REFERENCES [dbo].[t_leavetype] ([leavetype_code])
ALTER TABLE [dbo].[t_leavereason]
	CHECK CONSTRAINT [FK_t_leavereason_t_leavetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_undertime_t_syncstatus on [dbo].[undertime]
Print 'Create Foreign Key FK_undertime_t_syncstatus on [dbo].[undertime]'
GO
ALTER TABLE [dbo].[undertime]
	WITH CHECK
	ADD CONSTRAINT [FK_undertime_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[undertime]
	CHECK CONSTRAINT [FK_undertime_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

GO
INSERT [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code], [leaveappstatus_name], [leaveappstatus_description], [close_record]) VALUES (N'APP', N'Approved', N'Application has been approved', 1)
GO
INSERT [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code], [leaveappstatus_name], [leaveappstatus_description], [close_record]) VALUES (N'CNL', N'Cancelled', N'Cancelled', 1)
GO
INSERT [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code], [leaveappstatus_name], [leaveappstatus_description], [close_record]) VALUES (N'DND', N'Disapproved', N'Application has been disapproved', 1)
GO
INSERT [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code], [leaveappstatus_name], [leaveappstatus_description], [close_record]) VALUES (N'PND', N'Pending', N'Pending', 0)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'APP', N'Approved', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'CNL', N'Cancelled', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'DND', N'Denied', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'PND', N'Pending', NULL)
GO
INSERT [dbo].[t_rosterdetailstatus] ([rdstatus_code], [rdstatus_name], [rdstatus_description]) VALUES (N'ACT', N'Active', NULL)
GO
INSERT [dbo].[t_rosterdetailstatus] ([rdstatus_code], [rdstatus_name], [rdstatus_description]) VALUES (N'CNL', N'Cancelled', NULL)
GO
INSERT [dbo].[t_rosterdetailstatus] ([rdstatus_code], [rdstatus_name], [rdstatus_description]) VALUES (N'MOV', N'Moved', NULL)
GO
INSERT [dbo].[t_rosterdetailstatus] ([rdstatus_code], [rdstatus_name], [rdstatus_description]) VALUES (N'SWP', N'Swapped', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'APP', N'Approved', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'CNL', N'Cancelled', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'DND', N'Denied', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'PND', N'Pending', NULL)
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF
GO

