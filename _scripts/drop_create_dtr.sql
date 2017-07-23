USE [HRIS]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtr_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtr]'))
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_employee]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtr_dtr_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [DF_dtr_dtr_date]
END

GO

USE [HRIS]
GO

/****** Object:  Table [dbo].[dtr]    Script Date: 02/17/2014 06:20:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtr]') AND type in (N'U'))
DROP TABLE [dbo].[dtr]
GO

USE [HRIS]
GO

/****** Object:  Table [dbo].[dtr]    Script Date: 02/17/2014 06:20:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dtr](
	[dtr_id] [int] IDENTITY(1,1) NOT NULL,
	[dtr_date] [date] NOT NULL,
	[employee_id] [int] NOT NULL,
	[time_in] [time](7) NOT NULL,
	[time_out] [time](7) NULL,
	[dtr_snapshot_in] [varchar](250) NULL,
	[dtr_snapshot_out] [varchar](250) NULL,
	[dtr_remarks] [varchar](250) NULL,
 CONSTRAINT [PK_dtr] PRIMARY KEY CLUSTERED 
(
	[dtr_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
GO

ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtr_date]  DEFAULT (getdate()) FOR [dtr_date]
GO


