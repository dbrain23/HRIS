/*
   Monday, 15 November 20219:56:29 AM
   User: 
   Server: BRYAN\DEVELOPMENT
   Database: HRIS_Live
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.t_adjustmenttype ADD
	is_allowance_adjustment bit NOT NULL CONSTRAINT DF_t_adjustmenttype_is_allowance_adjustment DEFAULT 0
GO
ALTER TABLE dbo.t_adjustmenttype SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.t_adjustmenttype', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.t_adjustmenttype', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.t_adjustmenttype', 'Object', 'CONTROL') as Contr_Per 