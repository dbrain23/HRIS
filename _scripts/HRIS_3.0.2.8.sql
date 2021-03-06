/* ------------------------------------------------------------

DESCRIPTION: Schema synchronization script for object(s) \r\n
    functions:
        [dbo].[dtr_fn_get_dtr], [dbo].[dtr_fn_get_working_days], [dbo].[paf_fn_active_employees], [dbo].[pr_fn_get_daily_rate], [dbo].[pr_fn_get_declared_salary], [dbo].[pr_fn_get_pagibig_contribution], [dbo].[pr_fn_get_payroll_details], [dbo].[pr_fn_get_phic_contribution], [dbo].[pr_fn_get_sss_contribution], [dbo].[pr_fn_get_withholding_tax], [dbo].[rpt_fn_get_concat_paf_allowances], [dbo].[rpt_fn_get_payroll_deductions]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_by_employee], [dbo].[hris_dd_get_leave_reasons], [dbo].[hris_dd_get_position_types], [dbo].[hris_get_account_types], [dbo].[hris_get_adjustment_types], [dbo].[hris_get_areas], [dbo].[hris_get_empfamily], [dbo].[hris_get_employees], [dbo].[pr_close_payroll], [dbo].[pr_dd_get_adjustment_types], [dbo].[pr_dd_get_deduction_types], [dbo].[pr_dd_payroll_period], [dbo].[pr_declare_dependents], [dbo].[pr_generate_payroll], [dbo].[pr_generate_payroll_code], [dbo].[pr_get_active_allowances], [dbo].[pr_get_dependents], [dbo].[pr_get_payroll], [dbo].[pr_get_payroll_adjustments], [dbo].[pr_get_payroll_allowances], [dbo].[pr_get_payroll_deductions], [dbo].[pr_get_pending_paf], [dbo].[rpt_paf], [dbo].[rpt_paf_signatories], [dbo].[rpt_payslip], [dbo].[rpt_pr_deduction_summary], [dbo].[rpt_pr_variance]

    triggers:
        [dbo].[tr_set_pin]

    tables:
        [dbo].[employee], [dbo].[leave], [dbo].[payroll], [dbo].[payrolladjustment], [dbo].[payrollallowance], [dbo].[payrollcode], [dbo].[payrolldeduction], [dbo].[t_accounttype], [dbo].[t_adjustmenttype], [dbo].[t_deductiontype], [dbo].[t_payrollstatus], [dbo].[t_position], [dbo].[t_positiontype]

     Make BRYAN-ULTRA\SQL2008R2.HRIS_Production Equal BRYAN-ULTRA\SQL2008R2.HRIS_Dev

   AUTHOR:	[Insert author name]

   DATE:	10/04/2016 7:46:52 PM

   LEGAL:	[Insert legal tag]

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
-- Drop All Permissions For The procedure [dbo].[dtr_get_by_employee]
Print 'Drop All Permissions For The procedure [dbo].[dtr_get_by_employee]'
REVOKE ALTER
	ON [dbo].[dtr_get_by_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_get_by_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[dtr_get_by_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[dtr_get_by_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[dtr_get_by_employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[dtr_get_by_employee]
Print 'Drop Procedure [dbo].[dtr_get_by_employee]'
GO
DROP PROCEDURE [dbo].[dtr_get_by_employee]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop All Permissions For The procedure [dbo].[hris_get_empfamily]
Print 'Drop All Permissions For The procedure [dbo].[hris_get_empfamily]'
REVOKE ALTER
	ON [dbo].[hris_get_empfamily]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_empfamily]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_empfamily]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[hris_get_empfamily]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[hris_get_empfamily]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_empfamily]
Print 'Drop Procedure [dbo].[hris_get_empfamily]'
GO
DROP PROCEDURE [dbo].[hris_get_empfamily]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop All Permissions For The function [dbo].[paf_fn_active_employees]
Print 'Drop All Permissions For The function [dbo].[paf_fn_active_employees]'
REVOKE ALTER
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[paf_fn_active_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Function [dbo].[paf_fn_active_employees]
Print 'Drop Function [dbo].[paf_fn_active_employees]'
GO
DROP FUNCTION [dbo].[paf_fn_active_employees]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop All Permissions For The function [dbo].[dtr_fn_get_dtr]
Print 'Drop All Permissions For The function [dbo].[dtr_fn_get_dtr]'
REVOKE ALTER
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[dtr_fn_get_dtr]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Function [dbo].[dtr_fn_get_dtr]
Print 'Drop Function [dbo].[dtr_fn_get_dtr]'
GO
DROP FUNCTION [dbo].[dtr_fn_get_dtr]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE DELETE
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE INSERT
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE UPDATE
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW CHANGE TRACKING
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[leave]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Trigger [dbo].[tr_set_pin]
Print 'Drop Trigger [dbo].[tr_set_pin]'
GO
DROP TRIGGER [dbo].[tr_set_pin]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[hris_dd_get_leave_reasons]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_dd_get_leave_reasons]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_dd_get_leave_reasons]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[hris_dd_get_leave_reasons]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[hris_dd_get_leave_reasons]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop All Permissions For The procedure [dbo].[hris_get_employees]
Print 'Drop All Permissions For The procedure [dbo].[hris_get_employees]'
REVOKE ALTER
	ON [dbo].[hris_get_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[hris_get_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE EXECUTE
	ON [dbo].[hris_get_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[hris_get_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[hris_get_employees]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[hris_get_employees]
Print 'Drop Procedure [dbo].[hris_get_employees]'
GO
DROP PROCEDURE [dbo].[hris_get_employees]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE DELETE
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE INSERT
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE UPDATE
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW CHANGE TRACKING
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[t_position]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE DELETE
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE INSERT
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE UPDATE
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW CHANGE TRACKING
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[employee]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF__employee__is_ext__1CDC41A7 from [dbo].[employee]
Print 'Drop Default Constraint DF__employee__is_ext__1CDC41A7 from [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [DF__employee__is_ext__1CDC41A7]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE ALTER
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE CONTROL
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE DELETE
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE INSERT
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE REFERENCES
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE SELECT
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE TAKE OWNERSHIP
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE UPDATE
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW CHANGE TRACKING
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
REVOKE VIEW DEFINITION
	ON [dbo].[t_deductiontype]
	TO [HRISUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_positiontype]
Print 'Create Table [dbo].[t_positiontype]'
GO
CREATE TABLE [dbo].[t_positiontype] (
		[positiontype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[positiontype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[positiontype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_positiontype to [dbo].[t_positiontype]
Print 'Add Primary Key PK_t_positiontype to [dbo].[t_positiontype]'
GO
ALTER TABLE [dbo].[t_positiontype]
	ADD
	CONSTRAINT [PK_t_positiontype]
	PRIMARY KEY
	CLUSTERED
	([positiontype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_positiontype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
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
-- Create Table [dbo].[t_adjustmenttype]
Print 'Create Table [dbo].[t_adjustmenttype]'
GO
CREATE TABLE [dbo].[t_adjustmenttype] (
		[adjustmenttype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustmenttype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustmenttype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[is_deduction]                   [smallint] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_adjustmenttype to [dbo].[t_adjustmenttype]
Print 'Add Primary Key PK_t_adjustmenttype to [dbo].[t_adjustmenttype]'
GO
ALTER TABLE [dbo].[t_adjustmenttype]
	ADD
	CONSTRAINT [PK_t_adjustmenttype]
	PRIMARY KEY
	CLUSTERED
	([adjustmenttype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_t_adjustmenttype_is_deduction to [dbo].[t_adjustmenttype]
Print 'Add Default Constraint DF_t_adjustmenttype_is_deduction to [dbo].[t_adjustmenttype]'
GO
ALTER TABLE [dbo].[t_adjustmenttype]
	ADD
	CONSTRAINT [DF_t_adjustmenttype_is_deduction]
	DEFAULT ((0)) FOR [is_deduction]
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
-- Create Table [dbo].[t_accounttype]
Print 'Create Table [dbo].[t_accounttype]'
GO
CREATE TABLE [dbo].[t_accounttype] (
		[accounttype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[accounttype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[accounttype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_accounttype to [dbo].[t_accounttype]
Print 'Add Primary Key PK_t_accounttype to [dbo].[t_accounttype]'
GO
ALTER TABLE [dbo].[t_accounttype]
	ADD
	CONSTRAINT [PK_t_accounttype]
	PRIMARY KEY
	CLUSTERED
	([accounttype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_accounttype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_declared_salary]
Print 'Create Function [dbo].[pr_fn_get_declared_salary]'
GO

CREATE FUNCTION [dbo].[pr_fn_get_declared_salary]
(
	@positiontype_code char(3)
)
RETURNS decimal(8,2)
AS
BEGIN
	
	declare @salary decimal(8,2)
	
	select @salary =
		case when @positiontype_code in ('COO') then 15000.00
		     when @positiontype_code in ('AM') then 13000.00
			 when @positiontype_code in ('DH') then 12000.00
			 when @positiontype_code in ('BM') then 11000.00
			 else 8500.00 -- staff
	end

	-- Return the result of the function
	return @salary

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_sss_contribution]
Print 'Create Function [dbo].[pr_fn_get_sss_contribution]'
GO

CREATE FUNCTION [dbo].[pr_fn_get_sss_contribution]
(
	@salary decimal(10,2)
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @sss_contribution decimal(10,2)

	select @sss_contribution =
			case when @salary between 1000 and 1249.99 then 36.30 -- 120.00
			     when @salary between 1250 and 1749.99 then 54.50 -- 175.00
				 when @salary between 1750 and 2249.99 then 72.70 -- 230.00
				 when @salary between 2250 and 2749.99 then 90.80 -- 285.00
				 when @salary between 2750 and 3249.99 then 109.00 -- 340.00
				 when @salary between 3250 and 3749.99 then 127.20 -- 395.00
				 when @salary between 3750 and 4249.99 then 145.30 -- 450.00
				 when @salary between 4250 and 4749.99 then 163.50 -- 505.00
				 when @salary between 4750 and 5249.99 then 181.70 -- 560.00
				 when @salary between 5250 and 5749.99 then 199.80 -- 615.00
				 when @salary between 5750 and 6249.99 then 218.00 -- 670.00
				 when @salary between 6250 and 6749.99 then 236.20 -- 725.00
				 when @salary between 6750 and 7249.99 then 254.30 -- 780.00
				 when @salary between 7250 and 7749.99 then 272.50 -- 835.00
				 when @salary between 7750 and 8249.99 then 290.70 -- 890.00
				 when @salary between 8250 and 8749.99 then 308.80 -- 945.00
				 when @salary between 8750 and 9249.99 then 327.00 -- 1000.00
				 when @salary between 9250 and 9749.99 then 345.20 -- 1055.00
				 when @salary between 9750 and 10249.99 then 363.30 -- 1110.00
				 when @salary between 10250 and 10749.99 then 381.50 -- 1165.00
				 when @salary between 10750 and 11249.99 then 399.70 -- 1220.00
				 when @salary between 11250 and 11749.99 then 417.80 -- 1275.00
				 when @salary between 11750 and 12249.99 then 436.00 -- 1330.00
				 when @salary between 12250 and 12749.99 then 454.20 -- 1385.00
				 when @salary between 12750 and 13249.99 then 472.30 -- 1440.00
				 when @salary between 13250 and 13749.99 then 490.50 -- 1495.00
				 when @salary between 13750 and 14249.99 then 508.70 -- 1550.00
				 when @salary between 14250 and 14749.99 then 526.80 -- 1605.00
				 when @salary between 14750 and 15249.99 then 545.00 -- 1680.00
				 when @salary between 15250 and 15749.99 then 563.20 -- 1735.00
				 when @salary >= 15750 then 581.30 -- 1790
				 else 0
			end

	-- Return the result of the function
	return @sss_contribution / 2.00

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_phic_contribution]
Print 'Create Function [dbo].[pr_fn_get_phic_contribution]'
GO

CREATE FUNCTION [dbo].[pr_fn_get_phic_contribution]
(
	@position_code char(3)
)
RETURNS decimal(10,2)
AS
BEGIN
	-- Declare the return variable here
	declare @phic decimal(10,2)

	if @position_code in ('BM','DH')
		set @phic = 137.50
	else if @position_code in ('AM','COO')
		set @phic = 150.00
	else
	    set @phic = 125.00

	-- Return the result of the function
	return @phic / 2.00

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_pagibig_contribution]
Print 'Create Function [dbo].[pr_fn_get_pagibig_contribution]'
GO

CREATE FUNCTION [dbo].[pr_fn_get_pagibig_contribution]
(
	@employee_status char(3)
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @pagibig decimal(10,2)

	if @employee_status = 'PRO'
	  set @pagibig = 200.00 
    else
	  set @pagibig = 300.00
	
	-- Return the result of the function
	RETURN @pagibig / 2.00

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_withholding_tax]
Print 'Create Function [dbo].[pr_fn_get_withholding_tax]'
GO

CREATE FUNCTION [dbo].[pr_fn_get_withholding_tax]
(
	@empstatus_code char(3),
	@positiontype_code char(3),
	@declared_salary decimal(10,2), 
	@dependents int
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @withholding_tax decimal(10,2) = 0
	declare @net decimal(10,2)

	-- exemptions
	declare @exemption decimal(10,2) = 50000
	declare @dependents_exemption decimal(10,2) = 25000

	-- sss/phic/hdmf
	declare @deductions decimal(10,2)


	if @empstatus_code = 'REG'
	begin
		-- set deductions according to position type
		-- these values are based from computations retrieved from payroll person
		-- refer to spreadsheet
		select @deductions =
			case when @positiontype_code in ('COO') then 11670.00 
				 when @positiontype_code in ('AM') then 10767.60
				 when @positiontype_code in ('DH') then 10332.00
				 when @positiontype_code in ('BM') then 9896.40
				 else 7605.60 -- staff
		end
		
		-- get net salary
		set @net = (@declared_salary * 12) - @deductions - (@exemption + (isnull(@dependents,0) * @dependents_exemption))
	
		-- tax rate
		select @withholding_tax =
				case when @net between 0.00 and 10000 then @net * 0.05
					 when @net between 10001 and 30000 then ((@net - 10000) * 0.10) + 500
					 when @net between 30001 and 70000 then ((@net - 30000) * 0.15) + 2500
					 when @net between 70001 and 140000 then ((@net - 70000) * 0.20) + 8500
					 when @net between 140001 and 250000 then ((@net - 140000) * 0.25) + 22500
					 when @net between 250001 and 500000 then ((@net - 250000) * 0.30) + 50000
					 else ((@net - 500000) * 0.32) + 125000
				end
	end

	if @withholding_tax < 0.00
		set @withholding_tax = 0.00

	return @withholding_tax / 23.00
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[pr_fn_get_daily_rate]
Print 'Create Function [dbo].[pr_fn_get_daily_rate]'
GO

CREATE FUNCTION dbo.pr_fn_get_daily_rate
(
	@salary decimal(10,2)
)
RETURNS decimal(10,2)
AS
BEGIN

	return @salary * 12.00 / 365.00

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[dtr_fn_get_working_days]
Print 'Create Function [dbo].[dtr_fn_get_working_days]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[dtr_fn_get_working_days]
(
	@dtr_date_from datetime,
	@dtr_date_until datetime
)
RETURNS @days TABLE
(
	working_days int,
	saturdays int,
	sundays int
)
AS
BEGIN
	-- this function returns the working days, Saturdays and Sundays
	-- alternatively, DATEDIFF can be used to get the number of days
	-- however, instead of using another function (in this case DATEDIFF), this function has been utilised

	declare @working_days int = 0,
		    @saturdays int = 0,
			@sundays int = 0,
	        @d datetime

	set @d = @dtr_date_from
	
	while @d <= @dtr_date_until
	begin
	  if datename(dw, @d) = 'Sunday'
		set @sundays = @sundays + 1

	  if datename(dw, @d) = 'Saturday'
	    set @saturdays = @saturdays + 1 

	  set @d = dateadd(dd, 1, @d)

	  set @working_days = @working_days + 1
	end 

	insert @days
	select @working_days,
	       @saturdays,
		   @sundays

	return
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column accounttype_code to [dbo].[t_deductiontype]
Print 'Add Column accounttype_code to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD [accounttype_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column display_name to [dbo].[t_deductiontype]
Print 'Add Column display_name to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD [display_name] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column sort_order to [dbo].[t_deductiontype]
Print 'Add Column sort_order to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD [sort_order] [smallint] NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column has_bcf to [dbo].[t_deductiontype]
Print 'Add Column has_bcf to [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	ADD [has_bcf] [smallint] NOT NULL
	CONSTRAINT [DF_t_deductiontype_has_bcf] DEFAULT ((0))
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column declare_dependents to [dbo].[employee]
Print 'Add Column declare_dependents to [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	ADD [declare_dependents] [smallint] NULL
	CONSTRAINT [DF_employee_declare_dependents] DEFAULT ((0)) WITH VALUES
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_employee_is_external to [dbo].[employee]
Print 'Add Default Constraint DF_employee_is_external to [dbo].[employee]'
GO
ALTER TABLE [dbo].[employee]
	ADD
	CONSTRAINT [DF_employee_is_external]
	DEFAULT ((0)) FOR [is_external]
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
-- Add Column positiontype_code to [dbo].[t_position]
Print 'Add Column positiontype_code to [dbo].[t_position]'
GO
ALTER TABLE [dbo].[t_position]
	ADD [positiontype_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	CONSTRAINT [DF_t_position_positiontype_code] DEFAULT ('STF')
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_dd_get_adjustment_types]
Print 'Create Procedure [dbo].[pr_dd_get_adjustment_types]'
GO

CREATE PROCEDURE dbo.pr_dd_get_adjustment_types
AS
BEGIN
	select a.adjustmenttype_code,
	       a.adjustmenttype_name,
		   a.is_deduction
	  from t_adjustmenttype a (nolock)
  order by a.adjustmenttype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_dd_get_position_types]
Print 'Create Procedure [dbo].[hris_dd_get_position_types]'
GO

CREATE PROCEDURE dbo.hris_dd_get_position_types
AS
BEGIN
	select positiontype_code,
	       positiontype_name
	  from t_positiontype (nolock)
  order by positiontype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_areas]
Print 'Create Procedure [dbo].[hris_get_areas]'
GO

CREATE PROCEDURE dbo.hris_get_areas
AS
BEGIN
	select *
	  from area (nolock)
  order by area_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_adjustment_types]
Print 'Create Procedure [dbo].[hris_get_adjustment_types]'
GO

CREATE PROCEDURE dbo.hris_get_adjustment_types	
AS
BEGIN
	select *
	  from t_adjustmenttype (nolock)
  order by adjustmenttype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_account_types]
Print 'Create Procedure [dbo].[hris_get_account_types]'
GO

CREATE PROCEDURE dbo.hris_get_account_types
AS
BEGIN
	select *
	  from t_accounttype (nolock)
  order by accounttype_name
END
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
		[payroll_code]           [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id_num]                 [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[number_of_days]         [decimal](8, 2) NOT NULL,
		[undertime]              [decimal](8, 2) NULL,
		[overtime]               [decimal](8, 2) NULL,
		[leaves_with_pay]        [decimal](8, 2) NULL,
		[leaves_without_pay]     [decimal](8, 2) NULL,
		[skeletal]               [decimal](8, 2) NULL,
		[dependents]             [smallint] NULL,
		[salary]                 [decimal](8, 2) NOT NULL,
		[declared_salary]        [decimal](8, 2) NOT NULL,
		[remarks]                [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payroll_1 to [dbo].[payroll]
Print 'Add Primary Key PK_payroll_1 to [dbo].[payroll]'
GO
ALTER TABLE [dbo].[payroll]
	ADD
	CONSTRAINT [PK_payroll_1]
	PRIMARY KEY
	CLUSTERED
	([payroll_code], [id_num])
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
-- Create Function [dbo].[pr_fn_get_payroll_details]
Print 'Create Function [dbo].[pr_fn_get_payroll_details]'
GO

CREATE FUNCTION dbo.pr_fn_get_payroll_details	
(	
	@payroll_code char(15) 
)
RETURNS @dates TABLE 
(
	payroll_from date,
	payroll_until date,
	payrollstatus_code char(3)
)
AS
BEGIN
	-- return
	insert @dates
	select payroll_from,
	       payroll_until,
		   payrollstatus_code
	  from payrollcode pr (nolock)
	 where pr.payroll_code = @payroll_code
	
	return
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_generate_payroll_code]
Print 'Create Procedure [dbo].[pr_generate_payroll_code]'
GO
CREATE PROCEDURE [dbo].[pr_generate_payroll_code]
AS
BEGIN
	declare @previous_from datetime,
	        @previous_until datetime,
	        @previous_payroll_code varchar(15),
	        @next_from datetime,
	        @next_until datetime,
	        @new_payroll_code varchar(15),
	        @current_day int,
	        @current_month int,
	        @current_year int,
	        @code_count int,
			@current_date datetime
	
	declare @FIFTH int = 5,
	        @TWENTIETH int = 20
	        
	--check date
	--if current date is greater than payroll period
	--create new payroll code
	select @code_count = count(payroll_code)
	  from payrollcode

	-- get current date
	set @current_date = getdate()

	select @current_day = DATEPART(dd,@current_date),
	       @current_month = DATEPART(mm,@current_date),
	       @current_year = DATEPART(yy,@current_date)
	
	-- get previous dates
	if @code_count > 0
	begin
		select top 1 @previous_from = payroll_from
			   ,@previous_until = payroll_until
			   ,@previous_payroll_code = payroll_code
		  from payrollcode
	  order by payroll_from desc
	end

	if (@current_date > dateadd(dd,1,@previous_until))
		or (@code_count = 0)
	begin
	    -- current day falls between 6 - 20 of the current month 
		if @current_day between (@FIFTH + 1) and @TWENTIETH
		begin
			if @current_month < 10 
			begin
				-- month is between January and September
				set @next_from = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month as varchar) + '-' + CAST((@FIFTH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month  as varchar) + '-' + CAST(@TWENTIETH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
			else
			begin
				-- month is between October and December
				set @next_from = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month as varchar) + '-' + CAST((@FIFTH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month  as varchar) + '-' + CAST(@TWENTIETH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
		end
		else -- current day falls is greater than 21 
		begin
			if @code_count = 0
			begin
				set @current_month = @current_month - 1
			end

			if @current_month < 10 
			begin
				-- month is between January and September
				set @next_from = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month as varchar) + '-' + CAST((@TWENTIETH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-0' + CAST((@current_month + 1)  as varchar) + '-' + CAST(@FIFTH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
			else
			begin
				-- month is between October and December
				set @next_from = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month as varchar) + '-' + CAST((@TWENTIETH + 1) as varchar)) as datetime) 
				
				if @current_month < 12 
					set @next_until = CAST((CAST(@current_year as varchar) + '-' + CAST((@current_month + 1)  as varchar) + '-' + CAST(@FIFTH as varchar)) as datetime) 
				else
					set @next_until = CAST((CAST((@current_year + 1) as varchar) + '-01-' + CAST(@FIFTH as varchar)) as datetime) -- set to January of the following year 
					
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
		end
		
		-- finalise (close) previous payroll code
		--update payrollcode 
		--   set payrollstatus_code = 'FIN'
		-- where payroll_code = @previous_payroll_code
		
		-- insert new code
		insert 
		  into payrollcode 
		values (
			   ltrim(@new_payroll_code)
			   ,@next_from
			   ,@next_until
			   ,'INP'
			   )
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
-- Alter Procedure [dbo].[hris_dd_get_leave_reasons]
Print 'Alter Procedure [dbo].[hris_dd_get_leave_reasons]'
GO

ALTER PROCEDURE [dbo].[hris_dd_get_leave_reasons]
AS
BEGIN
	select lr.leavereason_code,
	       lr.leavereason_name,
	       (lr.leavereason_code + ' - ' + lr.leavereason_name) leavereason_name_long,
		   lr.leavetype_code
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
-- Create Procedure [dbo].[pr_dd_get_deduction_types]
Print 'Create Procedure [dbo].[pr_dd_get_deduction_types]'
GO

CREATE PROCEDURE dbo.pr_dd_get_deduction_types
AS
BEGIN
	select dt.deductiontype_code,
	       dt.deductiontype_name
	  from t_deductiontype dt (nolock)
  order by dt.deductiontype_name
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_employees]
Print 'Create Procedure [dbo].[hris_get_employees]'
GO
CREATE PROCEDURE [dbo].[hris_get_employees]
	@lastname varchar(50),
	@firstname varchar(50),
	@option int
AS
BEGIN

	if @lastname = '' 
	  set @lastname = null
	 
	if @firstname = ''
	  set @firstname = null
	  
	-- partial
	if @option = 1
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (e.employee_lastname like '%' + @lastname + '%'))
		   and (@firstname is null or (e.employee_firstname like '%' + @firstname + '%'))
		   and isnull(e.is_external,0) = 0
	  order by e.employee_lastname,
			   e.employee_firstname
	end 
	else if @option = 2
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (lower(e.employee_lastname) = lower(@lastname)))
		   and (@firstname is null or (lower(e.employee_firstname) = (@firstname)))
		   and isnull(e.is_external,0) = 0
	  order by e.employee_lastname,
			   e.employee_firstname
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
-- Create Trigger [dbo].[tr_set_pin]
Print 'Create Trigger [dbo].[tr_set_pin]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_set_pin]
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
-- Create Table [dbo].[payrolldeduction]
Print 'Create Table [dbo].[payrolldeduction]'
GO
CREATE TABLE [dbo].[payrolldeduction] (
		[payroll_code]              [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id_num]                    [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[deductiontype_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[deduction_amount]          [decimal](10, 2) NOT NULL,
		[bcf_amount]                [decimal](10, 2) NULL,
		[bcf_sub_location_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[remarks]                   [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_by]               [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]             [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payrolldeduction to [dbo].[payrolldeduction]
Print 'Add Primary Key PK_payrolldeduction to [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	ADD
	CONSTRAINT [PK_payrolldeduction]
	PRIMARY KEY
	CLUSTERED
	([payroll_code], [id_num], [deductiontype_code])
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
-- Create Table [dbo].[payrollallowance]
Print 'Create Table [dbo].[payrollallowance]'
GO
CREATE TABLE [dbo].[payrollallowance] (
		[payroll_code]           [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id_num]                 [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[allowancetype_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[allowance_amount]       [decimal](10, 2) NOT NULL,
		[remarks]                [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_by]            [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modified_date]          [datetime] NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payrollallowance to [dbo].[payrollallowance]
Print 'Add Primary Key PK_payrollallowance to [dbo].[payrollallowance]'
GO
ALTER TABLE [dbo].[payrollallowance]
	ADD
	CONSTRAINT [PK_payrollallowance]
	PRIMARY KEY
	CLUSTERED
	([payroll_code], [id_num], [allowancetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[payrollallowance] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[payrolladjustment]
Print 'Create Table [dbo].[payrolladjustment]'
GO
CREATE TABLE [dbo].[payrolladjustment] (
		[payroll_code]            [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id_num]                  [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustmenttype_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[adjustment_amount]       [decimal](10, 2) NOT NULL,
		[remarks]                 [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created_by]              [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created_date]            [datetime] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_payrolladjustment to [dbo].[payrolladjustment]
Print 'Add Primary Key PK_payrolladjustment to [dbo].[payrolladjustment]'
GO
ALTER TABLE [dbo].[payrolladjustment]
	ADD
	CONSTRAINT [PK_payrolladjustment]
	PRIMARY KEY
	CLUSTERED
	([payroll_code], [id_num], [adjustmenttype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[payrolladjustment] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[dtr_fn_get_dtr]
Print 'Create Function [dbo].[dtr_fn_get_dtr]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[dtr_fn_get_dtr]
(
    -- Add the parameters for the function here
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12) = null,
	@include_override smallint = 1
)
RETURNS @dtr TABLE 
(
	id_num varchar(12),
	dtr_date datetime,
	time_in_am time,
	time_out_am time,
	time_in_pm time,
	time_out_pm time,
	total_hours_am decimal(4,2),
	total_hours_pm decimal(4,2),
	location_code char(3)
)
AS
BEGIN
	declare @override table
	(
		dtr_date datetime,
		id_num varchar(12),
		time_in time,
		time_out time,
		am_pm char(1),
		location_code char(3)
	)
	
	-- get override
	if @include_override = 1
	begin
		insert @override
		select dtr_date,
			   id_num,
			   time_in,
			   time_out,
			   am_pm,
			   location_code
		  from dtroverride (nolock)
		 where dtr_date between @dtr_date_from and @dtr_date_until
		   and isnull(is_cancelled,0) = 0
	end

	insert @dtr
	select d_am.id_num,
		   d_am.dtr_date,
		   coalesce(ov_am.time_in,d_am.time_in) as time_in_am,
		   coalesce(ov_am.time_out,d_am.time_out) as time_out_am,
		   coalesce(ov_pm.time_in,d_pm.time_in) as time_in_pm,
		   coalesce(ov_pm.time_out,d_pm.time_out) as time_out_pm,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_am.time_in,d_am.time_in),coalesce(ov_am.time_out,d_am.time_out), @dtr_date_until) total_hours_am,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_pm.time_in,d_pm.time_in),coalesce(ov_pm.time_out,d_pm.time_out), @dtr_date_until) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
 left join @override ov_am
        on ov_am.id_num = d_am.id_num
	   and ov_am.dtr_date = d_am.dtr_date
	   and ov_am.am_pm = 'A'
 left join @override ov_pm
        on ov_pm.id_num = d_am.id_num
	   and ov_pm.dtr_date = d_am.dtr_date
	   and ov_pm.am_pm = 'P'
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
	   and ((isnull(@id_num,'') = '') or (d_am.id_num = @id_num))
  
	-- afternoon log
	-- without morning log
	insert @dtr
	select d_pm_only.id_num,
	       d_pm_only.dtr_date,
		   ov_am.time_in as time_in_am,
		   ov_am.time_out as time_out_am,
		   coalesce(ov_pm.time_in,d_pm_only.time_in) as time_in_pm,
		   coalesce(ov_pm.time_out,d_pm_only.time_out) as time_out_pm,
		   0 total_hours_am,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_pm.time_in,d_pm_only.time_in),coalesce(ov_pm.time_out,d_pm_only.time_out), @dtr_date_until) d_pm_only,
		   d_pm_only.location_code
	  from dtr d_pm_only (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_pm_only.id_num
 left join @override ov_am
        on ov_am.id_num = d_pm_only.id_num
	   and ov_am.dtr_date = d_pm_only.dtr_date
	   and ov_am.am_pm = 'A'
 left join @override ov_pm
        on ov_pm.id_num = d_pm_only.id_num
	   and ov_pm.dtr_date = d_pm_only.dtr_date
	   and ov_pm.am_pm = 'P'
	 where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
   	   and d_pm_only.time_in > '12:00:00'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = e.id_num
						  and d.dtr_date = d_pm_only.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (d_pm_only.id_num = @id_num))

	-- overrides with no logs at all
	insert @dtr
	select ov_am.id_num,
	       ov_am.dtr_date,
		   ov_am.time_in,
		   ov_am.time_out,
		   ov_pm.time_in,
		   ov_pm.time_out,
		   dbo.dtr_fn_get_total_hours(ov_am.time_in,ov_am.time_out, @dtr_date_until) total_hours_am,
		   dbo.dtr_fn_get_total_hours(ov_pm.time_in,ov_pm.time_out, @dtr_date_until) total_hours_pm,
		   ov_am.location_code
	  from @override ov_am
 left join @override ov_pm
        on ov_pm.dtr_date = ov_am.dtr_date
	   and ov_pm.id_num = ov_am.id_num
	   and ov_pm.am_pm = 'P'
     where ov_am.am_pm = 'A'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = ov_am.id_num
						  and d.dtr_date = ov_am.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (ov_am.id_num = @id_num))

	-- afternoon overrides with no morning overrides or logs
	insert @dtr
	select ov_pm.id_num,
	       ov_pm.dtr_date,
		   null,
		   null,
		   ov_pm.time_in,
		   ov_pm.time_out,
		   0 total_hours_am,
		   dbo.dtr_fn_get_total_hours(ov_pm.time_in,ov_pm.time_out, @dtr_date_until) total_hours_pm,
		   ov_pm.location_code
	  from @override ov_pm
	 where ov_pm.am_pm = 'P'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = ov_pm.id_num
						  and d.dtr_date = ov_pm.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (ov_pm.id_num = @id_num))

	return 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[paf_fn_active_employees]
Print 'Create Function [dbo].[paf_fn_active_employees]'
GO

CREATE FUNCTION [dbo].[paf_fn_active_employees]
(
	-- Add the parameters for the function here
	@dtr_date_from datetime,
	@dtr_date_until datetime
)
RETURNS @employee TABLE 
(
	id_num varchar(12) primary key,
	employee_name varchar(250),
	employee_name_full varchar(250),
	location_code char(3),
	salary decimal(10,2),
	frequency_code char(3),
	paf_id int,
	department_code char(3),
	position_code char(3),
	empstatus_code char(3),
	declare_dependents smallint,
	positiontype_code char(3)
)
AS
BEGIN
	insert @employee
	select e.id_num,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   (e.employee_firstname + isnull(' ' + substring(e.employee_middlename,1,1) + '. ',' ') + e.employee_lastname) employee_name_full,
		   location_code,
		   salary,
		   frequency_code,
		   paf_id,
		   department_code,
		   p.position_code,
		   empstatus_code,
		   declare_dependents,
		   ps.positiontype_code
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
     where (
		   ((p.effective_until is null) and (p.effective_date between @dtr_date_from and @dtr_date_until))
		or ((p.effective_until is null) and (p.effective_date <= @dtr_date_from))
	    or ((p.effective_until is not null) and (@dtr_date_until <= p.effective_until) and (@dtr_date_from >= p.effective_date))
		or ((p.effective_until is not null) and (@dtr_date_until <= p.effective_until) and (p.effective_date between @dtr_date_from and @dtr_date_until))
		   )
	   and isnull(p.is_cancelled,0) = 0 
	   and p.pafstatus_code = 'APP'

	return
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_empfamily]
Print 'Create Procedure [dbo].[hris_get_empfamily]'
GO
CREATE PROCEDURE [dbo].[hris_get_empfamily]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empfamily ef (nolock)
	 where ef.id_num = @id_num
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_pending_paf]
Print 'Create Procedure [dbo].[pr_get_pending_paf]'
GO

CREATE PROCEDURE dbo.pr_get_pending_paf
	@payroll_code char(15)
AS
BEGIN
	declare @payroll_from datetime,
	        @payroll_until datetime

	select @payroll_from = payroll_from,
	       @payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@payroll_code)

	-- get pending PAF records
	select 1 
	  from paf p (nolock)
	 where p.effective_date between @payroll_from and @payroll_until
	   and isnull(p.is_cancelled,0) = 0
	   and p.pafstatus_code = 'PND'

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_dependents]
Print 'Create Procedure [dbo].[pr_get_dependents]'
GO
CREATE PROCEDURE dbo.pr_get_dependents
AS
BEGIN
		-- get number of dependents
		select count(id_num) dependents,
			   id_num
		  into #dependents
		  from empfamily ef (nolock)
		 where isnull(ef.is_dependent,0) = 1
		   and isnull(ef.is_deceased,0) = 0
	  group by ef.id_num

		-- return
		select e.id_num,
		       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
			   d.dependents,
			   e.declare_dependents
		  from employee e
		  join #dependents d
		    on d.id_num = e.id_num
	  order by employee_name	 

		drop table #dependents
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_dd_payroll_period]
Print 'Create Procedure [dbo].[pr_dd_payroll_period]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_dd_payroll_period]
AS
BEGIN
    exec dbo.pr_generate_payroll_code
    
	select payroll_code,
	       (convert(varchar(10),pc.payroll_from,101) + ' - ' + convert(varchar(10),pc.payroll_until,101)) payroll_period
	  from payrollcode pc (nolock)
  order by pc.payroll_until desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[rpt_fn_get_payroll_deductions]
Print 'Create Function [dbo].[rpt_fn_get_payroll_deductions]'
GO

CREATE FUNCTION [dbo].[rpt_fn_get_payroll_deductions]
(
	@id_num varchar(12),
	@payroll_code char(15),
	@value_to_retrieve char(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @deduction_str varchar(250)
	declare @i int
	declare @cnt int
	declare @deduction_name varchar(100)
    declare @amount varchar(100)
    declare @empty char(25)
	declare @deduction table
	(
		pk integer primary key identity(1,1),
		deductiontype_name varchar(100),
		deduction_amount varchar(100)
	)
	
	insert into @deduction 
	select coalesce(dt.display_name,dt.deductiontype_name),
	       (
				case when pd.deduction_amount > 0 then convert(varchar,convert(money,isnull(pd.deduction_amount,0.00)),1) else '-' end

		   ) allowance_amount
	  from t_deductiontype dt (nolock)
 left join (
				select d.deductiontype_code,
				       d.deduction_amount
				  from payrolldeduction d (nolock)
				 where d.id_num = @id_num
				   and d.payroll_code = @payroll_code
           ) pd 
	    on pd.deductiontype_code = dt.deductiontype_code
  order by dt.sort_order, dt.display_name, dt.deductiontype_name
			
			
	select @cnt = count(pk) 
	  from @deduction
	
	set @i = 1
	set @deduction_str = ''
	set @empty = '               ';

	declare @start integer
	
	-- concatenate
	while @i <= @cnt
	begin
		select @deduction_name = deductiontype_name,
			   @amount = deduction_amount
		  from @deduction
		 where pk = @i
		
		if @i > 1 set @deduction_str = @deduction_str + char(13)
		
		if @value_to_retrieve = 'TYPE'
			set @deduction_str = @deduction_str + substring(@deduction_name + @empty,1,18)
		else if @value_to_retrieve = 'AMOUNT'
			set @deduction_str = @deduction_str + rtrim(@amount)
		
		set @i = @i + 1
	end 
	
	return @deduction_str

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Function [dbo].[rpt_fn_get_concat_paf_allowances]
Print 'Create Function [dbo].[rpt_fn_get_concat_paf_allowances]'
GO

CREATE FUNCTION [dbo].[rpt_fn_get_concat_paf_allowances]
(
	@paf_id int
	,@value_to_retrieve char(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @allowances_str varchar(250)
	declare @i int
	declare @cnt int
	declare @allowance_name varchar(100)
    declare @amount varchar(100)
    declare @empty char(25)
	declare @allowance table
	(
		pk integer primary key identity(1,1)
		,allowancetype_name varchar(100)
		,allowance_amount varchar(100)
	)
	
	insert into @allowance 
	select at.allowancetype_name,
		   convert(varchar,convert(money,pa.allowance_amount),1) allowance_amount
	  from pafallowance pa (nolock)
	  join t_allowancetype at (nolock)
	    on at.allowancetype_code = pa.allowancetype_code
	 where pa.paf_id = @paf_id
			
			
	select @cnt = count(pk) 
	  from @allowance
	
	set @i = 1
	set @allowances_str = ''
	-- set @empty = '               ';

	declare @start integer
	
	-- concatenate
	while @i <= @cnt
	begin
		select @allowance_name = allowancetype_name,
			   @amount = allowance_amount
		  from @allowance
		  where pk = @i
		
		if @i > 1 set @allowances_str = @allowances_str + char(13)
		
		if @value_to_retrieve = 'TYPE'
		begin
			-- set @allowances_str = @allowances_str + substring(@allowance_name + @empty,1,18)
			set @start = isnull(charindex(' Allowance',@allowance_name),0)
			if @start > 0
				set @allowances_str = @allowances_str + substring(@allowance_name,1,@start)
			else
				set @allowances_str = @allowances_str + @allowance_name
		end
		else if @value_to_retrieve = 'AMOUNT'
			set @allowances_str = @allowances_str + rtrim(@amount)
		
		set @i = @i + 1
	end 
	
	if @allowances_str = '' 
		set @allowances_str = ' - '

	return @allowances_str

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_by_employee]
Print 'Create Procedure [dbo].[dtr_get_by_employee]'
GO

CREATE PROCEDURE [dbo].[dtr_get_by_employee]
	@id_num varchar(12),
	@dtr_date datetime
AS
BEGIN
	select @id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   convert(varchar(12),@dtr_date,107) formatted_dtr_date,
		   fn.*
	  from employee e (nolock)
 left join dbo.dtr_fn_get_dtr(@dtr_date,@dtr_date,@id_num,0) fn
	    on e.id_num = fn.id_num
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
-- Create Procedure [dbo].[rpt_pr_deduction_summary]
Print 'Create Procedure [dbo].[rpt_pr_deduction_summary]'
GO

CREATE PROCEDURE [dbo].[rpt_pr_deduction_summary]
	@payroll_code char(15)
AS
BEGIN
		declare @deduction_code char(3),
				@deduction_name varchar(25),
				@payroll_from date,
				@payroll_until date

		create table #deduction 
		(
			id_num varchar(12)
		)

		-- get payroll period
		select @payroll_from = payroll_from,
			   @payroll_until = payroll_until
		  from dbo.pr_fn_get_payroll_details(@payroll_code)

		-- employee details
		select *
		  into #employee
		  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

		insert into #deduction
		select id_num
		  from payroll (nolock)
		 where payroll_code = @payroll_code


		-- get all deductions
		select pd.id_num,
		       pd.deductiontype_code,
			   pd.deduction_amount
		  into #employee_deduction
		  from payrolldeduction pd (nolock)
		 where pd.payroll_code = @payroll_code 

		-- get deduction types and add each type as a column to the return table
		declare deductiontype cursor
			for select coalesce(dt.display_name,dt.deductiontype_name),
			           dt.deductiontype_code
		          from t_deductiontype dt (nolock)
			  order by sort_order, display_name, deductiontype_name

		open deductiontype
		fetch next from deductiontype
		into @deduction_name, @deduction_code;

		while @@fetch_status = 0
		begin
		    set @deduction_name = replace(@deduction_name,' ','_')

		    -- add the column
			-- NOTE: added "COL@" preceding the column name for parsing purposes in the UI side
			execute('alter table #deduction	add COL@' + @deduction_name + ' varchar(25) ')

			-- update the column
			execute('update d' +
					'   set COL@' + @deduction_name + ' = isnull(ed.deduction_amount,0.00)
					   from #deduction d
				  left join #employee_deduction ed 
						 on ed.id_num = d.id_num  collate Latin1_General_CI_AS
					  where ed.deductiontype_code = ''' + @deduction_code + '''')

			fetch next from deductiontype
			into @deduction_name, @deduction_code;
		end

		close deductiontype
		deallocate deductiontype

		-- total
		select id_num,
			   sum(deduction_amount) total_deduction
		  into #total
		  from #employee_deduction
	  group by id_num

		-- return
		select e.employee_name,
		       e.location_code,
			   e.department_code,
			   upper(l.location_name) location_name,
			   d.*,
			   (t.total_deduction * 1.00) total_deduction,
			   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period
		  from #deduction d
		  join #employee e
		    on e.id_num = d.id_num collate SQL_Latin1_General_CP1_CI_AS
		  join #total t
			on t.id_num = d.id_num collate SQL_Latin1_General_CP1_CI_AS
		  join location l (nolock)
		    on l.location_code = e.location_code 
	  order by l.location_name, e.employee_name
		
		drop table #deduction
		drop table #employee_deduction
		drop table #total
		drop table #employee

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_active_allowances]
Print 'Create Procedure [dbo].[pr_get_active_allowances]'
GO

CREATE PROCEDURE dbo.pr_get_active_allowances
	@payroll_code char(15),
	@id_num varchar(15)
AS
BEGIN
	-- this routine gets the active allowances of the employee for payroll purposes
	-- not all allowances are included in the payroll but for this routine
	-- all allowances are assumed to be included
	-- otherwise, allowances can be removed from the list from the UI

    declare @dtr_date_from datetime,
	        @dtr_date_until datetime,
			@paf_id integer

	-- get the paf ID based on the payroll code parameter
	-- this is used to get the allowances
	
	select @dtr_date_from = payroll_from,
	       @dtr_date_until = payroll_until
	  from payrollcode pc (nolock)
	 where pc.payroll_code = @payroll_code 

	 select @paf_id = paf_id
	  from paf p (nolock)
     where isnull(p.effective_until,@dtr_date_until) between @dtr_date_from and @dtr_date_until
	   and p.effective_date <= @dtr_date_from
	   and isnull(p.is_cancelled,0) = 0
	   and p.id_num = @id_num

	-- return allowances
	select *
	  from pafallowance pa (nolock)
	 where pa.paf_id = @paf_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[rpt_paf_signatories]
Print 'Create Procedure [dbo].[rpt_paf_signatories]'
GO

CREATE PROCEDURE [dbo].[rpt_paf_signatories]
	@paf_id integer
AS
BEGIN
	declare @location_code char(3),
	        @created_date date,
			@area_code char(3),
			@position_code char(3),
			@level_code char(3)
	
	-- get paf details
	select @location_code = location_code,
	       @created_date = created_date,
		   @position_code = pf.position_code,
		   @level_code = level_code
	  from paf (nolock) pf
	  join t_position (nolock) ps
	    on ps.position_code = pf.position_code
	 where paf_id = @paf_id

	 -- get area code
	 select @area_code = area_code
	   from location l (nolock)
	  where l.location_code = @location_code
	 
	 select *
	   into #signatories
	   from dbo.paf_fn_active_employees(dateadd(ww,-1,@created_date),@created_date)
	  where position_code in ('BM','AM','HRM','COO','NAM')

	-- return
	select (select upper(s.employee_name_full) from #signatories s where position_code = 'HRM') as human_resource,
		   (
				case @level_code when '7' then ''
				else
					(select upper(s.employee_name_full) from #signatories s where position_code = 'BM' and location_code = @location_code)
				end
		   
		   ) as branch_manager,

		   (select upper(s.employee_name_full) from #signatories s where position_code = 'COO') as chief_operating_officer,

		   (	
				case when @level_code in ('8','9','10') then ''
				else
					(select upper(s.employee_name) 
					  from #signatories s 
					 where position_code in ('AM','NAM')
					   and location_code in (select location_code from location l (nolock) where area_code = @area_code))
				end
			
			) as area_manager

    drop table #signatories  
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_payroll_deductions]
Print 'Create Procedure [dbo].[pr_get_payroll_deductions]'
GO

CREATE PROCEDURE [dbo].[pr_get_payroll_deductions]
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select pd.*,
	       dt.has_bcf
	  from payrolldeduction pd (nolock)
	  join t_deductiontype dt (nolock)
	    on dt.deductiontype_code = pd.deductiontype_code
	 where pd.payroll_code = @payroll_code
	   and pd.id_num = @id_num
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_payroll_allowances]
Print 'Create Procedure [dbo].[pr_get_payroll_allowances]'
GO

CREATE PROCEDURE dbo.pr_get_payroll_allowances
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select *
	  from payrollallowance pa (nolock)
	 where pa.payroll_code = @payroll_code
	   and pa.id_num = @id_num
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_payroll_adjustments]
Print 'Create Procedure [dbo].[pr_get_payroll_adjustments]'
GO

CREATE PROCEDURE [dbo].[pr_get_payroll_adjustments]
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select pa.*,
	       a.is_deduction
	  from payrolladjustment pa (nolock)
	  join t_adjustmenttype a (nolock)
	    on a.adjustmenttype_code = pa.adjustmenttype_code
	 where pa.payroll_code = @payroll_code
	   and pa.id_num = @id_num
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_get_payroll]
Print 'Create Procedure [dbo].[pr_get_payroll]'
GO
CREATE PROCEDURE [dbo].[pr_get_payroll]
	@payroll_code char(15),
	@id_num varchar(12) = null
AS
BEGIN
			declare @dtr_date_from datetime,
					@dtr_date_until datetime,
					@working_days int,
					@saturdays int, 
					@sundays int,
					@payroll_status char(3)
			 
			-- get date range
			select @dtr_date_from = payroll_from,
				   @dtr_date_until = payroll_until,
				   @payroll_status = payrollstatus_code
			  from payrollcode pc (nolock)
			 where pc.payroll_code = @payroll_code 

			-- get number of days required and number of saturdays
			select @working_days = working_days,
				   @saturdays = saturdays, 
				   @sundays = sundays
			  from dbo.dtr_fn_get_working_days(@dtr_date_from, @dtr_date_until)

			-- get the employees affected by the date range
			-- use the paf table
			select *
			  into #employee
			  from dbo.paf_fn_active_employees(dateadd(mm,-2,@dtr_date_from),@dtr_date_until) e
			 where (isnull(@id_num,'') = '' or e.id_num = @id_num)
	        
			-- get deductions
			select pd.id_num id_num,
				   sum(pd.deduction_amount) deduction
			  into #deductions
			  from payrolldeduction pd (nolock)
			 where pd.payroll_code = @payroll_code
		  group by pd.id_num

			-- get allowances
			select pa.id_num id_num,
				   sum(pa.allowance_amount) allowance
			  into #allowances
			  from payrollallowance pa (nolock)
			 where pa.payroll_code = @payroll_code
		  group by pa.id_num

			-- get adjustments (plus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_plus
			  into #adjustments_plus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 0
		  group by pad.id_num

			-- get adjustments (minus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_minus
			  into #adjustments_minus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 1   
		  group by pad.id_num

			select pr.payroll_code,
			       pr.id_num,
				   pr.number_of_days,
				   isnull(pr.leaves_with_pay,0.00) leaves_with_pay,
				   isnull(pr.leaves_without_pay,0.00) leaves_without_pay,
				   isnull(pr.undertime,0.00) undertime,
				   isnull(round((case when e.frequency_code = 'MLY'
				   then 
					  -- (salary / 2.00) - ((@days_covered - case pr.number_of_days when 0 then @days_covered else pr.number_of_days end) * (salary * 12 / 365.00))
					  -- (pr.salary) - ((isnull(pr.leaves,0) * (pr.salary * 12 / 365.00)) + (isnull(pr.undertime,0) * (pr.salary * 12 / 365.00)) )
					  pr.salary
				   else
				      pr.salary * pr.number_of_days * 1.00  
				   end
				   ),2),00) as gross,
				   sf.frequency_name,
				   (convert(varchar(10),@dtr_date_from,101) + ' - ' + convert(varchar(10),@dtr_date_until,101)) period,
				   isnull(d.deduction,0.00) deduction,
				   isnull(a.allowance,0.00) allowance,
				   (isnull(adp.adjustment_plus,0.00) - isnull(adm.adjustment_minus,0.00)) adjustment,
				   pr.salary,
				   pr.dependents
			  into #payroll
			  from payroll pr
		      join #employee e
		        on e.id_num = pr.id_num
			  join t_salaryfrequency sf (nolock)
				on sf.frequency_code = e.frequency_code collate SQL_Latin1_General_CP1_CI_AS
		 left join #deductions d
				on d.id_num = pr.id_num
		 left join #allowances a
				on a.id_num = pr.id_num
		 left join #adjustments_plus adp
				on adp.id_num = pr.id_num
		 left join #adjustments_minus adm
				on adm.id_num = pr.id_num
			 where pr.payroll_code = @payroll_code
		  
			-- return
			select p.*,
			       e.employee_name,
				   e.location_code,
				   e.department_code,
				   e.declare_dependents,
				   (
						(p.leaves_without_pay + (p.undertime / 60.00 / 8.00)) * dbo.pr_fn_get_daily_rate(e.salary)
				   ) as undertime_lwop,
				   (
						(case e.frequency_code when 'MLY' then p.salary else p.salary * p.number_of_days end) + allowance + adjustment -
						((p.leaves_without_pay + (p.undertime / 60.00 / 8.00)) * dbo.pr_fn_get_daily_rate(e.salary)) - deduction

						
				   ) as net,
				   ps.payrollstatus_code,
				   ps.payrollstatus_name,
				   @working_days working_days
			  from #payroll p
			  join #employee e 
			    on e.id_num = p.id_num
			  join payrollcode pc (nolock)
			    on pc.payroll_code = p.payroll_code
			  join t_payrollstatus ps (nolock)
				on ps.payrollstatus_code = pc.payrollstatus_code
		  order by e.employee_name

			drop table #employee
			drop table #payroll
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_close_payroll]
Print 'Create Procedure [dbo].[pr_close_payroll]'
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_close_payroll]
	@payroll_code char(15)
AS
BEGIN
	-- This routine sets the selected payroll's status to FIN = Finalised
	-- Finalised means modifying records of the selected period is restricted

	set xact_abort on

	begin tran

		-- close the payroll
		update payrollcode
		   set payrollstatus_code = 'FIN'
		 where payroll_code = @payroll_code

		-- remove the zero deductions
		delete payrolldeduction
		 where payroll_code = @payroll_code
		   and deduction_amount = 0 

	commit tran
END

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[rpt_pr_variance]
Print 'Create Procedure [dbo].[rpt_pr_variance]'
GO

CREATE PROCEDURE [dbo].[rpt_pr_variance]
	@payroll_code char(15),
	@variance_amount decimal(8,2) = 0
AS
BEGIN
	declare @previous_payroll_code char(15),
	        @payroll_from date,
			@payroll_until date,
			@previous_payroll_from date,
			@previous_payroll_until date

	-- get payroll period details
	select @payroll_from = payroll_from,
		   @payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@payroll_code)

	-- employee details
	select *
	  into #employee
	  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

	select top 1 @previous_payroll_code = payroll_code
	  from payrollcode pc (nolock)
     where pc.payroll_code <> @payroll_code
	   and pc.payroll_from < @payroll_from
  order by pc.payroll_from desc

	-- get previous payroll period details
	select @previous_payroll_from = payroll_from,
		   @previous_payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@previous_payroll_code)

	-- get deductions of payroll code param
	select pd.id_num,
	       pd.deductiontype_code,
		   pd.deduction_amount
	  into #deduction
	  from payrolldeduction pd (nolock)
	 where pd.payroll_code = @payroll_code

	-- get deductions of previous payroll
	select pd.id_num,
	       pd.deductiontype_code,
		   pd.deduction_amount
	  into #deduction_previous
	  from payrolldeduction pd (nolock)
	 where pd.payroll_code = @previous_payroll_code

	-- add deduction types that exists only in the previous payroll
	insert into #deduction
	select dp.id_num,
	       dp.deductiontype_code,
		   0.00
	  from #deduction_previous dp
	 where not exists (select 1
	                     from #deduction d
						where d.id_num = dp.id_num
						  and d.deductiontype_code = dp.deductiontype_code)

	-- return
	select e.employee_name,
	       e.location_code,
		   e.department_code,
		   l.location_name,
		   d.id_num,
	       d.deductiontype_code,
		   coalesce(td.display_name,td.deductiontype_name) as deductiontype_name,
		   d.deduction_amount,
		   dp.deduction_amount as previous_deduction_amount,
		   (isnull(d.deduction_amount,0.00) - isnull(dp.deduction_amount,0.00)) as variance_amount,
		   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
		   (convert(varchar(10),@previous_payroll_from,101) + ' - ' + convert(varchar(10),@previous_payroll_until,101)) previous_payroll_period
	  from #deduction d
 left join #deduction_previous dp
	    on dp.deductiontype_code = d.deductiontype_code
	   and dp.id_num = d.id_num
	  join #employee e 
	    on e.id_num = d.id_num
	  join location l (nolock)
	    on l.location_code = e.location_code
	  join t_deductiontype td (nolock)
	    on td.deductiontype_code = d.deductiontype_code
     where ((isnull(d.deduction_amount,0.00) - isnull(dp.deduction_amount,0.00)) > isnull(@variance_amount,0.00) 
	    or (isnull(dp.deduction_amount,0.00) - isnull(d.deduction_amount,0.00)) > isnull(@variance_amount,0.00))
	    -- or (isnull(dp.deduction_amount,0.00) - isnull(d.deduction_amount,0.00)) = 0.00
  order by e.employee_name, td.sort_order

	drop table #deduction
	drop table #deduction_previous

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_declare_dependents]
Print 'Create Procedure [dbo].[pr_declare_dependents]'
GO

CREATE PROCEDURE [dbo].[pr_declare_dependents]
	@payroll_code char(15),
	@id_num varchar(12),
	@declare smallint
AS
BEGIN
    declare @payroll_from datetime,
			@payroll_until datetime,
			@dependents int

	set xact_abort on

	begin transaction

	-- update employee record
	update employee
	   set declare_dependents = @declare
	 where id_num = @id_num

	 -- get dependents
	 select @dependents = count(id_num)
	   from empfamily ef (nolock)
	  where isnull(ef.is_dependent,0) = 1
		and isnull(ef.is_deceased,0) = 0
		and id_num = @id_num

	 -- update payroll record
	 update payroll
	    set dependents = (case when @declare = 1 then @dependents else null end)
	  where id_num = @id_num
	    and payroll_code = @payroll_code

	 -- payroll dates
	 select @payroll_from = pc.payroll_from,
			@payroll_until = pc.payroll_until
	   from payrollcode pc (nolock)
	  where pc.payroll_code = @payroll_code

	 -- employee record
	 select *
	   into #employee
	   from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

	 -- update withholding tax
	 update pd
	    set deduction_amount = 
			dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,dbo.pr_fn_get_declared_salary(e.positiontype_code),(case when @declare = 1 then @dependents else null end))
	   from payrolldeduction pd
	   join #employee e
	     on e.id_num = pd.id_num
	  where pd.payroll_code = @payroll_code
	    and deductiontype_code = 'WTX'
		and pd.id_num = @id_num
	
	  drop table #employee

	  commit transaction
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
						      where d.id_num = e.id_num
							    and d.dtr_date = d_pm_only.dtr_date)
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
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[pr_generate_payroll]
Print 'Create Procedure [dbo].[pr_generate_payroll]'
GO

CREATE PROCEDURE [dbo].[pr_generate_payroll]
	@payroll_code char(15)
AS
BEGIN
		-- This routine generates the payroll by automatically adding records for deductions, allowances, etc.

		declare @payroll_from datetime,
				@payroll_until datetime,
				@payrollstatus_code char(3),
				@working_days int,
				@saturdays int, 
				@sundays int,
				@payroll_code_previous char(15)

	  -- get the status and dates
	  select @payroll_from = payroll_from,
			 @payroll_until = payroll_until,
			 @payrollstatus_code = payrollstatus_code
	    from dbo.pr_fn_get_payroll_details(@payroll_code)

	   -- get previous payroll code
	   -- used to get previous deduction amount to populate current payroll
	   select top 1 @payroll_code_previous = payroll_code
	     from payrollcode 
	    where payroll_code < @payroll_code
	 order by payroll_code desc

	   -- do no proceed if the status is other than INP = In progress
	   if @payrollstatus_code = 'INP'
	   begin
			  set xact_abort on

			  begin transaction

			  -- get days
			  select @working_days = working_days,
			         @saturdays = saturdays,
					 @sundays = sundays
			    from dbo.dtr_fn_get_working_days(@payroll_from, @payroll_until) 

			  -- employees
			  select *
				into #employee
				from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)
	 
			  -- get all dtr records covered by the payroll period
			  create table #dtr
			  (
				id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
				dtr_date datetime,
				time_in_am time,
				time_out_am time,
				time_in_pm time,
				time_out_pm time,
				total_hours_am decimal(4,2),
				total_hours_pm decimal(4,2),
				location_code char(3)
				--primary key (id_num, dtr_date)
			  )

			  insert #dtr
			  select *
				from dbo.dtr_fn_get_dtr(@payroll_from,@payroll_until,null,1)
					  
			select te.id_num,
				   te.employee_name,
				   te.location_code,
				   l.location_name,
				   te.salary,
				   te.frequency_code,
				   te.position_code,
				   @working_days working_days,
				   @saturdays saturdays,
				   sum(total_hours_am) + sum(total_hours_pm) total_hours
			  into #hours
			  from #dtr td
		right join #employee te
				on td.id_num = te.id_num
			  join location l (nolock)
				on l.location_code = te.location_code
		  group by te.id_num, 
				   te.employee_name, 
				   te.location_code, 
				   l.location_name,
				   te.salary,
				   te.frequency_code,
				   te.position_code        

			-- hours
			select *,
				   (case when ((total_hours / 8.00) + @saturdays + @sundays) > @working_days
					then @working_days 
					else ((total_hours / 8.00) + @saturdays + @sundays)
					end 
				   ) days_attended
			  into #days
			  from #hours

			  -- get leaves
			  -- both with and without pay
			  select leave_date,
			         id_num,
					 is_paid,
					 am_pm
			    into #leaves
			    from leavedetail ld (nolock)
				join leave l (nolock)
				  on l.leave_id = ld.leave_id
				 and l.location_code = ld.location_code
			   where ld.leave_date between @payroll_from and @payroll_until
			     and leavestatus_code = 'APP'

			  -- get undertime
			  select sum(datediff(ss,time_from,time_until) / 60.00) undertime,
			         id_num
			    into #undertime
			    from dtrundertime u (nolock)
			   where u.dtr_date between @payroll_from and @payroll_until
			     and u.timestatus_code = 'APP'
			group by id_num

			  -- get overtime

			  -- get dependents
			select count(id_num) dependents,
				   id_num
			  into #dependents
			  from empfamily ef (nolock)
			 where isnull(ef.is_dependent,0) = 1
			   and isnull(ef.is_deceased,0) = 0
		  group by ef.id_num

			  -- insert new payroll record
			  insert 
				into payroll (payroll_code, id_num, number_of_days, undertime, leaves_with_pay, leaves_without_pay, skeletal, dependents, salary, declared_salary)
			  select @payroll_code,
					 e.id_num,
					
					 /***** number of days present *****/
					 isnull((case when e.empstatus_code in ('PRO','PRE') then d.days_attended - (@saturdays + @sundays) else d.days_attended end),0.00),
					 /***** number of days present *****/

					 /***** undertime *****/
					 (select undertime 
						from #undertime 
					   where id_num = e.id_num),
					 /***** undertime *****/
					 
					 /***** leaves (fullday + half-day leaves) *****/ 
					 /***** with pay *****/
					 (nullif(((select count(id_num) 
					     from #leaves l1
						where l1.id_num = e.id_num
						  and isnull(l1.is_paid,0) = 1
						  and isnull(am_pm,'') = '') 
						  
						+

					   (select count(id_num) / 2.00 
					     from #leaves l2
						where l2.id_num = e.id_num
						  and isnull(l2.is_paid,0) = 1
						  and isnull(am_pm,'') <> ''))
					 ,0)),
					 /***** with pay *****/
					 /***** without pay *****/
					 (nullif(((select count(id_num) 
					     from #leaves l1
						where l1.id_num = e.id_num
						  and isnull(l1.is_paid,0) = 0
						  and isnull(am_pm,'') = '') 
						  
						+

					   -- AM only
					   (select count(id_num) * 3.50 / 8.00 
					     from #leaves l2
						where l2.id_num = e.id_num
						  and isnull(l2.is_paid,0) = 0
						  and isnull(am_pm,'') = 'A')

						+

						-- PM only
						(select count(id_num) * 4.50 / 8.00 
					     from #leaves l3
						where l3.id_num = e.id_num
						  and isnull(l3.is_paid,0) = 0
						  and isnull(am_pm,'') = 'P'))

					 ,0)),
					 /***** without pay *****/
				     /***** leaves *****/
				     
					 null,

					 /***** dependents *****/
					 (case isnull(e.declare_dependents,0) when 1 then nullif(dp.dependents,0) else null end),
					 /***** dependents *****/

					 (case e.frequency_code when 'MLY' then e.salary / 2.00 else e.salary end), -- actual salary
					 dbo.pr_fn_get_declared_salary(e.positiontype_code) -- declared salary
				from #employee e
		   left join payroll pr 
				  on pr.id_num = e.id_num
				 and pr.payroll_code = @payroll_code
		   left join #days d
		          on d.id_num = e.id_num
		   left join #dependents dp
		          on dp.id_num = e.id_num
			   where isnull(pr.id_num,'') = ''

			  -- update payroll
			  update p
			     set number_of_days = isnull((case when e.empstatus_code in ('PRO','PRE') then d.days_attended - (@saturdays + @sundays) else d.days_attended end),0.00), 
				     
					 undertime = (select undertime 
									from #undertime 
								   where id_num = e.id_num), 

					 leaves_with_pay =  (nullif(((select count(id_num) 
										from #leaves l1
									where l1.id_num = p.id_num
										and isnull(l1.is_paid,0) = 1
										and isnull(am_pm,'') = '') 
						  
									+

									(select count(id_num) / 2.00 
										from #leaves l2
									where l2.id_num = p.id_num
										and isnull(l2.is_paid,0) = 1
										and isnull(am_pm,'') <> ''))
									,0)),

					 leaves_without_pay =  (nullif(((select count(id_num) 
														from #leaves l1
													where l1.id_num = p.id_num
														and isnull(l1.is_paid,0) = 0
														and isnull(am_pm,'') = '') 
						  
										+

										-- AM only
									   (select count(id_num) * 3.50 / 8.00 
										 from #leaves l2
										where l2.id_num = e.id_num
										  and isnull(l2.is_paid,0) = 0
										  and isnull(am_pm,'') = 'A')

										+

										-- PM only
										(select count(id_num) * 4.50 / 8.00 
										 from #leaves l3
										where l3.id_num = e.id_num
										  and isnull(l3.is_paid,0) = 0
										  and isnull(am_pm,'') = 'P'))
									,0)),
					 skeletal = null, 
					 dependents =  (case isnull(e.declare_dependents,0) when 1 then nullif(dp.dependents,0) else null end), 
					 salary = (case e.frequency_code when 'MLY' then e.salary / 2.00 else e.salary end), 
					 declared_salary = dbo.pr_fn_get_declared_salary(e.positiontype_code) 
			    from payroll p
				join #employee e
				  on e.id_num = p.id_num
				join #days d
		          on d.id_num = e.id_num
		   left join #dependents dp
		          on dp.id_num = e.id_num
			   where p.payroll_code = @payroll_code

			  -- allowances
			  insert
				into payrollallowance (payroll_code, id_num, allowancetype_code, allowance_amount)
			  select @payroll_code,
					 e.id_num,
					 pf.allowancetype_code,
					 sum(pf.allowance_amount) / 2.00
				from #employee e
				join pafallowance pf (nolock)
				  on pf.paf_id = e.paf_id
				join t_allowancetype ta (nolock)
				  on ta.allowancetype_code = pf.allowancetype_code
				 and isnull(ta.is_voucher,0) = 0
			   where not exists (select 1
								   from payrollallowance pa
								  where pa.payroll_code = @payroll_code
									and pa.id_num = e.id_num
									and pa.allowancetype_code = pf.allowancetype_code)
			group by e.id_num,
					 pf.allowancetype_code
     
			-- get gross
		   select d.*,
				  round((case when d.frequency_code = 'MLY'
				  then (e.salary / 2.00) - ((working_days - days_attended) * (e.salary * 12 / 365.00))
				  else e.salary * days_attended * 1.00  
				  end
				  ),2) as gross,
				  (dbo.pr_fn_get_declared_salary(e.positiontype_code)) as declared_salary,
				  dp.dependents
			 into #payroll
			 from #days d
			 join #employee e
			   on e.id_num = d.id_num
		left join #dependents dp
			   on dp.id_num = d.id_num

			  -- insert the required deduction
			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount)
			  select @payroll_code,
					 pr.id_num,
					 td.deductiontype_code,
					 isnull((
						case td.deductiontype_code
						when 'SSS' then dbo.pr_fn_get_sss_contribution(pr.salary)
						when 'PAG' then dbo.pr_fn_get_pagibig_contribution(empstatus_code)
						when 'WTX' then dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,pr.declared_salary,pr.dependents)
						when 'PHL' then dbo.pr_fn_get_phic_contribution(e.positiontype_code)
						end
					 ),0) deduction_amount
				from #payroll pr, 
					 t_deductiontype td (nolock),
					  #employee e 
			   where td.deductiontype_code in ('SSS','PAG','WTX','PHL')
				 and e.id_num = pr.id_num 
				 and not exists (select 1 
								   from payrolldeduction pd 
								  where pd.id_num = pr.id_num
								    and pd.payroll_code = @payroll_code
									and pd.deductiontype_code = td.deductiontype_code)

			  -- update deductions as variables could have been possibly changed.. i.e. gross, dependents, etc.
			  update pd
			     set deduction_amount = isnull((
						case pd.deductiontype_code
						when 'SSS' then dbo.pr_fn_get_sss_contribution(pr.salary)
						when 'PAG' then dbo.pr_fn_get_pagibig_contribution(empstatus_code)
						when 'WTX' then dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,pr.declared_salary,pr.dependents)
						when 'PHL' then dbo.pr_fn_get_phic_contribution(e.positiontype_code)
						end
					 ),0)
			    from payrolldeduction pd
				join #employee e
				  on e.id_num = pd.id_num 
				join #payroll pr
				  on pr.id_num = pd.id_num
			   where pd.payroll_code = @payroll_code
			     and pd.deductiontype_code in ('SSS','PAG','WTX','PHL') 

			  -- non-required deductions
			  -- check previous payroll and insert first
			  -- this would populate the amount entered previously
			  select *
			    into #deduction
			    from payrolldeduction pd (nolock)
			   where pd.payroll_code = @payroll_code_previous
			     and pd.deductiontype_code not in ('SSS','PAG','WTX','PHL')

			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount)
			  select @payroll_code,
			         d.id_num,
					 d.deductiontype_code,
					 d.deduction_amount
			    from #deduction d
				join #employee e
				  on e.id_num = d.id_num
			   where not exists (select 1 
								   from payrolldeduction pd (nolock) 
								  where pd.id_num = d.id_num
								    and pd.payroll_code = @payroll_code
								    and pd.deductiontype_code = d.deductiontype_code)

			  -- insert deductions that have been added recently
			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount)
			  select @payroll_code,
					 pr.id_num,
					 td.deductiontype_code,
					 0.00
				from #payroll pr, 
					 t_deductiontype td (nolock),
					 #employee e
			   where e.id_num = pr.id_num
				 and not exists (select 1 
								   from payrolldeduction pd 
								  where pd.id_num = pr.id_num
								    and pd.payroll_code = @payroll_code
									and pd.deductiontype_code = td.deductiontype_code)
			
			  -- select * from #undertime FOR CHECKING PURPOSES

			  drop table #employee
			  drop table #dtr
			  drop table #hours
			  drop table #leaves
			  drop table #days
			  drop table #payroll
			  drop table #dependents
			  drop table #deduction

			  commit transaction

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
-- Create Procedure [dbo].[rpt_paf]
Print 'Create Procedure [dbo].[rpt_paf]'
GO

