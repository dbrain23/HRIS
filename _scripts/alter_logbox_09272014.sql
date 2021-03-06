/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_delete_synched_record]

    procedures:
        [dbo].[sync_dtr_que], [dbo].[sync_generate_xml], [dbo].[sync_get_wsmessage_status], [dbo].[sync_get_wsmessagein_status], [dbo].[sync_get_wsmessageout_status], [dbo].[sync_set_wsmessage_status], [dbo].[sync_set_wsmessageout_status], [dbo].[sync_xml_to_db]

    tables:
        [dbo].[dtr], [dbo].[t_wsmessagestatus], [dbo].[wsmessage], [dbo].[wsmessagein], [dbo].[wsmessageout]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	28/09/2014 8:50:07 PM

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

BEGIN TRAN
GO


delete from wsmessageout

-- Drop Procedure [dbo].[sync_dtr_que]
Print 'Drop Procedure [dbo].[sync_dtr_que]'
GO
DROP PROCEDURE [dbo].[sync_dtr_que]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Procedure [dbo].[sync_generate_xml]
Print 'Drop Procedure [dbo].[sync_generate_xml]'
GO
DROP PROCEDURE [dbo].[sync_generate_xml]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Default Constraint DF_wsmessage_priority from [dbo].[wsmessage]
Print 'Drop Default Constraint DF_wsmessage_priority from [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage] DROP CONSTRAINT [DF_wsmessage_priority]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_wsmessage from [dbo].[wsmessage]
Print 'Drop Primary Key PK_wsmessage from [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage] DROP CONSTRAINT [PK_wsmessage]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Primary Key PK_wsmessageout from [dbo].[wsmessageout]
Print 'Drop Primary Key PK_wsmessageout from [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [PK_wsmessageout]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_wsmessagestatus]
Print 'Create Table [dbo].[t_wsmessagestatus]'
GO
CREATE TABLE [dbo].[t_wsmessagestatus] (
		[messagestatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagestatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagestatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_wsmessagestatus to [dbo].[t_wsmessagestatus]
Print 'Add Primary Key PK_t_wsmessagestatus to [dbo].[t_wsmessagestatus]'
GO
ALTER TABLE [dbo].[t_wsmessagestatus]
	ADD
	CONSTRAINT [PK_t_wsmessagestatus]
	PRIMARY KEY
	CLUSTERED
	([messagestatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_wsmessagestatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
EXEC sp_rename @objname = N'[dbo].[wsmessageout]', @newname = N'temp686625489', @objtype = 'OBJECT'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessageout]
Print 'Create Table [dbo].[wsmessageout]'
GO
CREATE TABLE [dbo].[wsmessageout] (
		[event_object]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pk_event_object]        [int] NOT NULL,
		[ws_message_date]        [datetime] NOT NULL,
		[priority]               [smallint] NULL,
		[messagetype_code]       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagestatus_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessageout_is_sent to [dbo].[wsmessageout]
Print 'Add Default Constraint DF_wsmessageout_is_sent to [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	ADD
	CONSTRAINT [DF_wsmessageout_is_sent]
	DEFAULT ((0)) FOR [messagestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[wsmessageout] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp686625489 into the table [dbo].[wsmessageout]
-- Restore data
IF OBJECT_ID('[dbo].temp686625489') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[wsmessageout]') AND [type]='U')
EXEC sp_executesql N'
INSERT INTO [dbo].[wsmessageout] ([event_object], [pk_event_object], [ws_message_date])
   SELECT [event_object], [pk_event_object], [ws_message_date] FROM [dbo].temp686625489
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_wsmessageout to [dbo].[wsmessageout]
Print 'Add Primary Key PK_wsmessageout to [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	ADD
	CONSTRAINT [PK_wsmessageout]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp686625489
IF OBJECT_ID('[dbo].temp686625489') IS NOT NULL DROP TABLE [dbo].temp686625489
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessagein]
Print 'Create Table [dbo].[wsmessagein]'
GO
CREATE TABLE [dbo].[wsmessagein] (
		[event_object]           [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pk_event_object]        [int] NOT NULL,
		[ws_message]             [xml] NOT NULL,
		[ws_message_date]        [datetime] NOT NULL,
		[priority]               [int] NULL,
		[messagetype_code]       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagestatus_code]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_wsmessagein to [dbo].[wsmessagein]
Print 'Add Primary Key PK_wsmessagein to [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	ADD
	CONSTRAINT [PK_wsmessagein]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessagein_is_synced to [dbo].[wsmessagein]
Print 'Add Default Constraint DF_wsmessagein_is_synced to [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	ADD
	CONSTRAINT [DF_wsmessagein_is_synced]
	DEFAULT ((0)) FOR [messagestatus_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[wsmessagein] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
EXEC sp_rename @objname = N'[dbo].[wsmessage]', @newname = N'temp638625318', @objtype = 'OBJECT'
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessage]
Print 'Create Table [dbo].[wsmessage]'
GO
CREATE TABLE [dbo].[wsmessage] (
		[event_object]              [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pk_event_object]           [int] NOT NULL,
		[ws_message]                [xml] NOT NULL,
		[ws_message_date]           [datetime] NOT NULL,
		[source_branch]             [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[destination_branch]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[priority]                  [smallint] NULL,
		[messagetype_code]          [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagestatus_code]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[last_transaction_date]     [datetime] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessage_last_transaction_date to [dbo].[wsmessage]
Print 'Add Default Constraint DF_wsmessage_last_transaction_date to [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	ADD
	CONSTRAINT [DF_wsmessage_last_transaction_date]
	DEFAULT (getdate()) FOR [last_transaction_date]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Disable constraints
ALTER TABLE [dbo].[wsmessage] NOCHECK CONSTRAINT ALL
GO

-- Copy data from temp638625318 into the table [dbo].[wsmessage]
-- Restore data
IF OBJECT_ID('[dbo].temp638625318') IS NOT NULL AND EXISTS(SELECT * FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbo].[wsmessage]') AND [type]='U')
EXEC sp_executesql N'
INSERT INTO [dbo].[wsmessage] ([event_object], [pk_event_object], [ws_message], [ws_message_date], [priority])
   SELECT [event_object], [pk_event_object], CAST([ws_message] AS [xml]), [ws_message_date], CAST([priority] AS [smallint]) FROM [dbo].temp638625318
'
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Enable backward constraints
ALTER TABLE [dbo].[wsmessage] CHECK CONSTRAINT ALL
GO

-- Add Primary Key PK_wsmessage to [dbo].[wsmessage]
Print 'Add Primary Key PK_wsmessage to [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	ADD
	CONSTRAINT [PK_wsmessage]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object], [source_branch])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop the temporary table temp638625318
IF OBJECT_ID('[dbo].temp638625318') IS NOT NULL DROP TABLE [dbo].temp638625318
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_set_wsmessageout_status]
Print 'Create Procedure [dbo].[sync_set_wsmessageout_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessageout_status] 
	@event_object char(3),
	@pk_event_object integer,
	@messagestatus_code char(3)
AS
BEGIN
	update wsmessageout
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessagein_status]
Print 'Create Procedure [dbo].[sync_get_wsmessagein_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessagein_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessageout_status]
Print 'Create Procedure [dbo].[sync_get_wsmessageout_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessageout_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'SSV'
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessage_status]
Print 'Create Procedure [dbo].[sync_get_wsmessage_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessage_status] 
	@event_object char(3),
	@pk_event_object integer,
	@branch_code char(3)
