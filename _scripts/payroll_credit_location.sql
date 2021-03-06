/*
   Saturday, 7 October 20179:42:24 AM
   User: 
   Server: BRYAN\DEVELOPMENT
   Database: HRIS
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
ALTER TABLE dbo.location SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.location', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.location', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.location', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.payroll ADD
	credit_location char(3) NULL
GO
DECLARE @v sql_variant 
SET @v = N'Location where this payroll will be credited. If NULL, employee''s parent location is used.'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'payroll', N'COLUMN', N'credit_location'
GO
ALTER TABLE dbo.payroll ADD CONSTRAINT
	FK_payroll_location FOREIGN KEY
	(
	credit_location
	) REFERENCES dbo.location
	(
	location_code
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.payroll SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.payroll', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.payroll', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.payroll', 'Object', 'CONTROL') as Contr_Per 