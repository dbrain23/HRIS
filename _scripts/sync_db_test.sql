

	declare @ws_message xml,
				@event_object char(3),
				@pk_event_object varchar(30),
				@source_location char(3),
				@sync_attempts int,
				@hdoc int, 
				@exists int = 0

	set @ws_message = '<dtroverride><dtr_date>2017-12-22</dtr_date><id_num>197</id_num><am_pm>P</am_pm><time_out>17:30:00</time_out><override_reason_code>EGY</override_reason_code><overriden_by>043</overriden_by><override_date>2018-01-05T17:03:29.947</override_date><syncstatus_code>NS </syncstatus_code><location_code>SN </location_code><is_cancelled>0</is_cancelled></dtroverride>'

	exec sp_xml_preparedocument @hdoc output, @ws_message

	insert into dtroverride
	select *
		from openxml(@hdoc, '/dtroverride', 2) 
		with dtroverride	

	exec sp_xml_removedocument @hdoc  