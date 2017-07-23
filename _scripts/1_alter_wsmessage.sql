
	-- wsmessage
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[wsmessage]') AND name = N'PK_wsmessage')
	ALTER TABLE [dbo].[wsmessage] DROP CONSTRAINT [PK_wsmessage]
	GO

	alter table wsmessage
	alter column pk_event_object varchar(30) not null
	
	GO

	/****** Object:  Index [PK_wsmessage]    Script Date: 02/23/2015 21:18:30 ******/
	ALTER TABLE [dbo].[wsmessage] ADD  CONSTRAINT [PK_wsmessage] PRIMARY KEY CLUSTERED 
	(
		[event_object] ASC,
		[pk_event_object] ASC,
		[source_location] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO