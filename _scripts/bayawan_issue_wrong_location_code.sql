
	select *
	  from wsmessage
	 where event_object = 'DTR'
	   and source_location = 'BAY'
	   
	   select *
	     from wsmessage
	    where ((cast(pk_event_object as int) between 80 and 193)
			or (cast(pk_event_object as int) between 501 and 778))
			and (ws_message like '%<id_num>372</id_num>%'
			  or ws_message like '%<id_num>325</id_num>%'
			  or ws_message like '%<id_num>421</id_num>%'
			  or ws_message like '%<id_num>398</id_num>%'
			  or ws_message like '%<id_num>362</id_num>%'
			  or ws_message like '%<id_num>364</id_num>%'
			  or ws_message like '%<id_num>397</id_num>%'
			  or ws_message like '%<id_num>414</id_num>%'
			  or ws_message like '%<id_num>260</id_num>%'
			  or ws_message like '%<id_num>224</id_num>%'
			  or ws_message like '%<id_num>374</id_num>%')
	    AND source_location = 'CO'
	    order by cast(pk_event_object as int)
	    

		begin tran
		update wsmessage
		   set source_location = 'BAY',
		       ws_message = REPLACE(ws_message,'<location_code>CO </location_code>','<location_code>BAY</location_code>')
	    where ((cast(pk_event_object as int) between 80 and 193)
			or (cast(pk_event_object as int) between 501 and 778))
			and (ws_message like '%<id_num>372</id_num>%'
			  or ws_message like '%<id_num>325</id_num>%'
			  or ws_message like '%<id_num>421</id_num>%'
			  or ws_message like '%<id_num>398</id_num>%'
			  or ws_message like '%<id_num>362</id_num>%'
			  or ws_message like '%<id_num>364</id_num>%'
			  or ws_message like '%<id_num>397</id_num>%'
			  or ws_message like '%<id_num>414</id_num>%'
			  or ws_message like '%<id_num>260</id_num>%'
			  or ws_message like '%<id_num>224</id_num>%'
			  or ws_message like '%<id_num>374</id_num>%')
	    AND source_location = 'CO'
	    
		
		commit tran
		ROLLBACK TRAN