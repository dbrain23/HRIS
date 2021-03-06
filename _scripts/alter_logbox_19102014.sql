/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    roles:
        [db_datareader], [db_datawriter]

    schemas:
        [db_datareader], [db_datawriter]

    triggers:
        [dbo].[tr_delete_synched_record], [dbo].[tr_set_location_code]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_employee], [dbo].[dtr_log_time], [dbo].[sync_generate_xml], [dbo].[sync_get_wsmessagein_status], [dbo].[sync_get_wsmessageout_status], [dbo].[sync_que_record], [dbo].[sync_set_wsmessageout_status], [dbo].[sync_xml_to_db]

    users:
        [LogBoxUser]

    tables:
        [dbo].[dtr], [dbo].[employee], [dbo].[sysconfig], [dbo].[t_dtrstatus], [dbo].[t_syncstatus], [dbo].[t_wsmessagestatus], [dbo].[t_wsmessagetype], [dbo].[wsmessagein], [dbo].[wsmessageout]

    functions:
        [dbo].[dtr_fn_get_log_status], [dbo].[dtr_fn_get_total_hours], [dbo].[fn_get_sysconfig_value]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.LogBox

   AUTHOR:	[Insert Author Name]

   DATE:	19/10/2014 7:27:43 PM

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
-- Create User [LogBoxUser]
Print 'Create User [LogBoxUser]'
GO
CREATE USER [LogBoxUser]
	FOR LOGIN [LogBoxUser]
	WITH DEFAULT_SCHEMA = [dbo]
GO
EXEC sp_droprolemember @rolename=N'db_datareader', @membername =N'gee'

GO
EXEC sp_addrolemember @rolename=N'db_datareader', @membername =N'LogBoxUser'

GO
EXEC sp_droprolemember @rolename=N'db_datawriter', @membername =N'gee'

GO
EXEC sp_addrolemember @rolename=N'db_datawriter', @membername =N'LogBoxUser'

GO

BEGIN TRAN
GO