CREATE PROCEDURE [dbo].[rpt_paf]	
	@paf_id	integer
AS
BEGIN
	declare @date_hired datetime 
	declare @date_regularized datetime

	-- get date hired
	select @date_hired = effective_date
	  from paf p (nolock)
     where p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
  order by effective_date desc

	-- get date regularized
	select @date_regularized = effective_date
	  from paf p (nolock)
     where p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
	   and p.empstatus_code = 'REG'
  order by effective_date desc

	-- get previous PAF details
	select p.id_num,
	       p.salary salary_previous,
		   ps.position_name position_previous,
		   l.location_name location_previous,
		   lv.level_name job_level_previous,
	       dbo.rpt_fn_get_concat_paf_allowances(paf_id,'TYPE') allowances_previous
	  into #paf_previous
	  from paf p (nolock)
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
	  join location l (nolock)
	    on l.location_code = p.location_code
 left join t_level lv (nolock)
        on lv.level_code = ps.level_code
     where paf_id < @paf_id
	   and p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
  order by effective_date asc

	-- return
	select e.id_num,
	       ps.position_name position,
		   l.location_name location,
		   lv.level_name job_level,
		   upper(e.employee_firstname + ' ' + isnull(substring(e.employee_middlename,1,1) + '. ','') + e.employee_lastname) employee_name,
		   convert(varchar(25),@date_hired,107) date_hired,
		   convert(varchar(25),@date_regularized,107) date_regularized,
		   es.empstatus_name employment_status,
		   convert(varchar(25),p.effective_date,107) effective_date,
		  
		   -- /*** salary ***/
		   (
				case when p.salary = pp.salary_previous then ' - '
				else convert(varchar,convert(money,p.salary),1)  + ' ' + upper(sf.frequency_name) end
		   ) salary,
		   -- /*** salary ***/
		   
		   dbo.rpt_fn_get_concat_paf_allowances(paf_id,'TYPE') allowances,
		   (convert(varchar,convert(money,pp.salary_previous),1) + ' ' + upper(sf.frequency_name)) salary_previous,
		   
		   --  /*** position ***/
		   (
				case when ps.position_name = pp.position_previous then ' - '
				else ps.position_name end
		   ) position2,
		   --  /*** position ***/

		   --  /*** location ***/
		   (
				case when l.location_name = pp.location_previous then ' - '
				else l.location_name end
		   ) location2,
		   --  /*** location ***/

		   --  /*** job level ***/
		   (
				case when lv.level_name = pp.job_level_previous then ' - '
				else lv.level_name end
		   ) job_level2,
		   --  /*** job level ***/

		   pp.position_previous,
		   pp.job_level_previous,
		   pp.location_previous,
	       pp.allowances_previous
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
	  join t_salaryfrequency sf
	    on sf.frequency_code = p.frequency_code
 left join t_level lv (nolock)
        on lv.level_code = ps.level_code
	  join location l (nolock)
	    on l.location_code = p.location_code
 left join #paf_previous pp
        on pp.id_num = p.id_num
	  join t_empstatus es
	    on es.empstatus_code = p.empstatus_code
	 where p.paf_id = @paf_id

	 drop table #paf_previous
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[rpt_payslip]
Print 'Create Procedure [dbo].[rpt_payslip]'
GO
CREATE PROCEDURE [dbo].[rpt_payslip]
	@payroll_code char(15)
