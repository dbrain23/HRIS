/* ------------------------------------------------------------

DESCRIPTION: Schema synchronization script for object(s) \r\n
    triggers:
        [dbo].[tr_set_pin]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_by_date_no_joins], [dbo].[dtr_get_dtr_for_import], [dbo].[dtr_get_employee], [dbo].[dtr_log_time], [dbo].[hris_dd_get_leave_reasons], [dbo].[hris_dd_get_override_reasons], [dbo].[hris_dd_get_overtime_reasons], [dbo].[hris_dd_get_time_status], [dbo].[hris_dd_get_undertime_reasons], [dbo].[hris_delete_leave_reasons], [dbo].[hris_get_leave_reasons], [dbo].[hris_get_leave_reasons_with_parent], [dbo].[hris_get_overridereasons], [dbo].[hris_get_overtime_reasons], [dbo].[hris_get_undertime_reasons]

    tables:
        [dbo].[t_leavereason], [dbo].[t_overtimereason], [dbo].[t_timestatus], [dbo].[t_undertimereason]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert author name]

   DATE:	18/08/2015 5:09:21 PM

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
USE [HRIS_Live]
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
-- Drop Procedure [dbo].[dtr_get_by_date]
Print 'Drop Procedure [dbo].[dtr_get_by_date]'
GO
DROP PROCEDURE [dbo].[dtr_get_by_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop All Permissions For The procedure [dbo].[dtr_get_by_date_no_joins]
Print 'Drop All Permissions For The procedure [dbo].[dtr_get_by_date_no_joins]'
REVOKE ALTER
	ON [dbo].[dtr_get_by_date_no_joins]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_get_by_date_no_joins]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_get_by_date_no_joins]
	TO [HRISUser]
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
-- Drop All Permissions For The procedure [dbo].[dtr_log_time]
Print 'Drop All Permissions For The procedure [dbo].[dtr_log_time]'
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
-- Drop Procedure [dbo].[dtr_log_time]
Print 'Drop Procedure [dbo].[dtr_log_time]'
GO
DROP PROCEDURE [dbo].[dtr_log_time]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[dtr_get_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_get_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_get_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[dtr_get_dtr_for_import]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_get_dtr_for_import]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_get_dtr_for_import]
	TO [HRISUser]
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
-- Create Procedure [dbo].[hris_delete_leave_reasons]
Print 'Create Procedure [dbo].[hris_delete_leave_reasons]'
GO

CREATE PROCEDURE dbo.hris_delete_leave_reasons
	@remote_leave_id int,
	@location_code char(3)
AS
BEGIN
	delete leavereason
     where remote_leave_id = @remote_leave_id
       and location_code = @location_code
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
-- Create Procedure [dbo].[hris_dd_get_time_status]
Print 'Create Procedure [dbo].[hris_dd_get_time_status]'
GO

CREATE PROCEDURE [dbo].[hris_dd_get_time_status]
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
-- Create Procedure [dbo].[hris_dd_get_overtime_reasons]
Print 'Create Procedure [dbo].[hris_dd_get_overtime_reasons]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_overtime_reasons]
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_leave_reasons]
Print 'Create Procedure [dbo].[hris_get_leave_reasons]'
GO

CREATE PROCEDURE dbo.hris_get_leave_reasons
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
-- Create Procedure [dbo].[hris_get_leave_reasons_with_parent]
Print 'Create Procedure [dbo].[hris_get_leave_reasons_with_parent]'
GO

CREATE PROCEDURE dbo.hris_get_leave_reasons_with_parent
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
-- Create Procedure [dbo].[dtr_get_by_date_no_joins]
Print 'Create Procedure [dbo].[dtr_get_by_date_no_joins]'
GO

CREATE PROCEDURE [dbo].[dtr_get_by_date_no_joins] 
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
-- Create Procedure [dbo].[dtr_get_by_date]
Print 'Create Procedure [dbo].[dtr_get_by_date]'
GO


CREATE PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
	@override_only smallint = 0
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
	
	--set @dtr_date_from = '2015-07-21'
	--set @dtr_date_until = '2015-07-22'
	
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
	                   
	-- get inclusive dates
	;with inclusive_dates
	as
	(
		select @dtr_date_from as dt
		union all
		select dateadd(day, 1, dt)
		  from inclusive_dates
		 where dt < @dtr_date_until
	)
	
	-- select result
	-- join date with the dtr table
	select i.dt, 
	       id_num,
		   employee_name,
		   dtr_date,
		   isnull(convert(varchar(5),time_in_am),'-') time_in_am,
		   isnull(convert(varchar(5),time_out_am),'-') time_out_am,
		   am_status,
		   isnull(convert(varchar(5),time_in_pm),'-') time_in_pm,
		   isnull(convert(varchar(5),time_out_pm),'-') time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		   location_code
	  from inclusive_dates i
 left join (
				select *
				  from @dtr
				 where (ISNULL(@id_num,'') = '' or id_num = @id_num)
		   ) d
        on d.dtr_date = i.dt
     where ((ISNULL(@override_only,0) = 0)
			or
			(exists (select 1
					   from dtroverride dto (nolock)
					  where	dto.dtr_date = i.dt
					    and dto.id_num = d.id_num
			))
			)
     
END

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

