
/****** Object:  StoredProcedure [dbo].[upd_execute_update]    Script Date: 05/04/2015 10:38:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[upd_execute_update]

AS
BEGIN
    declare @update nvarchar(max),
			@pk_event_object varchar(30),
			@source_location char(3),
			@sync_attempts int

	select top 1 
		   @update = ws_message,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location,
		   @sync_attempts = sync_attempts
	  from wsmessagein 
	 where messagestatus_code <> 'SYN'
	   and event_object = 'SQL'
  order by priority
  
	-- update the last_transaction_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set sync_attempts = ISNULL(sync_attempts,0) + 1
	       ,last_transaction_date = GETDATE()
	 where event_object = 'SQL'
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   
	set xact_abort on
	
	begin tran
					  
	if ISNULL(@update,'') <> ''
	begin
		execute (@update)
		
		-- update the status of the "update"
		update wsmessagein
		   set messagestatus_code = 'SYN'
		 where event_object = 'SQL'
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
	end
	
	commit tran
	
	set xact_abort off
END

GO


