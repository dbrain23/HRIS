
select *
  from wsmessagein wsm
 where wsm.ws_message not like '%location_code%'
   and wsm.event_object = 'DTR'

select stuff(wsm.ws_message,(CHARINDEX('</dtr_id>',ws_message) + LEN('</dtr_id>')),0,'<location_code>' + wsm.source_location + '</location_code>')
  from wsmessagein wsm
 where wsm.ws_message not like '%location_code%'
   and wsm.event_object = 'DTR'
   
   
   
   begin tran
   
   update wsmessagein 
      set ws_message = stuff(ws_message,(CHARINDEX('</dtr_id>',ws_message) + LEN('</dtr_id>')),0,'<location_code>' + source_location + '</location_code>')
    where ws_message not like '%location_code%'
      and event_object = 'DTR'
      
   commit tran