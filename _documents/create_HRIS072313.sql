
USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_accessadmin')      
     EXEC (N'CREATE SCHEMA db_accessadmin')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_backupoperator')      
     EXEC (N'CREATE SCHEMA db_backupoperator')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datareader')      
     EXEC (N'CREATE SCHEMA db_datareader')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datawriter')      
     EXEC (N'CREATE SCHEMA db_datawriter')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_ddladmin')      
     EXEC (N'CREATE SCHEMA db_ddladmin')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatareader')      
     EXEC (N'CREATE SCHEMA db_denydatareader')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatawriter')      
     EXEC (N'CREATE SCHEMA db_denydatawriter')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_owner')      
     EXEC (N'CREATE SCHEMA db_owner')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_securityadmin')      
     EXEC (N'CREATE SCHEMA db_securityadmin')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'dbo')      
     EXEC (N'CREATE SCHEMA dbo')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'guest')      
     EXEC (N'CREATE SCHEMA guest')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'INFORMATION_SCHEMA')      
     EXEC (N'CREATE SCHEMA INFORMATION_SCHEMA')                                   
 GO                                                               

USE hris
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'sys')      
     EXEC (N'CREATE SCHEMA sys')                                   
 GO                                                               

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'allowance'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'allowance'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[allowance]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[allowance]
(
   [allowance_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [allowance_type] varchar(100) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [allowance_remarks] varchar(250) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL,
   [allowance_amount] decimal(6, 2) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.allowance',
        N'SCHEMA', N'dbo',
        N'TABLE', N'allowance'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'award'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'award'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[award]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[award]
(
   [employee_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [award_name] varchar(50) DEFAULT NULL  NULL,
   [award_date] date DEFAULT NULL  NULL,
   [award_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(1) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(1) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.award',
        N'SCHEMA', N'dbo',
        N'TABLE', N'award'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'branch'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'branch'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[branch]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[branch]
(

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [branch_name] varchar(50)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [branch_address] varchar(250) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [branch_telephone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [branch_cellphone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [branch_email] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [added_date] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [updated_date] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.branch',
        N'SCHEMA', N'dbo',
        N'TABLE', N'branch'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'course'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'course'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[course]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[course]
(
   [course_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [course_name] varchar(70)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.course',
        N'SCHEMA', N'dbo',
        N'TABLE', N'course'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'dtr'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'dtr'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[dtr]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[dtr]
(
   [dtr_id] int  NOT NULL,
   [employee_id] int  NOT NULL,
   [dtr_date] date  NOT NULL,
   [dtr_in_am] datetime2(0) DEFAULT NULL  NULL,
   [dtr_out_am] datetime2(0) DEFAULT NULL  NULL,
   [dtr_in_pm] datetime2(0) DEFAULT NULL  NULL,
   [dtr_out_pm] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [dtr_remarks] varchar(70) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.dtr',
        N'SCHEMA', N'dbo',
        N'TABLE', N'dtr'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'edit_log'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'edit_log'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[edit_log]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[edit_log]
(
   [log_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [log_table] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [log_field] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [log_value] varchar(45) DEFAULT NULL  NULL,
   [log_date] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [log_remarks] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [iscancelled] char(1) DEFAULT N'N'  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.edit_log',
        N'SCHEMA', N'dbo',
        N'TABLE', N'edit_log'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'educationalattainment'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'educationalattainment'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[educationalattainment]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[educationalattainment]
(
   [educationalattainment_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [educationalattainment_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.educationalattainment',
        N'SCHEMA', N'dbo',
        N'TABLE', N'educationalattainment'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empassignment'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'empassignment'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[empassignment]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[empassignment]
(
   [empassignment_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3)  NOT NULL,
   [employee_id] int  NOT NULL,
   [date_from] date  NOT NULL,
   [date_until] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.empassignment',
        N'SCHEMA', N'dbo',
        N'TABLE', N'empassignment'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employee'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employee'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employee]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employee]
(
   [employee_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_firstname] varchar(45)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_lastname] varchar(45)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_middlename] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [employee_company_id] char(5) DEFAULT NULL  NULL,
   [employee_birthdate] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [employee_gender] char(8) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [employee_civil_status] char(10) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_photo] varchar(150) DEFAULT NULL  NULL,
   [employee_height] decimal(10, 2) DEFAULT NULL  NULL,
   [employee_weight] decimal(10, 2) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_tin] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_sss] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_hdmf] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_phic] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_driver_license] varchar(45) DEFAULT NULL  NULL,
   [religion_id] int DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_cellphone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_telephone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_email] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employee_blood_type] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [added_date] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [updated_date] datetime2(0) DEFAULT NULL  NULL,
   [employee_date_hired] date DEFAULT NULL  NULL,
   [employee_regularization_date] date DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employee',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employee'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeaddress'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeeaddress'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeeaddress]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeeaddress]
(
   [employeeaddress_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [address_type] char(15) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [address_address] varchar(250) DEFAULT NULL  NULL,
   [province_id] int DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL,
   [employee_id] int DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeeaddress',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeeaddress'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeallowance'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeeallowance'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeeallowance]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeeallowance]
(
   [emp_allowance_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [date_from] date  NOT NULL,
   [date_until] date DEFAULT NULL  NULL,
   [emp_allowance_amount] decimal(6, 2)  NOT NULL,
   [allowance_type_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeeallowance',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeeallowance'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeeducation'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeeeducation'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeeeducation]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeeeducation]
(
   [employee_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeeeducation_yearstarted] varchar(4) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeeeducation_yearended] varchar(4) DEFAULT NULL  NULL,
   [school_id] int DEFAULT NULL  NULL,
   [course_id] int DEFAULT NULL  NULL,
   [educationalattainment_id] int DEFAULT NULL  NULL,
   [employeeeducation_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeeeducation',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeeeducation'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeexamination'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeeexamination'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeeexamination]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeeexamination]
(
   [employee_id] int  NOT NULL,
   [employeeexamination_date] date DEFAULT NULL  NULL,
   [employeeexamination_rating] decimal(3, 2) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeeexamination_venue] varchar(100) DEFAULT NULL  NULL,
   [examination_id] int IDENTITY(1, 1)  NOT NULL,
   [employeeexamination_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeeexamination',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeeexamination'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeefamily'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeefamily'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeefamily]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeefamily]
(
   [employee_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_firstname] varchar(50)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_lastname] varchar(50)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_middlename] varchar(50) DEFAULT NULL  NULL,
   [employeefamily_birthdate] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_telephone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_celphone] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [employeefamily_email] varchar(45) DEFAULT NULL  NULL,
   [employeefamily_isbenefeciary] int DEFAULT NULL  NULL,
   [employeefamily_orderprioritybenefeciary] int DEFAULT NULL  NULL,
   [employeefamily_isdependent] int DEFAULT NULL  NULL,
   [occupation_id] int DEFAULT NULL  NULL,
   [employeefamily_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [relationship] char(20) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeefamily',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeefamily'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeskill'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeeskill'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeeskill]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeeskill]