-- Drop Foreign Key FK_dtr_branch from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_branch from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_branch]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtr_employee from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_employee from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_employee]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtr_t_dtrstatus from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_t_dtrstatus from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_t_dtrstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_employee_t_religion from [dbo].[employee]
Print 'Drop Foreign Key FK_employee_t_religion from [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [FK_employee_t_religion]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_dtr_branch_code from [dbo].[dtr]
Print 'Drop Default Constraint DF_dtr_branch_code from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [DF_dtr_branch_code]
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
-- Drop Procedure [dbo].[dtr_get_by_date]
Print 'Drop Procedure [dbo].[dtr_get_by_date]'
GO
DROP PROCEDURE [dbo].[dtr_get_by_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_generate_xml]
Print 'Drop Procedure [dbo].[sync_generate_xml]'
GO
DROP PROCEDURE [dbo].[sync_generate_xml]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[dtr_get_employee]
Print 'Drop Procedure [dbo].[dtr_get_employee]'
GO
DROP PROCEDURE [dbo].[dtr_get_employee]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Preserve data from [dbo].[dtr] into a temporary table [dbo].temp498100815
CREATE TABLE [dbo].temp498100815 (
		[dtr_id]               [int] IDENTITY(1, 1) NOT NULL,
		[dtr_date]             [date] NOT NULL,
		[employee_id]          [int] NOT NULL,
		[time_in]              [time](7) NOT NULL,
		[time_out]             [time](7) NULL,
		[dtr_snapshot_in]      [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[dtr_snapshot_out]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[dtr_remarks]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[branch_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[remote_dtr_id]        [int] NULL,
		[dtrstatus_code]       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[syncstatus_code]      [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET IDENTITY_INSERT [dbo].temp498100815 ON
INSERT INTO [dbo].temp498100815 ([dtr_id], [dtr_date], [employee_id], [time_in], [time_out], [dtr_snapshot_in], [dtr_snapshot_out], [dtr_remarks], [remote_dtr_id], [dtrstatus_code], [syncstatus_code])
   SELECT [dtr_id], [dtr_date], [employee_id], [time_in], [time_out], [dtr_snapshot_in], [dtr_snapshot_out], [dtr_remarks], [remote_dtr_id], [dtrstatus_code], [syncstatus_code] FROM [dbo].[dtr]
SET IDENTITY_INSERT [dbo].temp498100815 OFF

GO

-- Drop Primary Key PK_dtr from [dbo].[dtr]
Print 'Drop Primary Key PK_dtr from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [PK_dtr]
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
-- Drop Table [dbo].[dtr]
Print 'Drop Table [dbo].[dtr]'
GO
DROP TABLE [dbo].[dtr]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Function [dbo].[fn_get_sysconfig_value]
Print 'Drop Function [dbo].[fn_get_sysconfig_value]'
GO
DROP FUNCTION [dbo].[fn_get_sysconfig_value]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Unique IX_id_num from [dbo].[employee]
Print 'Drop Unique IX_id_num from [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [IX_id_num]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_t_sysncstatus from [dbo].[t_syncstatus]
Print 'Drop Primary Key PK_t_sysncstatus from [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus] DROP CONSTRAINT [PK_t_sysncstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_wsmessageout from [dbo].[wsmessageout]
Print 'Drop Primary Key PK_wsmessageout from [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [PK_wsmessageout]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_t_wsmessagetype from [dbo].[t_wsmessagetype]
Print 'Drop Primary Key PK_t_wsmessagetype from [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype] DROP CONSTRAINT [PK_t_wsmessagetype]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_t_dtrstatus from [dbo].[t_dtrstatus]
Print 'Drop Primary Key PK_t_dtrstatus from [dbo].[t_dtrstatus]'
GO
ALTER TABLE [dbo].[t_dtrstatus] DROP CONSTRAINT [PK_t_dtrstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_sysconfig from [dbo].[sysconfig]
Print 'Drop Primary Key PK_sysconfig from [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig] DROP CONSTRAINT [PK_sysconfig]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column dtrstatus_name on [dbo].[t_dtrstatus]
Print 'Alter Column dtrstatus_name on [dbo].[t_dtrstatus]'
GO
ALTER TABLE [dbo].[t_dtrstatus]
	 ALTER COLUMN [dtrstatus_name] [varchar](25) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column dtrstatus_description on [dbo].[t_dtrstatus]
Print 'Alter Column dtrstatus_description on [dbo].[t_dtrstatus]'
GO
ALTER TABLE [dbo].[t_dtrstatus]
	 ALTER COLUMN [dtrstatus_description] [varchar](250) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column dtrstatus_code on [dbo].[t_dtrstatus]
Print 'Alter Column dtrstatus_code on [dbo].[t_dtrstatus]'
GO
ALTER TABLE [dbo].[t_dtrstatus]
	 ALTER COLUMN [dtrstatus_code] [char](3) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_dtrstatus to [dbo].[t_dtrstatus]
Print 'Add Primary Key PK_t_dtrstatus to [dbo].[t_dtrstatus]'
GO
ALTER TABLE [dbo].[t_dtrstatus]
	ADD
	CONSTRAINT [PK_t_dtrstatus]
	PRIMARY KEY
	CLUSTERED
	([dtrstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column sysconfig_value on [dbo].[sysconfig]
Print 'Alter Column sysconfig_value on [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig]
	 ALTER COLUMN [sysconfig_value] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column sysconfig_code on [dbo].[sysconfig]
Print 'Alter Column sysconfig_code on [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig]
	 ALTER COLUMN [sysconfig_code] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column sysconfig_description on [dbo].[sysconfig]
Print 'Alter Column sysconfig_description on [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig]
	 ALTER COLUMN [sysconfig_description] [varchar](250) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column sysconfig_name on [dbo].[sysconfig]
Print 'Alter Column sysconfig_name on [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig]
	 ALTER COLUMN [sysconfig_name] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_sysconfig to [dbo].[sysconfig]
Print 'Add Primary Key PK_sysconfig to [dbo].[sysconfig]'
GO
ALTER TABLE [dbo].[sysconfig]
	ADD
	CONSTRAINT [PK_sysconfig]
	PRIMARY KEY
	CLUSTERED
	([sysconfig_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column birth_place on [dbo].[employee]
Print 'Alter Column birth_place on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [birth_place] [varchar](150) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column id_num on [dbo].[employee]
Print 'Alter Column id_num on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [id_num] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column sss on [dbo].[employee]
Print 'Alter Column sss on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [sss] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column tin on [dbo].[employee]
Print 'Alter Column tin on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [tin] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column blood_type on [dbo].[employee]
Print 'Alter Column blood_type on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [blood_type] [char](2) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column employee_firstname on [dbo].[employee]
Print 'Alter Column employee_firstname on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [employee_firstname] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column gender on [dbo].[employee]
Print 'Alter Column gender on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [gender] [char](1) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column hdmf on [dbo].[employee]
Print 'Alter Column hdmf on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [hdmf] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column pin on [dbo].[employee]
Print 'Alter Column pin on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [pin] [char](2) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column phic on [dbo].[employee]
Print 'Alter Column phic on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [phic] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column civil_status on [dbo].[employee]
Print 'Alter Column civil_status on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [civil_status] [char](3) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column employee_lastname on [dbo].[employee]
Print 'Alter Column employee_lastname on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [employee_lastname] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column employee_middlename on [dbo].[employee]
Print 'Alter Column employee_middlename on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [employee_middlename] [varchar](50) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column drivers_license on [dbo].[employee]
Print 'Alter Column drivers_license on [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	 ALTER COLUMN [drivers_license] [varchar](12) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Unique IX_id_num to [dbo].[employee]
Print 'Add Unique IX_id_num to [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	ADD
	CONSTRAINT [IX_id_num]
	UNIQUE
	NONCLUSTERED
	([id_num])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column messagetype_code on [dbo].[t_wsmessagetype]
Print 'Alter Column messagetype_code on [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype]
	 ALTER COLUMN [messagetype_code] [char](3) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column messagetype_description on [dbo].[t_wsmessagetype]
Print 'Alter Column messagetype_description on [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype]
	 ALTER COLUMN [messagetype_description] [varchar](250) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column messagetype_name on [dbo].[t_wsmessagetype]
Print 'Alter Column messagetype_name on [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype]
	 ALTER COLUMN [messagetype_name] [varchar](25) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_wsmessagetype to [dbo].[t_wsmessagetype]
Print 'Add Primary Key PK_t_wsmessagetype to [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype]
	ADD
	CONSTRAINT [PK_t_wsmessagetype]
	PRIMARY KEY
	CLUSTERED
	([messagetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_wsmessagestatus]
Print 'Create Table [dbo].[t_wsmessagestatus]'
GO
CREATE TABLE [dbo].[t_wsmessagestatus] (
		[messagestatus_code]            [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[messagestatus_name]            [varchar](25) COLLATE Latin1_General_CI_AS NOT NULL,
		[messagestatus_description]     [varchar](250) COLLATE Latin1_General_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_wsmessagestatus to [dbo].[t_wsmessagestatus]
Print 'Add Primary Key PK_t_wsmessagestatus to [dbo].[t_wsmessagestatus]'
GO
ALTER TABLE [dbo].[t_wsmessagestatus]
	ADD
	CONSTRAINT [PK_t_wsmessagestatus]
	PRIMARY KEY
	CLUSTERED
	([messagestatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[t_wsmessagestatus]
Print 'Add Permissions To The table [dbo].[t_wsmessagestatus]'
DENY ALTER
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_wsmessagestatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column syncstatus_name on [dbo].[t_syncstatus]
Print 'Alter Column syncstatus_name on [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus]
	 ALTER COLUMN [syncstatus_name] [varchar](25) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column syncstatus_code on [dbo].[t_syncstatus]
Print 'Alter Column syncstatus_code on [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus]
	 ALTER COLUMN [syncstatus_code] [char](3) COLLATE Latin1_General_CI_AS NOT NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column syncstatus_description on [dbo].[t_syncstatus]
Print 'Alter Column syncstatus_description on [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus]
	 ALTER COLUMN [syncstatus_description] [varchar](250) COLLATE Latin1_General_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_sysncstatus to [dbo].[t_syncstatus]
Print 'Add Primary Key PK_t_sysncstatus to [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus]
	ADD
	CONSTRAINT [PK_t_sysncstatus]
	PRIMARY KEY
	CLUSTERED
	([syncstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessagein]
Print 'Create Table [dbo].[wsmessagein]'
GO
CREATE TABLE [dbo].[wsmessagein] (
		[event_object]           [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[pk_event_object]        [int] NOT NULL,
		[ws_message]             [xml] NOT NULL,
		[ws_message_date]        [datetime] NOT NULL,
		[priority]               [int] NULL,
		[messagetype_code]       [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[messagestatus_code]     [char](3) COLLATE Latin1_General_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_wsmessagein to [dbo].[wsmessagein]
Print 'Add Primary Key PK_wsmessagein to [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	ADD
	CONSTRAINT [PK_wsmessagein]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessagein_is_synced to [dbo].[wsmessagein]
Print 'Add Default Constraint DF_wsmessagein_is_synced to [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	ADD
	CONSTRAINT [DF_wsmessagein_is_synced]
	DEFAULT ((0)) FOR [messagestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[wsmessagein]
Print 'Add Permissions To The table [dbo].[wsmessagein]'
DENY ALTER
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT DELETE
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT UPDATE
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[wsmessagein] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
EXEC sp_rename @objname = N'[dbo].[wsmessageout]', @newname = N'temp686625489', @objtype = 'OBJECT'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessageout]
Print 'Create Table [dbo].[wsmessageout]'
GO
CREATE TABLE [dbo].[wsmessageout] (
		[event_object]           [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[pk_event_object]        [int] NOT NULL,
		[ws_message_date]        [datetime] NOT NULL,
		[priority]               [smallint] NULL,
		[messagetype_code]       [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[messagestatus_code]     [char](3) COLLATE Latin1_General_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessageout_is_sent to [dbo].[wsmessageout]
Print 'Add Default Constraint DF_wsmessageout_is_sent to [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	ADD
	CONSTRAINT [DF_wsmessageout_is_sent]
	DEFAULT ((0)) FOR [messagestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[wsmessageout] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp686625489 into the table [dbo].[wsmessageout]
-- Restore data
IF OBJECT_ID('[dbo].temp686625489') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[wsmessageout]') AND [type]='U')
EXEC sp_executesql N'
INSERT INTO [dbo].[wsmessageout] ([event_object], [pk_event_object], [ws_message_date])
   SELECT [event_object], [pk_event_object], [ws_message_date] FROM [dbo].temp686625489
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_wsmessageout to [dbo].[wsmessageout]
Print 'Add Primary Key PK_wsmessageout to [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	ADD
	CONSTRAINT [PK_wsmessageout]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[wsmessageout]
Print 'Add Permissions To The table [dbo].[wsmessageout]'
DENY ALTER
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT DELETE
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT UPDATE
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp686625489
IF OBJECT_ID('[dbo].temp686625489') IS NOT NULL DROP TABLE [dbo].temp686625489
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[dtr]
Print 'Create Table [dbo].[dtr]'
GO
CREATE TABLE [dbo].[dtr] (
		[dtr_id]               [int] IDENTITY(1, 1) NOT NULL,
		[location_code]        [char](3) COLLATE Latin1_General_CI_AS NULL,
		[remote_dtr_id]        [int] NULL,
		[dtr_date]             [date] NOT NULL,
		[employee_id]          [int] NOT NULL,
		[time_in]              [time](7) NOT NULL,
		[time_out]             [time](7) NULL,
		[dtr_snapshot_in]      [varchar](250) COLLATE Latin1_General_CI_AS NULL,
		[dtr_snapshot_out]     [varchar](250) COLLATE Latin1_General_CI_AS NULL,
		[dtr_remarks]          [varchar](250) COLLATE Latin1_General_CI_AS NULL,
		[dtrstatus_code]       [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[syncstatus_code]      [char](3) COLLATE Latin1_General_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_dtr_dtr_date to [dbo].[dtr]
Print 'Add Default Constraint DF_dtr_dtr_date to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD
	CONSTRAINT [DF_dtr_dtr_date]
	DEFAULT (getdate()) FOR [dtr_date]
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
-- Add Default Constraint DF_dtr_syncstatus_code to [dbo].[dtr]
Print 'Add Default Constraint DF_dtr_syncstatus_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD
	CONSTRAINT [DF_dtr_syncstatus_code]
	DEFAULT ('NS') FOR [syncstatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[dtr] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp498100815 into the table [dbo].[dtr]
-- Restore data
IF OBJECT_ID('[dbo].temp498100815') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[dtr]') AND [type]='U')
EXEC sp_executesql N'
SET IDENTITY_INSERT [dbo].[dtr] ON
INSERT INTO [dbo].[dtr] ([dtr_id], [dtr_date], [employee_id], [time_in], [time_out], [dtr_snapshot_in], [dtr_snapshot_out], [dtr_remarks], [remote_dtr_id], [dtrstatus_code], [syncstatus_code])
   SELECT [dtr_id], [dtr_date], [employee_id], [time_in], [time_out], [dtr_snapshot_in], [dtr_snapshot_out], [dtr_remarks], [remote_dtr_id], [dtrstatus_code], [syncstatus_code] FROM [dbo].temp498100815
SET IDENTITY_INSERT [dbo].[dtr] OFF
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_dtr to [dbo].[dtr]
Print 'Add Primary Key PK_dtr to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD
	CONSTRAINT [PK_dtr]
	PRIMARY KEY
	CLUSTERED
	([dtr_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[dtr]
Print 'Add Permissions To The table [dbo].[dtr]'
DENY ALTER
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp498100815
IF OBJECT_ID('[dbo].temp498100815') IS NOT NULL DROP TABLE [dbo].temp498100815
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[fn_get_sysconfig_value]
Print 'Create Function [dbo].[fn_get_sysconfig_value]'
GO
CREATE FUNCTION [dbo].[fn_get_sysconfig_value]
(
	@code varchar(30)
)
RETURNS varchar(50)
AS
BEGIN
    declare @value varchar(50)
    
    select @value = sysconfig_value
      from sysconfig sc (nolock)
     where sc.sysconfig_code = @code
     
	-- Return the result of the function
	RETURN @value
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The function [dbo].[fn_get_sysconfig_value]
Print 'Add Permissions To The function [dbo].[fn_get_sysconfig_value]'
DENY ALTER
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_employee]
Print 'Create Procedure [dbo].[dtr_get_employee]'
GO
CREATE PROCEDURE [dbo].[dtr_get_employee]
	@id_num varchar(12),
	@pin char(4)
AS
BEGIN
	select e.employee_id,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from employee e (nolock)
	 where e.id_num = @id_num
	   and e.pin = @pin
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[dtr_get_employee]
Print 'Add Permissions To The procedure [dbo].[dtr_get_employee]'
DENY ALTER
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]	
WITH GRANT OPTION
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_que_record]
Print 'Create Procedure [dbo].[sync_que_record]'
GO
CREATE PROCEDURE [dbo].[sync_que_record]
AS
BEGIN
	declare @dtr_id int
    set xact_abort on
    
    begin transaction
    
    -- get ID
    select @dtr_id = dtr_id
	  from dtr d (nolock) 
	 where d.syncstatus_code = 'NS'
	   and d.time_out is not null
  order by dtr_date desc, 
           time_in desc,
           time_out desc
    
	-- insert record into que
	-- set status to SYN
	-- this status will be changed
	-- to SSV after sending to the 
	-- web server
	if ISNULL(@dtr_id,0) > 0 
	begin
		insert into wsmessageout
		values ('DTR',
			   @dtr_id,
			   GETDATE(),
			   0,
			   'SYN',
			   'QUE')
	 
		-- set sync status of record to QUE
		update dtr 
		   set syncstatus_code = 'QUE'
		 where dtr_id = @dtr_id
	end
	
	commit transaction
	
	set xact_abort off
	 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_que_record]
Print 'Add Permissions To The procedure [dbo].[sync_que_record]'
DENY ALTER
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_by_date]
Print 'Create Procedure [dbo].[dtr_get_by_date]'
GO
CREATE PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from date,
	@dtr_date_until date,
	@employee_id integer
AS
BEGIN
	declare @dtr table
	(
		employee_id int,
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
	select e.employee_id,
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
	    on e.employee_id = d_am.employee_id
 left join (select dtr_id,
                   dtr_date,
				   employee_id,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= '12:00:00') d_pm 
		on d_pm.employee_id = d_am.employee_id
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < '12:00:00'
  
  -- afternoon log
  -- without morning log
  insert into @dtr
  select e.employee_id,
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
	   on e.employee_id = d_pm_only.employee_id
	where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
	  and d_pm_only.time_in > '12:00:00'
	  and not exists (select 1 
	                    from @dtr d  
	                   where d.employee_id = e.employee_id)
	
	select employee_id,
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
	 where (ISNULL(@employee_id,0) = 0 or d.employee_id = @employee_id)
  order by d.time_out_pm desc,
		   d.time_in_pm desc,
		   d.time_out_am desc,
		   d.time_in_am desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[dtr_get_by_date]
Print 'Add Permissions To The procedure [dbo].[dtr_get_by_date]'
DENY ALTER
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessageout_status]
Print 'Create Procedure [dbo].[sync_get_wsmessageout_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessageout_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'SSV'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_get_wsmessageout_status]
Print 'Add Permissions To The procedure [dbo].[sync_get_wsmessageout_status]'
DENY ALTER
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_set_wsmessageout_status]
Print 'Create Procedure [dbo].[sync_set_wsmessageout_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessageout_status] 
	@event_object char(3),
	@pk_event_object integer,
	@messagestatus_code char(3)
AS
BEGIN
	update wsmessageout
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_set_wsmessageout_status]
Print 'Add Permissions To The procedure [dbo].[sync_set_wsmessageout_status]'
DENY ALTER
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_xml_to_db]
Print 'Create Procedure [dbo].[sync_xml_to_db]'
GO
CREATE PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object int,
			@hdoc int, 
			@exists int = 0
			
	set xact_abort on
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object
	  from wsmessagein nolock
	 where messagestatus_code <> 'SYN'
  order by priority, ws_message_date
  
	if @ws_message is not null
	begin
		-- check if record already exists
		select @exists = COUNT(*)
		  from dtr
		 where remote_dtr_id = @pk_event_object
		
		if isnull(@exists,0) = 0 
		begin 
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- update status of message in the wsmessagein table
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
		  
			-- save wsmessage to intended table
			insert into dtr
			select *
			  from openxml(@hdoc, '/dtr', 2) 
			  with dtr	
			  
			-- update the status of the newly-inserted record
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = (select SCOPE_IDENTITY())
			 
			commit transaction
			  
			exec sp_xml_removedocument @hdoc  
		end
		else
		begin
			-- delete the existing record
			-- from the wsmessagein table
			delete
			  from wsmessagein
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
		end
	end
	
  	set xact_abort off  
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_xml_to_db]
Print 'Add Permissions To The procedure [dbo].[sync_xml_to_db]'
DENY ALTER
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
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
-- Add Permissions To The procedure [dbo].[dtr_log_time]
Print 'Add Permissions To The procedure [dbo].[dtr_log_time]'
DENY ALTER
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_generate_xml]
Print 'Create Procedure [dbo].[sync_generate_xml]'
GO
CREATE PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object int,
			@ws_message varchar(max),
			@ws_message_date datetime,
			@messagetype_code char(3),
			@messagestatus_code char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'QUE'
  order by ws_message_date asc
  
	-- get xml message
	set @ws_message = (select * 
					     from dtr d (nolock)
				    	where d.dtr_id = @pk_event_object
					      for xml raw ('dtr'), 
					          elements)
				   
	select @event_object as event_object,
		   @pk_event_object as pk_event_object,
		   @ws_message as ws_message,
		   @ws_message_date as ws_message_date,
		   null as priority,
		   dbo.fn_get_sysconfig_value('LOCATION_CODE') as source_location, 
		   'SVR' as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_generate_xml]
Print 'Add Permissions To The procedure [dbo].[sync_generate_xml]'
DENY ALTER
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessagein_status]
Print 'Create Procedure [dbo].[sync_get_wsmessagein_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessagein_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_get_wsmessagein_status]
Print 'Add Permissions To The procedure [dbo].[sync_get_wsmessagein_status]'
DENY ALTER
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_delete_synched_record]
Print 'Create Trigger [dbo].[tr_delete_synched_record]'
GO


CREATE TRIGGER [dbo].[tr_delete_synched_record]
   ON  [dbo].[wsmessageout]
   AFTER update
AS 
BEGIN
	declare @eventObject char(3),
			@pkEventObject integer,
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
			 where dtr_id = @pkEventObject
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
-- Create Trigger [dbo].[tr_set_location_code]
Print 'Create Trigger [dbo].[tr_set_location_code]'
GO

CREATE TRIGGER [dbo].[tr_set_location_code] 
   ON  [dbo].[dtr]
   AFTER INSERT
AS 
BEGIN
	declare @location_code char(3),
		    @employee_id int,
		    @use_paf_location varchar(30)
			
	select @location_code = location_code,
		   @employee_id = employee_id
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
			 where p.employee_id = @employee_id
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
-- Alter the authorization for Schema [db_datareader]
Print 'Alter the authorization for Schema [db_datareader]'
GO
ALTER AUTHORIZATION
	ON SCHEMA::[db_datareader]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter the authorization for Schema [db_datawriter]
Print 'Alter the authorization for Schema [db_datawriter]'
GO
ALTER AUTHORIZATION
	ON SCHEMA::[db_datawriter]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_employee on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_employee on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_employee]
	FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([employee_id])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_employee]

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
-- Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessagein_t_wsmessagestatus on [dbo].[wsmessagein]
Print 'Create Foreign Key FK_wsmessagein_t_wsmessagestatus on [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
	FOREIGN KEY ([messagestatus_code]) REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
ALTER TABLE [dbo].[wsmessagein]
	CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessagein_t_wsmessagetype on [dbo].[wsmessagein]
Print 'Create Foreign Key FK_wsmessagein_t_wsmessagetype on [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
	FOREIGN KEY ([messagetype_code]) REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
ALTER TABLE [dbo].[wsmessagein]
	CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessageout_t_wsmessagestatus on [dbo].[wsmessageout]
Print 'Create Foreign Key FK_wsmessageout_t_wsmessagestatus on [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
	FOREIGN KEY ([messagestatus_code]) REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
ALTER TABLE [dbo].[wsmessageout]
	CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessageout_t_wsmessagetype on [dbo].[wsmessageout]
Print 'Create Foreign Key FK_wsmessageout_t_wsmessagetype on [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
	FOREIGN KEY ([messagetype_code]) REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
ALTER TABLE [dbo].[wsmessageout]
	CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