AS
BEGIN

			declare @payroll_from date,
					@payroll_until date,
					@working_days decimal(8,2)
	
			-- get payroll period
			select @payroll_from = payroll_from,
				   @payroll_until = payroll_until
			  from dbo.pr_fn_get_payroll_details(@payroll_code)

			-- get working days
			select @working_days = working_days
			  from dbo.dtr_fn_get_working_days(@payroll_from, @payroll_until) 

			-- employee details
			select *
			  into #employee
			  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

			-- get deductions
			select pd.id_num id_num,
				   sum(pd.deduction_amount) deduction
			  into #deductions
			  from payrolldeduction pd (nolock)
			 where pd.payroll_code = @payroll_code
		  group by pd.id_num

			-- get allowances
			select pa.id_num id_num,
				   sum(pa.allowance_amount) allowance
			  into #allowances
			  from payrollallowance pa (nolock)
			 where pa.payroll_code = @payroll_code
		  group by pa.id_num

			-- get adjustments (plus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_plus
			  into #adjustments_plus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 0
		  group by pad.id_num

			-- get adjustments (minus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_minus
			  into #adjustments_minus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 1 
		  group by pad.id_num

			select upper(e.employee_name) employee_name,
				   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) as payroll_period,
				   @working_days as working_days,
				   pr.number_of_days as days_attended,
				   null as holidays,
				   pr.leaves_with_pay as leave_with_pay,
				   pr.leaves_without_pay as leave_without_pay,
				   null as awol,
				   null as business_trip,
				   pr.salary as semi_monthly_rate,
				   isnull(allowance,0.00) as allowance,
				   (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) as adjustment,
				   pr.undertime as undertime,
				   ((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary))) * -1.00 as undertime_lwop,
				   (d.deduction * -1.00) as deduction,
				   /****** gross pay ******/
				   (
						(case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) -
						((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary)))

				   ) as gross_pay,
				   /****** gross pay ******/
				   /****** net pay ******/
				   (
						(case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) -
						((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary))) - isnull(deduction,0.00)

						--isnull(((case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) - isnull(deduction,0.00) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00))),0.00) 
				   ) as net,
				   /****** net pay ******/
				   /****** deduction types ******/
				   dbo.rpt_fn_get_payroll_deductions(e.id_num,@payroll_code,'TYPE') as deduction_types,
				   /****** deduction types ******/
				   /****** deduction amount ******/
				   dbo.rpt_fn_get_payroll_deductions(e.id_num,@payroll_code,'AMOUNT') as deduction_amount,
				   /****** deduction amount ******/
				   e.location_code,
				   e.department_code
			  from payroll (nolock) pr
			  join #employee e
				on e.id_num = pr.id_num
		 left join #deductions d
		        on d.id_num = e.id_num
		 left join #allowances a
		        on a.id_num = pr.id_num
		 left join #adjustments_plus ap
		        on ap.id_num = pr.id_num
		 left join #adjustments_minus am
		        on am.id_num = pr.id_num
			 where pr.payroll_code = @payroll_code
		  order by employee_name

			drop table #employee
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_leave_t_leavetype on [dbo].[leave]
Print 'Create Foreign Key FK_leave_t_leavetype on [dbo].[leave]'
GO
ALTER TABLE [dbo].[leave]
	WITH CHECK
	ADD CONSTRAINT [FK_leave_t_leavetype]
	FOREIGN KEY ([leavetype_code]) REFERENCES [dbo].[t_leavetype] ([leavetype_code])