(
   [employee_id] int  NOT NULL,
   [skill_id] int  NOT NULL,
   [employeeskill_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeeskill',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeeskill'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeetraining'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'employeetraining'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[employeetraining]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[employeetraining]
(
   [employee_training_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [training_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.employeetraining',
        N'SCHEMA', N'dbo',
        N'TABLE', N'employeetraining'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empposition'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'empposition'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[empposition]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[empposition]
(
   [empposition_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [position_id] int  NOT NULL,
   [date_from] date  NOT NULL,
   [date_until] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.empposition',
        N'SCHEMA', N'dbo',
        N'TABLE', N'empposition'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empsalary'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'empsalary'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[empsalary]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[empsalary]
(
   [empsalary_id] int IDENTITY(1, 1)  NOT NULL,
   [date_from] date  NOT NULL,
   [date_until] date DEFAULT NULL  NULL,
   [employee_id] int  NOT NULL,
   [salary] decimal(8, 2)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.empsalary',
        N'SCHEMA', N'dbo',
        N'TABLE', N'empsalary'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empstatus'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'empstatus'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[empstatus]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[empstatus]
(
   [empstatus_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [date_from] date DEFAULT NULL  NULL,
   [date_until] date DEFAULT NULL  NULL,
   [statustype_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.empstatus',
        N'SCHEMA', N'dbo',
        N'TABLE', N'empstatus'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'examination'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'examination'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[examination]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[examination]
(
   [examination_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [examination_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.examination',
        N'SCHEMA', N'dbo',
        N'TABLE', N'examination'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'holiday'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'holiday'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[holiday]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[holiday]
(
   [holiday_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [holiday_name] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [holiday_office] varchar(45) DEFAULT NULL  NULL,
   [date_from] date DEFAULT NULL  NULL,
   [date_to] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [holiday_description] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [holiday_type] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [iscancelled] char(1) DEFAULT N'N'  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.holiday',
        N'SCHEMA', N'dbo',
        N'TABLE', N'holiday'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'insurance'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'insurance'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[insurance]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[insurance]
(
   [insurance_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [insurance_name] varchar(50)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [insurance_type] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [insurance_policynumber] varchar(50) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [insurance_coverage] varchar(50) DEFAULT NULL  NULL,
   [insurance_premium] decimal(8, 2) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.insurance',
        N'SCHEMA', N'dbo',
        N'TABLE', N'insurance'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leave'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'leave'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[leave]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[leave]
(
   [leave_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [date_filed] datetime2(0) DEFAULT NULL  NULL,
   [date_from] date DEFAULT NULL  NULL,
   [date_until] date DEFAULT NULL  NULL,
   [leavetype_id] int  NOT NULL,
   [approved_by] int DEFAULT NULL  NULL,
   [date_approved] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [reason] varchar(250) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [cancelled] char(1) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [with_pay] char(1) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [is_halfday] char(1) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [halfday_AMPM] char(2) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [remarks] varchar(250) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.`leave`',
        N'SCHEMA', N'dbo',
        N'TABLE', N'leave'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leavecredit'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'leavecredit'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[leavecredit]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[leavecredit]
(
   [leavecredit_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [leavetype_id] int  NOT NULL,
   [credit_sl] float(24) DEFAULT NULL  NULL,
   [credit_vl] float(24) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [remarks] varchar(250) DEFAULT NULL  NULL,
   [date_from] date DEFAULT NULL  NULL,
   [date_until] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.leavecredit',
        N'SCHEMA', N'dbo',
        N'TABLE', N'leavecredit'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leavetype'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'leavetype'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[leavetype]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[leavetype]
(
   [leavetype_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [leavetype_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [leave_credit_type] char(10) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.leavetype',
        N'SCHEMA', N'dbo',
        N'TABLE', N'leavetype'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'logemployee'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'logemployee'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[logemployee]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[logemployee]
(
   [employee_id] int  NOT NULL,
   [employee_name] varchar(100)  NOT NULL,
   [employee_password] varchar(45) DEFAULT (NULL)  NULL,
   [employee_position] varchar(70) DEFAULT (NULL)  NULL
)
GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'occupation'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'occupation'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[occupation]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[occupation]
(
   [occupation_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [occupation_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.occupation',
        N'SCHEMA', N'dbo',
        N'TABLE', N'occupation'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'organization'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'organization'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[organization]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[organization]
(
   [organization_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [organization_name] varchar(60)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [organization_position] varchar(50) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [organization_remarks] varchar(200) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.organization',
        N'SCHEMA', N'dbo',
        N'TABLE', N'organization'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'paf'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'paf'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[paf]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[paf]
(
   [paf_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [paf_type_id] int  NOT NULL,
   [paf_date] datetime2(0)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [edited_by] char(25) DEFAULT NULL  NULL,
   [date_edited] datetime2(0) DEFAULT NULL  NULL,
   [effectivity_date] date DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.paf',
        N'SCHEMA', N'dbo',
        N'TABLE', N'paf'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'paf_type'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'paf_type'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[paf_type]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[paf_type]
(
   [paf_type_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [paf_type_name] varchar(45)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.paf_type',
        N'SCHEMA', N'dbo',
        N'TABLE', N'paf_type'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'payrollperiod'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'payrollperiod'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[payrollperiod]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[payrollperiod]
(
   [payrolperiod_id] int IDENTITY(1, 1)  NOT NULL,
   [date_from] date  NOT NULL,
   [date_until] date  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.payrollperiod',
        N'SCHEMA', N'dbo',
        N'TABLE', N'payrollperiod'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'position'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'position'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[position]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[position]
(
   [position_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [position_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [position_joblevel] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.`position`',
        N'SCHEMA', N'dbo',
        N'TABLE', N'position'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'province'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'province'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[province]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[province]
(
   [province_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [province_name] varchar(100)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.province',
        N'SCHEMA', N'dbo',
        N'TABLE', N'province'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'religion'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'religion'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[religion]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[religion]
(
   [religion_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [religion_name] varchar(100)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.religion',
        N'SCHEMA', N'dbo',
        N'TABLE', N'religion'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'roleright'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'roleright'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[roleright]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[roleright]
(

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [role_code] char(25)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [right_code] char(25)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.roleright',
        N'SCHEMA', N'dbo',
        N'TABLE', N'roleright'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'school'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'school'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[school]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[school]
(
   [school_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [school_name] varchar(100)  NOT NULL,
   [province_id] int DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.school',
        N'SCHEMA', N'dbo',
        N'TABLE', N'school'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'skeletal'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'skeletal'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[skeletal]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[skeletal]
(
   [skeletal_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [skeletal_date] date  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [skeletal_remarks] varchar(80) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.skeletal',
        N'SCHEMA', N'dbo',
        N'TABLE', N'skeletal'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'skill'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'skill'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[skill]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[skill]
(
   [skill_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [skill_name] varchar(100)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.skill',
        N'SCHEMA', N'dbo',
        N'TABLE', N'skill'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'statustype'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'statustype'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[statustype]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[statustype]
(
   [statustype_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [statustype_name] varchar(100) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.statustype',
        N'SCHEMA', N'dbo',
        N'TABLE', N'statustype'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'systemright'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'systemright'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[systemright]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[systemright]
(

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [right_code] char(25)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [right_name] varchar(100) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [right_description] varchar(200) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.systemright',
        N'SCHEMA', N'dbo',
        N'TABLE', N'systemright'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'systemrole'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'systemrole'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[systemrole]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[systemrole]
(

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [role_code] char(25)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [role_name] varchar(100) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [role_description] varchar(200) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.systemrole',
        N'SCHEMA', N'dbo',
        N'TABLE', N'systemrole'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'systemuser'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'systemuser'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[systemuser]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[systemuser]
(
   [user_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [password] char(15) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [username] char(25)  NOT NULL,
   [is_active] int DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.systemuser',
        N'SCHEMA', N'dbo',
        N'TABLE', N'systemuser'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'training'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'training'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[training]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[training]
(
   [training_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [training_name] varchar(100)  NOT NULL,
   [training_date] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [training_venue] varchar(100) DEFAULT NULL  NULL,
   [training_no_of_participants] int DEFAULT NULL  NULL,
   [training_rating] int DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [training_remarks] varchar(150) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.training',
        N'SCHEMA', N'dbo',
        N'TABLE', N'training'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'training_speaker'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'training_speaker'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[training_speaker]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[training_speaker]
(
   [training_speaker_id] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [training_speaker_name] varchar(85)  NOT NULL,
   [training_speaker_rating] int DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [training_speaker_remarks] varchar(150) DEFAULT NULL  NULL,
   [training_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [added_by] char(25) DEFAULT NULL  NULL,
   [date_added] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [updated_by] char(25) DEFAULT NULL  NULL,
   [date_updated] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.training_speaker',
        N'SCHEMA', N'dbo',
        N'TABLE', N'training_speaker'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'undertime'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'undertime'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[undertime]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[undertime]
(
   [undertime_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [undertime_datefiled] date  NOT NULL,
   [undertime_date] date  NOT NULL,
   [undertime_timefrom] datetime2(0)  NOT NULL,
   [undertime_timeto] datetime2(0)  NOT NULL,
   [undertime__approvedby] int DEFAULT NULL  NULL,
   [undertime_datetimeapproved] datetime2(0) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [undertime_reason] varchar(150) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [undertime_status] varchar(45) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [iscancelled] char(1) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [undertime_remarks] varchar(150) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [branch_code] char(3) DEFAULT NULL  NULL,
   [actual_timeto] datetime2(0) DEFAULT NULL  NULL,
   [actual_timefrom] datetime2(0) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.undertime',
        N'SCHEMA', N'dbo',
        N'TABLE', N'undertime'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'userrole'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'userrole'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[userrole]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[userrole]
(
   [user_id] int  NOT NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to CHAR according to character set mapping for latin1 character set
   */

   [role_code] char(25)  NOT NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.userrole',
        N'SCHEMA', N'dbo',
        N'TABLE', N'userrole'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'workexperience'  AND sc.name=N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'workexperience'  AND sc.name=N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[workexperience]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[workexperience]
(
   [workexperience_id] int IDENTITY(1, 1)  NOT NULL,
   [employee_id] int  NOT NULL,
   [workexperience_datefrom] date DEFAULT NULL  NULL,
   [workexperience_dateto] date DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [workexperience_companyname] varchar(50) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [workexperience_position] varchar(50) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [workexperience_status] varchar(50) DEFAULT NULL  NULL,

   /*
   *   SSMA informational messages:
   *   M2SS0055: Data type was converted to VARCHAR according to character set mapping for latin1 character set
   */

   [workexperience_remarks] varchar(200) DEFAULT NULL  NULL
)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'hris.workexperience',
        N'SCHEMA', N'dbo',
        N'TABLE', N'workexperience'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_allowance_allowance_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[allowance] DROP CONSTRAINT [PK_allowance_allowance_id]
 GO



ALTER TABLE [dbo].[allowance]
 ADD CONSTRAINT [PK_allowance_allowance_id]
 PRIMARY KEY 
   CLUSTERED ([allowance_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_award_award_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[award] DROP CONSTRAINT [PK_award_award_id]
 GO



ALTER TABLE [dbo].[award]
 ADD CONSTRAINT [PK_award_award_id]
 PRIMARY KEY 
   CLUSTERED ([award_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_branch_branch_code'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[branch] DROP CONSTRAINT [PK_branch_branch_code]
 GO



ALTER TABLE [dbo].[branch]
 ADD CONSTRAINT [PK_branch_branch_code]
 PRIMARY KEY 
   CLUSTERED ([branch_code] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_course_course_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[course] DROP CONSTRAINT [PK_course_course_id]
 GO



ALTER TABLE [dbo].[course]
 ADD CONSTRAINT [PK_course_course_id]
 PRIMARY KEY 
   CLUSTERED ([course_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_dtr_dtr_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [PK_dtr_dtr_id]
 GO



ALTER TABLE [dbo].[dtr]
 ADD CONSTRAINT [PK_dtr_dtr_id]
 PRIMARY KEY 
   CLUSTERED ([dtr_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_edit_log_log_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[edit_log] DROP CONSTRAINT [PK_edit_log_log_id]
 GO



ALTER TABLE [dbo].[edit_log]
 ADD CONSTRAINT [PK_edit_log_log_id]
 PRIMARY KEY 
   CLUSTERED ([log_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_educationalattainment_educationalattainment_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[educationalattainment] DROP CONSTRAINT [PK_educationalattainment_educationalattainment_id]
 GO



ALTER TABLE [dbo].[educationalattainment]
 ADD CONSTRAINT [PK_educationalattainment_educationalattainment_id]
 PRIMARY KEY 
   CLUSTERED ([educationalattainment_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_empassignment_empassignment_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[empassignment] DROP CONSTRAINT [PK_empassignment_empassignment_id]
 GO



ALTER TABLE [dbo].[empassignment]
 ADD CONSTRAINT [PK_empassignment_empassignment_id]
 PRIMARY KEY 
   CLUSTERED ([empassignment_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employee_employee_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [PK_employee_employee_id]
 GO



ALTER TABLE [dbo].[employee]
 ADD CONSTRAINT [PK_employee_employee_id]
 PRIMARY KEY 
   CLUSTERED ([employee_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeeaddress_employeeaddress_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeeaddress] DROP CONSTRAINT [PK_employeeaddress_employeeaddress_id]
 GO



ALTER TABLE [dbo].[employeeaddress]
 ADD CONSTRAINT [PK_employeeaddress_employeeaddress_id]
 PRIMARY KEY 
   CLUSTERED ([employeeaddress_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeeallowance_emp_allowance_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeeallowance] DROP CONSTRAINT [PK_employeeallowance_emp_allowance_id]
 GO



ALTER TABLE [dbo].[employeeallowance]
 ADD CONSTRAINT [PK_employeeallowance_emp_allowance_id]
 PRIMARY KEY 
   CLUSTERED ([emp_allowance_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeeeducation_employeeeducation_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeeeducation] DROP CONSTRAINT [PK_employeeeducation_employeeeducation_id]
 GO



ALTER TABLE [dbo].[employeeeducation]
 ADD CONSTRAINT [PK_employeeeducation_employeeeducation_id]
 PRIMARY KEY 
   CLUSTERED ([employeeeducation_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeeexamination_employeeexamination_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeeexamination] DROP CONSTRAINT [PK_employeeexamination_employeeexamination_id]
 GO



ALTER TABLE [dbo].[employeeexamination]
 ADD CONSTRAINT [PK_employeeexamination_employeeexamination_id]
 PRIMARY KEY 
   CLUSTERED ([employeeexamination_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeefamily_employeefamily_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeefamily] DROP CONSTRAINT [PK_employeefamily_employeefamily_id]
 GO



ALTER TABLE [dbo].[employeefamily]
 ADD CONSTRAINT [PK_employeefamily_employeefamily_id]
 PRIMARY KEY 
   CLUSTERED ([employeefamily_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeeskill_employeeskill_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeeskill] DROP CONSTRAINT [PK_employeeskill_employeeskill_id]
 GO



ALTER TABLE [dbo].[employeeskill]
 ADD CONSTRAINT [PK_employeeskill_employeeskill_id]
 PRIMARY KEY 
   CLUSTERED ([employeeskill_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_employeetraining_employee_training_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[employeetraining] DROP CONSTRAINT [PK_employeetraining_employee_training_id]
 GO



ALTER TABLE [dbo].[employeetraining]
 ADD CONSTRAINT [PK_employeetraining_employee_training_id]
 PRIMARY KEY 
   CLUSTERED ([employee_training_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_empposition_empposition_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[empposition] DROP CONSTRAINT [PK_empposition_empposition_id]
 GO



ALTER TABLE [dbo].[empposition]
 ADD CONSTRAINT [PK_empposition_empposition_id]
 PRIMARY KEY 
   CLUSTERED ([empposition_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_empsalary_empsalary_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[empsalary] DROP CONSTRAINT [PK_empsalary_empsalary_id]
 GO



ALTER TABLE [dbo].[empsalary]
 ADD CONSTRAINT [PK_empsalary_empsalary_id]
 PRIMARY KEY 
   CLUSTERED ([empsalary_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_empstatus_empstatus_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[empstatus] DROP CONSTRAINT [PK_empstatus_empstatus_id]
 GO



ALTER TABLE [dbo].[empstatus]
 ADD CONSTRAINT [PK_empstatus_empstatus_id]
 PRIMARY KEY 
   CLUSTERED ([empstatus_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_examination_examination_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[examination] DROP CONSTRAINT [PK_examination_examination_id]
 GO



ALTER TABLE [dbo].[examination]
 ADD CONSTRAINT [PK_examination_examination_id]
 PRIMARY KEY 
   CLUSTERED ([examination_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_holiday_holiday_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[holiday] DROP CONSTRAINT [PK_holiday_holiday_id]
 GO



ALTER TABLE [dbo].[holiday]
 ADD CONSTRAINT [PK_holiday_holiday_id]
 PRIMARY KEY 
   CLUSTERED ([holiday_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_insurance_insurance_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [PK_insurance_insurance_id]
 GO



ALTER TABLE [dbo].[insurance]
 ADD CONSTRAINT [PK_insurance_insurance_id]
 PRIMARY KEY 
   CLUSTERED ([insurance_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_leave_leave_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [PK_leave_leave_id]
 GO



ALTER TABLE [dbo].[leave]
 ADD CONSTRAINT [PK_leave_leave_id]
 PRIMARY KEY 
   CLUSTERED ([leave_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_leavecredit_leavecredit_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [PK_leavecredit_leavecredit_id]
 GO



ALTER TABLE [dbo].[leavecredit]
 ADD CONSTRAINT [PK_leavecredit_leavecredit_id]
 PRIMARY KEY 
   CLUSTERED ([leavecredit_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_leavetype_leavetype_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[leavetype] DROP CONSTRAINT [PK_leavetype_leavetype_id]
 GO



ALTER TABLE [dbo].[leavetype]
 ADD CONSTRAINT [PK_leavetype_leavetype_id]
 PRIMARY KEY 
   CLUSTERED ([leavetype_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_logemployee_employee_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[logemployee] DROP CONSTRAINT [PK_logemployee_employee_id]
 GO



ALTER TABLE [dbo].[logemployee]
 ADD CONSTRAINT [PK_logemployee_employee_id]
 PRIMARY KEY 
   CLUSTERED ([employee_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_occupation_occupation_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[occupation] DROP CONSTRAINT [PK_occupation_occupation_id]
 GO



ALTER TABLE [dbo].[occupation]
 ADD CONSTRAINT [PK_occupation_occupation_id]
 PRIMARY KEY 
   CLUSTERED ([occupation_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_organization_organization_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[organization] DROP CONSTRAINT [PK_organization_organization_id]
 GO



ALTER TABLE [dbo].[organization]
 ADD CONSTRAINT [PK_organization_organization_id]
 PRIMARY KEY 
   CLUSTERED ([organization_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_paf_paf_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [PK_paf_paf_id]
 GO



ALTER TABLE [dbo].[paf]
 ADD CONSTRAINT [PK_paf_paf_id]
 PRIMARY KEY 
   CLUSTERED ([paf_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_paf_type_paf_type_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[paf_type] DROP CONSTRAINT [PK_paf_type_paf_type_id]
 GO



ALTER TABLE [dbo].[paf_type]
 ADD CONSTRAINT [PK_paf_type_paf_type_id]
 PRIMARY KEY 
   CLUSTERED ([paf_type_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_payrollperiod_payrolperiod_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[payrollperiod] DROP CONSTRAINT [PK_payrollperiod_payrolperiod_id]
 GO



ALTER TABLE [dbo].[payrollperiod]
 ADD CONSTRAINT [PK_payrollperiod_payrolperiod_id]
 PRIMARY KEY 
   CLUSTERED ([payrolperiod_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_position_position_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[position] DROP CONSTRAINT [PK_position_position_id]
 GO



ALTER TABLE [dbo].[position]
 ADD CONSTRAINT [PK_position_position_id]
 PRIMARY KEY 
   CLUSTERED ([position_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_province_province_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[province] DROP CONSTRAINT [PK_province_province_id]
 GO



ALTER TABLE [dbo].[province]
 ADD CONSTRAINT [PK_province_province_id]
 PRIMARY KEY 
   CLUSTERED ([province_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_religion_religion_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[religion] DROP CONSTRAINT [PK_religion_religion_id]
 GO



ALTER TABLE [dbo].[religion]
 ADD CONSTRAINT [PK_religion_religion_id]
 PRIMARY KEY 
   CLUSTERED ([religion_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_school_school_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[school] DROP CONSTRAINT [PK_school_school_id]
 GO



ALTER TABLE [dbo].[school]
 ADD CONSTRAINT [PK_school_school_id]
 PRIMARY KEY 
   CLUSTERED ([school_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_skeletal_skeletal_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[skeletal] DROP CONSTRAINT [PK_skeletal_skeletal_id]
 GO



ALTER TABLE [dbo].[skeletal]
 ADD CONSTRAINT [PK_skeletal_skeletal_id]
 PRIMARY KEY 
   CLUSTERED ([skeletal_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_skill_skill_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[skill] DROP CONSTRAINT [PK_skill_skill_id]
 GO



ALTER TABLE [dbo].[skill]
 ADD CONSTRAINT [PK_skill_skill_id]
 PRIMARY KEY 
   CLUSTERED ([skill_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_statustype_statustype_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[statustype] DROP CONSTRAINT [PK_statustype_statustype_id]
 GO



ALTER TABLE [dbo].[statustype]
 ADD CONSTRAINT [PK_statustype_statustype_id]
 PRIMARY KEY 
   CLUSTERED ([statustype_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_systemright_right_code'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[systemright] DROP CONSTRAINT [PK_systemright_right_code]
 GO



ALTER TABLE [dbo].[systemright]
 ADD CONSTRAINT [PK_systemright_right_code]
 PRIMARY KEY 
   CLUSTERED ([right_code] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_systemrole_role_code'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[systemrole] DROP CONSTRAINT [PK_systemrole_role_code]
 GO



ALTER TABLE [dbo].[systemrole]
 ADD CONSTRAINT [PK_systemrole_role_code]
 PRIMARY KEY 
   CLUSTERED ([role_code] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_systemuser_user_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[systemuser] DROP CONSTRAINT [PK_systemuser_user_id]
 GO



ALTER TABLE [dbo].[systemuser]
 ADD CONSTRAINT [PK_systemuser_user_id]
 PRIMARY KEY 
   CLUSTERED ([user_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_training_training_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[training] DROP CONSTRAINT [PK_training_training_id]
 GO



ALTER TABLE [dbo].[training]
 ADD CONSTRAINT [PK_training_training_id]
 PRIMARY KEY 
   CLUSTERED ([training_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_training_speaker_training_speaker_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[training_speaker] DROP CONSTRAINT [PK_training_speaker_training_speaker_id]
 GO



ALTER TABLE [dbo].[training_speaker]
 ADD CONSTRAINT [PK_training_speaker_training_speaker_id]
 PRIMARY KEY 
   CLUSTERED ([training_speaker_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_undertime_undertime_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[undertime] DROP CONSTRAINT [PK_undertime_undertime_id]
 GO



ALTER TABLE [dbo].[undertime]
 ADD CONSTRAINT [PK_undertime_undertime_id]
 PRIMARY KEY 
   CLUSTERED ([undertime_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'PK_workexperience_workexperience_id'  AND sc.name=N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[workexperience] DROP CONSTRAINT [PK_workexperience_workexperience_id]
 GO



ALTER TABLE [dbo].[workexperience]
 ADD CONSTRAINT [PK_workexperience_workexperience_id]
 PRIMARY KEY 
   CLUSTERED ([workexperience_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'allowance$c_allowance_description_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[allowance] DROP CONSTRAINT [allowance$c_allowance_description_UNIQUE]
 GO



ALTER TABLE [dbo].[allowance]
 ADD CONSTRAINT [allowance$c_allowance_description_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([allowance_type] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'course$c_course_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[course] DROP CONSTRAINT [course$c_course_name_UNIQUE]
 GO



ALTER TABLE [dbo].[course]
 ADD CONSTRAINT [course$c_course_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([course_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'educationalattainment$c_educationalattainment_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[educationalattainment] DROP CONSTRAINT [educationalattainment$c_educationalattainment_name_UNIQUE]
 GO



ALTER TABLE [dbo].[educationalattainment]
 ADD CONSTRAINT [educationalattainment$c_educationalattainment_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([educationalattainment_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'examination$c_examination_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[examination] DROP CONSTRAINT [examination$c_examination_name_UNIQUE]
 GO



ALTER TABLE [dbo].[examination]
 ADD CONSTRAINT [examination$c_examination_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([examination_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leavetype$c_leavetype_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[leavetype] DROP CONSTRAINT [leavetype$c_leavetype_UNIQUE]
 GO



ALTER TABLE [dbo].[leavetype]
 ADD CONSTRAINT [leavetype$c_leavetype_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([leavetype_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'logemployee$employee_id_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[logemployee] DROP CONSTRAINT [logemployee$employee_id_UNIQUE]
 GO



ALTER TABLE [dbo].[logemployee]
 ADD CONSTRAINT [logemployee$employee_id_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([employee_id] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'occupation$c_occupation_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[occupation] DROP CONSTRAINT [occupation$c_occupation_name_UNIQUE]
 GO



ALTER TABLE [dbo].[occupation]
 ADD CONSTRAINT [occupation$c_occupation_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([occupation_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'province$c_province_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[province] DROP CONSTRAINT [province$c_province_name_UNIQUE]
 GO



ALTER TABLE [dbo].[province]
 ADD CONSTRAINT [province$c_province_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([province_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'religion$c_religion_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[religion] DROP CONSTRAINT [religion$c_religion_name_UNIQUE]
 GO



ALTER TABLE [dbo].[religion]
 ADD CONSTRAINT [religion$c_religion_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([religion_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'skill$c_skill_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[skill] DROP CONSTRAINT [skill$c_skill_name_UNIQUE]
 GO



ALTER TABLE [dbo].[skill]
 ADD CONSTRAINT [skill$c_skill_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([skill_name] ASC)

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'systemuser$user_name_UNIQUE'  AND sc.name=N'dbo'  AND type in (N'UQ'))
ALTER TABLE [dbo].[systemuser] DROP CONSTRAINT [systemuser$user_name_UNIQUE]
 GO



ALTER TABLE [dbo].[systemuser]
 ADD CONSTRAINT [systemuser$user_name_UNIQUE]
 UNIQUE 
   NONCLUSTERED ([username] ASC)

GO


USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empassignment'  AND sc.name = N'dbo'  AND si.name = N'fk_empassignment_branch' AND so.type in (N'U'))
   DROP INDEX [dbo].[empassignment].[fk_empassignment_branch] 
GO
CREATE NONCLUSTERED INDEX [fk_empassignment_branch] ON [dbo].[empassignment]
(
   [branch_code] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empassignment'  AND sc.name = N'dbo'  AND si.name = N'fk_empassignment_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[empassignment].[fk_empassignment_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_empassignment_employee] ON [dbo].[empassignment]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeaddress'  AND sc.name = N'dbo'  AND si.name = N'fk_employeeaddress_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeaddress].[fk_employeeaddress_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_employeeaddress_employee] ON [dbo].[employeeaddress]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeaddress'  AND sc.name = N'dbo'  AND si.name = N'fk_employeeaddress_province' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeaddress].[fk_employeeaddress_province] 
GO
CREATE NONCLUSTERED INDEX [fk_employeeaddress_province] ON [dbo].[employeeaddress]
(
   [province_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeallowance'  AND sc.name = N'dbo'  AND si.name = N'fk_employeeallowance_allowance' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeallowance].[fk_employeeallowance_allowance] 
GO
CREATE NONCLUSTERED INDEX [fk_employeeallowance_allowance] ON [dbo].[employeeallowance]
(
   [allowance_type_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeallowance'  AND sc.name = N'dbo'  AND si.name = N'fk_employeeallowance_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeallowance].[fk_employeeallowance_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_employeeallowance_employee] ON [dbo].[employeeallowance]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeetraining'  AND sc.name = N'dbo'  AND si.name = N'fk_employeetraining_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeetraining].[fk_employeetraining_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_employeetraining_employee] ON [dbo].[employeetraining]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empposition'  AND sc.name = N'dbo'  AND si.name = N'fk_empposition_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[empposition].[fk_empposition_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_empposition_employee] ON [dbo].[empposition]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empposition'  AND sc.name = N'dbo'  AND si.name = N'fk_empposition_position' AND so.type in (N'U'))
   DROP INDEX [dbo].[empposition].[fk_empposition_position] 
GO
CREATE NONCLUSTERED INDEX [fk_empposition_position] ON [dbo].[empposition]
(
   [position_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empsalary'  AND sc.name = N'dbo'  AND si.name = N'fk_empsalary_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[empsalary].[fk_empsalary_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_empsalary_employee] ON [dbo].[empsalary]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empstatus'  AND sc.name = N'dbo'  AND si.name = N'fk_empstatus_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[empstatus].[fk_empstatus_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_empstatus_employee] ON [dbo].[empstatus]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'empstatus'  AND sc.name = N'dbo'  AND si.name = N'fk_empstatus_statustype' AND so.type in (N'U'))
   DROP INDEX [dbo].[empstatus].[fk_empstatus_statustype] 
GO
CREATE NONCLUSTERED INDEX [fk_empstatus_statustype] ON [dbo].[empstatus]
(
   [empstatus_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'roleright'  AND sc.name = N'dbo'  AND si.name = N'fk_roleright_systemright' AND so.type in (N'U'))
   DROP INDEX [dbo].[roleright].[fk_roleright_systemright] 
GO
CREATE NONCLUSTERED INDEX [fk_roleright_systemright] ON [dbo].[roleright]
(
   [right_code] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'roleright'  AND sc.name = N'dbo'  AND si.name = N'fk_roleright_systemrole' AND so.type in (N'U'))
   DROP INDEX [dbo].[roleright].[fk_roleright_systemrole] 
GO
CREATE NONCLUSTERED INDEX [fk_roleright_systemrole] ON [dbo].[roleright]
(
   [role_code] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'skeletal'  AND sc.name = N'dbo'  AND si.name = N'fk_skeletal_branch' AND so.type in (N'U'))
   DROP INDEX [dbo].[skeletal].[fk_skeletal_branch] 
GO
CREATE NONCLUSTERED INDEX [fk_skeletal_branch] ON [dbo].[skeletal]
(
   [branch_code] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'skeletal'  AND sc.name = N'dbo'  AND si.name = N'fk_skeletal_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[skeletal].[fk_skeletal_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_skeletal_employee] ON [dbo].[skeletal]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'systemuser'  AND sc.name = N'dbo'  AND si.name = N'fk_systemuser_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[systemuser].[fk_systemuser_employee] 
GO
CREATE NONCLUSTERED INDEX [fk_systemuser_employee] ON [dbo].[systemuser]
(
   [user_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'userrole'  AND sc.name = N'dbo'  AND si.name = N'fk_userrole_systemrole' AND so.type in (N'U'))
   DROP INDEX [dbo].[userrole].[fk_userrole_systemrole] 
GO
CREATE NONCLUSTERED INDEX [fk_userrole_systemrole] ON [dbo].[userrole]
(
   [role_code] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'userrole'  AND sc.name = N'dbo'  AND si.name = N'fk_userrole_systemuser' AND so.type in (N'U'))
   DROP INDEX [dbo].[userrole].[fk_userrole_systemuser] 
GO
CREATE NONCLUSTERED INDEX [fk_userrole_systemuser] ON [dbo].[userrole]
(
   [user_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'award'  AND sc.name = N'dbo'  AND si.name = N'fkaward_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[award].[fkaward_employee] 
GO
CREATE NONCLUSTERED INDEX [fkaward_employee] ON [dbo].[award]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'school'  AND sc.name = N'dbo'  AND si.name = N'fkc_school_c_province' AND so.type in (N'U'))
   DROP INDEX [dbo].[school].[fkc_school_c_province] 
GO
CREATE NONCLUSTERED INDEX [fkc_school_c_province] ON [dbo].[school]
(
   [province_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'dtr'  AND sc.name = N'dbo'  AND si.name = N'fkdtr_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[dtr].[fkdtr_employee] 
GO
CREATE NONCLUSTERED INDEX [fkdtr_employee] ON [dbo].[dtr]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employee'  AND sc.name = N'dbo'  AND si.name = N'fkemployee_c_religion' AND so.type in (N'U'))
   DROP INDEX [dbo].[employee].[fkemployee_c_religion] 
GO
CREATE NONCLUSTERED INDEX [fkemployee_c_religion] ON [dbo].[employee]
(
   [religion_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeeducation'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeeducation_c_educationalattainment' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeeducation].[fkemployeeeducation_c_educationalattainment] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeeducation_c_educationalattainment] ON [dbo].[employeeeducation]
(
   [educationalattainment_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeeducation'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeeducation_c_school' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeeducation].[fkemployeeeducation_c_school] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeeducation_c_school] ON [dbo].[employeeeducation]
(
   [school_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeeducation'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeeducation_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeeducation].[fkemployeeeducation_employee] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeeducation_employee] ON [dbo].[employeeeducation]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeeducation'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeeduccation_c_course' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeeducation].[fkemployeeeduccation_c_course] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeeduccation_c_course] ON [dbo].[employeeeducation]
(
   [course_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeexamination'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeexamination_c_examination' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeexamination].[fkemployeeexamination_c_examination] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeexamination_c_examination] ON [dbo].[employeeexamination]
(
   [examination_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeexamination'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeexamination_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeexamination].[fkemployeeexamination_employee] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeexamination_employee] ON [dbo].[employeeexamination]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeefamily'  AND sc.name = N'dbo'  AND si.name = N'fkemployeefamily_c_occupation' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeefamily].[fkemployeefamily_c_occupation] 
GO
CREATE NONCLUSTERED INDEX [fkemployeefamily_c_occupation] ON [dbo].[employeefamily]
(
   [occupation_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeefamily'  AND sc.name = N'dbo'  AND si.name = N'fkemployeefamily_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeefamily].[fkemployeefamily_employee] 
GO
CREATE NONCLUSTERED INDEX [fkemployeefamily_employee] ON [dbo].[employeefamily]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeskill'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeskill_c_skill' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeskill].[fkemployeeskill_c_skill] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeskill_c_skill] ON [dbo].[employeeskill]
(
   [skill_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeeskill'  AND sc.name = N'dbo'  AND si.name = N'fkemployeeskill_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeeskill].[fkemployeeskill_employee] 
GO
CREATE NONCLUSTERED INDEX [fkemployeeskill_employee] ON [dbo].[employeeskill]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'employeetraining'  AND sc.name = N'dbo'  AND si.name = N'fkemployeetraining_c_training' AND so.type in (N'U'))
   DROP INDEX [dbo].[employeetraining].[fkemployeetraining_c_training] 
GO
CREATE NONCLUSTERED INDEX [fkemployeetraining_c_training] ON [dbo].[employeetraining]
(
   [training_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'insurance'  AND sc.name = N'dbo'  AND si.name = N'fkinsurance_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[insurance].[fkinsurance_employee] 
GO
CREATE NONCLUSTERED INDEX [fkinsurance_employee] ON [dbo].[insurance]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'leave'  AND sc.name = N'dbo'  AND si.name = N'fkleave_c_leavetype' AND so.type in (N'U'))
   DROP INDEX [dbo].[leave].[fkleave_c_leavetype] 
GO
CREATE NONCLUSTERED INDEX [fkleave_c_leavetype] ON [dbo].[leave]
(
   [leavetype_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'leave'  AND sc.name = N'dbo'  AND si.name = N'fkleave_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[leave].[fkleave_employee] 
GO
CREATE NONCLUSTERED INDEX [fkleave_employee] ON [dbo].[leave]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'leavecredit'  AND sc.name = N'dbo'  AND si.name = N'fkleavecredit_c_leavetype' AND so.type in (N'U'))
   DROP INDEX [dbo].[leavecredit].[fkleavecredit_c_leavetype] 
GO
CREATE NONCLUSTERED INDEX [fkleavecredit_c_leavetype] ON [dbo].[leavecredit]
(
   [leavetype_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'leavecredit'  AND sc.name = N'dbo'  AND si.name = N'fkleavecredit_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[leavecredit].[fkleavecredit_employee] 
GO
CREATE NONCLUSTERED INDEX [fkleavecredit_employee] ON [dbo].[leavecredit]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'organization'  AND sc.name = N'dbo'  AND si.name = N'fkorganization_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[organization].[fkorganization_employee] 
GO
CREATE NONCLUSTERED INDEX [fkorganization_employee] ON [dbo].[organization]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'paf'  AND sc.name = N'dbo'  AND si.name = N'fkpaf_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[paf].[fkpaf_employee] 
GO
CREATE NONCLUSTERED INDEX [fkpaf_employee] ON [dbo].[paf]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'paf'  AND sc.name = N'dbo'  AND si.name = N'fkpaf_paf_type' AND so.type in (N'U'))
   DROP INDEX [dbo].[paf].[fkpaf_paf_type] 
GO
CREATE NONCLUSTERED INDEX [fkpaf_paf_type] ON [dbo].[paf]
(
   [paf_type_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'training_speaker'  AND sc.name = N'dbo'  AND si.name = N'fktrainingspeaker_training' AND so.type in (N'U'))
   DROP INDEX [dbo].[training_speaker].[fktrainingspeaker_training] 
GO
CREATE NONCLUSTERED INDEX [fktrainingspeaker_training] ON [dbo].[training_speaker]
(
   [training_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'undertime'  AND sc.name = N'dbo'  AND si.name = N'fkundertime_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[undertime].[fkundertime_employee] 
GO
CREATE NONCLUSTERED INDEX [fkundertime_employee] ON [dbo].[undertime]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF  EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'workexperience'  AND sc.name = N'dbo'  AND si.name = N'fkworkexperience_employee' AND so.type in (N'U'))
   DROP INDEX [dbo].[workexperience].[fkworkexperience_employee] 
GO
CREATE NONCLUSTERED INDEX [fkworkexperience_employee] ON [dbo].[workexperience]
(
   [employee_id] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
GO

USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'award$fkaward_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[award] DROP CONSTRAINT [award$fkaward_employee]
 GO



ALTER TABLE [dbo].[award]
 ADD CONSTRAINT [award$fkaward_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'dtr$fkdtr_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [dtr$fkdtr_employee]
 GO



ALTER TABLE [dbo].[dtr]
 ADD CONSTRAINT [dtr$fkdtr_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empassignment$fk_empassignment_branch'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empassignment] DROP CONSTRAINT [empassignment$fk_empassignment_branch]
 GO



ALTER TABLE [dbo].[empassignment]
 ADD CONSTRAINT [empassignment$fk_empassignment_branch]
 FOREIGN KEY 
   ([branch_code])
 REFERENCES 
   [hris].[dbo].[branch]     ([branch_code])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empassignment$fk_empassignment_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empassignment] DROP CONSTRAINT [empassignment$fk_empassignment_employee]
 GO



ALTER TABLE [dbo].[empassignment]
 ADD CONSTRAINT [empassignment$fk_empassignment_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employee$fkemployee_c_religion'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [employee$fkemployee_c_religion]
 GO



ALTER TABLE [dbo].[employee]
 ADD CONSTRAINT [employee$fkemployee_c_religion]
 FOREIGN KEY 
   ([religion_id])
 REFERENCES 
   [hris].[dbo].[religion]     ([religion_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeaddress$fk_employeeaddress_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeaddress] DROP CONSTRAINT [employeeaddress$fk_employeeaddress_employee]
 GO



ALTER TABLE [dbo].[employeeaddress]
 ADD CONSTRAINT [employeeaddress$fk_employeeaddress_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeaddress$fk_employeeaddress_province'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeaddress] DROP CONSTRAINT [employeeaddress$fk_employeeaddress_province]
 GO



ALTER TABLE [dbo].[employeeaddress]
 ADD CONSTRAINT [employeeaddress$fk_employeeaddress_province]
 FOREIGN KEY 
   ([province_id])
 REFERENCES 
   [hris].[dbo].[province]     ([province_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeallowance$fk_employeeallowance_allowance'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeallowance] DROP CONSTRAINT [employeeallowance$fk_employeeallowance_allowance]
 GO



ALTER TABLE [dbo].[employeeallowance]
 ADD CONSTRAINT [employeeallowance$fk_employeeallowance_allowance]
 FOREIGN KEY 
   ([allowance_type_id])
 REFERENCES 
   [hris].[dbo].[allowance]     ([allowance_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeallowance$fk_employeeallowance_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeallowance] DROP CONSTRAINT [employeeallowance$fk_employeeallowance_employee]
 GO



ALTER TABLE [dbo].[employeeallowance]
 ADD CONSTRAINT [employeeallowance$fk_employeeallowance_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeeducation$fkemployeeeducation_c_educationalattainment'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeeducation] DROP CONSTRAINT [employeeeducation$fkemployeeeducation_c_educationalattainment]
 GO



ALTER TABLE [dbo].[employeeeducation]
 ADD CONSTRAINT [employeeeducation$fkemployeeeducation_c_educationalattainment]
 FOREIGN KEY 
   ([educationalattainment_id])
 REFERENCES 
   [hris].[dbo].[educationalattainment]     ([educationalattainment_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeeducation$fkemployeeeducation_c_school'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeeducation] DROP CONSTRAINT [employeeeducation$fkemployeeeducation_c_school]
 GO



ALTER TABLE [dbo].[employeeeducation]
 ADD CONSTRAINT [employeeeducation$fkemployeeeducation_c_school]
 FOREIGN KEY 
   ([school_id])
 REFERENCES 
   [hris].[dbo].[school]     ([school_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeeducation$fkemployeeeducation_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeeducation] DROP CONSTRAINT [employeeeducation$fkemployeeeducation_employee]
 GO



ALTER TABLE [dbo].[employeeeducation]
 ADD CONSTRAINT [employeeeducation$fkemployeeeducation_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeeducation$fkemployeeeduccation_c_course'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeeducation] DROP CONSTRAINT [employeeeducation$fkemployeeeduccation_c_course]
 GO



ALTER TABLE [dbo].[employeeeducation]
 ADD CONSTRAINT [employeeeducation$fkemployeeeduccation_c_course]
 FOREIGN KEY 
   ([course_id])
 REFERENCES 
   [hris].[dbo].[course]     ([course_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeexamination$fkemployeeexamination_c_examination'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeexamination] DROP CONSTRAINT [employeeexamination$fkemployeeexamination_c_examination]
 GO



ALTER TABLE [dbo].[employeeexamination]
 ADD CONSTRAINT [employeeexamination$fkemployeeexamination_c_examination]
 FOREIGN KEY 
   ([examination_id])
 REFERENCES 
   [hris].[dbo].[examination]     ([examination_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeexamination$fkemployeeexamination_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeexamination] DROP CONSTRAINT [employeeexamination$fkemployeeexamination_employee]
 GO



ALTER TABLE [dbo].[employeeexamination]
 ADD CONSTRAINT [employeeexamination$fkemployeeexamination_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeefamily$fkemployeefamily_c_occupation'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeefamily] DROP CONSTRAINT [employeefamily$fkemployeefamily_c_occupation]
 GO



ALTER TABLE [dbo].[employeefamily]
 ADD CONSTRAINT [employeefamily$fkemployeefamily_c_occupation]
 FOREIGN KEY 
   ([occupation_id])
 REFERENCES 
   [hris].[dbo].[occupation]     ([occupation_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeefamily$fkemployeefamily_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeefamily] DROP CONSTRAINT [employeefamily$fkemployeefamily_employee]
 GO



ALTER TABLE [dbo].[employeefamily]
 ADD CONSTRAINT [employeefamily$fkemployeefamily_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeskill$fkemployeeskill_c_skill'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeskill] DROP CONSTRAINT [employeeskill$fkemployeeskill_c_skill]
 GO



ALTER TABLE [dbo].[employeeskill]
 ADD CONSTRAINT [employeeskill$fkemployeeskill_c_skill]
 FOREIGN KEY 
   ([skill_id])
 REFERENCES 
   [hris].[dbo].[skill]     ([skill_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeeskill$fkemployeeskill_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeeskill] DROP CONSTRAINT [employeeskill$fkemployeeskill_employee]
 GO



ALTER TABLE [dbo].[employeeskill]
 ADD CONSTRAINT [employeeskill$fkemployeeskill_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeetraining$fkemployeetraining_c_training'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeetraining] DROP CONSTRAINT [employeetraining$fkemployeetraining_c_training]
 GO



ALTER TABLE [dbo].[employeetraining]
 ADD CONSTRAINT [employeetraining$fkemployeetraining_c_training]
 FOREIGN KEY 
   ([training_id])
 REFERENCES 
   [hris].[dbo].[training]     ([training_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'employeetraining$fk_employeetraining_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[employeetraining] DROP CONSTRAINT [employeetraining$fk_employeetraining_employee]
 GO



ALTER TABLE [dbo].[employeetraining]
 ADD CONSTRAINT [employeetraining$fk_employeetraining_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empposition$fk_empposition_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empposition] DROP CONSTRAINT [empposition$fk_empposition_employee]
 GO



ALTER TABLE [dbo].[empposition]
 ADD CONSTRAINT [empposition$fk_empposition_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empposition$fk_empposition_position'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empposition] DROP CONSTRAINT [empposition$fk_empposition_position]
 GO



ALTER TABLE [dbo].[empposition]
 ADD CONSTRAINT [empposition$fk_empposition_position]
 FOREIGN KEY 
   ([position_id])
 REFERENCES 
   [hris].[dbo].[position]     ([position_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empsalary$fk_empsalary_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empsalary] DROP CONSTRAINT [empsalary$fk_empsalary_employee]
 GO



ALTER TABLE [dbo].[empsalary]
 ADD CONSTRAINT [empsalary$fk_empsalary_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empstatus$fk_empstatus_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empstatus] DROP CONSTRAINT [empstatus$fk_empstatus_employee]
 GO



ALTER TABLE [dbo].[empstatus]
 ADD CONSTRAINT [empstatus$fk_empstatus_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'empstatus$fk_empstatus_statustype'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[empstatus] DROP CONSTRAINT [empstatus$fk_empstatus_statustype]
 GO



ALTER TABLE [dbo].[empstatus]
 ADD CONSTRAINT [empstatus$fk_empstatus_statustype]
 FOREIGN KEY 
   ([empstatus_id])
 REFERENCES 
   [hris].[dbo].[statustype]     ([statustype_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'insurance$fkinsurance_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [insurance$fkinsurance_employee]
 GO



ALTER TABLE [dbo].[insurance]
 ADD CONSTRAINT [insurance$fkinsurance_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leave$fkleave_c_leavetype'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [leave$fkleave_c_leavetype]
 GO



ALTER TABLE [dbo].[leave]
 ADD CONSTRAINT [leave$fkleave_c_leavetype]
 FOREIGN KEY 
   ([leavetype_id])
 REFERENCES 
   [hris].[dbo].[leavetype]     ([leavetype_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leave$fkleave_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[leave] DROP CONSTRAINT [leave$fkleave_employee]
 GO



ALTER TABLE [dbo].[leave]
 ADD CONSTRAINT [leave$fkleave_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leavecredit$fkleavecredit_c_leavetype'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [leavecredit$fkleavecredit_c_leavetype]
 GO



ALTER TABLE [dbo].[leavecredit]
 ADD CONSTRAINT [leavecredit$fkleavecredit_c_leavetype]
 FOREIGN KEY 
   ([leavetype_id])
 REFERENCES 
   [hris].[dbo].[leavetype]     ([leavetype_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'leavecredit$fkleavecredit_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [leavecredit$fkleavecredit_employee]
 GO



ALTER TABLE [dbo].[leavecredit]
 ADD CONSTRAINT [leavecredit$fkleavecredit_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'organization$fkorganization_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[organization] DROP CONSTRAINT [organization$fkorganization_employee]
 GO



ALTER TABLE [dbo].[organization]
 ADD CONSTRAINT [organization$fkorganization_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'paf$fkpaf_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [paf$fkpaf_employee]
 GO



ALTER TABLE [dbo].[paf]
 ADD CONSTRAINT [paf$fkpaf_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'paf$fkpaf_paf_type'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [paf$fkpaf_paf_type]
 GO



ALTER TABLE [dbo].[paf]
 ADD CONSTRAINT [paf$fkpaf_paf_type]
 FOREIGN KEY 
   ([paf_type_id])
 REFERENCES 
   [hris].[dbo].[paf_type]     ([paf_type_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'roleright$fk_roleright_systemright'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[roleright] DROP CONSTRAINT [roleright$fk_roleright_systemright]
 GO



ALTER TABLE [dbo].[roleright]
 ADD CONSTRAINT [roleright$fk_roleright_systemright]
 FOREIGN KEY 
   ([right_code])
 REFERENCES 
   [hris].[dbo].[systemright]     ([right_code])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'roleright$fk_roleright_systemrole'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[roleright] DROP CONSTRAINT [roleright$fk_roleright_systemrole]
 GO



ALTER TABLE [dbo].[roleright]
 ADD CONSTRAINT [roleright$fk_roleright_systemrole]
 FOREIGN KEY 
   ([role_code])
 REFERENCES 
   [hris].[dbo].[systemrole]     ([role_code])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'school$fkc_school_c_province'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[school] DROP CONSTRAINT [school$fkc_school_c_province]
 GO



ALTER TABLE [dbo].[school]
 ADD CONSTRAINT [school$fkc_school_c_province]
 FOREIGN KEY 
   ([province_id])
 REFERENCES 
   [hris].[dbo].[province]     ([province_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'skeletal$fk_skeletal_branch'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[skeletal] DROP CONSTRAINT [skeletal$fk_skeletal_branch]
 GO



ALTER TABLE [dbo].[skeletal]
 ADD CONSTRAINT [skeletal$fk_skeletal_branch]
 FOREIGN KEY 
   ([branch_code])
 REFERENCES 
   [hris].[dbo].[branch]     ([branch_code])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'skeletal$fk_skeletal_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[skeletal] DROP CONSTRAINT [skeletal$fk_skeletal_employee]
 GO



ALTER TABLE [dbo].[skeletal]
 ADD CONSTRAINT [skeletal$fk_skeletal_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'systemuser$fk_systemuser_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[systemuser] DROP CONSTRAINT [systemuser$fk_systemuser_employee]
 GO



ALTER TABLE [dbo].[systemuser]
 ADD CONSTRAINT [systemuser$fk_systemuser_employee]
 FOREIGN KEY 
   ([user_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'training_speaker$fktrainingspeaker_training'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[training_speaker] DROP CONSTRAINT [training_speaker$fktrainingspeaker_training]
 GO



ALTER TABLE [dbo].[training_speaker]
 ADD CONSTRAINT [training_speaker$fktrainingspeaker_training]
 FOREIGN KEY 
   ([training_id])
 REFERENCES 
   [hris].[dbo].[training]     ([training_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'undertime$fkundertime_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[undertime] DROP CONSTRAINT [undertime$fkundertime_employee]
 GO



ALTER TABLE [dbo].[undertime]
 ADD CONSTRAINT [undertime$fkundertime_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'userrole$fk_userrole_systemrole'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[userrole] DROP CONSTRAINT [userrole$fk_userrole_systemrole]
 GO



ALTER TABLE [dbo].[userrole]
 ADD CONSTRAINT [userrole$fk_userrole_systemrole]
 FOREIGN KEY 
   ([role_code])
 REFERENCES 
   [hris].[dbo].[systemrole]     ([role_code])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'userrole$fk_userrole_systemuser'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[userrole] DROP CONSTRAINT [userrole$fk_userrole_systemuser]
 GO



ALTER TABLE [dbo].[userrole]
 ADD CONSTRAINT [userrole$fk_userrole_systemuser]
 FOREIGN KEY 
   ([user_id])
 REFERENCES 
   [hris].[dbo].[systemuser]     ([user_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'workexperience$fkworkexperience_employee'  AND sc.name=N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[workexperience] DROP CONSTRAINT [workexperience$fkworkexperience_employee]
 GO



ALTER TABLE [dbo].[workexperience]
 ADD CONSTRAINT [workexperience$fkworkexperience_employee]
 FOREIGN KEY 
   ([employee_id])
 REFERENCES 
   [hris].[dbo].[employee]     ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

GO


USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_delete_rolerights'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_delete_rolerights]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_delete_rolerights]
	@role_code char(25)
AS
BEGIN
	delete from roleright where role_code = @role_code
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_password_by_user_id'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_password_by_user_id]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_password_by_user_id]
	@user_id int
AS
BEGIN
	select "password"
	from systemuser u
	where u.user_id = @user_id
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_rights_by_role'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_rights_by_role]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_rights_by_role]
	@role_code char(25)
AS
BEGIN
	select rr.role_code 
		,rr.right_code
		,r.right_name
	from roleright rr
		inner join systemright r on r.right_code = rr.right_code
	where rr.role_code = @role_code 
	order by r.right_name		
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_rights_by_user'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_rights_by_user]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_rights_by_user]
 @user_id int
AS
BEGIN
 select distinct right_code
 from roleright
 where role_code in (select role_code from userrole where "user_id" = @user_id)
END



GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_roles'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_roles]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_roles]
AS
BEGIN
	select * from systemrole
	order by role_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_roles_by_user'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_roles_by_user]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_roles_by_user]
	@user_id integer
AS
BEGIN
	select ur."user_id" 
		,ur.role_code
		,r.role_name
	from userrole ur
		inner join systemrole r on r.role_code = ur.role_code
	where "user_id" = @user_id
	order by r.role_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_unassigned_rights_by_role'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_unassigned_rights_by_role]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_unassigned_rights_by_role]
	@role_code char(25)
AS
BEGIN
	select r.right_code
		,r.right_name
	from systemright r 
	where r.right_code not in (select rr.right_code from roleright rr where rr.role_code = @role_code)
	order by r.right_name		
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_unassigned_roles_by_user'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_unassigned_roles_by_user]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[oct_sp_sec_get_unassigned_roles_by_user]
 @user_id integer
AS
BEGIN
 select r.role_code
  ,r.role_name
 from systemrole r
 where r.role_code not in (select ur.role_code from userrole ur where ur."user_id" = @user_id)
 order by r.role_name
END



GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'oct_sp_sec_get_users'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[oct_sp_sec_get_users]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[oct_sp_sec_get_users]
AS
BEGIN
	select * from systemuser
	order by username
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_allowance'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_allowance]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 04/01/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_allowance] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from allowance 
			order by allowance.allowance_type
			
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_branch'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_branch]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 3/25/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_branch]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from branch
			order by branch.branch_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_course'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_course]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 3/25/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_course]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from course
	        order by course.course_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_educational_attainment'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_educational_attainment]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03/21/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_educational_attainment]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from educationalattainment
			order by educationalattainment.educationalattainment_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_empassignment_by_employee'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_empassignment_by_employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 07/22/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_empassignment_by_employee]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from empassignment order by empassignment.date_from
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03-14-13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from employee
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_address'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_address]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 04/22/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_address]
	@spvar_employeeid integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from employeeaddress 
			where employeeaddress.employee_id = @spvar_employeeid
			
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_allowance'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_allowance]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 07/22/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_allowance]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from employeeallowance order by employeeallowance.date_from
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_position'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_position]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 07/18/13
-- Description:	display employee position
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_position]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from empposition order by empposition.date_from desc

END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_salary_by_employee'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_salary_by_employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 07/22/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_salary_by_employee]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from empsalary order by empsalary.date_from
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_search'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03-14-13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_search]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	       ,e.employee_lastname + ', ' + e.employee_firstname + ' ' + SUBSTRING(e.employee_middlename,1,1) + '.' as 'Employee'
	
		  from employee e order by e.employee_lastname
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employee_status'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employee_status]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 07/18/13
-- Description:	display employee status
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employee_status]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from empstatus order by empstatus.date_from desc
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employeeeducation'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employeeeducation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 04/03/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employeeeducation]
  
  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from employeeeducation
			order by employeeeducation.employeeeducation_yearstarted
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_employeeeducation_display'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_employeeeducation_display]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 4/16/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_employeeeducation_display]
	@spvar_employeeid integer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from employeeeducation 
	       left join course on course.course_id = employeeeducation.course_id
	       left join school on school.school_id = employeeeducation.school_id
	       left join educationalattainment on educationalattainment.educationalattainment_id = employeeeducation.educationalattainment_id
	       where employeeeducation.employee_id = @spvar_employeeid
	       order by employeeeducation.employeeeducation_yearstarted
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_examination'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_examination]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03/21/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_examination]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from examination
			order by examination.examination_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_leavetype'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_leavetype]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 04/01/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_leavetype] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from leavetype
	       order by leavetype.leavetype_name
END


GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_occupation'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_occupation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 3/21/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_occupation]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from occupation 
			order by occupation.occupation_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_paf_by_employee'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_paf_by_employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 07/18/13
-- Description:	display paf per employee
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_paf_by_employee]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from paf 
			inner join paf_type on paf_type.paf_type_id = paf.paf_id
	        order by paf.paf_date
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_paf_type'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_paf_type]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 07/22/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_paf_type]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from paf_type order by paf_type.paf_type_name
END

GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_position'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_position]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 3/25/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_position]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from position
			order by position.position_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_province'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_province]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 3/21/13 AT HOME
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_province]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from province
			order by province.province_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_religion'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_religion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM		
-- Create date: 03/25/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_religion]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from religion
			order by religion.religion_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_school'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_school]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03-18-13
-- Description:	created at home
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_school]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from school order by school.school_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_school_unite_province'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_school_unite_province]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 03/20/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_school_unite_province]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from school
			inner join province on province.province_id = school.province_id
			order by school.school_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_skill'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_skill]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM	
-- Create date: 3/25/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_skill]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from skill
			order by skill.skill_name
END




GO
GO

USE hris
GO
IF  EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'sp_get_statustype'  AND sc.name=N'dbo'  AND type in (N'P'))
 DROP PROCEDURE [dbo].[sp_get_statustype]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GVM
-- Create date: 04/01/13
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_statustype]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from statustype
	       order by statustype.statustype_name
END


GO
GO
