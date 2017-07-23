
	
select *
  from wsmessagein wsm
 where wsm.ws_message not like '%remote_dtr_id%'
   and wsm.event_object = 'DTR'

select stuff(wsm.ws_message,(CHARINDEX('</location_code>',ws_message) + LEN('</location_code>')),0,'<remote_dtr_id>' + wsm.pk_event_object + '</remote_dtr_id>')
  from wsmessagein wsm
 where wsm.ws_message not like '%remote_dtr_id%'
   and wsm.event_object = 'DTR'
   
   
   
   begin tran
   
   update wsmessagein 
      set ws_message = stuff(ws_message,(CHARINDEX('</location_code>',ws_message) + LEN('</location_code>')),0,'<remote_dtr_id>' + wsm.pk_event_object + '</remote_dtr_id>')
    where ws_message not like '%remote_dtr_id%'
      and event_object = 'DTR'
      
   commit tran