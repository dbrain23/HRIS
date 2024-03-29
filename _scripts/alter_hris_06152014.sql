/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    procedures:
        [dbo].[hris_get_leaves], [dbo].[hris_get_paf_list], [dbo].[sec_delete_levels], [dbo].[sec_get_levels_by_role]

    tables:
        [dbo].[sysrolelevel], [dbo].[t_leavetype]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	15/06/2014 10:02:03 PM

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

-- Drop Default Constraint DF_t_leavetype_max_days from [dbo].[t_leavetype]
Print 'Drop Default Constraint DF_t_leavetype_max_days from [dbo].[t_leavetype]'
GO
ALTER TABLE [dbo].[t_leavetype] DROP CONSTRAINT [DF_t_leavetype_max_days]
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
-- Create Procedure [dbo].[sec_get_levels_by_role]
Print 'Create Procedure [dbo].[sec_get_levels_by_role]'
GO

CREATE PROCEDURE dbo.sec_get_levels_by_role
	@role_code varchar(25)
AS
BEGIN
	select * 
	  from sysrolelevel rl (nolock)
	 where rl.role_code = @role_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sec_delete_levels]
Print 'Create Procedure [dbo].[sec_delete_levels]'
GO

CREATE PROCEDURE dbo.sec_delete_levels
	@role_code varchar(25)
AS
BEGIN
	delete 
	  from sysrolelevel
	 where role_code = @role_code
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter Procedure [dbo].[hris_get_paf_list]
Print 'Alter Procedure [dbo].[hris_get_paf_list]'
GO
ALTER PROCEDURE [dbo].[hris_get_paf_list]
	@employee_id int,
	@user_id int
AS
BEGIN
	select p.paf_id,
		   e.employee_id,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   ps.position_name,
		   pst.posstatus_name,
		   es.empstatus_name,
		   br.branch_name,
		   p.salary,
		   p.effective_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement
	  from paf p (nolock)
	  join employee e (nolock) on e.employee_id = p.employee_id
	  join t_position ps (nolock) on ps.position_code = p.position_code
	  join t_empstatus es (nolock) on es.empstatus_code = p.empstatus_code
	  join t_positionstatus pst (nolock) on pst.posstatus_code = p.posstatus_code
	  join branch br (nolock) on br.branch_code = p.branch_code
	 where (@employee_id = 0 or p.employee_id = @employee_id)
	   and (ps.level_code in ( 
							   select distinct level_code
							     from sysroleprivilege rp (nolock)
							     join sysuserrole ur (nolock) 
								   on ur.role_code = rp.role_code and ur.user_id = @user_id
							     join sysrolelevel rl (nolock)
								   on rl.role_code = rp.role_code
							    where rp.privilege_code = 'PAF_VIEW')
							 ) 
  order by p.paf_id desc
END
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

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