ALTER TABLE [dbo].[leave]
	CHECK CONSTRAINT [FK_leave_t_leavetype]

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
-- Create Foreign Key FK_payrolladjustment_employee on [dbo].[payrolladjustment]
Print 'Create Foreign Key FK_payrolladjustment_employee on [dbo].[payrolladjustment]'
GO
ALTER TABLE [dbo].[payrolladjustment]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolladjustment_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[payrolladjustment]
	CHECK CONSTRAINT [FK_payrolladjustment_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolladjustment_payrollcode on [dbo].[payrolladjustment]
Print 'Create Foreign Key FK_payrolladjustment_payrollcode on [dbo].[payrolladjustment]'
GO
ALTER TABLE [dbo].[payrolladjustment]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolladjustment_payrollcode]
	FOREIGN KEY ([payroll_code]) REFERENCES [dbo].[payrollcode] ([payroll_code])
ALTER TABLE [dbo].[payrolladjustment]
	CHECK CONSTRAINT [FK_payrolladjustment_payrollcode]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolladjustment_sysuser on [dbo].[payrolladjustment]
Print 'Create Foreign Key FK_payrolladjustment_sysuser on [dbo].[payrolladjustment]'
GO
ALTER TABLE [dbo].[payrolladjustment]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolladjustment_sysuser]
	FOREIGN KEY ([created_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[payrolladjustment]
	CHECK CONSTRAINT [FK_payrolladjustment_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolladjustment_t_adjustmenttype on [dbo].[payrolladjustment]
Print 'Create Foreign Key FK_payrolladjustment_t_adjustmenttype on [dbo].[payrolladjustment]'
GO
ALTER TABLE [dbo].[payrolladjustment]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolladjustment_t_adjustmenttype]
	FOREIGN KEY ([adjustmenttype_code]) REFERENCES [dbo].[t_adjustmenttype] ([adjustmenttype_code])
ALTER TABLE [dbo].[payrolladjustment]
	CHECK CONSTRAINT [FK_payrolladjustment_t_adjustmenttype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrollallowance_employee on [dbo].[payrollallowance]
Print 'Create Foreign Key FK_payrollallowance_employee on [dbo].[payrollallowance]'
GO
ALTER TABLE [dbo].[payrollallowance]
	WITH CHECK
	ADD CONSTRAINT [FK_payrollallowance_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[payrollallowance]
	CHECK CONSTRAINT [FK_payrollallowance_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrollallowance_payrollcode on [dbo].[payrollallowance]
Print 'Create Foreign Key FK_payrollallowance_payrollcode on [dbo].[payrollallowance]'
GO
ALTER TABLE [dbo].[payrollallowance]
	WITH CHECK
	ADD CONSTRAINT [FK_payrollallowance_payrollcode]
	FOREIGN KEY ([payroll_code]) REFERENCES [dbo].[payrollcode] ([payroll_code])
ALTER TABLE [dbo].[payrollallowance]
	CHECK CONSTRAINT [FK_payrollallowance_payrollcode]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrollallowance_sysuser on [dbo].[payrollallowance]
Print 'Create Foreign Key FK_payrollallowance_sysuser on [dbo].[payrollallowance]'
GO
ALTER TABLE [dbo].[payrollallowance]
	WITH CHECK
	ADD CONSTRAINT [FK_payrollallowance_sysuser]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[payrollallowance]
	CHECK CONSTRAINT [FK_payrollallowance_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrollallowance_t_allowancetype on [dbo].[payrollallowance]
Print 'Create Foreign Key FK_payrollallowance_t_allowancetype on [dbo].[payrollallowance]'
GO
ALTER TABLE [dbo].[payrollallowance]
	WITH CHECK
	ADD CONSTRAINT [FK_payrollallowance_t_allowancetype]
	FOREIGN KEY ([allowancetype_code]) REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
ALTER TABLE [dbo].[payrollallowance]
	CHECK CONSTRAINT [FK_payrollallowance_t_allowancetype]

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
-- Create Foreign Key FK_payrolldeduction_employee on [dbo].[payrolldeduction]
Print 'Create Foreign Key FK_payrolldeduction_employee on [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolldeduction_employee]
	FOREIGN KEY ([id_num]) REFERENCES [dbo].[employee] ([id_num])
ALTER TABLE [dbo].[payrolldeduction]
	CHECK CONSTRAINT [FK_payrolldeduction_employee]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolldeduction_location on [dbo].[payrolldeduction]
Print 'Create Foreign Key FK_payrolldeduction_location on [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolldeduction_location]
	FOREIGN KEY ([bcf_sub_location_code]) REFERENCES [dbo].[location] ([location_code])
ALTER TABLE [dbo].[payrolldeduction]
	CHECK CONSTRAINT [FK_payrolldeduction_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolldeduction_payrollcode on [dbo].[payrolldeduction]
Print 'Create Foreign Key FK_payrolldeduction_payrollcode on [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolldeduction_payrollcode]
	FOREIGN KEY ([payroll_code]) REFERENCES [dbo].[payrollcode] ([payroll_code])
ALTER TABLE [dbo].[payrolldeduction]
	CHECK CONSTRAINT [FK_payrolldeduction_payrollcode]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolldeduction_sysuser on [dbo].[payrolldeduction]
Print 'Create Foreign Key FK_payrolldeduction_sysuser on [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolldeduction_sysuser]
	FOREIGN KEY ([modified_by]) REFERENCES [dbo].[sysuser] ([id_num])
ALTER TABLE [dbo].[payrolldeduction]
	CHECK CONSTRAINT [FK_payrolldeduction_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_payrolldeduction_t_deductiontype on [dbo].[payrolldeduction]
Print 'Create Foreign Key FK_payrolldeduction_t_deductiontype on [dbo].[payrolldeduction]'
GO
ALTER TABLE [dbo].[payrolldeduction]
	WITH CHECK
	ADD CONSTRAINT [FK_payrolldeduction_t_deductiontype]
	FOREIGN KEY ([deductiontype_code]) REFERENCES [dbo].[t_deductiontype] ([deductiontype_code])
ALTER TABLE [dbo].[payrolldeduction]
	CHECK CONSTRAINT [FK_payrolldeduction_t_deductiontype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_deductiontype_t_accounttype on [dbo].[t_deductiontype]
Print 'Create Foreign Key FK_t_deductiontype_t_accounttype on [dbo].[t_deductiontype]'
GO
ALTER TABLE [dbo].[t_deductiontype]
	WITH CHECK
	ADD CONSTRAINT [FK_t_deductiontype_t_accounttype]
	FOREIGN KEY ([accounttype_code]) REFERENCES [dbo].[t_accounttype] ([accounttype_code])
ALTER TABLE [dbo].[t_deductiontype]
	CHECK CONSTRAINT [FK_t_deductiontype_t_accounttype]

GO


INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'AM ', N'Area Manager', NULL)
GO
INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'BM ', N'Branch Manager', NULL)
GO
INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'COO', N'Chief Operating Officer', N'Might be changed to VP later.')
GO
INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'DH ', N'Department Head', NULL)
GO
INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'STF', N'Staff', NULL)
GO
INSERT [dbo].[t_positiontype] ([positiontype_code], [positiontype_name], [positiontype_description]) VALUES (N'UH ', N'Unit Head', NULL)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_t_position_t_positiontype on [dbo].[t_position]
Print 'Create Foreign Key FK_t_position_t_positiontype on [dbo].[t_position]'
GO
ALTER TABLE [dbo].[t_position]
	WITH CHECK
	ADD CONSTRAINT [FK_t_position_t_positiontype]
	FOREIGN KEY ([positiontype_code]) REFERENCES [dbo].[t_positiontype] ([positiontype_code])
ALTER TABLE [dbo].[t_position]
	CHECK CONSTRAINT [FK_t_position_t_positiontype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

INSERT [dbo].[t_deductiontype] ([deductiontype_code], [deductiontype_name], [deductiontype_description], [is_required]) VALUES (N'PAG', N'HDMF', NULL, 1)
GO
INSERT [dbo].[t_deductiontype] ([deductiontype_code], [deductiontype_name], [deductiontype_description], [is_required]) VALUES (N'PHL', N'PHIC', NULL, 1)
GO
INSERT [dbo].[t_deductiontype] ([deductiontype_code], [deductiontype_name], [deductiontype_description], [is_required]) VALUES (N'SSS', N'SSS', N'SSS contribution', 1)
GO
INSERT [dbo].[t_deductiontype] ([deductiontype_code], [deductiontype_name], [deductiontype_description], [is_required]) VALUES (N'WTX', N'Withholding tax', NULL, 1)
GO
INSERT [dbo].[t_payrollstatus] ([payrollstatus_code], [payrollstatus_name], [payrollstatus_description]) VALUES (N'FIN', N'Finalised', NULL)
GO
INSERT [dbo].[t_payrollstatus] ([payrollstatus_code], [payrollstatus_name], [payrollstatus_description]) VALUES (N'INP', N'In Progress', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'APP', N'Approved', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'CNL', N'Cancelled', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'DND', N'Denied', NULL)
GO
INSERT [dbo].[t_leavestatus] ([leavestatus_code], [leavestatus_name], [leavestatus_description]) VALUES (N'PND', N'Pending', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'APP', N'Approved', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'CNL', N'Cancelled', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'DND', N'Denied', NULL)
GO
INSERT [dbo].[t_timestatus] ([timestatus_code], [timestatus_name], [timestatus_description]) VALUES (N'PND', N'Pending', NULL)

DENY ALTER ON [dbo].[hris_dd_get_civil_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_civil_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_civil_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_civil_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_civil_status] TO [HRISUser]
DENY ALTER ON [dbo].[t_wsmessagetype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY DELETE ON [dbo].[t_wsmessagetype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_wsmessagetype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_wsmessagetype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY UPDATE ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_wsmessagetype] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leaveapplication_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leaveapplication_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leaveapplication_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leaveapplication_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leaveapplication_status] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_leaveapp_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_leaveapp_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_leaveapp_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_leaveapp_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_leaveapp_status] TO [HRISUser]
DENY ALTER ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_holidaytype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_holidaytype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_holidaytype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_holidaytype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_holidaytype] TO [HRISUser]
DENY ALTER ON [dbo].[sync_get_wsmessage] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_get_wsmessage] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_get_wsmessage] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_get_wsmessage] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_get_wsmessage] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_leave_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_leave_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_leave_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_leave_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_leave_status] TO [HRISUser]
DENY ALTER ON [dbo].[t_pafstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_pafstatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_pafstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_pafstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_pafstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_pafstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_pafstatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_pafstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_pafstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_pafstatus] TO [HRISUser]
DENY ALTER ON [dbo].[wsmessagein] TO [HRISUser]
GRANT CONTROL ON [dbo].[wsmessagein] TO [HRISUser]
GRANT DELETE ON [dbo].[wsmessagein] TO [HRISUser]
GRANT INSERT ON [dbo].[wsmessagein] TO [HRISUser]
GRANT REFERENCES ON [dbo].[wsmessagein] TO [HRISUser]
GRANT SELECT ON [dbo].[wsmessagein] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[wsmessagein] TO [HRISUser]
GRANT UPDATE ON [dbo].[wsmessagein] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[wsmessagein] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[wsmessagein] TO [HRISUser]
DENY ALTER ON [dbo].[leavecredit] TO [HRISUser]
GRANT CONTROL ON [dbo].[leavecredit] TO [HRISUser]
DENY DELETE ON [dbo].[leavecredit] TO [HRISUser]
GRANT INSERT ON [dbo].[leavecredit] TO [HRISUser]
GRANT REFERENCES ON [dbo].[leavecredit] TO [HRISUser]
GRANT SELECT ON [dbo].[leavecredit] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[leavecredit] TO [HRISUser]
GRANT UPDATE ON [dbo].[leavecredit] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[leavecredit] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[leavecredit] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_months] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_months] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_months] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_months] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_months] TO [HRISUser]
DENY ALTER ON [dbo].[holiday] TO [HRISUser]
GRANT CONTROL ON [dbo].[holiday] TO [HRISUser]
DENY DELETE ON [dbo].[holiday] TO [HRISUser]
GRANT INSERT ON [dbo].[holiday] TO [HRISUser]
GRANT REFERENCES ON [dbo].[holiday] TO [HRISUser]
GRANT SELECT ON [dbo].[holiday] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[holiday] TO [HRISUser]
GRANT UPDATE ON [dbo].[holiday] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[holiday] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[holiday] TO [HRISUser]
DENY ALTER ON [dbo].[t_wsmessagestatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_wsmessagestatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_wsmessagestatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_wsmessagestatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_wsmessagestatus] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_gender] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_gender] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_gender] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_gender] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_gender] TO [HRISUser]
DENY ALTER ON [dbo].[t_pafcomptype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY DELETE ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY INSERT ON [dbo].[t_pafcomptype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_pafcomptype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY UPDATE ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_pafcomptype] TO [HRISUser]
DENY ALTER ON [dbo].[wsmessageout] TO [HRISUser]
GRANT CONTROL ON [dbo].[wsmessageout] TO [HRISUser]
GRANT DELETE ON [dbo].[wsmessageout] TO [HRISUser]
GRANT INSERT ON [dbo].[wsmessageout] TO [HRISUser]
GRANT REFERENCES ON [dbo].[wsmessageout] TO [HRISUser]
GRANT SELECT ON [dbo].[wsmessageout] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[wsmessageout] TO [HRISUser]
GRANT UPDATE ON [dbo].[wsmessageout] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[wsmessageout] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[wsmessageout] TO [HRISUser]
DENY ALTER ON [dbo].[t_occupation] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_occupation] TO [HRISUser]
GRANT DELETE ON [dbo].[t_occupation] TO [HRISUser]
GRANT INSERT ON [dbo].[t_occupation] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_occupation] TO [HRISUser]
GRANT SELECT ON [dbo].[t_occupation] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_occupation] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_occupation] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_occupation] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_occupation] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_holiday_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_holiday_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_holiday_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_holiday_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_holiday_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_paf_status] TO [HRISUser]
DENY ALTER ON [dbo].[t_level] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_level] TO [HRISUser]
GRANT DELETE ON [dbo].[t_level] TO [HRISUser]
GRANT INSERT ON [dbo].[t_level] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_level] TO [HRISUser]
GRANT SELECT ON [dbo].[t_level] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_level] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_level] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_level] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_level] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_holiday_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_holiday_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_holiday_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_holiday_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_holiday_types] TO [HRISUser]
DENY ALTER ON [dbo].[t_leavetype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_leavetype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_leavetype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_leavetype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_leavetype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_leavetype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_leavetype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_leavetype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_leavetype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_leavetype] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_by_date_no_joins] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_by_date_no_joins] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_by_date_no_joins] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_by_date_no_joins] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_by_date_no_joins] TO [HRISUser]
DENY ALTER ON [dbo].[holidaylocation] TO [HRISUser]
GRANT CONTROL ON [dbo].[holidaylocation] TO [HRISUser]
GRANT DELETE ON [dbo].[holidaylocation] TO [HRISUser]
GRANT INSERT ON [dbo].[holidaylocation] TO [HRISUser]
GRANT REFERENCES ON [dbo].[holidaylocation] TO [HRISUser]
GRANT SELECT ON [dbo].[holidaylocation] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[holidaylocation] TO [HRISUser]
GRANT UPDATE ON [dbo].[holidaylocation] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[holidaylocation] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[holidaylocation] TO [HRISUser]
GRANT ALTER ON [dbo].[dtr_get_dtr_for_import] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_dtr_for_import] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_dtr_for_import] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leavedetail] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leavedetail] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leavedetail] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leavedetail] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leavedetail] TO [HRISUser]
DENY ALTER ON [dbo].[t_leavestatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_leavestatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_leavestatus] TO [HRISUser]
DENY INSERT ON [dbo].[t_leavestatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_leavestatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_leavestatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_leavestatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_leavestatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_leavestatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_leavestatus] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_employee] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_employee] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_employee] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_employee] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_employee] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_holiday] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_holiday] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_holiday] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holiday] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_holiday] TO [HRISUser]
GRANT ALTER ON [dbo].[dtr_import_dtr] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_import_dtr] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_import_dtr] TO [HRISUser]
DENY ALTER ON [dbo].[sync_set_wsmessageout_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_set_wsmessageout_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_set_wsmessageout_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_set_wsmessageout_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_set_wsmessageout_status] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_delete_holiday_locations] TO [HRISUser]
DENY ALTER ON [dbo].[t_empstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_empstatus] TO [HRISUser]
GRANT DELETE ON [dbo].[t_empstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_empstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_empstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_empstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_empstatus] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_empstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_empstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_empstatus] TO [HRISUser]
GRANT ALTER ON [dbo].[dtr_load_exported_dtr] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_load_exported_dtr] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_load_exported_dtr] TO [HRISUser]
DENY ALTER ON [dbo].[sync_get_wsmessagein_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_get_wsmessagein_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_get_wsmessagein_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_get_wsmessagein_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_get_wsmessagein_status] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_holiday_locations] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_log_time] TO [HRISUser]
DENY CONTROL ON [dbo].[dtr_log_time] TO [HRISUser]
DENY EXECUTE ON [dbo].[dtr_log_time] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_log_time] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_log_time] TO [HRISUser]
DENY ALTER ON [dbo].[sync_get_wsmessageout_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_get_wsmessageout_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_get_wsmessageout_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_get_wsmessageout_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_get_wsmessageout_status] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_holidays] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_holidays] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_holidays] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_holidays] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_holidays] TO [HRISUser]
DENY ALTER ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_allowancetype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_allowancetype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_allowancetype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_allowancetype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_allowancetype] TO [HRISUser]
DENY ALTER ON [dbo].[t_religion] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_religion] TO [HRISUser]
GRANT DELETE ON [dbo].[t_religion] TO [HRISUser]
GRANT INSERT ON [dbo].[t_religion] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_religion] TO [HRISUser]
GRANT SELECT ON [dbo].[t_religion] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_religion] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_religion] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_religion] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_religion] TO [HRISUser]
DENY ALTER ON [dbo].[sync_employee] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_employee] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_employee] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_employee] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_employee] TO [HRISUser]
DENY ALTER ON [dbo].[empaddress] TO [HRISUser]
GRANT CONTROL ON [dbo].[empaddress] TO [HRISUser]
GRANT DELETE ON [dbo].[empaddress] TO [HRISUser]
GRANT INSERT ON [dbo].[empaddress] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empaddress] TO [HRISUser]
GRANT SELECT ON [dbo].[empaddress] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[empaddress] TO [HRISUser]
GRANT UPDATE ON [dbo].[empaddress] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empaddress] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empaddress] TO [HRISUser]
DENY ALTER ON [dbo].[t_relation] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_relation] TO [HRISUser]
GRANT DELETE ON [dbo].[t_relation] TO [HRISUser]
GRANT INSERT ON [dbo].[t_relation] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_relation] TO [HRISUser]
GRANT SELECT ON [dbo].[t_relation] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_relation] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_relation] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_relation] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_relation] TO [HRISUser]
DENY ALTER ON [dbo].[upd_execute_update] TO [HRISUser]
GRANT CONTROL ON [dbo].[upd_execute_update] TO [HRISUser]
GRANT EXECUTE ON [dbo].[upd_execute_update] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[upd_execute_update] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[upd_execute_update] TO [HRISUser]
DENY ALTER ON [dbo].[t_province] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_province] TO [HRISUser]
GRANT DELETE ON [dbo].[t_province] TO [HRISUser]
GRANT INSERT ON [dbo].[t_province] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_province] TO [HRISUser]
GRANT SELECT ON [dbo].[t_province] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_province] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_province] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_province] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_province] TO [HRISUser]
DENY ALTER ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT DELETE ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_positionstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_positionstatus] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_positionstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_positionstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_positionstatus] TO [HRISUser]
DENY ALTER ON [dbo].[dtr] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr] TO [HRISUser]
DENY DELETE ON [dbo].[dtr] TO [HRISUser]
DENY INSERT ON [dbo].[dtr] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr] TO [HRISUser]
GRANT SELECT ON [dbo].[dtr] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr] TO [HRISUser]
DENY UPDATE ON [dbo].[dtr] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[dtr] TO [HRISUser]
DENY ALTER ON [dbo].[t_positiontype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_positiontype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_positiontype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_positiontype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_positiontype] TO [HRISUser]
DENY SELECT ON [dbo].[t_positiontype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_positiontype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_positiontype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_positiontype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_positiontype] TO [HRISUser]
DENY ALTER ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT DELETE ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_payrollstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_payrollstatus] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_payrollstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_payrollstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_payrollstatus] TO [HRISUser]
DENY ALTER ON [dbo].[t_locationtype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_locationtype] TO [HRISUser]
DENY DELETE ON [dbo].[t_locationtype] TO [HRISUser]
DENY INSERT ON [dbo].[t_locationtype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_locationtype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_locationtype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_locationtype] TO [HRISUser]
DENY UPDATE ON [dbo].[t_locationtype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_locationtype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_locationtype] TO [HRISUser]
DENY ALTER ON [dbo].[sysrole] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysrole] TO [HRISUser]
DENY DELETE ON [dbo].[sysrole] TO [HRISUser]
GRANT INSERT ON [dbo].[sysrole] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysrole] TO [HRISUser]
GRANT SELECT ON [dbo].[sysrole] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysrole] TO [HRISUser]
GRANT UPDATE ON [dbo].[sysrole] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysrole] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysrole] TO [HRISUser]
DENY ALTER ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_adjustmenttype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_adjustmenttype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_adjustmenttype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_adjustmenttype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_adjustmenttype] TO [HRISUser]
DENY ALTER ON [dbo].[locationdepartment] TO [HRISUser]
GRANT CONTROL ON [dbo].[locationdepartment] TO [HRISUser]
DENY DELETE ON [dbo].[locationdepartment] TO [HRISUser]
GRANT INSERT ON [dbo].[locationdepartment] TO [HRISUser]
GRANT REFERENCES ON [dbo].[locationdepartment] TO [HRISUser]
GRANT SELECT ON [dbo].[locationdepartment] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[locationdepartment] TO [HRISUser]
GRANT UPDATE ON [dbo].[locationdepartment] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[locationdepartment] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[locationdepartment] TO [HRISUser]
DENY ALTER ON [dbo].[sysprivilege] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysprivilege] TO [HRISUser]
DENY DELETE ON [dbo].[sysprivilege] TO [HRISUser]
GRANT INSERT ON [dbo].[sysprivilege] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysprivilege] TO [HRISUser]
GRANT SELECT ON [dbo].[sysprivilege] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysprivilege] TO [HRISUser]
DENY UPDATE ON [dbo].[sysprivilege] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysprivilege] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysprivilege] TO [HRISUser]
DENY ALTER ON [dbo].[t_accounttype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_accounttype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_accounttype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_accounttype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_accounttype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_accounttype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_accounttype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_accounttype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_accounttype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_accounttype] TO [HRISUser]
DENY ALTER ON [dbo].[department] TO [HRISUser]
GRANT CONTROL ON [dbo].[department] TO [HRISUser]
GRANT DELETE ON [dbo].[department] TO [HRISUser]
GRANT INSERT ON [dbo].[department] TO [HRISUser]
GRANT REFERENCES ON [dbo].[department] TO [HRISUser]
GRANT SELECT ON [dbo].[department] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[department] TO [HRISUser]
GRANT UPDATE ON [dbo].[department] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[department] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[department] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_log_status] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_privileges] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_privileges] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_privileges] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_privileges] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_privileges] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_declared_salary] TO [HRISUser]
DENY ALTER ON [dbo].[location] TO [HRISUser]
GRANT CONTROL ON [dbo].[location] TO [HRISUser]
DENY DELETE ON [dbo].[location] TO [HRISUser]
GRANT INSERT ON [dbo].[location] TO [HRISUser]
GRANT REFERENCES ON [dbo].[location] TO [HRISUser]
GRANT SELECT ON [dbo].[location] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[location] TO [HRISUser]
GRANT UPDATE ON [dbo].[location] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[location] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[location] TO [HRISUser]
DENY ALTER ON [dbo].[sec_generate_username] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_generate_username] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_generate_username] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_generate_username] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_generate_username] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_sss_contribution] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_roles] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_roles] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_roles] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_roles] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_roles] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_phic_contribution] TO [HRISUser]
DENY ALTER ON [dbo].[sysuser] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysuser] TO [HRISUser]
GRANT DELETE ON [dbo].[sysuser] TO [HRISUser]
GRANT INSERT ON [dbo].[sysuser] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysuser] TO [HRISUser]
GRANT SELECT ON [dbo].[sysuser] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysuser] TO [HRISUser]
GRANT UPDATE ON [dbo].[sysuser] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysuser] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysuser] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_pagibig_contribution] TO [HRISUser]
DENY ALTER ON [dbo].[t_town] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_town] TO [HRISUser]
GRANT DELETE ON [dbo].[t_town] TO [HRISUser]
GRANT INSERT ON [dbo].[t_town] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_town] TO [HRISUser]
GRANT SELECT ON [dbo].[t_town] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_town] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_town] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_town] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_town] TO [HRISUser]
DENY ALTER ON [dbo].[hris_delete_departments] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_delete_departments] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_delete_departments] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_delete_departments] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_delete_departments] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_withholding_tax] TO [HRISUser]
DENY ALTER ON [dbo].[dtroverride] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtroverride] TO [HRISUser]
DENY DELETE ON [dbo].[dtroverride] TO [HRISUser]
GRANT INSERT ON [dbo].[dtroverride] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtroverride] TO [HRISUser]
GRANT SELECT ON [dbo].[dtroverride] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtroverride] TO [HRISUser]
GRANT UPDATE ON [dbo].[dtroverride] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtroverride] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[dtroverride] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_departments] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_departments] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_departments] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_departments] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_departments] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_daily_rate] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_departments_by_location] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_departments_by_location] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_departments_by_location] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_departments_by_location] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_departments_by_location] TO [HRISUser]
DENY ALTER ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT DELETE ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT INSERT ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT SELECT ON [dbo].[sysroleprivilege] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysroleprivilege] TO [HRISUser]
GRANT UPDATE ON [dbo].[sysroleprivilege] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysroleprivilege] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysroleprivilege] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
GRANT SELECT ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_working_days] TO [HRISUser]
DENY ALTER ON [dbo].[t_overridereason] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_overridereason] TO [HRISUser]
GRANT DELETE ON [dbo].[t_overridereason] TO [HRISUser]
GRANT INSERT ON [dbo].[t_overridereason] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_overridereason] TO [HRISUser]
GRANT SELECT ON [dbo].[t_overridereason] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_overridereason] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_overridereason] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_overridereason] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_overridereason] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_departments] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_departments] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_departments] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_departments] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_departments] TO [HRISUser]
DENY ALTER ON [dbo].[sysuserrole] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysuserrole] TO [HRISUser]
GRANT DELETE ON [dbo].[sysuserrole] TO [HRISUser]
GRANT INSERT ON [dbo].[sysuserrole] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysuserrole] TO [HRISUser]
GRANT SELECT ON [dbo].[sysuserrole] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysuserrole] TO [HRISUser]
GRANT UPDATE ON [dbo].[sysuserrole] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysuserrole] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysuserrole] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_location_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_location_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_location_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_location_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_location_types] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_user] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_user] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_user] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_user] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_user] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_location_code] TO [HRISUser]
DENY ALTER ON [dbo].[sec_delete_privileges] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_delete_privileges] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_delete_privileges] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_delete_privileges] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_delete_privileges] TO [HRISUser]
DENY ALTER ON [dbo].[t_position] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_position] TO [HRISUser]
GRANT DELETE ON [dbo].[t_position] TO [HRISUser]
GRANT INSERT ON [dbo].[t_position] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_position] TO [HRISUser]
GRANT SELECT ON [dbo].[t_position] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_position] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_position] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_position] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_position] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_locations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_locations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_locations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_locations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_locations] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_privileges_by_role] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_privileges_by_role] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_privileges_by_role] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_privileges_by_role] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_privileges_by_role] TO [HRISUser]
DENY ALTER ON [dbo].[payrollcode] TO [HRISUser]
GRANT CONTROL ON [dbo].[payrollcode] TO [HRISUser]
DENY DELETE ON [dbo].[payrollcode] TO [HRISUser]
GRANT INSERT ON [dbo].[payrollcode] TO [HRISUser]
GRANT REFERENCES ON [dbo].[payrollcode] TO [HRISUser]
GRANT SELECT ON [dbo].[payrollcode] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[payrollcode] TO [HRISUser]
DENY UPDATE ON [dbo].[payrollcode] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[payrollcode] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[payrollcode] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_locations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_locations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_locations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_locations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_locations] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_user_roles] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_user_roles] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_user_roles] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_user_roles] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_user_roles] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_position_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_position_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_position_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_position_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_position_status] TO [HRISUser]
DENY ALTER ON [dbo].[paf] TO [HRISUser]
GRANT CONTROL ON [dbo].[paf] TO [HRISUser]
DENY DELETE ON [dbo].[paf] TO [HRISUser]
GRANT INSERT ON [dbo].[paf] TO [HRISUser]
GRANT REFERENCES ON [dbo].[paf] TO [HRISUser]
GRANT SELECT ON [dbo].[paf] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[paf] TO [HRISUser]
GRANT UPDATE ON [dbo].[paf] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[paf] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[paf] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_user_rights] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_user_rights] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_user_rights] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_user_rights] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_user_rights] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_emp_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_emp_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_emp_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_emp_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_emp_status] TO [HRISUser]
DENY ALTER ON [dbo].[sec_delete_roles] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_delete_roles] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_delete_roles] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_delete_roles] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_delete_roles] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_occupations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_occupations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_occupations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_occupations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_occupations] TO [HRISUser]
DENY ALTER ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_deductiontype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_deductiontype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_deductiontype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_deductiontype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_deductiontype] TO [HRISUser]
DENY ALTER ON [dbo].[pr_dd_get_adjustment_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_dd_get_adjustment_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_dd_get_adjustment_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_dd_get_adjustment_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_dd_get_adjustment_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_position_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_position_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_position_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_position_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_position_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_employee] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_employee] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_employee] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_employee] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_employee] TO [HRISUser]
DENY ALTER ON [dbo].[sync_que_record] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_que_record] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_que_record] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_que_record] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_que_record] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_areas] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_areas] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_areas] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_areas] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_areas] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_occupations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_occupations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_occupations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_occupations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_occupations] TO [HRISUser]
DENY ALTER ON [dbo].[sync_xml_to_db] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_xml_to_db] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_xml_to_db] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_xml_to_db] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_xml_to_db] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_adjustment_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_adjustment_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_adjustment_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_adjustment_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_adjustment_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_levels] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_levels] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_levels] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_levels] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_levels] TO [HRISUser]
DENY ALTER ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT DELETE ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT INSERT ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT SELECT ON [dbo].[t_undertimereason] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_undertimereason] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_undertimereason] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_undertimereason] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_undertimereason] TO [HRISUser]
DENY ALTER ON [dbo].[sync_generate_xml] TO [HRISUser]
GRANT CONTROL ON [dbo].[sync_generate_xml] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sync_generate_xml] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sync_generate_xml] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sync_generate_xml] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_account_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_account_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_account_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_account_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_account_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_religions] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_religions] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_religions] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_religions] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_religions] TO [HRISUser]
DENY ALTER ON [dbo].[payroll] TO [HRISUser]
GRANT CONTROL ON [dbo].[payroll] TO [HRISUser]
DENY DELETE ON [dbo].[payroll] TO [HRISUser]
GRANT INSERT ON [dbo].[payroll] TO [HRISUser]
GRANT REFERENCES ON [dbo].[payroll] TO [HRISUser]
GRANT SELECT ON [dbo].[payroll] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[payroll] TO [HRISUser]
GRANT UPDATE ON [dbo].[payroll] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[payroll] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[payroll] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_relations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_relations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_relations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_relations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_relations] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_paf] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_paf] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_paf] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_paf] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_paf] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_provinces] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_provinces] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_provinces] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_provinces] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_provinces] TO [HRISUser]
DENY ALTER ON [dbo].[t_leavereason] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_leavereason] TO [HRISUser]
GRANT DELETE ON [dbo].[t_leavereason] TO [HRISUser]
GRANT INSERT ON [dbo].[t_leavereason] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_leavereason] TO [HRISUser]
GRANT SELECT ON [dbo].[t_leavereason] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_leavereason] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_leavereason] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_leavereason] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_leavereason] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_paf_list] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_paf_list] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_paf_list] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_paf_list] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_paf_list] TO [HRISUser]
DENY ALTER ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
GRANT SELECT ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_fn_get_payroll_details] TO [HRISUser]
DENY ALTER ON [dbo].[empfamily] TO [HRISUser]
GRANT CONTROL ON [dbo].[empfamily] TO [HRISUser]
GRANT DELETE ON [dbo].[empfamily] TO [HRISUser]
GRANT INSERT ON [dbo].[empfamily] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empfamily] TO [HRISUser]
GRANT SELECT ON [dbo].[empfamily] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[empfamily] TO [HRISUser]
GRANT UPDATE ON [dbo].[empfamily] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empfamily] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empfamily] TO [HRISUser]
DENY ALTER ON [dbo].[pr_generate_payroll_code] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_generate_payroll_code] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_generate_payroll_code] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_generate_payroll_code] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_generate_payroll_code] TO [HRISUser]
DENY ALTER ON [dbo].[pr_dd_get_deduction_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_dd_get_deduction_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_dd_get_deduction_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_dd_get_deduction_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_dd_get_deduction_types] TO [HRISUser]
GRANT ALTER ON [dbo].[empemergency] TO [HRISUser]
GRANT CONTROL ON [dbo].[empemergency] TO [HRISUser]
GRANT DELETE ON [dbo].[empemergency] TO [HRISUser]
GRANT INSERT ON [dbo].[empemergency] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empemergency] TO [HRISUser]
GRANT SELECT ON [dbo].[empemergency] TO [HRISUser]
GRANT TAKE OWNERSHIP ON [dbo].[empemergency] TO [HRISUser]
GRANT UPDATE ON [dbo].[empemergency] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empemergency] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empemergency] TO [HRISUser]
DENY ALTER ON [dbo].[t_dtrstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_dtrstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_dtrstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_dtrstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_dtrstatus] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_employees] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_employees] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_employees] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_employees] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_employees] TO [HRISUser]
DENY ALTER ON [dbo].[empcontact] TO [HRISUser]
GRANT CONTROL ON [dbo].[empcontact] TO [HRISUser]
GRANT DELETE ON [dbo].[empcontact] TO [HRISUser]
GRANT INSERT ON [dbo].[empcontact] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empcontact] TO [HRISUser]
GRANT SELECT ON [dbo].[empcontact] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[empcontact] TO [HRISUser]
GRANT UPDATE ON [dbo].[empcontact] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empcontact] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empcontact] TO [HRISUser]
DENY ALTER ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT CONTROL ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT DELETE ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT INSERT ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT REFERENCES ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT SELECT ON [dbo].[payrolldeduction] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[payrolldeduction] TO [HRISUser]
GRANT UPDATE ON [dbo].[payrolldeduction] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[payrolldeduction] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[payrolldeduction] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_overridereasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_overridereasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_overridereasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_overridereasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_overridereasons] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_deduction_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_deduction_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_deduction_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_deduction_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_deduction_types] TO [HRISUser]
DENY ALTER ON [dbo].[sysconfig] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysconfig] TO [HRISUser]
DENY DELETE ON [dbo].[sysconfig] TO [HRISUser]
GRANT INSERT ON [dbo].[sysconfig] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysconfig] TO [HRISUser]
GRANT SELECT ON [dbo].[sysconfig] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysconfig] TO [HRISUser]
DENY UPDATE ON [dbo].[sysconfig] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysconfig] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysconfig] TO [HRISUser]
DENY ALTER ON [dbo].[payrollallowance] TO [HRISUser]
GRANT CONTROL ON [dbo].[payrollallowance] TO [HRISUser]
DENY DELETE ON [dbo].[payrollallowance] TO [HRISUser]
GRANT INSERT ON [dbo].[payrollallowance] TO [HRISUser]
GRANT REFERENCES ON [dbo].[payrollallowance] TO [HRISUser]
GRANT SELECT ON [dbo].[payrollallowance] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[payrollallowance] TO [HRISUser]
GRANT UPDATE ON [dbo].[payrollallowance] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[payrollallowance] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[payrollallowance] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_levels_by_role] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_levels_by_role] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_levels_by_role] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_levels_by_role] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_levels_by_role] TO [HRISUser]
DENY ALTER ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT CONTROL ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT DELETE ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT INSERT ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT REFERENCES ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT SELECT ON [dbo].[payrolladjustment] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[payrolladjustment] TO [HRISUser]
GRANT UPDATE ON [dbo].[payrolladjustment] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[payrolladjustment] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[payrolladjustment] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_undertime_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_undertime_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_undertime_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_undertime_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_undertime_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[sec_delete_levels] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_delete_levels] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_delete_levels] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_delete_levels] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_delete_levels] TO [HRISUser]
DENY ALTER ON [dbo].[leave] TO [HRISUser]
GRANT CONTROL ON [dbo].[leave] TO [HRISUser]
DENY DELETE ON [dbo].[leave] TO [HRISUser]
GRANT INSERT ON [dbo].[leave] TO [HRISUser]
GRANT REFERENCES ON [dbo].[leave] TO [HRISUser]
GRANT SELECT ON [dbo].[leave] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[leave] TO [HRISUser]
GRANT UPDATE ON [dbo].[leave] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[leave] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[leave] TO [HRISUser]
DENY ALTER ON [dbo].[t_salaryfrequency] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY DELETE ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY INSERT ON [dbo].[t_salaryfrequency] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_salaryfrequency] TO [HRISUser]
GRANT SELECT ON [dbo].[t_salaryfrequency] TO [HRISUser]
GRANT TAKE OWNERSHIP ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY UPDATE ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_salaryfrequency] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
GRANT SELECT ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_dtr] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_allowance_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_allowance_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_allowance_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_allowance_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_allowance_types] TO [HRISUser]
DENY ALTER ON [dbo].[paf_fn_active_employees] TO [HRISUser]
GRANT CONTROL ON [dbo].[paf_fn_active_employees] TO [HRISUser]
GRANT REFERENCES ON [dbo].[paf_fn_active_employees] TO [HRISUser]
GRANT SELECT ON [dbo].[paf_fn_active_employees] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[paf_fn_active_employees] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[paf_fn_active_employees] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_religions] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_religions] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_religions] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_religions] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_religions] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_relations] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_relations] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_relations] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_relations] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_relations] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_provinces] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_provinces] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_provinces] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_provinces] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_provinces] TO [HRISUser]
DENY ALTER ON [dbo].[leavedetail] TO [HRISUser]
GRANT CONTROL ON [dbo].[leavedetail] TO [HRISUser]
GRANT DELETE ON [dbo].[leavedetail] TO [HRISUser]
GRANT INSERT ON [dbo].[leavedetail] TO [HRISUser]
GRANT REFERENCES ON [dbo].[leavedetail] TO [HRISUser]
GRANT SELECT ON [dbo].[leavedetail] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[leavedetail] TO [HRISUser]
GRANT UPDATE ON [dbo].[leavedetail] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[leavedetail] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[leavedetail] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_position_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_position_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_position_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_position_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_position_status] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empfamily] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empfamily] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empfamily] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empfamily] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empfamily] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_emp_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_emp_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_emp_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_emp_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_emp_status] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_pending_paf] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_pending_paf] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_pending_paf] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_pending_paf] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_pending_paf] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_dependents] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_dependents] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_dependents] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_dependents] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_dependents] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_allowance_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_allowance_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_allowance_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_allowance_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_allowance_types] TO [HRISUser]
DENY ALTER ON [dbo].[pr_dd_payroll_period] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_dd_payroll_period] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_dd_payroll_period] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_dd_payroll_period] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_dd_payroll_period] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_town_with_prov] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_town_with_prov] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_town_with_prov] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_town_with_prov] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_town_with_prov] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_leave_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_leave_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_leave_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_leave_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_leave_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
GRANT REFERENCES ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_fn_get_payroll_deductions] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_position] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_position] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_position] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_position] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_position] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leave_reasons_with_parent] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leave_reasons_with_parent] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leave_reasons_with_parent] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leave_reasons_with_parent] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leave_reasons_with_parent] TO [HRISUser]
DENY ALTER ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
GRANT CONTROL ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
GRANT EXECUTE ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
DENY REFERENCES ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[fn_get_sysconfig_value] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
GRANT REFERENCES ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_fn_get_concat_paf_allowances] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_positions] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_positions] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_positions] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_positions] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_positions] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leave_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leave_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leave_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leave_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leave_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_salaryfrequencies] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_salaryfrequencies] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_salaryfrequencies] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_salaryfrequencies] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_salaryfrequencies] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_by_employee] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_by_employee] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_by_employee] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_by_employee] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_by_employee] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_users] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_users] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_users] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_users] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_users] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_salary_frequencies] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_salary_frequencies] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_salary_frequencies] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_salary_frequencies] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_salary_frequencies] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_pr_deduction_summary] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_pr_deduction_summary] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_pr_deduction_summary] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_pr_deduction_summary] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_pr_deduction_summary] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_towns] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_towns] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_towns] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_towns] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_towns] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_activity_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_activity_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_activity_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_activity_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_activity_status] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_active_allowances] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_active_allowances] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_active_allowances] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_active_allowances] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_active_allowances] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_sysusers] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_sysusers] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_sysusers] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_sysusers] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_sysusers] TO [HRISUser]
GRANT ALTER ON [dbo].[hris_dd_get_activity_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_activity_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_activity_types] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_paf_signatories] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_paf_signatories] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_paf_signatories] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_paf_signatories] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_paf_signatories] TO [HRISUser]
GRANT ALTER ON [dbo].[hris_get_activity_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_activity_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_activity_status] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_payroll_deductions] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_payroll_deductions] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_payroll_deductions] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_payroll_deductions] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_payroll_deductions] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empemergency] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empemergency] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empemergency] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empemergency] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empemergency] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_payroll_allowances] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_payroll_allowances] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_payroll_allowances] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_payroll_allowances] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_payroll_allowances] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empcontact_p] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empcontact_p] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empcontact_p] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empcontact_p] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empcontact_p] TO [HRISUser]
GRANT ALTER ON [dbo].[hris_get_activity_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_activity_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_activity_types] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_payroll_adjustments] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_payroll_adjustments] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_payroll_adjustments] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_payroll_adjustments] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_payroll_adjustments] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empcontact_h] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empcontact_h] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empcontact_h] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empcontact_h] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empcontact_h] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_employees] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_employees] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_employees] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_employees] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_employees] TO [HRISUser]
DENY ALTER ON [dbo].[pr_get_payroll] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_get_payroll] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_get_payroll] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_get_payroll] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_get_payroll] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empaddress_p] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empaddress_p] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empaddress_p] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empaddress_p] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empaddress_p] TO [HRISUser]
DENY ALTER ON [dbo].[pr_close_payroll] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_close_payroll] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_close_payroll] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_close_payroll] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_close_payroll] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_empaddress_h] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_empaddress_h] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_empaddress_h] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_empaddress_h] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_empaddress_h] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_pr_variance] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_pr_variance] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_pr_variance] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_pr_variance] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_pr_variance] TO [HRISUser]
DENY ALTER ON [dbo].[pr_declare_dependents] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_declare_dependents] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_declare_dependents] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_declare_dependents] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_declare_dependents] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_by_date] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_by_date] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_by_date] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_by_date] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_by_date] TO [HRISUser]
DENY ALTER ON [dbo].[pr_generate_payroll] TO [HRISUser]
GRANT CONTROL ON [dbo].[pr_generate_payroll] TO [HRISUser]
GRANT EXECUTE ON [dbo].[pr_generate_payroll] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pr_generate_payroll] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pr_generate_payroll] TO [HRISUser]
DENY ALTER ON [dbo].[t_course] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_course] TO [HRISUser]
GRANT DELETE ON [dbo].[t_course] TO [HRISUser]
GRANT INSERT ON [dbo].[t_course] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_course] TO [HRISUser]
GRANT SELECT ON [dbo].[t_course] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_course] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_course] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_course] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_course] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_paf] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_paf] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_paf] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_paf] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_paf] TO [HRISUser]
DENY ALTER ON [dbo].[rpt_payslip] TO [HRISUser]
GRANT CONTROL ON [dbo].[rpt_payslip] TO [HRISUser]
GRANT EXECUTE ON [dbo].[rpt_payslip] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[rpt_payslip] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[rpt_payslip] TO [HRISUser]
DENY ALTER ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT CONTROL ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT DELETE ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT INSERT ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT REFERENCES ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT SELECT ON [dbo].[sysrolelevel] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT UPDATE ON [dbo].[sysrolelevel] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sysrolelevel] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[sysrolelevel] TO [HRISUser]
GRANT ALTER ON [dbo].[hris_get_activities] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_activities] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_activities] TO [HRISUser]
GRANT ALTER ON [dbo].[hris_get_activity_employees] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_activity_employees] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_activity_employees] TO [HRISUser]
DENY ALTER ON [dbo].[t_timestatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_timestatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_timestatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_timestatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_timestatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_timestatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_timestatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_timestatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_timestatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_timestatus] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_leave_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_leave_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_leave_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_leave_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_leave_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leave_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leave_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leave_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leave_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leave_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_latest_paf] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_latest_paf] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_latest_paf] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_latest_paf] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_latest_paf] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
GRANT SELECT ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_days_covered] TO [HRISUser]
DENY ALTER ON [dbo].[t_school] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_school] TO [HRISUser]
GRANT DELETE ON [dbo].[t_school] TO [HRISUser]
GRANT INSERT ON [dbo].[t_school] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_school] TO [HRISUser]
GRANT SELECT ON [dbo].[t_school] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_school] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_school] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_school] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_school] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_times] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_times] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_times] TO [HRISUser]
GRANT SELECT ON [dbo].[dtr_fn_get_times] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_times] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_times] TO [HRISUser]
DENY ALTER ON [dbo].[pafcomponent] TO [HRISUser]
GRANT CONTROL ON [dbo].[pafcomponent] TO [HRISUser]
GRANT DELETE ON [dbo].[pafcomponent] TO [HRISUser]
GRANT INSERT ON [dbo].[pafcomponent] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pafcomponent] TO [HRISUser]
GRANT SELECT ON [dbo].[pafcomponent] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pafcomponent] TO [HRISUser]
GRANT UPDATE ON [dbo].[pafcomponent] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pafcomponent] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[pafcomponent] TO [HRISUser]
DENY ALTER ON [dbo].[hris_delete_leave_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_delete_leave_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_delete_leave_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_delete_leave_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_delete_leave_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[empeducation] TO [HRISUser]
GRANT CONTROL ON [dbo].[empeducation] TO [HRISUser]
GRANT DELETE ON [dbo].[empeducation] TO [HRISUser]
GRANT INSERT ON [dbo].[empeducation] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empeducation] TO [HRISUser]
GRANT SELECT ON [dbo].[empeducation] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[empeducation] TO [HRISUser]
GRANT UPDATE ON [dbo].[empeducation] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empeducation] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empeducation] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_override_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_override_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_override_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_override_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_override_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[pafallowance] TO [HRISUser]
GRANT CONTROL ON [dbo].[pafallowance] TO [HRISUser]
GRANT DELETE ON [dbo].[pafallowance] TO [HRISUser]
GRANT INSERT ON [dbo].[pafallowance] TO [HRISUser]
GRANT REFERENCES ON [dbo].[pafallowance] TO [HRISUser]
GRANT SELECT ON [dbo].[pafallowance] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[pafallowance] TO [HRISUser]
GRANT UPDATE ON [dbo].[pafallowance] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[pafallowance] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[pafallowance] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_time_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_time_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_time_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_time_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_time_status] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leave] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leave] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leave] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leave] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leave] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_undertime_reasons] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_undertime_reasons] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_undertime_reasons] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_undertime_reasons] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_undertime_reasons] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_latest_paf_allowances] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_latest_paf_allowances] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_latest_paf_allowances] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_latest_paf_allowances] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_latest_paf_allowances] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_resource_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_paf_comp] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_paf_comp] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_paf_comp] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_paf_comp] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_paf_comp] TO [HRISUser]
DENY ALTER ON [dbo].[dtrundertime] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtrundertime] TO [HRISUser]
DENY DELETE ON [dbo].[dtrundertime] TO [HRISUser]
GRANT INSERT ON [dbo].[dtrundertime] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtrundertime] TO [HRISUser]
GRANT SELECT ON [dbo].[dtrundertime] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtrundertime] TO [HRISUser]
GRANT UPDATE ON [dbo].[dtrundertime] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtrundertime] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[dtrundertime] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_paf_allowances] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_paf_allowances] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_paf_allowances] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_paf_allowances] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_paf_allowances] TO [HRISUser]
DENY ALTER ON [dbo].[t_skill] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_skill] TO [HRISUser]
GRANT DELETE ON [dbo].[t_skill] TO [HRISUser]
GRANT INSERT ON [dbo].[t_skill] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_skill] TO [HRISUser]
GRANT SELECT ON [dbo].[t_skill] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_skill] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_skill] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_skill] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_skill] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
GRANT REFERENCES ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_total_hours] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_override_by_date_am] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_override_by_date_am] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_override_by_date_am] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_override_by_date_am] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_override_by_date_am] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_employees] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_employees] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_employees] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_employees] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_employees] TO [HRISUser]
DENY ALTER ON [dbo].[sec_get_pin] TO [HRISUser]
GRANT CONTROL ON [dbo].[sec_get_pin] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sec_get_pin] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sec_get_pin] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sec_get_pin] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_override_by_date_pm] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_override_by_date_pm] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_override_by_date_pm] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_override_by_date_pm] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_override_by_date_pm] TO [HRISUser]
DENY ALTER ON [dbo].[sys_get_sysconfig] TO [HRISUser]
GRANT CONTROL ON [dbo].[sys_get_sysconfig] TO [HRISUser]
GRANT EXECUTE ON [dbo].[sys_get_sysconfig] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[sys_get_sysconfig] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[sys_get_sysconfig] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_undertime] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_undertime] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_undertime] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_undertime] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_undertime] TO [HRISUser]
DENY ALTER ON [dbo].[dtr_get_timelog_summary] TO [HRISUser]
GRANT CONTROL ON [dbo].[dtr_get_timelog_summary] TO [HRISUser]
GRANT EXECUTE ON [dbo].[dtr_get_timelog_summary] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[dtr_get_timelog_summary] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[dtr_get_timelog_summary] TO [HRISUser]
DENY ALTER ON [dbo].[empskill] TO [HRISUser]
GRANT CONTROL ON [dbo].[empskill] TO [HRISUser]
GRANT DELETE ON [dbo].[empskill] TO [HRISUser]
GRANT INSERT ON [dbo].[empskill] TO [HRISUser]
GRANT REFERENCES ON [dbo].[empskill] TO [HRISUser]
GRANT SELECT ON [dbo].[empskill] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[empskill] TO [HRISUser]
GRANT UPDATE ON [dbo].[empskill] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[empskill] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[empskill] TO [HRISUser]
DENY ALTER ON [dbo].[hris_change_leave_status] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_change_leave_status] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_change_leave_status] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_change_leave_status] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_change_leave_status] TO [HRISUser]
DENY ALTER ON [dbo].[t_overridetype] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_overridetype] TO [HRISUser]
GRANT DELETE ON [dbo].[t_overridetype] TO [HRISUser]
GRANT INSERT ON [dbo].[t_overridetype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_overridetype] TO [HRISUser]
GRANT SELECT ON [dbo].[t_overridetype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_overridetype] TO [HRISUser]
GRANT UPDATE ON [dbo].[t_overridetype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_overridetype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_overridetype] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_leaves] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_leaves] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_leaves] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_leaves] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_leaves] TO [HRISUser]
DENY ALTER ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY INSERT ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_leaveapplicationstatus] TO [HRISUser]
DENY ALTER ON [dbo].[locationallowancetype] TO [HRISUser]
GRANT CONTROL ON [dbo].[locationallowancetype] TO [HRISUser]
DENY DELETE ON [dbo].[locationallowancetype] TO [HRISUser]
GRANT INSERT ON [dbo].[locationallowancetype] TO [HRISUser]
GRANT REFERENCES ON [dbo].[locationallowancetype] TO [HRISUser]
GRANT SELECT ON [dbo].[locationallowancetype] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[locationallowancetype] TO [HRISUser]
GRANT UPDATE ON [dbo].[locationallowancetype] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[locationallowancetype] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[locationallowancetype] TO [HRISUser]
DENY ALTER ON [dbo].[t_syncstatus] TO [HRISUser]
GRANT CONTROL ON [dbo].[t_syncstatus] TO [HRISUser]
DENY DELETE ON [dbo].[t_syncstatus] TO [HRISUser]
GRANT INSERT ON [dbo].[t_syncstatus] TO [HRISUser]
GRANT REFERENCES ON [dbo].[t_syncstatus] TO [HRISUser]
GRANT SELECT ON [dbo].[t_syncstatus] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[t_syncstatus] TO [HRISUser]
DENY UPDATE ON [dbo].[t_syncstatus] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[t_syncstatus] TO [HRISUser]
DENY VIEW CHANGE TRACKING ON [dbo].[t_syncstatus] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_am_pm] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_am_pm] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_am_pm] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_am_pm] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_am_pm] TO [HRISUser]
DENY ALTER ON [dbo].[hris_dd_get_blood_types] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_dd_get_blood_types] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_dd_get_blood_types] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_dd_get_blood_types] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_dd_get_blood_types] TO [HRISUser]
DENY ALTER ON [dbo].[hris_get_allowance_types_by_location] TO [HRISUser]
GRANT CONTROL ON [dbo].[hris_get_allowance_types_by_location] TO [HRISUser]
GRANT EXECUTE ON [dbo].[hris_get_allowance_types_by_location] TO [HRISUser]
DENY TAKE OWNERSHIP ON [dbo].[hris_get_allowance_types_by_location] TO [HRISUser]
DENY VIEW DEFINITION ON [dbo].[hris_get_allowance_types_by_location] TO [HRISUser]

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF
GO

