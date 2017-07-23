
declare @message nvarchar(max),
        @pk_event_object varchar(30),
        @destination_location char(3),
        @priority int
	 
	set @message = 'ALTER TABLE employee
					ADD is_external smallint default 0'
	
	set @pk_event_object = '200'
	set @destination_location = 'CO'
	set @priority = 200
	
	/*insert into wsmessage values 
		('SQL',
			@pk_event_object,
			@message,
			GETDATE(),
			'DEV',
			@destination_location,
			@priority,
			'SUP',
			'QUE',
			GETDATE()		
		)*/
		
	insert into wsmessage	
	select distinct 'SQL',
			@pk_event_object,
			@message,
			GETDATE(),
			'DEV',
			source_location,
			@priority,
			'SUP',
			'QUE',
			GETDATE()		
	 from wsmessage 
	 where (source_location <> 'SVR')
	   and (source_location <> 'DEV')
	   and (source_location <> 'CO') 
	
	/*SELECT *
	  FROM wsmessage
	 WHERE event_object = 'SQL'
	   and pk_event_object = '100'
	   AND destination_location = @destination_location
	   
	   SELECT DISTINCT SOURCE_LOCATION
	   FROM wsmessage*/