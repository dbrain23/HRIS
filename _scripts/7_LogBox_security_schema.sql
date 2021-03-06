

GO
/****** Object:  ForeignKey [FK_sysrolelevel_sysrole]    Script Date: 03/09/2015 09:23:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysrolelevel_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysrolelevel]'))
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_sysrole]
GO
/****** Object:  ForeignKey [FK_sysrolelevel_t_level]    Script Date: 03/09/2015 09:23:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysrolelevel_t_level]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysrolelevel]'))
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_t_level]
GO
/****** Object:  ForeignKey [FK_sysroleprivilege_sysprivilege]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysprivilege]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO
/****** Object:  ForeignKey [FK_sysroleprivilege_sysrole]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysrole]
GO
/****** Object:  ForeignKey [FK_sysuser_employee]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuser_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
ALTER TABLE [dbo].[sysuser] DROP CONSTRAINT [FK_sysuser_employee]
GO
/****** Object:  ForeignKey [FK_sysuserrole_employee]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_employee]
GO
/****** Object:  ForeignKey [FK_sysuserrole_sysrole]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysrole]
GO
/****** Object:  Table [dbo].[sysuser]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuser_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
ALTER TABLE [dbo].[sysuser] DROP CONSTRAINT [FK_sysuser_employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysuser]') AND type in (N'U'))
DROP TABLE [dbo].[sysuser]
GO
/****** Object:  Table [dbo].[sysuserrole]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_employee]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysrole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysuserrole]') AND type in (N'U'))
DROP TABLE [dbo].[sysuserrole]
GO
/****** Object:  Table [dbo].[sysrolelevel]    Script Date: 03/09/2015 09:23:16 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysrolelevel_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysrolelevel]'))
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_sysrole]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysrolelevel_t_level]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysrolelevel]'))
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_t_level]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysrolelevel]') AND type in (N'U'))
DROP TABLE [dbo].[sysrolelevel]
GO
/****** Object:  Table [dbo].[sysroleprivilege]    Script Date: 03/09/2015 09:23:17 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysprivilege]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysrole]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]') AND type in (N'U'))
DROP TABLE [dbo].[sysroleprivilege]
GO
/****** Object:  Table [dbo].[sysprivilege]    Script Date: 03/09/2015 09:23:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysprivilege]') AND type in (N'U'))
DROP TABLE [dbo].[sysprivilege]
GO
/****** Object:  Table [dbo].[sysrole]    Script Date: 03/09/2015 09:23:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysrole]') AND type in (N'U'))
DROP TABLE [dbo].[sysrole]
GO
/****** Object:  Table [dbo].[sysrole]    Script Date: 03/09/2015 09:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysrole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysrole](
	[role_code] [varchar](25) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
	[role_description] [varchar](250) NULL,
 CONSTRAINT [PK_sysrole] PRIMARY KEY CLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysprivilege]    Script Date: 03/09/2015 09:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysprivilege]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysprivilege](
	[privilege_code] [varchar](30) NOT NULL,
	[privilege_name] [varchar](50) NOT NULL,
	[privilege_description] [varchar](250) NULL,
 CONSTRAINT [PK_sysprivilege] PRIMARY KEY CLUSTERED 
(
	[privilege_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysroleprivilege]    Script Date: 03/09/2015 09:23:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysroleprivilege](
	[role_code] [varchar](25) NOT NULL,
	[privilege_code] [varchar](30) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysrolelevel]    Script Date: 03/09/2015 09:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysrolelevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysrolelevel](
	[role_code] [varchar](25) NOT NULL,
	[level_code] [char](3) NOT NULL,
 CONSTRAINT [PK_sysrolelevel] PRIMARY KEY CLUSTERED 
(
	[role_code] ASC,
	[level_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuserrole]    Script Date: 03/09/2015 09:23:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysuserrole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysuserrole](
	[id_num] [varchar](12) NOT NULL,
	[role_code] [varchar](25) NOT NULL,
 CONSTRAINT [PK_sysuserrole] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC,
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuser]    Script Date: 03/09/2015 09:23:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysuser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysuser](
	[id_num] [varchar](12) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password] [varchar](15) NOT NULL,
 CONSTRAINT [PK_sysuser] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_sysuser] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_sysroleprivilege_sysprivilege]    Script Date: 03/09/2015 09:23:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysprivilege]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege]  WITH CHECK ADD  CONSTRAINT [FK_sysroleprivilege_sysprivilege] FOREIGN KEY([privilege_code])
REFERENCES [dbo].[sysprivilege] ([privilege_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysprivilege]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] CHECK CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO
/****** Object:  ForeignKey [FK_sysroleprivilege_sysrole]    Script Date: 03/09/2015 09:23:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege]  WITH CHECK ADD  CONSTRAINT [FK_sysroleprivilege_sysrole] FOREIGN KEY([role_code])
REFERENCES [dbo].[sysrole] ([role_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysroleprivilege_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysroleprivilege]'))
ALTER TABLE [dbo].[sysroleprivilege] CHECK CONSTRAINT [FK_sysroleprivilege_sysrole]
GO
/****** Object:  ForeignKey [FK_sysuser_employee]    Script Date: 03/09/2015 09:23:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuser_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
ALTER TABLE [dbo].[sysuser]  WITH CHECK ADD  CONSTRAINT [FK_sysuser_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuser_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
ALTER TABLE [dbo].[sysuser] CHECK CONSTRAINT [FK_sysuser_employee]
GO
/****** Object:  ForeignKey [FK_sysuserrole_employee]    Script Date: 03/09/2015 09:23:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole]  WITH CHECK ADD  CONSTRAINT [FK_sysuserrole_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] CHECK CONSTRAINT [FK_sysuserrole_employee]
GO
/****** Object:  ForeignKey [FK_sysuserrole_sysrole]    Script Date: 03/09/2015 09:23:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole]  WITH CHECK ADD  CONSTRAINT [FK_sysuserrole_sysrole] FOREIGN KEY([role_code])
REFERENCES [dbo].[sysrole] ([role_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sysuserrole_sysrole]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuserrole]'))
ALTER TABLE [dbo].[sysuserrole] CHECK CONSTRAINT [FK_sysuserrole_sysrole]
GO
