USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessagein_status]    Script Date: 04/21/2015 17:33:38 ******/
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
	declare @event_object char(3),
			@pk_event_object varchar(30),
			@source_location char(3)
			
	select top 1
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
  order by priority, ws_message_date
			
	-- update the ws_message_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set ws_message_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   
	select event_object,
		   pk_event_object,
		   messagestatus_code,
		   source_location
	  from wsmessagein wmi (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
END