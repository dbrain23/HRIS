/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    procedures:
        [dbo].[hris_dd_get_allowance_types], [dbo].[hris_get_allowance_types_by_location], [dbo].[hris_get_latest_paf_allowances]

    tables:
        [dbo].[locationallowancetype], [dbo].[payroll], [dbo].[payrollcode], [dbo].[payrolldeduction], [dbo].[t_adjustmenttype], [dbo].[t_deductiontype], [dbo].[t_payrollstatus]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	19/01/2015 10:06:35 PM

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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_payrollstatus]
Print 'Create Table [dbo].[t_payrollstatus]'
GO
CREATE TABLE [dbo].[t_payrollstatus] (
		[payrollstatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[payrollstatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[payrollstatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_payrollstatus to [dbo].[t_payrollstatus]
Print 'Add Primary Key PK_t_payrollstatus to [dbo].[t_payrollstatus]'
GO
ALTER TABLE [dbo].[t_payrollstatus]
	ADD
	CONSTRAINT [PK_t_payrollstatus]
	PRIMARY KEY
	CLUSTERED
	([payrollstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_payrollstatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[payrolldeduction]
Print 'Create Table [dbo].[payrolldeduction]'
GO
CREATE TABLE [dbo].[payrolldeduction] (
		[pd_id]            [int] IDENTITY(1, 1) NOT NULL,
		[payroll_id]       [int] NOT NULL,
		[dt_id]            [int] NOT NULL,
		[pd_amount]        [decimal](10, 2) NOT NULL,
		[is_cancelled]     [smallint] NULL,
		[remarks]          [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[payrolldeduction] SET (LOCK_ESCALATION = TABLE)
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
		[deductiontype_name]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[deductiontype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_disabled]                   [smallint] NOT NULL,
		[is_system]                     [smallint] NOT NULL,
		[is_government]                 [smallint] NOT NULL,
		[can_print_request]             [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_deductiontype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_adjustmenttype]
Print 'Create Table [dbo].[t_adjustmenttype]'
GO
CREATE TABLE [dbo].[t_adjustmenttype] (
		[adjustmenttype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustmenttype_name]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustmenttype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_deduction]                   [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_adjustmenttype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[payrollcode]
Print 'Create Table [dbo].[payrollcode]'
GO
CREATE TABLE [dbo].[payrollcode] (
		[payroll_code]           [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[payroll_from]           [datetime2](0) NOT NULL,
		[payroll_until]          [datetime2](0) NULL,
		[payrollstatus_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payrollcode_payroll_code to [dbo].[payrollcode]
Print 'Add Primary Key PK_payrollcode_payroll_code to [dbo].[payrollcode]'
GO
ALTER TABLE [dbo].[payrollcode]
	ADD
	CONSTRAINT [PK_payrollcode_payroll_code]
	PRIMARY KEY
	CLUSTERED
	([payroll_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF__payrollco__payro__6B24EA82 to [dbo].[payrollcode]
Print 'Add Default Constraint DF__payrollco__payro__6B24EA82 to [dbo].[payrollcode]'
GO
ALTER TABLE [dbo].[payrollcode]
	ADD
	CONSTRAINT [DF__payrollco__payro__6B24EA82]
	DEFAULT (NULL) FOR [payroll_until]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[payrollcode] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[payroll]
Print 'Create Table [dbo].[payroll]'
GO
CREATE TABLE [dbo].[payroll] (
		[payroll_id]         [int] IDENTITY(1, 1) NOT NULL,
		[payroll_code]       [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[employee_id]        [int] NOT NULL,
		[location_code]      [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[number_of_days]     [decimal](8, 2) NOT NULL,
		[rate]               [decimal](10, 2) NOT NULL,
		[ot_am]              [decimal](8, 2) NULL,
		[ot_pm]              [decimal](8, 2) NULL,
		[remarks]            [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payroll to [dbo].[payroll]
Print 'Add Primary Key PK_payroll to [dbo].[payroll]'
GO
ALTER TABLE [dbo].[payroll]
	ADD
	CONSTRAINT [PK_payroll]
	PRIMARY KEY
	CLUSTERED
	([payroll_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[payroll] SET (LOCK_ESCALATION = TABLE)
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
-- Create Foreign Key FK_payroll_employee on [dbo].[payroll]
Print 'Create Foreign Key FK_payroll_employee on [dbo].[payroll]'
GO
ALTER TABLE [dbo].[payroll]
	WITH CHECK
	ADD CONSTRAINT [FK_payroll_employee]
	FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([employee_id])
ALTER TABLE [dbo].[payroll]
	CHECK CONSTRAINT [FK_payroll_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payroll_location on [dbo].[payroll]
Print 'Create Foreign Key FK_payroll_location on [dbo].[payroll]'
GO
ALTER TABLE [dbo].[payroll]
	WITH CHECK
	ADD CONSTRAINT [FK_payroll_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
ALTER TABLE [dbo].[payroll]
	CHECK CONSTRAINT [FK_payroll_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payroll_payrollcode on [dbo].[payroll]
Print 'Create Foreign Key FK_payroll_payrollcode on [dbo].[payroll]'
GO
ALTER TABLE [dbo].[payroll]
	WITH CHECK
	ADD CONSTRAINT [FK_payroll_payrollcode]
	FOREIGN KEY ([payroll_code]) REFERENCES [dbo].[payrollcode] ([payroll_code])
ALTER TABLE [dbo].[payroll]
	CHECK CONSTRAINT [FK_payroll_payrollcode]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key payroll$fk_payrollcode_status on [dbo].[payrollcode]
Print 'Create Foreign Key payroll$fk_payrollcode_status on [dbo].[payrollcode]'
GO
ALTER TABLE [dbo].[payrollcode]
	WITH CHECK
	ADD CONSTRAINT [payroll$fk_payrollcode_status]
	FOREIGN KEY ([payrollstatus_code]) REFERENCES [dbo].[t_payrollstatus] ([payrollstatus_code])
ALTER TABLE [dbo].[payrollcode]
	CHECK CONSTRAINT [payroll$fk_payrollcode_status]

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

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

