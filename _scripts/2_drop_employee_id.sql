
	set xact_abort on

	begin tran

	-- 1
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empaddress_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empaddress]'))
	ALTER TABLE [dbo].[empaddress] DROP CONSTRAINT [FK_empaddress_employee]
	GO

	-- 2
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empcontact_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empcontact]'))
	ALTER TABLE [dbo].[empcontact] DROP CONSTRAINT [FK_empcontact_employee]
	GO

	-- 3
	GO
	/****** Object:  Index [PK_empeducation]    Script Date: 02/14/2015 15:46:43 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[empeducation]') AND name = N'PK_empeducation')
	ALTER TABLE [dbo].[empeducation] DROP CONSTRAINT [PK_empeducation]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empeducation_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empeducation]'))
	ALTER TABLE [dbo].[empeducation] DROP CONSTRAINT [FK_empeducation_employee]
	GO

	-- 4
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empemergency_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empemergency]'))
	ALTER TABLE [dbo].[empemergency] DROP CONSTRAINT [FK_empemergency_employee]
	GO

	-- 5
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empfamily_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empfamily]'))
	ALTER TABLE [dbo].[empfamily] DROP CONSTRAINT [FK_empfamily_employee]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuser_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
	ALTER TABLE [dbo].[sysuser] DROP CONSTRAINT [FK_sysuser_employee]
	GO

	-- 6
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
	ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysrole]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysuser]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
	ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysuser]
	GO
	
	-- 7
	/****** Object:  Index [PK_sysuser]    Script Date: 02/14/2015 15:49:43 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[sysuser]') AND name = N'PK_sysuser')
	ALTER TABLE [dbo].[sysuser] DROP CONSTRAINT [PK_sysuser]
	GO

	-- 8
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtr_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtr]'))
	ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_employee]
	GO

	-- 9
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_paf_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[paf]'))
	ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_employee]
	GO
	
	-- 10
	/****** Object:  Index [PK_empskill]    Script Date: 02/14/2015 15:47:42 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[empskill]') AND name = N'PK_empskill')
	ALTER TABLE [dbo].[empskill] DROP CONSTRAINT [PK_empskill]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empskill_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empskill]'))
	ALTER TABLE [dbo].[empskill] DROP CONSTRAINT [FK_empskill_employee]
	GO

	-- drop employee_id column 
	alter table empaddress
	drop column employee_id	
	go
	
	alter table empaddress
	alter column id_num varchar(12) not null
	go
	
	alter table empcontact
	drop column employee_id	
	go
	
	alter table empcontact
	alter column id_num varchar(12) not null
	go
	
	alter table empeducation
	drop column employee_id	
	go
	
	alter table empeducation
	alter column id_num varchar(12) not null
	go
	
	alter table empemergency
	drop column employee_id
	go
	
	alter table empemergency
	alter column id_num varchar(12) not null
	go	
	
	alter table empfamily
	drop column employee_id	
	go
	
	alter table empfamily
	alter column id_num varchar(12) not null
	go
	
	alter table empskill
	drop column employee_id	
	go
	
	alter table empskill
	alter column id_num varchar(12) not null
	go
	
	alter table paf
	drop column employee_id	
	go
	
	alter table paf
	alter column id_num varchar(12) not null
	go
	
	alter table sysuser
	drop column user_id	
	go
	
	alter table sysuser
	alter column id_num varchar(12) not null
	go
	
	alter table sysuserrole
	drop column user_id	
	go
	
	alter table sysuserrole
	alter column id_num varchar(12) not null
	go
	
	alter table dtr
	drop column employee_id	
	go
	
	alter table dtr
	alter column id_num varchar(12) not null
	go

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_groupemployee_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[groupemployee]'))
	ALTER TABLE [dbo].[groupemployee] DROP CONSTRAINT [FK_groupemployee_employee]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_activityemployee_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[activityemployee]'))
	ALTER TABLE [dbo].[activityemployee] DROP CONSTRAINT [FK_activityemployee_employee]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_leavecredit_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[leavecredit]'))
	ALTER TABLE [dbo].[leavecredit] DROP CONSTRAINT [FK_leavecredit_employee]
	GO

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_leave_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[leave]'))
	ALTER TABLE [dbo].[leave] DROP CONSTRAINT [FK_leave_employee]
	GO

	/****** Object:  Index [PK_employee]    Script Date: 02/14/2015 20:58:46 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[employee]') AND name = N'PK_employee')
	ALTER TABLE [dbo].[employee] DROP CONSTRAINT [PK_employee]
	GO
	
	alter table employee
	drop column employee_id
	go
	
	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
	ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_employee]
	GO

	/****** Object:  Index [IX_id_num]    Script Date: 02/14/2015 20:48:27 ******/
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[employee]') AND name = N'IX_id_num')
	ALTER TABLE [dbo].[employee] DROP CONSTRAINT [IX_id_num]
	GO

	alter table employee
	alter column id_num varchar(12) not null
	go
	
	commit tran

	set xact_abort off







