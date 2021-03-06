/* ------------------------------------------------------------

DESCRIPTION: Schema synchronization script for object(s) \r\n
    triggers:
        [dbo].[tr_set_approved_date]

    procedures:
        [dbo].[dtr_log_time], [dbo].[hris_dd_get_leave_reasons], [dbo].[hris_dd_get_religions], [dbo].[hris_get_leave], [dbo].[hris_get_leave_reasons], [dbo].[hris_get_leave_reasons_with_parent], [dbo].[hris_get_leave_types], [dbo].[hris_get_leavedetail], [dbo].[hris_get_leaves], [dbo].[hris_get_overridereasons], [dbo].[hris_get_undertime_reasons], [dbo].[pr_get_deduction_types], [dbo].[sec_get_users]

    tables:
        [dbo].[dtr], [dbo].[dtroverride], [dbo].[empfamily], [dbo].[leave], [dbo].[leavecredit], [dbo].[leavedetail], [dbo].[t_allowancetype], [dbo].[t_deductiontype], [dbo].[t_leavereason], [dbo].[t_undertimereason]

     Make BRYAN-ULTRA\SQL2008R2.HRIS_Production Equal BRYAN-ULTRA\SQL2008R2.HRIS

   AUTHOR:	[Insert author name]

   DATE:	30/09/2015 10:07:59 PM

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
USE [HRIS_Production]
GO

BEGIN TRAN
GO

-- Drop Foreign Key FK_dtr_location from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_location from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_location]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtr_t_overridetype from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_t_overridetype from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_t_overridetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtroverride_t_syncstatus from [dbo].[dtroverride]
Print 'Drop Foreign Key FK_dtroverride_t_syncstatus from [dbo].[dtroverride]'
GO
ALTER TABLE [dbo].[dtroverride] DROP CONSTRAINT [FK_dtroverride_t_syncstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Reference FK_leavedetail_leave from [dbo].[leavedetail]
Print 'Drop Reference FK_leavedetail_leave from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [FK_leavedetail_leave]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_leave_t_leaveapplicationstatus from [dbo].[leave]
Print 'Drop Foreign Key FK_leave_t_leaveapplicationstatus from [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [FK_leave_t_leaveapplicationstatus]
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
-- Drop Foreign Key FK_leavedetail_t_leavestatus from [dbo].[leavedetail]
Print 'Drop Foreign Key FK_leavedetail_t_leavestatus from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [FK_leavedetail_t_leavestatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_get_leaves]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_leaves]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_leaves]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_get_leavedetail]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_leavedetail]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_leavedetail]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[dtr_log_time]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_log_time]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_log_time]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Trigger [dbo].[tr_set_approved_date]
Print 'Drop Trigger [dbo].[tr_set_approved_date]'
GO
DROP TRIGGER [dbo].[tr_set_approved_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_get_leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_dd_get_religions]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_dd_get_religions]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_dd_get_religions]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_get_leave_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_leave_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_leave_types]
	TO [HRISUser]
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
-- Drop Default Constraint DF_leavedetail_am_pm from [dbo].[leavedetail]
Print 'Drop Default Constraint DF_leavedetail_am_pm from [dbo].[leavedetail]'
GO
ALTER TABLE [dbo].[leavedetail] DROP CONSTRAINT [DF_leavedetail_am_pm]
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
-- Drop Index IX_dtr from [dbo].[dtr]
Print 'Drop Index IX_dtr from [dbo].[dtr]'
GO
DROP INDEX [IX_dtr] ON [dbo].[dtr]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column override_date from [dbo].[dtr]
Print 'Drop Column override_date from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP COLUMN [override_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column overriden_by from [dbo].[dtr]
Print 'Drop Column overriden_by from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP COLUMN [overriden_by]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column overridetype_code from [dbo].[dtr]
Print 'Drop Column overridetype_code from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP COLUMN [overridetype_code]
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
-- Drop Primary Key PK_leavecredit_1 from [dbo].[leavecredit]
Print 'Drop Primary Key PK_leavecredit_1 from [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [PK_leavecredit_1]
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
-- Create Table [dbo].[t_deductiontype]
Print 'Create Table [dbo].[t_deductiontype]'
GO
CREATE TABLE [dbo].[t_deductiontype] (
		[deductiontype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[deductiontype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[deductiontype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_required]                   [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_deductiontype to [dbo].[t_deductiontype]
Print 'Add Primary Key PK_t_deductiontype to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD
	CONSTRAINT [PK_t_deductiontype]
	PRIMARY KEY
	CLUSTERED
	([deductiontype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_t_deductiontype_is_required to [dbo].[t_deductiontype]
Print 'Add Default Constraint DF_t_deductiontype_is_required to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD
	CONSTRAINT [DF_t_deductiontype_is_required]
	DEFAULT ((0)) FOR [is_required]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_deductiontype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column is_voucher to [dbo].[t_allowancetype]
Print 'Add Column is_voucher to [dbo].[t_allowancetype]'
GO
ALTER TABLE [dbo].[t_allowancetype]
	ADD [is_voucher] [smallint] NOT NULL
	CONSTRAINT [DF_t_allowancetype_is_voucher] DEFAULT ((0))
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
-- Alter Column employee_id on [dbo].[leavecredit]
Print 'Alter Column employee_id on [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit]
	 ALTER COLUMN [employee_id] [varchar](12) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column id_num to [dbo].[leavecredit]
Print 'Add Column id_num to [dbo].[leavecredit]'
GO
ALTER TABLE [dbo].[leavecredit]
	ADD [id_num] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
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
-- Alter Column location_code on [dbo].[dtr]
Print 'Alter Column location_code on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	 ALTER COLUMN [location_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column remote_dtr_id on [dbo].[dtr]
Print 'Alter Column remote_dtr_id on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	 ALTER COLUMN [remote_dtr_id] [int] NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Index IX_dtr on [dbo].[dtr]
Print 'Create Index IX_dtr on [dbo].[dtr]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtr]
	ON [dbo].[dtr] ([location_code], [remote_dtr_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER INDEX [IX_dtr] ON [dbo].[dtr] DISABLE
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Index IX_dtr_idnum_date on [dbo].[dtr]
Print 'Create Index IX_dtr_idnum_date on [dbo].[dtr]'
GO
CREATE NONCLUSTERED INDEX [IX_dtr_idnum_date]
	ON [dbo].[dtr] ([id_num], [dtr_date])
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
-- Create Procedure [dbo].[hris_get_overridereasons]
Print 'Create Procedure [dbo].[hris_get_overridereasons]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_overridereasons]
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
-- Create Procedure [dbo].[pr_get_deduction_types]
Print 'Create Procedure [dbo].[pr_get_deduction_types]'
GO

CREATE PROCEDURE dbo.pr_get_deduction_types
AS
BEGIN
	select *
	  from t_deductiontype dt (nolock)
  order by dt.deductiontype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column is_dependent to [dbo].[empfamily]
Print 'Add Column is_dependent to [dbo].[empfamily]'
GO
ALTER TABLE [dbo].[empfamily]
	ADD [is_dependent] [smallint] NOT NULL
	CONSTRAINT [DF_empfamily_is_dependent] DEFAULT ((0))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column is_deceased to [dbo].[empfamily]
Print 'Add Column is_deceased to [dbo].[empfamily]'
GO
ALTER TABLE [dbo].[empfamily]
	ADD [is_deceased] [smallint] NOT NULL
	CONSTRAINT [DF_empfamily_is_deceased] DEFAULT ((0))
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
EXEC sp_rename @objname = N'[dbo].[leave]', @newname = N'temp110623437', @objtype = 'OBJECT'
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
-- Disable constraints
ALTER TABLE [dbo].[leave] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp110623437 into the table [dbo].[leave]
-- Restore data
IF OBJECT_ID('[dbo].temp110623437') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[leave]') AND [type]='U')
EXEC sp_executesql N'
SET IDENTITY_INSERT [dbo].[leave] ON
INSERT INTO [dbo].[leave] ([leave_id], [leave_application_date], [leavetype_code], [justification], [leaveappstatus_code], [leave_remarks], [status_changed_date])
   SELECT [leave_id], [leave_application_date], [leavetype_code], [justification], [leaveappstatus_code], [leave_remarks], [status_changed_date] FROM [dbo].temp110623437
SET IDENTITY_INSERT [dbo].[leave] OFF
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT ALL
GO

-- Drop the temporary table temp110623437
IF OBJECT_ID('[dbo].temp110623437') IS NOT NULL DROP TABLE [dbo].temp110623437
GO

EXEC sp_rename @objname = N'[dbo].[leavedetail]', @newname = N'temp1506104406', @objtype = 'OBJECT'
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
-- Disable constraints
ALTER TABLE [dbo].[leavedetail] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp1506104406 into the table [dbo].[leavedetail]
-- Restore data
IF OBJECT_ID('[dbo].temp1506104406') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[leavedetail]') AND [type]='U')
EXEC sp_executesql N'
INSERT INTO [dbo].[leavedetail] ([leave_id], [leave_date], [is_paid], [leavestatus_code], [leave_remarks], [am_pm])
   SELECT [leave_id], [leave_date], [is_halfday], [leavestatus_code], [leave_remarks], [am_pm] FROM [dbo].temp1506104406
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT ALL
GO

-- Drop the temporary table temp1506104406
IF OBJECT_ID('[dbo].temp1506104406') IS NOT NULL DROP TABLE [dbo].temp1506104406
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_dd_get_religions]
Print 'Alter Procedure [dbo].[hris_dd_get_religions]'
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[hris_dd_get_religions]
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
-- Create Procedure [dbo].[hris_get_leave_reasons_with_parent]
Print 'Create Procedure [dbo].[hris_get_leave_reasons_with_parent]'
GO

CREATE PROCEDURE [dbo].[hris_get_leave_reasons_with_parent]
AS
BEGIN
	select lr1.leavereason_code,
	       lr1.leavereason_name,
	       lr1.leavetype_code,
	       lr1.parent_reason_code,
	       lr2.leavereason_name as parent_reason_name
	  from t_leavereason lr1 (nolock)
 left join t_leavereason lr2 (nolock)
        on lr1.parent_reason_code = lr2.leavereason_code
     where lr1.parent_reason_code is not null
  order by lr2.leavereason_name, lr1.leavereason_name
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leave_reasons]
Print 'Create Procedure [dbo].[hris_get_leave_reasons]'
GO

CREATE PROCEDURE [dbo].[hris_get_leave_reasons]
AS
BEGIN
	select *
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sec_get_users]
Print 'Create Procedure [dbo].[sec_get_users]'
GO

CREATE PROCEDURE dbo.sec_get_users
AS
BEGIN
	select e.id_num,
	       e.employee_lastname,
		   e.employee_firstname,
		   e.employee_middlename,
		   (employee_lastname + ', ' + employee_firstname) employee_name,
		   u.*
	  from employee e (nolock)
 left join sysuser u (nolock)
        on u.id_num = e.id_num
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
-- Alter Procedure [dbo].[hris_get_leave]
Print 'Alter Procedure [dbo].[hris_get_leave]'
GO

ALTER PROCEDURE dbo.hris_get_leave
	@leave_id integer,
	@location_code char(3)
AS
BEGIN
	select *
	  from leave l (nolock)
	 where l.leave_id = @leave_id
	   and l.location_code = @location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_leaves]
Print 'Alter Procedure [dbo].[hris_get_leaves]'
GO

ALTER PROCEDURE [dbo].[hris_get_leaves]
	@from_date datetime,
	@until_date datetime,
	@id_num varchar(12),
	@location_code char(3) = null,
	@department_code char(3) = null
AS
BEGIN
	declare @monthsPrevious int
	declare @employee table
	(
		id_num varchar(12),
		employee_name varchar(100),
		location_code char(3),
		department_code char(3)
	)

	-- set the number of months back of employee dtr records
	-- e.g. -1 means employees with dtr records for the last month, -2 means for the last 2 months, etc.
	set @monthsPrevious = -2

	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'paf')) 
	begin
	    insert into @employee
		select id_num,
		       employee_name,
			   location_code,
			   department_code
		  from dbo.paf_fn_active_employees(DATEADD(mm,@monthsPrevious,@from_date),@until_date)
	end
	else
	begin
		insert into @employee
		select id_num,
		       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
			   null,
			   null
		  from employee e (nolock)
	end

	-- use dtr in the FROM clause
    -- this would retrieve all employees 
    -- including those with no roster records
    select distinct d.id_num as dtr_id_num,
           e.employee_name,
           ll.*
      from dtr d (nolock)
      join @employee e
        on e.id_num = d.id_num
 left join (select ld.leave_date,
                   l.leave_id,
                   l.location_code,
				   l.leave_application_date,
				   l.id_num,
				   l.leavetype_code,
				   l.justification,
				   l.leaveappstatus_code,
				   l.leave_remarks,
				   l.created_by,
				   l.created_date,
				   l.modified_by,
				   l.modified_date,
				   l.status_changed_by,
				   l.status_changed_date 
              from leavedetail ld  (nolock)
			  join leave l (nolock) 
			    on l.leave_id = ld.leave_id
			   and l.location_code = ld.location_code
			where ld.leave_date
           between @from_date
               and @until_date) ll
        on ll.id_num = d.id_num 
     where d.dtr_date 
   between DATEADD(m, @monthsPrevious, @from_date)
       and @until_date
	   and ((isnull(@location_code,'') = '' or (e.location_code = @location_code)))-- location code
	   and ((isnull(@department_code,'') = '' or (e.department_code = @department_code))) -- department code
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
-- Alter Procedure [dbo].[hris_get_leavedetail]
Print 'Alter Procedure [dbo].[hris_get_leavedetail]'
GO

ALTER PROCEDURE [dbo].[hris_get_leavedetail]
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
-- Create Foreign Key FK_dtr_location on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_location on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_location]

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

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF
GO

