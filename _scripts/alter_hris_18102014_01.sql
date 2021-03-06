/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_rank_movement], [dbo].[tr_set_branch_code], [dbo].[tr_set_location_code], [dbo].[tr_set_remote_dtr_id]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_by_date_no_joins], [dbo].[dtr_get_dtr_for_import], [dbo].[dtr_import_dtr], [dbo].[dtr_load_exported_dtr], [dbo].[hris_dd_get_branches], [dbo].[hris_dd_get_departments], [dbo].[hris_dd_get_location_types], [dbo].[hris_dd_get_locations], [dbo].[hris_dd_get_skill], [dbo].[hris_delete_departments], [dbo].[hris_get_branches], [dbo].[hris_get_departments], [dbo].[hris_get_departments_by_location], [dbo].[hris_get_empskill], [dbo].[hris_get_locations], [dbo].[hris_get_paf], [dbo].[hris_get_paf_list], [dbo].[sync_dtr_que], [dbo].[sync_generate_xml], [dbo].[sync_get_wsmessage_status], [dbo].[sync_que_record], [dbo].[sync_set_wsmessage_status], [dbo].[sync_xml_to_db]

    tables:
        [dbo].[branch], [dbo].[department], [dbo].[dtr], [dbo].[location], [dbo].[locationdepartment], [dbo].[paf], [dbo].[t_locationtype]

    functions:
        [dbo].[dtr_fn_get_branch_code], [dbo].[dtr_fn_get_location_code]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	15/10/2014 9:45:52 PM

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
-- Drop Trigger [dbo].[tr_set_branch_code]
Print 'Drop Trigger [dbo].[tr_set_branch_code]'
GO
DROP TRIGGER [dbo].[tr_set_branch_code]
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
-- Drop Trigger [dbo].[tr_rank_movement]
Print 'Drop Trigger [dbo].[tr_rank_movement]'
GO
DROP TRIGGER [dbo].[tr_rank_movement]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_paf]
Print 'Drop Procedure [dbo].[hris_get_paf]'
GO
DROP PROCEDURE [dbo].[hris_get_paf]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_paf_list]
Print 'Drop Procedure [dbo].[hris_get_paf_list]'
GO
DROP PROCEDURE [dbo].[hris_get_paf_list]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Function [dbo].[dtr_fn_get_branch_code]
Print 'Drop Function [dbo].[dtr_fn_get_branch_code]'
GO
DROP FUNCTION [dbo].[dtr_fn_get_branch_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Trigger [dbo].[tr_set_remote_dtr_id]
Print 'Drop Trigger [dbo].[tr_set_remote_dtr_id]'
GO
DROP TRIGGER [dbo].[tr_set_remote_dtr_id]
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
-- Drop Procedure [dbo].[dtr_import_dtr]
Print 'Drop Procedure [dbo].[dtr_import_dtr]'
GO
DROP PROCEDURE [dbo].[dtr_import_dtr]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[dtr_get_by_date_no_joins]
Print 'Drop Procedure [dbo].[dtr_get_by_date_no_joins]'
GO
DROP PROCEDURE [dbo].[dtr_get_by_date_no_joins]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_dtr_que]
Print 'Drop Procedure [dbo].[sync_dtr_que]'
GO
DROP PROCEDURE [dbo].[sync_dtr_que]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_xml_to_db]
Print 'Drop Procedure [dbo].[sync_xml_to_db]'
GO
DROP PROCEDURE [dbo].[sync_xml_to_db]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_empskill]
Print 'Drop Procedure [dbo].[hris_get_empskill]'
GO
DROP PROCEDURE [dbo].[hris_get_empskill]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_get_wsmessage_status]
Print 'Drop Procedure [dbo].[sync_get_wsmessage_status]'
GO
DROP PROCEDURE [dbo].[sync_get_wsmessage_status]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_set_wsmessage_status]
Print 'Drop Procedure [dbo].[sync_set_wsmessage_status]'
GO
DROP PROCEDURE [dbo].[sync_set_wsmessage_status]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_dd_get_branches]
Print 'Drop Procedure [dbo].[hris_dd_get_branches]'
GO
DROP PROCEDURE [dbo].[hris_dd_get_branches]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_branches]
Print 'Drop Procedure [dbo].[hris_get_branches]'
GO
DROP PROCEDURE [dbo].[hris_get_branches]
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
-- Drop Index IX_dtr from [dbo].[dtr]
Print 'Drop Index IX_dtr from [dbo].[dtr]'
GO
DROP INDEX [IX_dtr] ON [dbo].[dtr]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_dd_get_skill]
Print 'Drop Procedure [dbo].[hris_dd_get_skill]'
GO
DROP PROCEDURE [dbo].[hris_dd_get_skill]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_locationtype]
Print 'Create Table [dbo].[t_locationtype]'
GO
CREATE TABLE [dbo].[t_locationtype] (
		[locationtype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[locationtype_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[locationtype_description]     [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[has_department]               [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_locationtype to [dbo].[t_locationtype]
Print 'Add Primary Key PK_t_locationtype to [dbo].[t_locationtype]'
GO
ALTER TABLE [dbo].[t_locationtype]
	ADD
	CONSTRAINT [PK_t_locationtype]
	PRIMARY KEY
	CLUSTERED
	([locationtype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_t_locationtype_has_department to [dbo].[t_locationtype]
Print 'Add Default Constraint DF_t_locationtype_has_department to [dbo].[t_locationtype]'
GO
ALTER TABLE [dbo].[t_locationtype]
	ADD
	CONSTRAINT [DF_t_locationtype_has_department]
	DEFAULT ((0)) FOR [has_department]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_locationtype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

/****** Object:  Table [dbo].[t_locationtype]    Script Date: 10/15/2014 22:07:29 ******/
INSERT [dbo].[t_locationtype] ([locationtype_code], [locationtype_name], [locationtype_description], [has_department]) VALUES (N'BRN', N'Branch', NULL, 0)
INSERT [dbo].[t_locationtype] ([locationtype_code], [locationtype_name], [locationtype_description], [has_department]) VALUES (N'CRP', N'Corporate office', NULL, 1)
INSERT [dbo].[t_locationtype] ([locationtype_code], [locationtype_name], [locationtype_description], [has_department]) VALUES (N'MAN', N'Main office', NULL, 0)
INSERT [dbo].[t_locationtype] ([locationtype_code], [locationtype_name], [locationtype_description], [has_department]) VALUES (N'SVR', N'Server', NULL, 0)

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[locationdepartment]
Print 'Create Table [dbo].[locationdepartment]'
GO
CREATE TABLE [dbo].[locationdepartment] (
		[location_code]       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[department_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_locationdepartment to [dbo].[locationdepartment]
Print 'Add Primary Key PK_locationdepartment to [dbo].[locationdepartment]'
GO
ALTER TABLE [dbo].[locationdepartment]
	ADD
	CONSTRAINT [PK_locationdepartment]
	PRIMARY KEY
	CLUSTERED
	([location_code], [department_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[locationdepartment] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[department]
Print 'Create Table [dbo].[department]'
GO
CREATE TABLE [dbo].[department] (
		[department_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[department_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[department_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_department to [dbo].[department]
Print 'Add Primary Key PK_department to [dbo].[department]'
GO
ALTER TABLE [dbo].[department]
	ADD
	CONSTRAINT [PK_department]
	PRIMARY KEY
	CLUSTERED
	([department_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[department] SET (LOCK_ESCALATION = TABLE)
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
	@employee_id int,
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
			employee_id int,
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
			@employee_id,
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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_paf_branch]') AND parent_object_id = OBJECT_ID(N'[dbo].[paf]'))
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_branch]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[location]
Print 'Create Table [dbo].[location]'
GO
CREATE TABLE [dbo].[location] (
		[location_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[location_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[location_address]         [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[location_landline_no]     [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[location_mobile_no]       [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[location_email]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[locationtype_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[area_code]                [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_inactive]              [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_location to [dbo].[location]
Print 'Add Primary Key PK_location to [dbo].[location]'
GO
ALTER TABLE [dbo].[location]
	ADD
	CONSTRAINT [PK_location]
	PRIMARY KEY
	CLUSTERED
	([location_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_location_is_inactive to [dbo].[location]
Print 'Add Default Constraint DF_location_is_inactive to [dbo].[location]'
GO
ALTER TABLE [dbo].[location]
	ADD
	CONSTRAINT [DF_location_is_inactive]
	DEFAULT ((0)) FOR [is_inactive]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[location] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

/****** Object:  Table [dbo].[location]    Script Date: 10/15/2014 22:07:29 ******/
INSERT [dbo].[location] 
	([location_code], 
	[location_name], 
	[location_address], 
	[location_landline_no], 
	[location_mobile_no], 
	[location_email], 
	[locationtype_code], 
	[area_code], 
	[is_inactive]) 
	(SELECT branch_code,
			branch_name,
			branch_address,
			branch_landline_no,
			branch_mobile_no,
			branch_email,
			'BRN',
			area_code,
			0
	   FROM branch
	)

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_delete_departments]
Print 'Create Procedure [dbo].[hris_delete_departments]'
GO

CREATE PROCEDURE dbo.hris_delete_departments
	@location_code char(3)
AS
BEGIN
	delete locationdepartment
	 where location_code = @location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_departments]
Print 'Create Procedure [dbo].[hris_get_departments]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_departments]
AS
BEGIN
	select *
	  from department d (nolock)
  order by d.department_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_departments_by_location]
Print 'Create Procedure [dbo].[hris_get_departments_by_location]'
GO

CREATE PROCEDURE dbo.hris_get_departments_by_location
	@location_code char(3)
AS
BEGIN
	select *
	  from locationdepartment ld (nolock)
	 where ld.location_code = @location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_departments]
Print 'Create Procedure [dbo].[hris_dd_get_departments]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.hris_dd_get_departments
AS
BEGIN
	select d.department_code,
		   d.department_name,
		   ld.location_code
	  from department d (nolock)
	  join locationdepartment ld (nolock) on ld.department_code = d.department_code
  order by d.department_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_location_types]
Print 'Create Procedure [dbo].[hris_dd_get_location_types]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_location_types]
AS
BEGIN
	select l.locationtype_code,
		   l.locationtype_name,
		   l.has_department
	  from t_locationtype l (nolock)
	 where l.locationtype_code <> 'SVR'
  order by l.locationtype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column location_code to [dbo].[dtr]
Print 'Add Column location_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD [location_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
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
-- Create Procedure [dbo].[hris_dd_get_locations]
Print 'Create Procedure [dbo].[hris_dd_get_locations]'
GO
CREATE PROCEDURE [dbo].[hris_dd_get_locations]
AS
BEGIN
	select l.location_code,
		   l.location_name
	  from location l (nolock)
	 where l.locationtype_code <> 'SVR'
  order by l.location_name
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
	  from ##dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.employee_id = d_am.employee_id
 left join (select dtr_id,
                   dtr_date,
				   employee_id,
                   time_in,
                   time_out 
			  from ##dtr d (nolock)
			 where d.time_in >= '12:00:00') d_pm 
		on d_pm.employee_id = d_am.employee_id
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.time_in < '12:00:00'
  
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
	 from ##dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.employee_id = d_pm_only.employee_id
	where d_pm_only.time_in > '12:00:00'
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_locations]
Print 'Create Procedure [dbo].[hris_get_locations]'
GO
CREATE PROCEDURE [dbo].[hris_get_locations]
AS
BEGIN
	select *
	  from location l (nolock)
  order by l.location_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
	EXEC sp_rename @objname = N'[dbo].[paf].[branch_code]', @newname = N'location_code', @objtype = 'COLUMN'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_location]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