AS
BEGIN
	select messagestatus_code
	  from wsmessage (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_branch = @branch_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_set_wsmessage_status]
Print 'Create Procedure [dbo].[sync_set_wsmessage_status]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessage_status] 
	@event_object char(3),
	@pk_event_object integer,
	@messagestatus_code char(3),
	@branch_code char(3)
AS
BEGIN
	update wsmessage
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and destination_branch = @branch_code
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_xml_to_db]
Print 'Create Procedure [dbo].[sync_xml_to_db]'
GO

CREATE PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object int,
			@hdoc int, 
			@sql nvarchar(max)
			
	set xact_abort on
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object
	  from wsmessagein nolock
	 where messagestatus_code <> 'SYN'
  order by priority, ws_message_date
  
	if @ws_message is not null
	begin
		exec sp_xml_preparedocument @hdoc output, @ws_message	
	  
		-- save wsmessage to intended table
		insert into dtr
		select *
		  from openxml(@hdoc, '/dtr', 2) 
		  with dtr
		  
		-- update status of message in the wsmessagein table
		update wsmessagein
		   set messagestatus_code = 'SYN'
		 where event_object = @event_object
		   and pk_event_object = @pk_event_object	
		  
		exec sp_xml_removedocument @hdoc  
	end
	
  	set xact_abort off  
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_dtr_que]
Print 'Create Procedure [dbo].[sync_dtr_que]'
GO

CREATE PROCEDURE [dbo].[sync_dtr_que]
AS
BEGIN
	declare @dtr_id int
    set xact_abort on
    
    begin transaction
    
    -- get ID
    select @dtr_id = dtr_id
	  from dtr d (nolock) 
	 where d.syncstatus_code = 'NS'
	   and d.time_out is not null
  order by dtr_date desc, 
           time_in desc,
           time_out desc
    
	-- insert record into que
	-- set status to SYN
	-- this status will be changed
	-- to SSV after sending to the 
	-- web server
	if ISNULL(@dtr_id,0) > 0 
	begin
		insert into wsmessageout
		values ('DTR',
			   @dtr_id,
			   GETDATE(),
			   0,
			   'SYN',
			   'QUE')
	 
		-- set sync status of record to QUE
		update dtr 
		   set syncstatus_code = 'QUE'
		 where dtr_id = @dtr_id
	end
	
	commit transaction
	
	set xact_abort off
	 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_delete_synched_record]
Print 'Create Trigger [dbo].[tr_delete_synched_record]'
GO

