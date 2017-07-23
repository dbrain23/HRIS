IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_wsmessagein_t_wsmessagestatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[wsmessagein]'))
ALTER TABLE [dbo].[wsmessagein] DROP CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_wsmessagein_t_wsmessagetype]') AND parent_object_id = OBJECT_ID(N'[dbo].[wsmessagein]'))
ALTER TABLE [dbo].[wsmessagein] DROP CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_wsmessagein_is_synced]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[wsmessagein] DROP CONSTRAINT [DF_wsmessagein_is_synced]
END

GO

/****** Object:  Table [dbo].[wsmessagein]    Script Date: 02/15/2015 11:17:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[wsmessagein]') AND type in (N'U'))
DROP TABLE [dbo].[wsmessagein]
GO

/****** Object:  Table [dbo].[wsmessagein]    Script Date: 02/15/2015 11:17:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[wsmessagein](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [int] NOT NULL,
	[ws_message] [varchar](max) NULL,
	[ws_message_date] [datetime] NOT NULL,
	[source_location] [char](3) NOT NULL,
	[priority] [int] NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_wsmessagein] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[source_location] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO

ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
GO

ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO

ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
GO

ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_is_synced]  DEFAULT ((0)) FOR [messagestatus_code]
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_wsmessageout_t_wsmessagestatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[wsmessageout]'))
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_wsmessageout_t_wsmessagetype]') AND parent_object_id = OBJECT_ID(N'[dbo].[wsmessageout]'))
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_wsmessageout_is_sent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [DF_wsmessageout_is_sent]
END

GO

/****** Object:  Table [dbo].[wsmessageout]    Script Date: 02/15/2015 11:18:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[wsmessageout]') AND type in (N'U'))
DROP TABLE [dbo].[wsmessageout]
GO

/****** Object:  Table [dbo].[wsmessageout]    Script Date: 02/15/2015 11:18:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[wsmessageout](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [int] NOT NULL,
	[ws_message_date] [datetime] NOT NULL,
	[priority] [smallint] NULL,
	[destination_location] [char](3) NOT NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_wsmessageout] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[destination_location] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO

ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
GO

ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO

ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
GO

ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [DF_wsmessageout_is_sent]  DEFAULT ((0)) FOR [messagestatus_code]
GO

/****** Object:  StoredProcedure [dbo].[sync_generate_xml]    Script Date: 02/15/2015 11:19:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object int,
			@ws_message varchar(max),
			@ws_message_date datetime,
			@messagetype_code char(3),
			@messagestatus_code char(3),
			@destination_location char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code,
	       @destination_location = wmo.destination_location
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
		   dbo.fn_get_sysconfig_value('LOCATION_CODE') as source_location, 
		   @destination_location as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END

GO

/****** Object:  StoredProcedure [dbo].[sync_que_record]    Script Date: 02/15/2015 11:19:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sync_que_record]
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
			   'SVR',
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

/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 02/15/2015 11:20:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object int,
			@source_location char(3),
			@hdoc int, 
			@exists int = 0
			
	set xact_abort on
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location
	  from wsmessagein nolock
	 where messagestatus_code <> 'SYN'
  order by priority, ws_message_date
  
	if @ws_message is not null
	begin
		-- check if record already exists
		select @exists = COUNT(1)
		  from dtr
		 where remote_dtr_id = @pk_event_object
		   and location_code = @source_location
		
		if isnull(@exists,0) = 0 
		begin 
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- update status of message in the wsmessagein table
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
			   and source_location = @source_location
		  
			-- save wsmessage to intended table
			insert into dtr
			select *
			  from openxml(@hdoc, '/dtr', 2) 
			  with dtr	
			  
			-- update the status of the newly-inserted record
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = (select SCOPE_IDENTITY())
			 
			commit transaction
			  
			exec sp_xml_removedocument @hdoc  
		end
		else
		begin
			-- delete the existing record
			-- from the wsmessagein table
			-- delete
			--  from wsmessagein
			-- where event_object = @event_object
			--   and pk_event_object = @pk_event_object
			--   and source_location = @source_location
			   
			-- update status of message in the wsmessagein table
			-- previously the record is deleted, 
			-- however, change the status instead to effectively
			-- change the status of the record in the webserver
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
			   and source_location = @source_location
			   
			commit transaction
		end
	end
	
  	set xact_abort off  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sync_get_wsmessagein_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code,
		   source_location
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
END

/****** Object:  Trigger [tr_delete_synched_record]    Script Date: 02/15/2015 17:15:23 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_delete_synched_record]'))
DROP TRIGGER [dbo].[tr_delete_synched_record]
GO


/****** Object:  Trigger [dbo].[tr_delete_synched_record]    Script Date: 02/15/2015 17:15:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_delete_synched_record]
   ON  [dbo].[wsmessageout]
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











