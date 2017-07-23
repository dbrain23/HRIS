begin tran
	update w
   	   set w.messagetype_code = 'SYN',
   	       w.messagestatus_code = 'QUE'
   	-- where 
	--select pk_event_object,
		   source_location,
		   location_code,
		   remote_dtr_id,
		   messagetype_code,
		   messagestatus_code
	  from wsmessage w
 left join #tempdtr t
        on t.location_code collate SQL_Latin1_General_CP1_CI_AS = w.source_location 
       and t.remote_dtr_id = w.pk_event_object
     where location_code is null
    
   rollback tran
     
   commit tran