USE [HRIS]
GO

/****** Object:  Table [dbo].[t_dtrstatus]    Script Date: 05/08/2014 05:05:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[t_dtrstatus](
	[dtrstatus_code] [char](3) NOT NULL,
	[dtrstatus_name] [varchar](25) NOT NULL,
	[dtrstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_dtrstatus] PRIMARY KEY CLUSTERED 
(
	[dtrstatus_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT [dbo].[t_dtrstatus] ([dtrstatus_code], [dtrstatus_name], [dtrstatus_description]) VALUES (N'EXP', N'Exported', N'DTR has been exported for payroll generation.')
INSERT [dbo].[t_dtrstatus] ([dtrstatus_code], [dtrstatus_name], [dtrstatus_description]) VALUES (N'IMP', N'Imported', N'DTR has been imported to a text file.')
INSERT [dbo].[t_dtrstatus] ([dtrstatus_code], [dtrstatus_name], [dtrstatus_description]) VALUES (N'OPN', N'Open', N'DTR has yet to be imported.')


