/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    procedures:
        [dbo].[sync_dtr_que], [dbo].[sync_generate_xml], [dbo].[sync_get_wsmessage]

    tables:
        [dbo].[dtr], [dbo].[t_syncstatus], [dbo].[t_wsmessagetype], [dbo].[wsmessage], [dbo].[wsmessageout]

     Make BRYAN-ULTRA\MYINSTANCE.LogBox_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	28/07/2014 9:33:36 PM

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

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[wsmessage]
Print 'Create Table [dbo].[wsmessage]'
GO
CREATE TABLE [dbo].[wsmessage] (
		[event_object]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pk_event_object]     [int] NOT NULL,
		[ws_message]          [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ws_message_date]     [datetime] NOT NULL,
		[priority]            [int] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_wsmessage to [dbo].[wsmessage]
Print 'Add Primary Key PK_wsmessage to [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	ADD
	CONSTRAINT [PK_wsmessage]
	PRIMARY KEY
	CLUSTERED
	([event_object], [pk_event_object])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Default Constraint DF_wsmessage_priority to [dbo].[wsmessage]
Print 'Add Default Constraint DF_wsmessage_priority to [dbo].[wsmessage]'
GO
ALTER TABLE [dbo].[wsmessage]
	ADD
	CONSTRAINT [DF_wsmessage_priority]
	DEFAULT ((0)) FOR [priority]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[wsmessage] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
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
		[event_object]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pk_event_object]     [int] NOT NULL,
		[ws_message_type]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ws_message_date]     [datetime] NOT NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
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
ALTER TABLE [dbo].[wsmessageout] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_syncstatus]
Print 'Create Table [dbo].[t_syncstatus]'
GO
CREATE TABLE [dbo].[t_syncstatus] (
		[syncstatus_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[syncstatus_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[syncstatus_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_sysncstatus to [dbo].[t_syncstatus]
Print 'Add Primary Key PK_t_sysncstatus to [dbo].[t_syncstatus]'
GO
ALTER TABLE [dbo].[t_syncstatus]
	ADD
	CONSTRAINT [PK_t_sysncstatus]
	PRIMARY KEY
	CLUSTERED
	([syncstatus_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_syncstatus] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Table [dbo].[t_wsmessagetype]
Print 'Create Table [dbo].[t_wsmessagetype]'
GO
CREATE TABLE [dbo].[t_wsmessagetype] (
		[messagetype_code]            [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagetype_name]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[messagetype_description]     [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Primary Key PK_t_wsmessagetype to [dbo].[t_wsmessagetype]
Print 'Add Primary Key PK_t_wsmessagetype to [dbo].[t_wsmessagetype]'
GO
ALTER TABLE [dbo].[t_wsmessagetype]
	ADD
	CONSTRAINT [PK_t_wsmessagetype]
	PRIMARY KEY
	CLUSTERED
	([messagetype_code])
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[t_wsmessagetype] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_get_wsmessage]
Print 'Create Procedure [dbo].[sync_get_wsmessage]'
GO

CREATE PROCEDURE dbo.sync_get_wsmessage
AS
BEGIN
	select top 1 event_object, 
	       pk_event_object, 
	       ws_message
	  from wsmessage wsm (nolock)
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column syncstatus_code to [dbo].[dtr]
Print 'Add Column syncstatus_code to [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	ADD [syncstatus_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	CONSTRAINT [DF_dtr_syncstatus_code] DEFAULT ('NS')
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

CREATE PROCEDURE dbo.sync_dtr_que
AS
BEGIN
	declare @dtr_id int
    set xact_abort on
    
    begin transaction
    
    -- get ID
    select @dtr_id = dtr_id
	  from dtr d (nolock) 
	 where d.syncstatus_code = 'NS'
  order by dtr_date desc, 
           time_in desc,
           time_out desc
    
	-- insert record into que
	if ISNULL(@dtr_id,0) > 0 
	begin
		insert into wsmessageout
		values ('DTR',
			   @dtr_id,
			   'SYN',
			   GETDATE())
	 
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
-- Create Procedure [dbo].[sync_generate_xml]
Print 'Create Procedure [dbo].[sync_generate_xml]'
GO

CREATE PROCEDURE dbo.sync_generate_xml
	@event_object char(3),
	@pk_event_object int
AS
BEGIN
	select * 
	  from dtr d (nolock)
	 where d.dtr_id = @pk_event_object
   for xml raw
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT
	
	/****** Object:  Table [dbo].[t_syncstatus]    Script Date: 07/28/2014 21:37:49 ******/
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'NS ', N'Not synced', N'Record is not yet synced.')
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'QUE', N'Record in que', N'Record is in the que to be sent to the web server. ')
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'SYN', N'Record synced', N'Record has been synced.')

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

SET NOEXEC OFF

