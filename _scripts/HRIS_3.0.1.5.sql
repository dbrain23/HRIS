/* ------------------------------------------------------------

DESCRIPTION: Schema synchronization script for object(s) \r\n
    procedures:
        [dbo].[dtr_delete_holiday_locations], [dbo].[dtr_get_by_date], [dbo].[dtr_get_holiday], [dbo].[dtr_get_holiday_locations], [dbo].[dtr_get_holidays], [dbo].[hris_dd_get_holiday_types], [dbo].[hris_dd_get_months], [dbo].[hris_dd_get_paf_status], [dbo].[hris_dd_get_resource_types], [dbo].[hris_get_holiday_types]

    tables:
        [dbo].[holiday], [dbo].[holidaylocation], [dbo].[paf], [dbo].[t_holidaytype], [dbo].[t_pafstatus]

     Make BRYAN-ULTRA\SQL2008R2.HRIS_Production Equal BRYAN-ULTRA\SQL2008R2.HRIS

   AUTHOR:	[Insert author name]

   DATE:	4/12/2015 11:11:44 AM

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

-- Drop All Permissions For The procedure [dbo].[dtr_get_by_date]
Print 'Drop All Permissions For The procedure [dbo].[dtr_get_by_date]'
REVOKE ALTER
	ON [dbo].[dtr_get_by_date]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_get_by_date]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_get_by_date]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[dtr_get_by_date]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[dtr_get_by_date]
	TO [HRISUser]
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
REVOKE ALTER
	ON [dbo].[hris_dd_get_resource_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_dd_get_resource_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_dd_get_resource_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[hris_dd_get_resource_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[hris_dd_get_resource_types]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE DELETE
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE INSERT
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE UPDATE
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW CHANGE TRACKING
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[paf]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_holidaytype]
Print 'Create Table [dbo].[t_holidaytype]'
GO
CREATE TABLE [dbo].[t_holidaytype] (
		[holidaytype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[holidaytype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[holidaytype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[holiday_rate]                [float] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_holidaytype to [dbo].[t_holidaytype]
Print 'Add Primary Key PK_t_holidaytype to [dbo].[t_holidaytype]'
GO
ALTER TABLE [dbo].[t_holidaytype]
	ADD
	CONSTRAINT [PK_t_holidaytype]
	PRIMARY KEY
	CLUSTERED
	([holidaytype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_holidaytype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_pafstatus]
Print 'Create Table [dbo].[t_pafstatus]'
GO
CREATE TABLE [dbo].[t_pafstatus] (
		[pafstatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pafstatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pafstatus_description]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_pafstatus to [dbo].[t_pafstatus]
Print 'Add Primary Key PK_t_pafstatus to [dbo].[t_pafstatus]'
GO
ALTER TABLE [dbo].[t_pafstatus]
	ADD
	CONSTRAINT [PK_t_pafstatus]
	PRIMARY KEY
	CLUSTERED
	([pafstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_pafstatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

GO
INSERT [dbo].[t_pafstatus] ([pafstatus_code], [pafstatus_name], [pafstatus_description]) VALUES (N'APP', N'Approved', N'PAF record has been approved.')
GO
INSERT [dbo].[t_pafstatus] ([pafstatus_code], [pafstatus_name], [pafstatus_description]) VALUES (N'PND', N'Pending', N'PAF record is awaiting approval')
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_months]
Print 'Create Procedure [dbo].[hris_dd_get_months]'
GO

CREATE PROCEDURE dbo.hris_dd_get_months
AS
BEGIN
	select 1 month_num, 'January' month_name
	union
	select 2 month_num, 'February' month_name
	union
	select 3 month_num, 'March' month_name
	union
	select 4 month_num, 'April' month_name
	union
	select 5 month_num, 'May' month_name
	union
	select 6 month_num, 'June' month_name
	union
	select 7 month_num, 'July' month_name
	union
	select 8 month_num, 'August' month_name
	union
	select 9 month_num, 'September' month_name
	union
	select 10 month_num, 'October' month_name
	union
	select 11 month_num, 'November' month_name
	union
	select 12 month_num, 'December' month_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[holiday]
Print 'Create Table [dbo].[holiday]'
GO
CREATE TABLE [dbo].[holiday] (
		[holiday_id]              [int] IDENTITY(1, 1) NOT NULL,
		[holiday_year]            [smallint] NULL,
		[holiday_month]           [smallint] NOT NULL,
		[holiday_day]             [smallint] NOT NULL,
		[holiday_name]            [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[holiday_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[holidaytype_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_national]             [smallint] NOT NULL,
		[holiday_remarks]         [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_recurring]            [smallint] NOT NULL,
		[created_by]              [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]            [datetime] NOT NULL,
		[modified_by]             [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]           [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_holiday_1 to [dbo].[holiday]
Print 'Add Primary Key PK_holiday_1 to [dbo].[holiday]'
GO
ALTER TABLE [dbo].[holiday]
	ADD
	CONSTRAINT [PK_holiday_1]
	PRIMARY KEY
	CLUSTERED
	([holiday_id])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_holiday_created_date to [dbo].[holiday]
Print 'Add Default Constraint DF_holiday_created_date to [dbo].[holiday]'
GO
ALTER TABLE [dbo].[holiday]
	ADD
	CONSTRAINT [DF_holiday_created_date]
	DEFAULT (getdate()) FOR [created_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_holiday_is_national to [dbo].[holiday]
Print 'Add Default Constraint DF_holiday_is_national to [dbo].[holiday]'
GO
ALTER TABLE [dbo].[holiday]
	ADD
	CONSTRAINT [DF_holiday_is_national]
	DEFAULT ((0)) FOR [is_national]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_holiday_is_recurring to [dbo].[holiday]
Print 'Add Default Constraint DF_holiday_is_recurring to [dbo].[holiday]'
GO
ALTER TABLE [dbo].[holiday]
	ADD
	CONSTRAINT [DF_holiday_is_recurring]
	DEFAULT ((0)) FOR [is_recurring]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[holiday] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_holiday_types]
Print 'Create Procedure [dbo].[hris_dd_get_holiday_types]'
GO

CREATE PROCEDURE [dbo].[hris_dd_get_holiday_types]
AS
BEGIN
	select holidaytype_code,
	       holidaytype_name,
		   holiday_rate
	  from t_holidaytype (nolock)
  order by holidaytype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_paf_status]
Print 'Create Procedure [dbo].[hris_dd_get_paf_status]'
GO

CREATE PROCEDURE dbo.hris_dd_get_paf_status
AS
BEGIN
	select ps.pafstatus_code,
	       ps.pafstatus_name
	  from t_pafstatus ps (nolock)
  order by ps.pafstatus_name	
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_holiday_types]
Print 'Create Procedure [dbo].[hris_get_holiday_types]'
GO

CREATE PROCEDURE dbo.hris_get_holiday_types
AS
BEGIN
	select *
	  from t_holidaytype (nolock)
  order by holidaytype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column pafstatus_code to [dbo].[paf]
Print 'Add Column pafstatus_code to [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	ADD [pafstatus_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	CONSTRAINT [DF_paf_pafstatus_code] DEFAULT ('PND')
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[holidaylocation]
Print 'Create Table [dbo].[holidaylocation]'
GO
CREATE TABLE [dbo].[holidaylocation] (
		[holiday_id]        [int] NOT NULL,
		[location_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_holidaylocation to [dbo].[holidaylocation]
Print 'Add Primary Key PK_holidaylocation to [dbo].[holidaylocation]'
GO
ALTER TABLE [dbo].[holidaylocation]
	ADD
	CONSTRAINT [PK_holidaylocation]
	PRIMARY KEY
	CLUSTERED
	([holiday_id], [location_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[holidaylocation] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_holiday]
Print 'Create Procedure [dbo].[dtr_get_holiday]'
GO

CREATE PROCEDURE [dbo].[dtr_get_holiday]
	@holiday_id integer
AS
BEGIN
	select *
	  from holiday h (nolock)
	 where h.holiday_id = @holiday_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_dd_get_resource_types]
Print 'Alter Procedure [dbo].[hris_dd_get_resource_types]'
GO

ALTER PROCEDURE [dbo].[hris_dd_get_resource_types]
AS
BEGIN
	declare @resourceType table
	(
		resource_type char(3),
		code char(3),
		name varchar(50)
	)
	
	insert into @resourceType
	select 'LOC' resource_type,
	       l.location_code code,
		   l.location_name name
	  from location l (nolock)
	 where l.locationtype_code <> 'SVR'	

	 union

	select 'DEP' resource_type,
		    d.department_code code,
			d.department_name + ' (DEPARTMENT)' name
		from department d (nolock)	
	
	-- return
	select *
	  from @resourceType
  order by name

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_delete_holiday_locations]
Print 'Create Procedure [dbo].[dtr_delete_holiday_locations]'
GO

CREATE PROCEDURE dbo.dtr_delete_holiday_locations
	@holiday_id integer
AS
BEGIN
	delete holidaylocation
	 where holiday_id = @holiday_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_holiday_locations]
Print 'Create Procedure [dbo].[dtr_get_holiday_locations]'
GO

CREATE PROCEDURE [dbo].[dtr_get_holiday_locations]
	@holiday_id integer
AS
BEGIN
	-- get locations
	select l.location_name,
	       l.location_code location,
	       hl.location_code,
		   hl.holiday_id
	  from location l (nolock)
 left join holidaylocation hl (nolock)
        on hl.location_code = l.location_code
	   and hl.holiday_id = @holiday_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_holidays]
Print 'Create Procedure [dbo].[dtr_get_holidays]'
GO

CREATE PROCEDURE [dbo].[dtr_get_holidays]
	@dtr_date_from datetime,
	@dtr_date_until datetime
AS
BEGIN
	
	select h.*
	  into #holidays
	  from holiday h (nolock)
	 where cast(cast((case isnull(h.holiday_year,0) when 0 then year(@dtr_date_from) else h.holiday_year end) as varchar(4)) +
				right('0' + cast(holiday_month as varchar(2)), 2) +
				right('0' + cast(holiday_day as varchar(2)), 2) as datetime) 
   between @dtr_date_from and @dtr_date_until
	 
	-- return 
	select *
	  from (
			select l.location_name,
				   l.location_code,
				   h.*
			  from location l (nolock)
		 left join holidaylocation hl (nolock)
				on hl.location_code = l.location_code
		 left join #holidays h (nolock)
				on h.holiday_id = hl.holiday_id

			union 
	
			select l.location_name,
				   l.location_code,
				   h.*
			  from location l (nolock),
				   #holidays h 
			 where isnull(h.is_national,0) = 1
			) hh
	order by hh.location_name

	drop table #holidays
END
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
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
    @location_code char(3) = null,
	@department_code char(3) = null
AS
BEGIN
			create table #dtr
			(
				id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
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
				--primary key (id_num, dtr_date)  -- removed temporarily to allow duplicate records.. check id_num = 231, date = 2015-10-05
			)

			declare @current_date datetime

			set @current_date = getdate()

			-- constants for min and max login/out times
			declare @LOGIN_AM time(0),
					@LOGIN_PM time(0),
					@LOGOUT_AM time(0),
					@LOGOUT_PM time(0)

			-- get times
			select @LOGIN_AM = LOGIN_AM,
				   @LOGOUT_AM = LOGOUT_AM,
				   @LOGIN_PM = LOGIN_PM,
				   @LOGOUT_PM = LOGOUT_PM
			  from dbo.dtr_fn_get_times(@current_date)

			declare @employee table
			(
				id_num varchar(12),
				employee_name varchar(100),
				location_code char(3),
				department_code char(3)
			)

			insert into @employee
			select id_num,
					employee_name,
					location_code,
					department_code
				from dbo.paf_fn_active_employees(@dtr_date_from,@dtr_date_until)

			-- all dtr affected by date range
			select *
              into #alldtr
			  from dtr (nolock) d
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
				
			-- morning log
			-- with or without afternoon log
			insert into #dtr
			select e.id_num,
				   e.employee_name,
				   d_am.dtr_date,
				   d_am.time_in as time_in_am,
				   d_am.time_out as time_out_am,
				   dbo.dtr_fn_get_log_status(d_am.time_in, @current_date) as am_status,
				   d_pm.time_in as time_in_pm,
				   d_pm.time_out as time_out_pm,
				   dbo.dtr_fn_get_log_status(d_pm.time_in, d_am.dtr_date) pm_status,
				   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
				   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
				   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, d_am.dtr_date) total_hours_am,
				   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, d_am.dtr_date) total_hours_pm,
				   d_am.location_code
			  from #alldtr d_am 
			  join @employee e 
				on e.id_num = d_am.id_num
		 left join (select dtr_id,
						   dtr_date,
						   id_num,
						   time_in,
						   time_out 
					  from #alldtr d 
					 where d.time_in >= @LOGOUT_AM --'12:00:00'
					   and (ISNULL(@id_num,'') = '' or d.id_num = @id_num)) d_pm 
				on d_pm.id_num = d_am.id_num
			   and d_pm.dtr_date = d_am.dtr_date
			 where d_am.time_in < @LOGOUT_AM --'12:00:00'
			   and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
			   and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
			   and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)


		  -- afternoon log
		  -- without morning log
		  insert into #dtr
		  select e.id_num,
				 e.employee_name,
				 d_pm_only.dtr_date,
				 null as time_in_am,
				 null as time_out_am,
				 null as am_status,
				 d_pm_only.time_in as time_in_pm,
				 d_pm_only.time_out as time_out_pm,
				 dbo.dtr_fn_get_log_status(d_pm_only.time_in, d_pm_only.dtr_date) pm_status,
				 0 total_hours_am,
				 -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
				 dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, d_pm_only.dtr_date) d_pm_only,
				 d_pm_only.location_code
			from #alldtr d_pm_only (nolock)
			join @employee e 
			  on e.id_num = d_pm_only.id_num
		   where d_pm_only.time_in > @LOGOUT_AM --'12:00:00'
			 and not exists (select 1 
			  				   from #dtr d  
						      where d.id_num = e.id_num)
			 and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
			 and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
			 and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)

			-- get override
			select dtr_date override_date,
				   id_num,
				   location_code
			  into #override
			  from dtroverride do (nolock)
			 where do.dtr_date between @dtr_date_from and @dtr_date_until
			 --and isnull(do.is_cancelled,0) = 0
		  group by dtr_date, id_num, location_code

			-- get undertime
			select dtr_date undertime_date,
				   id_num
			  into #undertime
			  from dtrundertime du (nolock)
			 where du.dtr_date between @dtr_date_from and @dtr_date_until
			-- and du.timestatus_code = 'APP'

			-- get leaves
			select leave_date,
				   id_num
			  into #leaves
			  from leavedetail ld (nolock)
			  join leave l (nolock)
				on l.location_code = ld.location_code
			   and l.leave_id = ld.leave_id
			 where ld.leave_date between @dtr_date_from and @dtr_date_until
			   and ld.leavestatus_code = 'APP'

			-- insert overrides with no corresponding log
			insert into #dtr
			select o.id_num,
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   o.override_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   o.location_code
			  from #override o 
			  join employee e (nolock)
				on e.id_num = o.id_num
		 left join #dtr d 
				on d.id_num = o.id_num
		  	   and d.dtr_date = o.override_date
			 where d.dtr_date is null
			   and o.id_num in (select id_num from #dtr)

			 -- insert undertime with no corresponding log
			insert into #dtr
			select u.id_num,
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   u.undertime_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   d.location_code
			  from #undertime u 
			  join employee e (nolock)
				on e.id_num = u.id_num
		 left join #dtr d 
				on d.id_num = u.id_num
		  	   and d.dtr_date = u.undertime_date
			 where d.dtr_date is null
			   and u.id_num in (select id_num from #dtr)
	                    
			-- insert leaves with no corresponding log
			insert into #dtr
			select l.id_num,
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   l.leave_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   d.location_code
			  from #leaves l 
			  join employee e (nolock)
				on e.id_num = l.id_num
		 left join #dtr d 
				on d.id_num = l.id_num
		  	   and d.dtr_date = l.leave_date
			 where d.dtr_date is null
			   and l.id_num in (select id_num from #dtr)

			CREATE NONCLUSTERED INDEX nci_id_num_date ON #dtr(id_num, dtr_date) 

			-- select result
			select d.id_num,
				   d.employee_name,
				   d.dtr_date,
				   isnull(convert(varchar(5),d.time_in_am),'-') time_in_am,
				   isnull(convert(varchar(5),d.time_out_am),'-') time_out_am,
				   d.am_status,
				   isnull(convert(varchar(5),d.time_in_pm),'-') time_in_pm,
				   isnull(convert(varchar(5),d.time_out_pm),'-') time_out_pm,
				   d.pm_status,
				   (total_hours_am + total_hours_pm) total_hours,
				   d.location_code,
				   o.override_date,
				   u.undertime_date,
				   l.leave_date
			  from #dtr d
		 left join #override o
		        on o.override_date = d.dtr_date
			   and o.id_num = d.id_num
		 left join #undertime u
				on u.undertime_date = d.dtr_date
		   	   and u.id_num = d.id_num
		 left join #leaves l
				on l.leave_date = d.dtr_date
		  	   and l.id_num = d.id_num 	
	      order by d.employee_name,
		           d.dtr_date

			drop table #dtr
			drop table #override
			drop table #undertime
			drop table #leaves
			drop table #alldtr
     
END


GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_holiday_t_holidaytype on [dbo].[holiday]
Print 'Create Foreign Key FK_holiday_t_holidaytype on [dbo].[holiday]'
GO
ALTER TABLE [dbo].[holiday]
	WITH CHECK
	ADD CONSTRAINT [FK_holiday_t_holidaytype]
	FOREIGN KEY ([holidaytype_code]) REFERENCES [dbo].[t_holidaytype] ([holidaytype_code])
ALTER TABLE [dbo].[holiday]
	CHECK CONSTRAINT [FK_holiday_t_holidaytype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_holidaylocation_holiday on [dbo].[holidaylocation]
Print 'Create Foreign Key FK_holidaylocation_holiday on [dbo].[holidaylocation]'
GO
ALTER TABLE [dbo].[holidaylocation]
	WITH CHECK
	ADD CONSTRAINT [FK_holidaylocation_holiday]
	FOREIGN KEY ([holiday_id]) REFERENCES [dbo].[holiday] ([holiday_id])
ALTER TABLE [dbo].[holidaylocation]
	CHECK CONSTRAINT [FK_holidaylocation_holiday]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_holidaylocation_location on [dbo].[holidaylocation]
Print 'Create Foreign Key FK_holidaylocation_location on [dbo].[holidaylocation]'
GO
ALTER TABLE [dbo].[holidaylocation]
	WITH CHECK
	ADD CONSTRAINT [FK_holidaylocation_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
ALTER TABLE [dbo].[holidaylocation]
	CHECK CONSTRAINT [FK_holidaylocation_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_t_pafstatus on [dbo].[paf]
Print 'Create Foreign Key FK_paf_t_pafstatus on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_t_pafstatus]
	FOREIGN KEY ([pafstatus_code]) REFERENCES [dbo].[t_pafstatus] ([pafstatus_code])
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_t_pafstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

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
		   p.is_cancelled,
		   p.pafstatus_code
	  from paf p (nolock)
	 where paf_id = @paf_id
END

GO
ALTER PROCEDURE [dbo].[hris_get_latest_paf]
	@id_num int
AS
BEGIN
	select top 1 *
	  from paf p (nolock)
	 where p.id_num = @id_num
	   and isnull(p.is_cancelled,0) = 0
	   and p.pafstatus_code = 'APP'
  order by p.effective_date desc
END

GO

-- populate the new paf column
update paf
   set pafstatus_code = 'APP'
 where is_cancelled = 0
   and effective_until is not null

GO
GRANT CONTROL ON [dbo].[dtr_get_by_date] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[dtr_get_by_date] TO [HRISUser]
GO

DENY ALTER ON [dbo].[dtr_get_by_date] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[dtr_get_by_date] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[dtr_get_by_date] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GO

DENY ALTER ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[holiday] TO [HRISUser]
GO

GRANT INSERT ON [dbo].[holiday] TO [HRISUser]
GO

GRANT REFERENCES ON [dbo].[holiday] TO [HRISUser]
GO

GRANT SELECT ON [dbo].[holiday] TO [HRISUser]
GO

GRANT UPDATE ON [dbo].[holiday] TO [HRISUser]
GO

DENY ALTER ON [dbo].[holiday] TO [HRISUser]
GO

DENY DELETE ON [dbo].[holiday] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[holiday] TO [HRISUser]
GO

DENY VIEW CHANGE TRACKING ON [dbo].[holiday] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[holiday] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT DELETE ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT INSERT ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT REFERENCES ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT SELECT ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT UPDATE ON [dbo].[holidaylocation] TO [HRISUser]
GO

DENY ALTER ON [dbo].[holidaylocation] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[holidaylocation] TO [HRISUser]
GO

DENY VIEW CHANGE TRACKING ON [dbo].[holidaylocation] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[holidaylocation] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT DELETE ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT INSERT ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT REFERENCES ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT SELECT ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT UPDATE ON [dbo].[t_holidaytype] TO [HRISUser]
GO

DENY ALTER ON [dbo].[t_holidaytype] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[t_holidaytype] TO [HRISUser]
GO

DENY VIEW CHANGE TRACKING ON [dbo].[t_holidaytype] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[t_holidaytype] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[dtr_get_holiday] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[dtr_get_holiday] TO [HRISUser]
GO

DENY ALTER ON [dbo].[dtr_get_holiday] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holiday] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[dtr_get_holiday] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[t_pafstatus] TO [HRISUser]
GO

GRANT INSERT ON [dbo].[t_pafstatus] TO [HRISUser]
GO

GRANT REFERENCES ON [dbo].[t_pafstatus] TO [HRISUser]
GO

GRANT SELECT ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY ALTER ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY DELETE ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY UPDATE ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY VIEW CHANGE TRACKING ON [dbo].[t_pafstatus] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[t_pafstatus] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GO

DENY ALTER ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[dtr_get_holidays] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[dtr_get_holidays] TO [HRISUser]
GO

DENY ALTER ON [dbo].[dtr_get_holidays] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holidays] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[dtr_get_holidays] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GO

DENY ALTER ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GO

GRANT CONTROL ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GO

GRANT EXECUTE ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GO

DENY ALTER ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GO

DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GO

DENY VIEW DEFINITION ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF
GO

