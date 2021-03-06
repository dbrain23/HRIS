/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_set_branch_code]

    functions:
        [dbo].[dtr_fn_get_branch_code]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	15/05/2014 8:52:58 PM

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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[dtr_fn_get_branch_code]
Print 'Create Function [dbo].[dtr_fn_get_branch_code]'
GO

CREATE FUNCTION [dbo].[dtr_fn_get_branch_code]
(
	@employee_id integer
)
RETURNS char(3)
AS
BEGIN
	declare @branch_code_sysconfig varchar(30),
	        @branch_code_employee char(3) = null,
			@use_employee_branch_code varchar(30),
			@branch_code char(3)
			
	set @use_employee_branch_code = isnull(dbo.fn_get_sysconfig_value('USE_EMPLOYEE_BRANCH_CODE'),0)
    set @branch_code_sysconfig = dbo.fn_get_sysconfig_value('BRANCH_CODE')
    
	if ISNULL(@use_employee_branch_code,0) = 1 
	begin  
	   select top 1 @branch_code_employee = branch_code 
	         from paf p (nolock)
	        where p.employee_id = @employee_id
	          and ISNULL(is_cancelled,0) = 0
	     order by p.effective_date desc
	end

	set @branch_code = isnull(@branch_code_employee, @branch_code_sysconfig) 
	
	return @branch_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_set_branch_code]
Print 'Create Trigger [dbo].[tr_set_branch_code]'
GO

CREATE TRIGGER dbo.tr_set_branch_code 
   ON  dbo.dtr
   AFTER INSERT
AS 
BEGIN
	update dtr
	   set branch_code = dbo.dtr_fn_get_branch_code(employee_id)
	 where dtr_id = (select dtr_id 
		   		       from inserted)
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

