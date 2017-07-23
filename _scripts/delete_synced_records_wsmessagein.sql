
	select COUNT(*)
	  from dtr
	  
	SELECT COUNT(*)
	  FROM wsmessagein 
	 WHERE messagestatus_code <> 'SYN'
	 
	   delete wsmessagein where  event_object = 'DTR' and pk_event_object = '737' and source_location = 'LAP'
	  
	  SELECT d.dtr_id, wmi.*
	    FROM wsmessagein WMI (NOLOCK)
	   LEFT JOIN dtr D (NOLOCK)
	   ON (D.remote_dtr_id = CAST(WMI.PK_EVENT_OBJECT AS INT) AND WMI.event_object = 'DTR')
	   and d.location_code = wmi.source_location
	  where ISNULL(d.dtr_id,0) > 0
	  
	  delete wmi
	  FROM wsmessagein WMI (NOLOCK)
	   LEFT JOIN dtr D (NOLOCK)
	   ON (D.remote_dtr_id = CAST(WMI.PK_EVENT_OBJECT AS INT) AND WMI.event_object = 'DTR')
	   and d.location_code = wmi.source_location
	  where ISNULL(d.dtr_id,0) > 0
	   
	   