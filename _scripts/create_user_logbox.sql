/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    roles:
        [db_datareader], [db_datawriter]

    schemas:
        [db_datareader], [db_datawriter]

    triggers:
        [dbo].[tr_delete_synched_record], [dbo].[tr_set_location_code]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_employee], [dbo].[dtr_log_time], [dbo].[sync_generate_xml], [dbo].[sync_get_wsmessagein_status], [dbo].[sync_get_wsmessageout_status], [dbo].[sync_que_record], [dbo].[sync_set_wsmessageout_status], [dbo].[sync_xml_to_db]

    users:
        [LogBoxUser]

    tables:
        [dbo].[dtr], [dbo].[employee], [dbo].[sysconfig], [dbo].[t_dtrstatus], [dbo].[t_syncstatus], [dbo].[t_wsmessagestatus], [dbo].[t_wsmessagetype], [dbo].[wsmessagein], [dbo].[wsmessageout]

    functions:
        [dbo].[dtr_fn_get_log_status], [dbo].[dtr_fn_get_total_hours], [dbo].[fn_get_sysconfig_value]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.LogBox

   AUTHOR:	[Insert Author Name]

   DATE:	19/10/2014 7:27:43 PM

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
USE [LogBox_Live]
GO
-- Create User [LogBoxUser]
Print 'Create User [LogBoxUser]'
GO
CREATE USER [LogBoxUser]
	FOR LOGIN [LogBoxUser]
	WITH DEFAULT_SCHEMA = [dbo]
GO
--EXEC sp_droprolemember @rolename=N'db_datareader', @membername =N'gee'

GO
EXEC sp_addrolemember @rolename=N'db_datareader', @membername =N'LogBoxUser'

GO
--EXEC sp_droprolemember @rolename=N'db_datawriter', @membername =N'gee'

GO
EXEC sp_addrolemember @rolename=N'db_datawriter', @membername =N'LogBoxUser'

GO

BEGIN TRAN
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_dtrstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_wsmessagetype]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[t_wsmessagestatus]
Print 'Add Permissions To The table [dbo].[t_wsmessagestatus]'
DENY ALTER
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_wsmessagestatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_wsmessagestatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY INSERT
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[t_syncstatus]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_fn_get_log_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY ALTER
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_fn_get_total_hours]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[wsmessagein]
Print 'Add Permissions To The table [dbo].[wsmessagein]'
DENY ALTER
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT DELETE
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT UPDATE
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[wsmessagein]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[wsmessageout]
Print 'Add Permissions To The table [dbo].[wsmessageout]'
DENY ALTER
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT DELETE
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT UPDATE
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[wsmessageout]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The table [dbo].[dtr]
Print 'Add Permissions To The table [dbo].[dtr]'
DENY ALTER
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY DELETE
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT INSERT
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT SELECT
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY UPDATE
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW CHANGE TRACKING
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The function [dbo].[fn_get_sysconfig_value]
Print 'Add Permissions To The function [dbo].[fn_get_sysconfig_value]'
DENY ALTER
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT REFERENCES
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[fn_get_sysconfig_value]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[dtr_get_employee]
Print 'Add Permissions To The procedure [dbo].[dtr_get_employee]'
DENY ALTER
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]	
WITH GRANT OPTION
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_get_employee]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_que_record]
Print 'Add Permissions To The procedure [dbo].[sync_que_record]'
DENY ALTER
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_que_record]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[dtr_get_by_date]
Print 'Add Permissions To The procedure [dbo].[dtr_get_by_date]'
DENY ALTER
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_get_by_date]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_get_wsmessageout_status]
Print 'Add Permissions To The procedure [dbo].[sync_get_wsmessageout_status]'
DENY ALTER
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_get_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_set_wsmessageout_status]
Print 'Add Permissions To The procedure [dbo].[sync_set_wsmessageout_status]'
DENY ALTER
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_set_wsmessageout_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_xml_to_db]
Print 'Add Permissions To The procedure [dbo].[sync_xml_to_db]'
DENY ALTER
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_xml_to_db]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[dtr_log_time]
Print 'Add Permissions To The procedure [dbo].[dtr_log_time]'
DENY ALTER
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[dtr_log_time]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_generate_xml]
Print 'Add Permissions To The procedure [dbo].[sync_generate_xml]'
DENY ALTER
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_generate_xml]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Permissions To The procedure [dbo].[sync_get_wsmessagein_status]
Print 'Add Permissions To The procedure [dbo].[sync_get_wsmessagein_status]'
DENY ALTER
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT CONTROL
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
GRANT EXECUTE
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY TAKE OWNERSHIP
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
DENY VIEW DEFINITION
	ON [dbo].[sync_get_wsmessagein_status]
	TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
GRANT CONTROL ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
GRANT REFERENCES ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
GRANT SELECT ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY ALTER ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY DELETE ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY INSERT ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY TAKE OWNERSHIP ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY UPDATE ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY VIEW CHANGE TRACKING ON [dbo].[sysconfig] TO [LogBoxUser]
GO
use [LogBox_Micro]
GO
DENY VIEW DEFINITION ON [dbo].[sysconfig] TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter the authorization for Schema [db_datareader]
Print 'Alter the authorization for Schema [db_datareader]'
GO
ALTER AUTHORIZATION
	ON SCHEMA::[db_datareader]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Alter the authorization for Schema [db_datawriter]
Print 'Alter the authorization for Schema [db_datawriter]'
GO
ALTER AUTHORIZATION
	ON SCHEMA::[db_datawriter]
	TO [LogBoxUser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

