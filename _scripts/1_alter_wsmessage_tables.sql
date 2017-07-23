
	/****** Object:  Index [PK_wsmessageout]    Script Date: 02/23/2015 21:17:57 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[wsmessageout]') AND name = N'PK_wsmessageout')
	ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [PK_wsmessageout]
	GO

	alter table wsmessageout
	alter column pk_event_object varchar(30) not null
	
	GO

	/****** Object:  Index [PK_wsmessageout]    Script Date: 02/23/2015 21:18:30 ******/
	ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [PK_wsmessageout] PRIMARY KEY CLUSTERED 
	(
		[event_object] ASC,
		[pk_event_object] ASC,
		[destination_location] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO
	
	-- wsmessagein
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[wsmessagein]') AND name = N'PK_wsmessagein')
	ALTER TABLE [dbo].[wsmessagein] DROP CONSTRAINT [PK_wsmessagein]
	GO

	alter table wsmessagein
	alter column pk_event_object varchar(30) not null
	
	GO

	/****** Object:  Index [PK_wsmessageout]    Script Date: 02/23/2015 21:18:30 ******/
	ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [PK_wsmessagein] PRIMARY KEY CLUSTERED 
	(
		[event_object] ASC,
		[pk_event_object] ASC,
		[source_location] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

