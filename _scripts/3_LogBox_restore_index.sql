
	set xact_abort on
	
	begin tran
	
	/****** Object:  Index [PK_employee]    Script Date: 02/14/2015 20:35:33 ******/
	ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
	(
		[id_num] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

	ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	GO

	ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
	GO

	commit tran
	
	set xact_abort off