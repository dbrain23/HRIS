
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

	ALTER TABLE [dbo].[empaddress]  WITH CHECK ADD  CONSTRAINT [FK_empaddress_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empaddress] CHECK CONSTRAINT [FK_empaddress_employee]
	GO

	ALTER TABLE [dbo].[empcontact]  WITH CHECK ADD  CONSTRAINT [FK_empcontact_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empcontact] CHECK CONSTRAINT [FK_empcontact_employee]
	GO

	/****** Object:  Index [PK_empeducation_1]    Script Date: 02/14/2015 20:32:04 ******/
	ALTER TABLE [dbo].[empeducation] ADD  CONSTRAINT [PK_empeducation] PRIMARY KEY CLUSTERED 
	(
		[id_num] ASC,
		[attainment_code] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

	ALTER TABLE [dbo].[empeducation]  WITH CHECK ADD  CONSTRAINT [FK_empeducation_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empeducation] CHECK CONSTRAINT [FK_empeducation_employee]
	GO

	ALTER TABLE [dbo].[empemergency]  WITH CHECK ADD  CONSTRAINT [FK_empemergency_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empemergency] CHECK CONSTRAINT [FK_empemergency_employee]
	GO

	ALTER TABLE [dbo].[empfamily]  WITH CHECK ADD  CONSTRAINT [FK_empfamily_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empfamily] CHECK CONSTRAINT [FK_empfamily_employee]
	GO

	/****** Object:  Index [PK_empskill_1]    Script Date: 02/14/2015 20:36:38 ******/
	ALTER TABLE [dbo].[empskill] ADD  CONSTRAINT [PK_empskill] PRIMARY KEY CLUSTERED 
	(
		[id_num] ASC,
		[skill_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

	ALTER TABLE [dbo].[empskill]  WITH CHECK ADD  CONSTRAINT [FK_empskill_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[empskill] CHECK CONSTRAINT [FK_empskill_employee]
	GO

	ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	GO

	ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_employee]
	GO

	/****** Object:  Index [PK_sysuser]    Script Date: 02/14/2015 20:42:54 ******/
	ALTER TABLE [dbo].[sysuser] ADD  CONSTRAINT [PK_sysuser] PRIMARY KEY CLUSTERED 
	(
		[id_num] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

	ALTER TABLE [dbo].[sysuser]  WITH CHECK ADD  CONSTRAINT [FK_sysuser_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	ON UPDATE CASCADE
	GO

	ALTER TABLE [dbo].[sysuser] CHECK CONSTRAINT [FK_sysuser_employee]
	GO

	/****** Object:  Index [PK_sysuserrole]    Script Date: 02/14/2015 20:44:03 ******/
	ALTER TABLE [dbo].[sysuserrole] ADD  CONSTRAINT [PK_sysuserrole] PRIMARY KEY CLUSTERED 
	(
		[id_num] ASC,
		[role_code] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	GO

	ALTER TABLE [dbo].[sysuserrole]  WITH CHECK ADD  CONSTRAINT [FK_sysuserrole_employee] FOREIGN KEY([id_num])
	REFERENCES [dbo].[employee] ([id_num])
	GO

	ALTER TABLE [dbo].[sysuserrole] CHECK CONSTRAINT [FK_sysuserrole_employee]
	GO

	commit tran
	
	set xact_abort off