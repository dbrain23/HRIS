USE [HRIS]
GO

/****** Object:  Table [dbo].[t_skill]    Script Date: 06/18/2014 20:42:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_skill]') AND type in (N'U'))
DROP TABLE [dbo].[t_skill]
GO

USE [HRIS]
GO

/****** Object:  Table [dbo].[t_skill]    Script Date: 06/18/2014 20:42:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[t_skill](
	[skill_id] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [varchar](50) NOT NULL,
	[skill_description] [varchar](250) NULL,
 CONSTRAINT [PK__t_skill__FBBA837922951AFD] PRIMARY KEY CLUSTERED 
(
	[skill_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [HRIS]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empskill_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[empskill]'))
ALTER TABLE [dbo].[empskill] DROP CONSTRAINT [FK_empskill_employee]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_empskill_t_skill]') AND parent_object_id = OBJECT_ID(N'[dbo].[empskill]'))
ALTER TABLE [dbo].[empskill] DROP CONSTRAINT [FK_empskill_t_skill]
GO

USE [HRIS]
GO

/****** Object:  Table [dbo].[empskill]    Script Date: 06/18/2014 20:41:45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[empskill]') AND type in (N'U'))
DROP TABLE [dbo].[empskill]
GO

USE [HRIS]
GO

/****** Object:  Table [dbo].[empskill]    Script Date: 06/18/2014 20:41:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[empskill](
	[employee_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
 CONSTRAINT [PK_empskill] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[skill_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[empskill]  WITH CHECK ADD  CONSTRAINT [FK_empskill_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[empskill] CHECK CONSTRAINT [FK_empskill_employee]
GO

ALTER TABLE [dbo].[empskill]  WITH CHECK ADD  CONSTRAINT [FK_empskill_t_skill] FOREIGN KEY([skill_id])
REFERENCES [dbo].[t_skill] ([skill_id])
GO

ALTER TABLE [dbo].[empskill] CHECK CONSTRAINT [FK_empskill_t_skill]
GO


