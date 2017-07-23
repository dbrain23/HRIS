
	set xact_abort on

	begin tran

	-- 8
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtr_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtr]'))
	ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_employee]
	GO

	alter table dtr
	drop column employee_id	
	go
	
	alter table dtr
	alter column id_num varchar(12) not null
	go

	/****** Object:  Index [PK_employee]    Script Date: 02/14/2015 20:58:46 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[employee]') AND name = N'PK_employee')
	ALTER TABLE [dbo].[employee] DROP CONSTRAINT [PK_employee]
	GO
	
	alter table employee
	drop column employee_id
	go
	
	/****** Object:  Index [IX_id_num]    Script Date: 02/14/2015 20:48:27 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[employee]') AND name = N'IX_id_num')
	ALTER TABLE [dbo].[employee] DROP CONSTRAINT [IX_id_num]
	GO

	alter table employee
	alter column id_num varchar(12) not null
	go
	
	commit tran

	set xact_abort off







