/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_set_approved_date]

    procedures:
        [dbo].[hris_dd_get_leave_types], [dbo].[hris_get_leave], [dbo].[hris_get_leave_types], [dbo].[hris_get_leaves]

    tables:
        [dbo].[empeducation], [dbo].[leave], [dbo].[sysrolelevel], [dbo].[t_course], [dbo].[t_educationalattainment], [dbo].[t_leavetype], [dbo].[t_school]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	17/06/2014 9:19:53 PM

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
USE [HRIS]
GO

BEGIN TRAN
GO

-- Drop Procedure [dbo].[hris_get_leave]
Print 'Drop Procedure [dbo].[hris_get_leave]'
GO
DROP PROCEDURE [dbo].[hris_get_leave]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_dd_get_leave_types]
Print 'Drop Procedure [dbo].[hris_dd_get_leave_types]'
GO
DROP PROCEDURE [dbo].[hris_dd_get_leave_types]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_leave_types]
Print 'Drop Procedure [dbo].[hris_get_leave_types]'
GO
DROP PROCEDURE [dbo].[hris_get_leave_types]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_t_leavetype_max_days from [dbo].[t_leavetype]
Print 'Drop Default Constraint DF_t_leavetype_max_days from [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype] DROP CONSTRAINT [DF_t_leavetype_max_days]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_educationalattainment]
Print 'Create Table [dbo].[t_educationalattainment]'
GO
CREATE TABLE [dbo].[t_educationalattainment] (
		[attainment_code]            [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[attainment_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[attainment_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_educationalattainment to [dbo].[t_educationalattainment]
Print 'Add Primary Key PK_t_educationalattainment to [dbo].[t_educationalattainment]'
GO
ALTER TABLE [dbo].[t_educationalattainment]
	ADD
	CONSTRAINT [PK_t_educationalattainment]
	PRIMARY KEY
	CLUSTERED
	([attainment_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_educationalattainment] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Column max_days on [dbo].[t_leavetype]
Print 'Alter Column max_days on [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype]
	 ALTER COLUMN [max_days] [float] NOT NULL
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_course]
Print 'Create Table [dbo].[t_course]'
GO
CREATE TABLE [dbo].[t_course] (
		[course_code]            [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[course_name]            [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[course_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK__t_course__8F1EF7AE0CA5D9DE to [dbo].[t_course]
Print 'Add Primary Key PK__t_course__8F1EF7AE0CA5D9DE to [dbo].[t_course]'
GO
ALTER TABLE [dbo].[t_course]
	ADD
	CONSTRAINT [PK__t_course__8F1EF7AE0CA5D9DE]
	PRIMARY KEY
	CLUSTERED
	([course_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_course] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[sysrolelevel]
Print 'Create Table [dbo].[sysrolelevel]'
GO
CREATE TABLE [dbo].[sysrolelevel] (
		[role_code]      [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[level_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_sysrolelevel to [dbo].[sysrolelevel]
Print 'Add Primary Key PK_sysrolelevel to [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel]
	ADD
	CONSTRAINT [PK_sysrolelevel]
	PRIMARY KEY
	CLUSTERED
	([role_code], [level_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[sysrolelevel] SET (LOCK_ESCALATION = TABLE)
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
-- Create Table [dbo].[t_school]
Print 'Create Table [dbo].[t_school]'
GO
CREATE TABLE [dbo].[t_school] (
		[school_code]     [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[school_name]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[town_id]         [int] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK__t_school__27CA6CF408D548FA to [dbo].[t_school]
Print 'Add Primary Key PK__t_school__27CA6CF408D548FA to [dbo].[t_school]'
GO
ALTER TABLE [dbo].[t_school]
	ADD
	CONSTRAINT [PK__t_school__27CA6CF408D548FA]
	PRIMARY KEY
	CLUSTERED
	([school_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_school] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column status_changed_date to [dbo].[leave]
Print 'Add Column status_changed_date to [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	ADD [status_changed_date] [datetime] NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[empeducation]
Print 'Create Table [dbo].[empeducation]'
GO
CREATE TABLE [dbo].[empeducation] (
		[employee_id]         [int] NOT NULL,
		[attainment_code]     [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[year_started]        [smallint] NULL,
		[year_ended]          [smallint] NULL,
		[school_code]         [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[course_code]         [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_empeducation to [dbo].[empeducation]
Print 'Add Primary Key PK_empeducation to [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	ADD
	CONSTRAINT [PK_empeducation]
	PRIMARY KEY
	CLUSTERED
	([employee_id], [attainment_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[empeducation] SET (LOCK_ESCALATION = TABLE)
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
-- Create Trigger [dbo].[tr_set_approved_date]
Print 'Create Trigger [dbo].[tr_set_approved_date]'
GO

CREATE TRIGGER dbo.tr_set_approved_date
   ON  dbo.leave
   AFTER update
AS 
BEGIN
    declare @leave_id int
	declare @leaveappstatus_code char(3)
	
	select @leave_id = leave_id,
		   @leaveappstatus_code = leaveappstatus_code
	  from inserted
	
	if @leaveappstatus_code = 'APP'
	begin
	  update leave
	     set status_changed_date = GETDATE()
	   where leave_id = @leave_id
	end
	else
	begin
	  update leave
	     set status_changed_date = null
	   where leave_id = @leave_id
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
-- Alter Procedure [dbo].[hris_get_leaves]
Print 'Alter Procedure [dbo].[hris_get_leaves]'
GO

ALTER PROCEDURE [dbo].[hris_get_leaves]
	@employee_id int
AS
BEGIN
	select l.leave_id,
		   l.leave_application_date,
		   e.employee_id,
		   e.employee_lastname,
		   e.employee_firstname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   lt.leavetype_name,
		   las.leaveappstatus_name,
		   l.leave_reason,
		   (select min(leave_date) 
		      from leavedetail ld1 (nolock) 
		     where ld1.leave_id = l.leave_id) startDate,
		   (select max(leave_date) 
		      from leavedetail ld2 (nolock) 
		     where ld2.leave_id = l.leave_id) untilDate
	  from leave l (nolock)
	  join employee e (nolock) 
	    on e.employee_id = l.employee_id
	  join t_leavetype lt (nolock)
	    on lt.leavetype_code = l.leavetype_code
	  join t_leaveapplicationstatus las (nolock)
	    on las.leaveappstatus_code = l.leaveappstatus_code
	 where (isnull(@employee_id,0) = 0 or l.employee_id = @employee_id)
  order by e.employee_lastname + e.employee_firstname
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_empeducation_employee on [dbo].[empeducation]
Print 'Create Foreign Key FK_empeducation_employee on [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	WITH CHECK
	ADD CONSTRAINT [FK_empeducation_employee]
	FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([employee_id])
ALTER TABLE [dbo].[empeducation]
	CHECK CONSTRAINT [FK_empeducation_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_empeducation_t_course on [dbo].[empeducation]
Print 'Create Foreign Key FK_empeducation_t_course on [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	WITH CHECK
	ADD CONSTRAINT [FK_empeducation_t_course]
	FOREIGN KEY ([course_code]) REFERENCES [dbo].[t_course] ([course_code])
ALTER TABLE [dbo].[empeducation]
	CHECK CONSTRAINT [FK_empeducation_t_course]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_empeducation_t_educationalattainment on [dbo].[empeducation]
Print 'Create Foreign Key FK_empeducation_t_educationalattainment on [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	WITH CHECK
	ADD CONSTRAINT [FK_empeducation_t_educationalattainment]
	FOREIGN KEY ([attainment_code]) REFERENCES [dbo].[t_educationalattainment] ([attainment_code])
ALTER TABLE [dbo].[empeducation]
	CHECK CONSTRAINT [FK_empeducation_t_educationalattainment]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_empeducation_t_school on [dbo].[empeducation]
Print 'Create Foreign Key FK_empeducation_t_school on [dbo].[empeducation]'
GO
ALTER TABLE [dbo].[empeducation]
	WITH CHECK
	ADD CONSTRAINT [FK_empeducation_t_school]
	FOREIGN KEY ([school_code]) REFERENCES [dbo].[t_school] ([school_code])
ALTER TABLE [dbo].[empeducation]
	CHECK CONSTRAINT [FK_empeducation_t_school]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysrolelevel_sysrole on [dbo].[sysrolelevel]
Print 'Create Foreign Key FK_sysrolelevel_sysrole on [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel]
	WITH CHECK
	ADD CONSTRAINT [FK_sysrolelevel_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
ALTER TABLE [dbo].[sysrolelevel]
	CHECK CONSTRAINT [FK_sysrolelevel_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysrolelevel_t_level on [dbo].[sysrolelevel]
Print 'Create Foreign Key FK_sysrolelevel_t_level on [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel]
	WITH CHECK
	ADD CONSTRAINT [FK_sysrolelevel_t_level]
	FOREIGN KEY ([level_code]) REFERENCES [dbo].[t_level] ([level_code])
ALTER TABLE [dbo].[sysrolelevel]
	CHECK CONSTRAINT [FK_sysrolelevel_t_level]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_school_t_town on [dbo].[t_school]
Print 'Create Foreign Key FK_t_school_t_town on [dbo].[t_school]'
GO
ALTER TABLE [dbo].[t_school]
	WITH CHECK
	ADD CONSTRAINT [FK_t_school_t_town]
	FOREIGN KEY ([town_id]) REFERENCES [dbo].[t_town] ([town_id])
ALTER TABLE [dbo].[t_school]
	CHECK CONSTRAINT [FK_t_school_t_town]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

