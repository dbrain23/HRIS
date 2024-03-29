USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 02/11/2015 08:49:17 ******/
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
			-- changed the status of the record in the webserver
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
			   and source_location = @source_location
		end
	end
	
  	set xact_abort off  
END