CREATE TRIGGER dbo.tr_delete_synched_record
   ON  dbo.wsmessageout
   AFTER update
AS 
BEGIN
	declare @eventObject char(3),
			@pkEventObject integer,
			@messageStatusCode char(3)
			
	select @eventObject = event_object,
		   @pkEventObject = pk_event_object,
		   @messageStatusCode = messagestatus_code
	  from inserted
	  
	if @messageStatusCode = 'SYN'
	begin
	    -- update the corresponding record
	    if @eventObject = 'DTR'
	    begin
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = @pkEventObject
		end
		
		-- then delete from the wsmessageout table
		delete wsmessageout
		 where event_object = @eventObject
		   and pk_event_object = @pkEventObject
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
-- Create Procedure [dbo].[sync_generate_xml]
Print 'Create Procedure [dbo].[sync_generate_xml]'
GO

CREATE PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object int,
			@ws_message varchar(max),
			@ws_message_date datetime,
			@priority int,
			@source_branch char(3),
			@destination_branch char(3),
			@messagetype_code char(3),
			@messagestatus_code char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'QUE'
  order by ws_message_date asc
  
	-- get xml message
	set @ws_message = (select * 
					     from dtr d (nolock)
				    	where d.dtr_id = @pk_event_object
					      for xml raw ('dtr'), 
					          elements)
				   
	select @event_object as event_object,
		   @pk_event_object as pk_event_object,
		   @ws_message as ws_message,
		   @ws_message_date as ws_message_date,
		   null as priority,
		   dbo.dtr_fn_get_branch_code(0) as source_branch, -- note: for the employee_id parameter, pass 0 always to get the actual branch code
		   'CO' as destination_branch,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessage_t_wsmessagestatus on [dbo].[wsmessage]
Print 'Create Foreign Key FK_wsmessage_t_wsmessagestatus on [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessage_t_wsmessagestatus]
	FOREIGN KEY ([messagestatus_code]) REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
ALTER TABLE [dbo].[wsmessage]
	CHECK CONSTRAINT [FK_wsmessage_t_wsmessagestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessage_t_wsmessagetype on [dbo].[wsmessage]
Print 'Create Foreign Key FK_wsmessage_t_wsmessagetype on [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessage_t_wsmessagetype]
	FOREIGN KEY ([messagetype_code]) REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
ALTER TABLE [dbo].[wsmessage]
	CHECK CONSTRAINT [FK_wsmessage_t_wsmessagetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessagein_t_wsmessagestatus on [dbo].[wsmessagein]
Print 'Create Foreign Key FK_wsmessagein_t_wsmessagestatus on [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
	FOREIGN KEY ([messagestatus_code]) REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
ALTER TABLE [dbo].[wsmessagein]
	CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessagein_t_wsmessagetype on [dbo].[wsmessagein]
Print 'Create Foreign Key FK_wsmessagein_t_wsmessagetype on [dbo].[wsmessagein]'
GO
ALTER TABLE [dbo].[wsmessagein]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
	FOREIGN KEY ([messagetype_code]) REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
ALTER TABLE [dbo].[wsmessagein]
	CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessageout_t_wsmessagestatus on [dbo].[wsmessageout]
Print 'Create Foreign Key FK_wsmessageout_t_wsmessagestatus on [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
	FOREIGN KEY ([messagestatus_code]) REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
ALTER TABLE [dbo].[wsmessageout]
	CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_wsmessageout_t_wsmessagetype on [dbo].[wsmessageout]
Print 'Create Foreign Key FK_wsmessageout_t_wsmessagetype on [dbo].[wsmessageout]'
GO
ALTER TABLE [dbo].[wsmessageout]
	WITH CHECK
	ADD CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
	FOREIGN KEY ([messagetype_code]) REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
ALTER TABLE [dbo].[wsmessageout]
	CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

/****** Object:  Table [dbo].[t_wsmessagetype]    Script Date: 09/28/2014 08:33:19 ******/
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'CHS', N'Change status', N'Change status in source database. Status comes from the destination database')
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'REQ', N'Record request', N'Send and receive request from destination branch')
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'SYN', N'Record sync', N'Sync record in central database')
/****** Object:  Table [dbo].[t_wsmessagestatus]    Script Date: 09/28/2014 08:33:19 ******/
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'NS ', N'Not synced', N'Record has not yet been synced')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'QUE', N'Qued for sending', N'Qued for sending to the server or client')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SSC', N'Sent to client', N'Sent to client')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SSV', N'Sent to server', N'Sent to server')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SYN', N'Synced', N'Record has been synced')
/****** Object:  Table [dbo].[t_syncstatus]    Script Date: 09/28/2014 08:33:19 ******/
--INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'NS ', N'Not synced', N'Record is not yet synced.')
--INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'QUE', N'Record in que', N'Record is in the que to be sent to the web server. ')
--INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'SYN', N'Record synced', N'Record has been synced.')

update dtr set syncstatus_code = 'NS'



IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

