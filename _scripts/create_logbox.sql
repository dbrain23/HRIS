USE [master]
GO
/****** Object:  Database [LogBox]    Script Date: 10/19/2014 19:33:32 ******/
CREATE DATABASE [LogBox] ON  PRIMARY 
( NAME = N'LogBox', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MYINSTANCE\MSSQL\DATA\LogBox.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LogBox_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MYINSTANCE\MSSQL\DATA\LogBox_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LogBox] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogBox].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogBox] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LogBox] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LogBox] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LogBox] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LogBox] SET ARITHABORT OFF
GO
ALTER DATABASE [LogBox] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LogBox] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LogBox] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LogBox] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LogBox] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LogBox] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LogBox] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LogBox] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LogBox] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LogBox] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LogBox] SET  DISABLE_BROKER
GO
ALTER DATABASE [LogBox] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LogBox] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LogBox] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LogBox] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LogBox] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LogBox] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LogBox] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LogBox] SET  READ_WRITE
GO
ALTER DATABASE [LogBox] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LogBox] SET  MULTI_USER
GO
ALTER DATABASE [LogBox] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LogBox] SET DB_CHAINING OFF
GO
USE [LogBox]
GO
/****** Object:  User [LogBoxUser]    Script Date: 10/19/2014 19:33:32 ******/
CREATE USER [LogBoxUser] FOR LOGIN [LogBoxUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[t_wsmessagetype]    Script Date: 10/19/2014 19:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_wsmessagetype](
	[messagetype_code] [char](3) NOT NULL,
	[messagetype_name] [varchar](25) NOT NULL,
	[messagetype_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_wsmessagetype] PRIMARY KEY CLUSTERED 
(
	[messagetype_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'CHS', N'Change status', N'Change status in source database. Status comes from the destination database')
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'REQ', N'Record request', N'Send and receive request from destination branch')
INSERT [dbo].[t_wsmessagetype] ([messagetype_code], [messagetype_name], [messagetype_description]) VALUES (N'SYN', N'Record sync', N'Sync record in central database')
/****** Object:  Table [dbo].[t_wsmessagestatus]    Script Date: 10/19/2014 19:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_wsmessagestatus](
	[messagestatus_code] [char](3) NOT NULL,
	[messagestatus_name] [varchar](25) NOT NULL,
	[messagestatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_wsmessagestatus] PRIMARY KEY CLUSTERED 
(
	[messagestatus_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'NS ', N'Not synced', N'Record has not yet been synced')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'QUE', N'Qued for sending', N'Qued for sending to the server or client')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SSC', N'Sent to client', N'Sent to client')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SSV', N'Sent to server', N'Sent to server')
INSERT [dbo].[t_wsmessagestatus] ([messagestatus_code], [messagestatus_name], [messagestatus_description]) VALUES (N'SYN', N'Synced', N'Record has been synced')
/****** Object:  Table [dbo].[t_syncstatus]    Script Date: 10/19/2014 19:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_syncstatus](
	[syncstatus_code] [char](3) NOT NULL,
	[syncstatus_name] [varchar](25) NULL,
	[syncstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_sysncstatus] PRIMARY KEY CLUSTERED 
(
	[syncstatus_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'NS ', N'Not synced', N'Record is not yet synced.')
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'QUE', N'Record in que', N'Record is in the que to be sent to the web server. ')
INSERT [dbo].[t_syncstatus] ([syncstatus_code], [syncstatus_name], [syncstatus_description]) VALUES (N'SYN', N'Record synced', N'Record has been synced.')
/****** Object:  Table [dbo].[t_dtrstatus]    Script Date: 10/19/2014 19:33:35 ******/
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
/****** Object:  Table [dbo].[sysconfig]    Script Date: 10/19/2014 19:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysconfig](
	[sysconfig_code] [varchar](30) NOT NULL,
	[sysconfig_name] [varchar](50) NOT NULL,
	[sysconfig_description] [varchar](250) NULL,
	[sysconfig_value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sysconfig] PRIMARY KEY CLUSTERED 
(
	[sysconfig_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[sysconfig] ([sysconfig_code], [sysconfig_name], [sysconfig_description], [sysconfig_value]) VALUES (N'LOCATION_CODE', N'Location code', N'Location code set in this machine', N'CO')
INSERT [dbo].[sysconfig] ([sysconfig_code], [sysconfig_name], [sysconfig_description], [sysconfig_value]) VALUES (N'MIN_TIMEOUT_INTERVAL', N'Time interval', N'Minimum interval between time in and time out.', N'2')
INSERT [dbo].[sysconfig] ([sysconfig_code], [sysconfig_name], [sysconfig_description], [sysconfig_value]) VALUES (N'USE_PAF_LOCATION', N'Use paf location', N'By default, the machine''s location code in the sysconfig table is used. However, for instances where multiple locations login to the same machine, the paf location in the server is used. Set 1 to enable.', N'1')
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_total_hours]    Script Date: 10/19/2014 19:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dtr_fn_get_total_hours]
(
	@time_in time,
	@time_out time
)
RETURNS decimal(4,2)
AS
BEGIN
	declare @total_hours decimal(4,2)

	-- morning
	if (@time_in < '12:00:00')
	begin
		if (@time_in < '08:11:00')
			set @time_in = '08:00:00'
		
		if (isnull(@time_out,@time_in) > '12:00:00')
			set @time_out = '12:00:00'
		else if (isnull(@time_out,@time_in) < '08:11:00')
			set @time_out = @time_in
	end	
	else
	-- afternoon
	begin 
		if (@time_in < '13:11:00')
			set @time_in = '13:00:00'
		else if (@time_in > '17:00:00')
			set @time_in = '17:00:00'	
			
		if (isnull(@time_out,@time_in) > '17:00:00')
			set @time_out = '17:00:00'
		else if (isnull(@time_out,@time_in) < '13:11:00')
			set @time_out = @time_in
	end
	
	set @total_hours = DATEDIFF(minute,@time_in,isnull(@time_out,@time_in)) / 60.0

	return isnull(@total_hours,0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_log_status]    Script Date: 10/19/2014 19:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dtr_fn_get_log_status]
(
	@time_in time
)
RETURNS varchar(15)
AS
BEGIN
	-- Declare the return variable here
	declare @log_status varchar(15)
	
	if (@time_in between '08:10:59' and '11:59:59') or (@time_in between '13:10:59' and '17:00:00')
		set @log_status = 'UNDERTIME'
	else if (@time_in between '08:00:59' and '08:10:01') or (@time_in between '13:00:59' and '13:10:01')
		set @log_status = 'LATE'
	
	-- Return the result of the function
	return @log_status

END
GO
/****** Object:  Table [dbo].[employee]    Script Date: 10/19/2014 19:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_firstname] [varchar](50) NOT NULL,
	[employee_lastname] [varchar](50) NOT NULL,
	[employee_middlename] [varchar](50) NULL,
	[id_num] [varchar](12) NULL,
	[birth_date] [datetime] NULL,
	[birth_place] [varchar](150) NULL,
	[gender] [char](1) NULL,
	[religion_id] [int] NULL,
	[civil_status] [char](3) NULL,
	[marriage_date] [datetime] NULL,
	[height] [int] NULL,
	[weight] [int] NULL,
	[blood_type] [char](2) NULL,
	[tin] [varchar](12) NULL,
	[sss] [varchar](12) NULL,
	[hdmf] [varchar](12) NULL,
	[phic] [varchar](12) NULL,
	[drivers_license] [varchar](12) NULL,
	[is_inactive] [smallint] NULL,
	[pin] [char](2) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_id_num] UNIQUE NONCLUSTERED 
(
	[id_num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (1, N'Ana Flor', N'Adrias', N'Cagbabanua', N'132', CAST(0x000074CD00000000 AS DateTime), N'Dapitan City,Zamboanga del Norte', N'F', 2, N'MRD', CAST(0x0000930600000000 AS DateTime), 5, 40, N'AA', N'947-035-107', N'10-0583112-1', N'1760-0012-17', N'14-05007870-', N'J01-09-00178', 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (2, N'Albert', N'Aniñon', N'It-it', N'105', CAST(0x0000715200000000 AS DateTime), N'Brgy.Minang, Roxas,Zamboanga del Norte', N'M', 2, N'MRD', CAST(0x000099CB00000000 AS DateTime), 170, 145, N'AB', N'947-046-377', N'33-7079294-8', N'1760-0011-91', N'050386189-0', N'G06-04-00291', 0, N'10')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (3, N'Brendo', N'Balanay', N'Bezar', N'077', CAST(0x00006E3A00000000 AS DateTime), N'Pinan, Zamboanga del Norte', N'M', 2, N'MRD', NULL, 5, 80, N'BB', N'276-719-623', N'100-6875694', N'176-00011662', N'140-50060129', N'J01-98-02714', 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (4, N'Ryian', N'Benitez', N'Pamagan', N'042', CAST(0x0000743200000000 AS DateTime), N'Sto. Nino, Polanco, Zamboanga del Norte', N'M', 2, N'MRD', CAST(0x0000992500000000 AS DateTime), 5, 70, N'BB', N'947041938000', N'10-0707682-9', N'1760-0011-32', N'190897725626', N'J01-03-04120', 0, N'04')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (5, N'Marhadzde', N'Bangsaja', N'Recamara', N'185', CAST(0x00007AA400000000 AS DateTime), N'Dapitan City', N'M', 4, N'SGL', NULL, 5, 66, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (6, N'Maribeth', N'Borlaza', N'Albios', N'027', CAST(0x0000741100000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', CAST(0x00009F9200000000 AS DateTime), 5, 48, N'OO', N'940556165', N'1006850350', N'176000111926', N'140500519270', NULL, 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (7, N'Vincent', N'Caboverde', N'Ratilla', N'286', CAST(0x00007C6700000000 AS DateTime), N'Punta, Dipolog City', N'M', 2, N'SGL', NULL, 5, 80, N'AA', N'410-925-389', N'10-0917989-2', N'1210-2247-47', N'14-050137999', N'J01-11-00234', 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (8, N'Jenny', N'Canggas', N'Acas', N'071', CAST(0x000074B500000000 AS DateTime), N'Potol, Dapitan City', N'F', 2, N'MRD', CAST(0x00009D0400000000 AS DateTime), 5, 42, NULL, N'947-041-961', N'10-06877-841', N'1760-0011-66', N'140250305296', NULL, 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (9, N'Juffry', N'Castillon', N'Tabal', N'221', CAST(0x00006EAB00000000 AS DateTime), N'Sta. Filomena, Dipolog City', N'M', 2, N'MRD', CAST(0x0000976600000000 AS DateTime), 5, 72, N'BB', N'947-030-110', N'33-5938768-8', N'1760-0050-61', N'14-050097821', N'J01-07-00002', 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (10, N'Belinda', N'Crampatanta', N'Suriba', N'075', CAST(0x00005E5B00000000 AS DateTime), N'Davao City, Davao del Sur', N'F', 2, N'MRD', CAST(0x0000881300000000 AS DateTime), 5, 84, N'AB', N'931-630-755', N'0910924823', N'176000116532', N'190897037681', NULL, 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (11, N'Roxan', N'Cuaresma', N'Baring', N'115', CAST(0x000072F500000000 AS DateTime), N'Buug, Zamboanga del Sur', N'F', 2, N'MRD', CAST(0x0000917D00000000 AS DateTime), 5, 59, N'OO', N'925-830-876-', N'10-0561271-9', N'1760-0013-29', N'14-050048155', N'J01-01-03563', 0, N'11')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (12, N'Eva', N'Daymiel', N'Dalman', N'013', CAST(0x00006F1500000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', CAST(0x000091CA00000000 AS DateTime), 5, 60, NULL, N'920-788-629', N'10-0684898', NULL, N'14-050050805', NULL, 0, N'01')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (13, N'Maria Lyra', N'Dayte', N'Rubio', N'033', CAST(0x0000663F00000000 AS DateTime), N'Miputak, Dipolog City', N'F', 2, N'SGL', NULL, 5, 57, N'OO', N'265-135-681', N'33-1889606-8', N'176000112260', N'190897224635', N'J0107003493', 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (14, N'Robert', N'Diaz', N'Salazar', N'024', CAST(0x0000681800000000 AS DateTime), N'Canawan, Salug, Zamboanga del Norte', N'M', 2, N'MRD', CAST(0x000090A400000000 AS DateTime), 5, 75, N'OO', N'920788717', N'1005589185', N'176000111972', N'140500746420', N'J0192014968', 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (15, N'Philips', N'Adasa', N'Ferolino', N'069', CAST(0x0000744F00000000 AS DateTime), N'Dapitan City', N'M', 2, N'MRD', CAST(0x000090E800000000 AS DateTime), 5, 88, N'BB', NULL, NULL, NULL, NULL, NULL, 0, N'06')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (16, N'Eirene', N'Amparado', N'Quizo', N'310', CAST(0x000081E500000000 AS DateTime), N'Ilaya, Dapitan City', N'F', 2, N'SGL', NULL, 5, NULL, N'OO', N'422918128', N'1009403568', NULL, N'140501574518', NULL, 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (17, N'Jessa', N'Alonzo', N'Ladera', N'283', CAST(0x0000806300000000 AS DateTime), N'Pob. South, Polanco, Zamboanga del Norte', N'F', 2, N'SGL', NULL, 5, 48, N'OO', N'409-974189', N'10-0917749-6', NULL, N'14-050137993', NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (18, N'Ricky', N'Abais', N'Ortega', N'222', CAST(0x00007C3000000000 AS DateTime), N'Liangan West, Maigo, Lanao del Norte', N'M', 2, N'SGL', NULL, 5, NULL, N'OO', N'285170776000', N'0628098245', N'09144614906', N'140501172452', N'J0111000520', 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (19, N'Emily', N'Abastas', N'Pacana', N'289', CAST(0x000080BA00000000 AS DateTime), N'Tisa, Cebu City', N'F', 2, N'SGL', NULL, 5, NULL, N'BB', N'278262926', N'0628001326', NULL, N'120507533502', NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (20, N'Angelea', N'Abulencia', N'Reganon', N'331', CAST(0x000083F300000000 AS DateTime), N'Olingan, Dipolog, Zamboanga del Norte', N'F', 2, N'SGL', NULL, 5, NULL, NULL, NULL, N'1010269979', NULL, NULL, NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (21, N'Marley', N'Ador', N'Ramasta', N'150', CAST(0x0000718100000000 AS DateTime), N'Borongan, Eastern Samar', N'F', 2, N'SGL', NULL, 5, 54, N'BB', N'935786245', N'3383762062', N'176000123261', N'190899785197', NULL, 0, N'15')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (22, N'Nelyn', N'Alabo', N'Ferrater', N'318', CAST(0x0000809B00000000 AS DateTime), N'Datagon, Pamplona, Negros Oriental', N'F', 2, N'SGL', NULL, 5, 48, N'AB', N'276960131', N'0724733763', N'121051465972', N'120252763436', N'G0809001220', 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (23, N'Mary Ailyn', N'Ibañez', N'Albino', N'194', CAST(0x00007C4F00000000 AS DateTime), N'Turno, Dipolog City', N'F', 2, N'MRD', NULL, 5, NULL, N'OO', N'265137424', N'1007671664', N'090142709706', N'140501059303', NULL, 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (24, N'Divina', N'Agusan', N'Cagampang', N'248', CAST(0x0000737300000000 AS DateTime), N'Kumalarang, Zamboanga del Sur', N'F', 2, N'MRD', CAST(0x000093C900000000 AS DateTime), 5, 74, N'BB', N'933945933', N'1006241480', NULL, N'140501211830', NULL, 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (25, N'Andy-Mar', N'Andan', N'Estor', N'304', CAST(0x00007EE100000000 AS DateTime), N'Camanga, Zamboanga del Sur', N'M', 3, N'SGL', NULL, 5, 72, N'AA', NULL, NULL, NULL, NULL, N'J1012000030', 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (26, N'Mary Saidee', N'Anchez', N'Araco', N'050', CAST(0x0000732900000000 AS DateTime), N'Gango, Ozamis City', N'F', 2, N'MRD', CAST(0x0000935200000000 AS DateTime), 4, 65, N'AA', N'934931396', N'1006851524', N'176000113392', N'190897832511', NULL, 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (27, N'Annul', N'Ajias', N'Tagaro', N'169', CAST(0x00007C4800000000 AS DateTime), N'Ozamis City

', N'M', 2, N'SGL', NULL, 5, 105, N'OO', N'265205663', N'0815867315', N'176000128543', N'140500965319', N'K0407001059', 0, N'16')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (28, N'Christine', N'Andus', N'Cabuguas', N'074', CAST(0x0000742B00000000 AS DateTime), N'Dippolog City
', N'F', 2, N'SGL', NULL, 5, 52, N'OO', N'947034444', N'1006874420', N'176000116521', N'140250271510', NULL, 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (29, N'Norman', N'Anghag', N'Morandarte', N'288', CAST(0x0000816100000000 AS DateTime), N'Poblacion, Sapang Dalaga, Misamis Occidental', N'M', 2, N'SGL', NULL, 5, 55, N'OO', N'410925766000', N'1009188016', NULL, N'140501398108', N'J0111001973', 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (30, N'Jun', N'Amorcillo', N'Suganob', N'130', CAST(0x0000683900000000 AS DateTime), N'Poblacion, Oroquieta City', N'M', 2, N'MRD', CAST(0x0000907000000000 AS DateTime), 5, 75, N'BB', N'934928245', N'0619370639', N'176000121839', N'152006144955', N'K1203027463', 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (31, N'Jolieza', N'Arcebal', N'Solatorio', N'323', CAST(0x0000832B00000000 AS DateTime), N'Locuban, Dumalinao, Zamboanga del Sur', N'F', 2, N'SGL', NULL, 4, 45, NULL, NULL, N'1009569729', NULL, N'114025170060', NULL, 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (32, N'Raymond', N'Atay', N'Sabijon', N'256', CAST(0x0000791200000000 AS DateTime), N'Ozamis City, Misamis Occidental', N'M', 2, N'SGL', NULL, 5, 75, N'OO', N'269867086000', N'0816653120', N'090145895605', N'150501858826', N'K1204001094', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (33, N'Elred', N'Atos', N'Bualat', N'052', CAST(0x00006B2C00000000 AS DateTime), N'Poblacion 2, Oroquieta, Misamis Occidental', N'M', 10, N'MRD', CAST(0x00008DC800000000 AS DateTime), 5, 75, N'OO', N'189910346', N'0810546275', N'176000113370', N'150250960672', N'K1293001393', 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (34, N'Ester', N'Bacon', N'Dela Cruz', N'010', CAST(0x00006E3F00000000 AS DateTime), N'Pangalalan, Sindangan, Zamboanga del Norte', N'F', 2, N'MRD', CAST(0x0000939200000000 AS DateTime), 5, 55, N'OO', N'920777754', N'1005617769', N'176000113824', N'140500746323', NULL, 0, N'01')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (35, N'Armie', N'Baraquil', N'Antinero', N'177', CAST(0x00007B9100000000 AS DateTime), N'Aguinaldo, Naga, Zamboanga del Sur', N'F', 2, N'MRD', CAST(0x00009A5200000000 AS DateTime), 5, 50, N'BB', N'950012075', N'1007261087', N'176000302930', N'140000679433', NULL, 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (36, N'Efren Phil', N'Barosa', N'Manatad', N'311', CAST(0x00007E3D00000000 AS DateTime), N'Calamba, Misamis Occidental', N'M', 2, N'SGL', NULL, 5, 56, N'OO', N'422923341', N'1009439396', NULL, N'', N'J0111001120', 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (37, N'Vinnah', N'Bas', N'Macoy', N'038', CAST(0x00006EC400000000 AS DateTime), N'Upper Loboc, Oroquieta City', N'F', 2, N'MRD', CAST(0x00008D9D00000000 AS DateTime), 5, 85, N'AB', N'947045246', N'1006851760', N'176000112325', N'150000545947', NULL, 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (38, N'Alberto, Jr.', N'Batoctoy', N'Alipan', N'180', CAST(0x00006BD100000000 AS DateTime), N'Poblacion Aurora, Zamboanga del Sur', N'M', 11, N'MRD', NULL, 5, 65, N'AA', N'911012184', N'1006663262', N'176000129831', N'140501417951', N'M02020600468', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (39, N'Jaymar', N'Batuampo', N'Corro', N'110', CAST(0x000072EB00000000 AS DateTime), N'Dapitan City', N'M', 2, N'MRD', CAST(0x00009D0700000000 AS DateTime), 5, 60, N'AA', N'275200127000', N'0622742403', N'176000119563', N'140500745254', N'J0107001366', 0, N'11')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (40, N'Fabian, Jr.', N'Belleno', N'Molina', N'225', CAST(0x00007E8400000000 AS DateTime), N'Dipolog City', N'M', 12, N'MRD', CAST(0x00009DA800000000 AS DateTime), 5, 58, N'BB', N'299032466', N'1008244692', N'090144615010', N'140501177292', N'J0109002360', 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (41, N'May', N'Bitantos', N'Lagura', N'279', CAST(0x00007F7400000000 AS DateTime), N'Zambuanga Sibugay', N'F', 1, N'SGL', NULL, 5, 46, N'OO', N'412835691', N'1009133922', N'121052343756', N'140501349832', NULL, 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (42, N'Maryheart', N'Bordios', N'Candelaria', N'251', CAST(0x00007F4D00000000 AS DateTime), N'San Isidro, Naga, Zambuanga Sibugay', N'F', 2, N'SGL', NULL, 5, 46, N'OO', N'409973904000', N'1008447185', N'090145303301', N'140501225556', N'J0512001977', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (43, N'Joseph Faith', N'Borlaza', N'Majorenos', N'054', CAST(0x0000728800000000 AS DateTime), N'50th District, Ozamis City, Misamis Occidental', N'M', 2, N'MRD', CAST(0x00009F9200000000 AS DateTime), 5, 65, N'OO', N'947034437', N'0812769432', N'176000113846', N'190900863288', N'K0403000302', 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (44, N'Blanch', N'Borres', N'Inocando', N'278', CAST(0x000080BD00000000 AS DateTime), N'Cebu City', N'F', 2, N'SGL', NULL, 5, 50, N'OO', N'299102430', N'0630556788', NULL, N'010509893557', NULL, 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (45, N'Wilson', N'Billiones', N'Permites', N'197', CAST(0x0000779D00000000 AS DateTime), N'Calatunan, Sindangan, Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 70, NULL, N'275199441', N'1007789093', NULL, NULL, N'J0710000053', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (46, N'Janice', N'Bularon', N'Mendoza', N'160', CAST(0x0000736F00000000 AS DateTime), N'Ozamis City', N'F', 1, N'MRD', CAST(0x0000940200000000 AS DateTime), 5, 47, N'OO', N'907058433', N'0812746523', N'176000127933', N'150500825946', NULL, 0, N'16')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (47, N'Joy', N'Cabungcag', N'Rodriquez', N'242', CAST(0x000078DF00000000 AS DateTime), N'Balangasan,Pagadian, Zamboanga del Sur', N'M', 2, N'MRD', CAST(0x00009BF800000000 AS DateTime), 5, 64, N'OO', N'294716484', N'1007286761', N'090145303410', N'142006434478', N'J0307002286', 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (48, N'Leonidas', N'Caitor', NULL, N'135', CAST(0x00006C8900000000 AS DateTime), N'Arbor, Boljoon, Cebu City', N'M', 2, N'MRD', CAST(0x000095E400000000 AS DateTime), 5, 65, N'BB', N'242334890000', N'0617539443', N'176000122238', N'120502057087', NULL, 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (49, N'Julius Kim', N'Caliskis', N'Duman-ag', N'236', CAST(0x0000772500000000 AS DateTime), N'Eastern Poblacion, Lopez Jaena, Misamis Occidental', N'M', 2, N'MRD', CAST(0x0000A04800000000 AS DateTime), 5, 69, N'AA', N'404108301000', N'0625250031', N'090145303508', N'150501938132', N'K1207000796', 0, N'23')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (50, N'Aida', N'Cansancio', N'Batal', N'170', CAST(0x00007AFC00000000 AS DateTime), N'Poblacion, Lanao del Norte', N'F', 2, N'SGL', NULL, 4, 57, N'OO', N'265182322', N'0815873147', N'176000128521', N'140500965351', NULL, 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (51, N'Irish', N'Cañete', N'Antiga', N'219', CAST(0x00007B9800000000 AS DateTime), N'Angeles, Tambuug, Zamboanga del Sur', N'F', 2, N'MRD', CAST(0x00009ABF00000000 AS DateTime), 5, 48, N'BB', N'285171819', N'000814832383', N'090144399101', N'15025232102', NULL, 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (52, N'Melodie', N'Carreon', N'Arenos', N'287', CAST(0x0000826800000000 AS DateTime), N'Cawa-Cawa, Dapitan City', N'F', 2, N'SEP', NULL, 4, 38, N'OO', N'410926199', N'1009183781', NULL, N'140501398086', NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (53, N'Sherwen', N'Chua', N'Digamo', N'034', CAST(0x0000748400000000 AS DateTime), N'Upper Langcangan, Oroquieta City, Misamis Occidental', N'M', 2, N'MRD', CAST(0x00009E3400000000 AS DateTime), 5, 61, N'BB', N'275188608', N'0822911584', N'176000112314', N'190897224600', N'K1203026583', 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (54, N'Alma', N'Chua', N'Laranjo', N'214', CAST(0x0000775000000000 AS DateTime), N'Lower Loboc, Oroquieta City, Misamis Occidental', N'F', 2, N'MRD', CAST(0x00009E3400000000 AS DateTime), 5, 52, N'BB', N'948525490', N'0815254423', N'09014428811', N'150501697747', N'K1207000048', 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (55, N'Rosa Claire', N'Clapano', N'Caboverde', N'174', CAST(0x00007B8000000000 AS DateTime), N'Estaka, Dipolog City
', N'F', 2, N'SGL', NULL, NULL, NULL, N'OO', N'262015709000', N'0627125834', N'176000129819', NULL, NULL, 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (56, N'Rolando', N'Clarabal', N'Dumaog', N'155', CAST(0x0000739900000000 AS DateTime), N'Looc Proper, Plaridel, Misamis Occidental', N'M', 1, N'MRD', CAST(0x0000955600000000 AS DateTime), 5, 95, N'OO', N'275189754000', N'0815588144', N'176000128110', N'140500878084', NULL, 0, N'15')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (57, N'Edwin John', N'Cordova', N'Baguinat', N'104', CAST(0x0000776D00000000 AS DateTime), N'Miputak, Dipolog City', N'M', 2, N'MRD', CAST(0x00009BE100000000 AS DateTime), 5, 90, N'AA', N'947034372', N'1006893553', N'176000119050', N'140250268749', N'J0104002835', 0, N'10')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (58, N'Alfred', N'Cuajotor', N'Luna', N'165', CAST(0x0000778700000000 AS DateTime), N'Oroquieta City, Misamis Occidental', N'M', 2, N'MRD', CAST(0x00009C5F00000000 AS DateTime), 5, 55, N'OO', N'275188255000', N'0811881612', N'176000128377', N'140500965343', N'K1207000274', 0, N'16')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (59, N'Mark Anthony', N'Dalauta', N'Pacho', N'124', CAST(0x0000729D00000000 AS DateTime), N'Cebu City', N'M', 2, N'MRD', CAST(0x00009A8E00000000 AS DateTime), 5, 70, N'AB', N'221076524', N'0622621663', N'176000121563', N'140500796010', N'G0100268510', 0, N'12')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (60, N'Kent Leymer', N'Dagpin', N'Dela Corta', N'339', CAST(0x000082E500000000 AS DateTime), N'Dawo, Dapitan City', N'M', 2, N'SGL', NULL, NULL, NULL, N'AA', NULL, N'1010464758', NULL, NULL, N'J0112002388', 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (61, N'Brian', N'Daguinotas', N'Gajetela', N'231', CAST(0x00007C9100000000 AS DateTime), N'Dawo, Dapitan City`', N'M', 2, N'SGL', NULL, 5, 55, N'OO', N'285172527', N'1008266395', NULL, N'140501190353', N'J0110000027', 0, N'23')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (62, N'Eirich', N'Dajuela', N'Torres', N'263', CAST(0x00007E1900000000 AS DateTime), N'Dawo, Dapitan City', N'M', 2, N'MRD', CAST(0x0000A00000000000 AS DateTime), 5, 62, NULL, N'412839268', N'1008989630', NULL, N'140501272856', N'J3110002063', 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (63, N'Clint Daryll', N'Dumajel', N'Faeldin', N'300', CAST(0x0000819E00000000 AS DateTime), N'Batayan, Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 45, NULL, N'412838530', N'1009302148', NULL, N'140501478039', N'J0111003077', 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (64, N'Jean', N'Dumaog', N'Austerio', N'296', CAST(0x0000812C00000000 AS DateTime), N'Hasaan, Misamis Occidental', N'F', 2, N'SGL', NULL, 5, 45, N'BB', N'276552491000', N'0817244460', NULL, N'140501504846', NULL, 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (65, N'Josephine', N'Dumapias ', N'Maghinay', N'021', CAST(0x0000611F00000000 AS DateTime), N'Canubay, Oroquieta City', N'F', 2, N'SGL', NULL, 5, 55, N'AA', N'155161178', N'0808002446', N'176000113835', N'190897224724', NULL, 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (66, N'Roy', N'Dumapias', N'Maghinay', N'065', CAST(0x00006B4700000000 AS DateTime), N'Canubay, Oroquieta City, Missamis Occidental', N'M', 2, N'MRD', CAST(0x0000919900000000 AS DateTime), 5, 63, N'BB', N'275187518000', N'0811834452', N'176000114600', N'140500996397', N'K1204000086', 0, N'06')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (67, N'Jun Rico', N'Dunque', N'Jabel', N'166', CAST(0x00007B5200000000 AS DateTime), N'Poblacion, Sindangan, Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 76, N'OO', N'949102045', N'1007231143', NULL, N'140500965327', N'J0107001518', 0, N'16')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (68, N'Jayson Christopher', N'Ebo', N'Capuyan', N'196', CAST(0x000079B800000000 AS DateTime), N'Cebu City', N'M', 2, N'SGL', NULL, 5, NULL, N'OO', NULL, N'0628079811', NULL, N'140501071974', N'G0107013101', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (69, N'Mary Ann', N'Banawa', N'Enriquez', N'204', CAST(0x00007B3800000000 AS DateTime), N'Lower Taway, Ipil, Zambuanga del Sur', N'F', 6, N'MRD', NULL, 5, 54, N'BB', N'275194296', N'1008070400', N'090143498105', N'140251147058', N'J0510001350', 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (70, N'Emmanuel', N'Eronico', N'Mosquieda', N'298', CAST(0x0000803D00000000 AS DateTime), N'Pajo, Lapu Lapu, Cebu City', N'M', 2, N'SGL', NULL, 5, 60, NULL, N'418261353', N'0631497493', NULL, N'140501478047', N'G1112000122', 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (71, N'Jeter', N'Esolana', N'Cosio', N'255', CAST(0x0000798100000000 AS DateTime), N'Poblacion, La Libertad, Zamboanga del Norte', N'M', 2, N'MRD', CAST(0x0000998D00000000 AS DateTime), 5, 68, N'AA', N'299036043', N'1007176211', N'090145303606', N'120252178789', N'G1110001446', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (72, N'Mary Jane', N'Escuadro', N'Pormento', N'253', CAST(0x00007A4700000000 AS DateTime), N'Bitoon, Sindangan, Zamboanga del Norte', N'F', 2, N'MRD', CAST(0x00009EDA00000000 AS DateTime), 5, 60, N'OO', N'275562862', N'1008457531', NULL, NULL, NULL, 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (73, N'Randy', N'Espiritu', N'Tapot', N'088', CAST(0x0000735700000000 AS DateTime), N'Aguada, Ozamis City', N'M', 2, N'MRD', CAST(0x00008FD800000000 AS DateTime), 5, 80, N'OO', N'268011856000', N'0812704468', N'176000117064', N'150251446727', N'K0408029523', 0, N'08')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (74, N'Lanneme', N'Estrera', N'Ostria', N'209', CAST(0x0000772100000000 AS DateTime), N'Labangon, Cebu City', N'F', 2, N'MRD', CAST(0x00009CCF00000000 AS DateTime), NULL, 40, N'BB', N'232056491000', N'0619821023', N'090145034505', N'12050553732', NULL, 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (75, N'Jaysarah', N'Montalban', N'Marquez', N'265', CAST(0x00007CCD00000000 AS DateTime), NULL, N'F', 2, N'MRD', CAST(0x00009EB100000000 AS DateTime), NULL, NULL, N'BB', NULL, N'0628723251', NULL, N'120508026906', NULL, 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (76, N'Anna Karene', N'Fernandez', N'Enot', N'330', CAST(0x0000821900000000 AS DateTime), N'Poblacion South, Polanco, Zamboanga del Norte', N'F', 2, N'SGL', NULL, 5, 40, NULL, NULL, N'1010304326', NULL, N'140501627549', NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (77, N'Ma. Nova', N'Celecious', N'Ferrer', N'142', CAST(0x0000763600000000 AS DateTime), N'Dipolog City', N'F', 2, N'MRD', NULL, NULL, NULL, NULL, N'947046385000', N'1006377079', N'176000122938', N'140500837302', N'G0211002651', 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (78, N'Zoser Ian', N'Flores', N'Cero', N'246', CAST(0x00007B1000000000 AS DateTime), N'Mampang, Zamboanga City', N'M', 2, N'SGL', NULL, 5, 65, N'OO', N'299033379000', N'0629543032', N'090145303704', N'140501253452', N'J0408005845', 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (79, N'Gerec', N'Gaabucayan', N'Diez', N'257', CAST(0x00007D1900000000 AS DateTime), N'Dona Consuela, Ozamiz City', N'M', 2, N'SGL', NULL, 5, 69, N'AA', N'299034708', N'0817744588', NULL, N'150252539575', N'K0411000054', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (80, N'Ronald', N'Gabas', N'Berhay', N'273', CAST(0x00007BCF00000000 AS DateTime), N'Bulie - Kalian, Margosatubig, Zamboang del Sur', N'M', 2, N'SGL', NULL, 5, 75, N'OO', N'936557353', N'1009555335', N'164001489057', N'120508057585', N'J0510000588', 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (81, N'Mark', N'Gadayan', N'Agan', N'285', CAST(0x0000825A00000000 AS DateTime), N'Turno, Dipolog City', N'M', 2, N'SGL', NULL, 5, 95, N'OO', N'410925987', N'1009179902', NULL, N'140501379979', N'J0511001230', 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (82, N'Karen Gay', N'Galeza', N'Morgia', N'023', CAST(0x0000728B00000000 AS DateTime), N'Dipolog City', N'F', 2, N'MRD', CAST(0x0000946300000000 AS DateTime), 5, 45, N'AB', N'920788611', N'1006841893', N'176000115109', N'140500746390', N'J0101036139', 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (83, N'Hazel', N'Pantoja', N'Gamueta', N'333', CAST(0x00007E8700000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', NULL, 5, 52, N'OO', N'288839483', N'3415709427', NULL, N'140501341998', NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (84, N'Ismael John Chrisam', N'Gandamra', N'Dalid', N'313', CAST(0x00007C5900000000 AS DateTime), N'Cagayan de Oro, Misamis Oriental', N'M', 2, N'MRD', CAST(0x00009FB100000000 AS DateTime), 5, 90, N'BB', N'407880395000', NULL, NULL, N'150252794982', N'K0407002926', 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (85, N'Fe Verna Marie', N'Gimony', N'Laroa', N'247', CAST(0x00007C2A00000000 AS DateTime), N'San Rafael, Maasin, Southern Leyte', N'F', 2, N'MRD', CAST(0x00009FD800000000 AS DateTime), 5, 67, N'OO', N'287505836', N'1008448485', N'090145304004', N'110501249021', NULL, 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (86, N'Chrismie', N'Gonzaga', N'Cerdena', N'207', CAST(0x0000766000000000 AS DateTime), N'Cebu City', N'F', 2, N'MRD', CAST(0x00009D7700000000 AS DateTime), 5, NULL, N'OO', N'245696276', N'0626166001', N'090143733205', N'120505704024', NULL, 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (87, N'Ryan', N'Gonzaga', N'Mata', N'309', CAST(0x00007AEF00000000 AS DateTime), N'Lawis, Gampis, Sindangan Zambo. del Norte', N'M', 2, N'MRD', CAST(0x00009DB600000000 AS DateTime), 5, 70, N'OO', NULL, NULL, NULL, NULL, N'J0111004402', 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (88, N'Mitzi Claire', N'Gran', N'Barite', N'128', CAST(0x0000739C00000000 AS DateTime), N'Dipolog City', N'F', 13, N'MRD', CAST(0x0000945600000000 AS DateTime), 5, 63, N'AB', N'282691572', N'0822176730', N'176000121805', N'140500789685', NULL, 0, N'12')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (89, N'Marivic', N'Gresos', N'Egdao', N'020', CAST(0x0000712400000000 AS DateTime), N'Miputak, Dipolog City
', N'F', 2, N'MRD', CAST(0x00009D3100000000 AS DateTime), 5, 60, N'AA', N'920788660', N'1007115120', N'176000111559', N'140500746404', N'J0101035350', 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (90, N'Gauden Emmanuel', N'Gulmatico', N'Almendras', N'199', CAST(0x00007BE100000000 AS DateTime), N'Bankasi, Butuan City', N'M', 11, N'SGL', NULL, 5, 60, N'OO', N'140501081147', N'1007755425', N'090143137604', NULL, N'J0508001144', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (91, N'Karlo Pengeemi', N'Gultia', N'Vallar', N'254', CAST(0x00007D8B00000000 AS DateTime), N'Catarman, Camiguin City', N'M', 2, N'SGL', NULL, 5, 70, N'AA', N'291302604000', N'0629786116', N'90145303802', N'140501243996', N'G0610002898', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (92, N'Maria Gracia', N'Tagbac', N'Hamoy', N'280', CAST(0x00007FEA00000000 AS DateTime), N'Pob. North, Pinan, Zambo. del Norte', N'F', 2, N'MRD', NULL, 5, 48, N'AA', N'412835416', N'1009124779', NULL, N'140501349786', NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (93, N'Geralden', N'Hampas', N'Gomez', N'316', CAST(0x0000814C00000000 AS DateTime), N'Pob. Sapangdalaga, Misamis Occidental', N'M', 1, N'MRD', CAST(0x00009FF800000000 AS DateTime), 5, 56, NULL, N'404558725', NULL, N'121060038530', N'150252720261', N'J0112001202', 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (94, N'Lalaine', N'Atay', N'Handumon', N'168', CAST(0x0000792B00000000 AS DateTime), N'Tin-ad, Agusan, Cagayan de Oro City', N'F', 2, N'MRD', NULL, 5, NULL, N'OO', N'275621415', N'0815861272', N'176000128532', N'140500965300', NULL, 0, N'16')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (95, N'Aguinaldo Jr.', N'Hapona', N'Aclao', N'210', CAST(0x00006D5A00000000 AS DateTime), N'Mobod, Oroquieta City', N'M', 1, N'MRD', CAST(0x0000975700000000 AS DateTime), 5, 65, N'OO', N'275657216', N'1008634642', N'090143982603', N'140501140143', N'J0503009905', 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (96, N'Joan', N'Igloria ', N'Palagon', N'293', CAST(0x00007F6A00000000 AS DateTime), N'Calamba, Misamis Occidental', N'F', 1, N'SGL', NULL, 5, 44, N'AA', N'298240482', N'0630499955', N'121051536286', NULL, NULL, 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (97, N'Deceryn', N'Igot', N'Mabini', N'171', CAST(0x000077CD00000000 AS DateTime), N'Cebu City', N'F', 2, N'MRD', CAST(0x00009C2E00000000 AS DateTime), 5, NULL, N'AA', N'264188780000', N'0625299801', N'176000129398', N'120505403415', NULL, 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (98, N'Melonie', N'Importante', N'Bangalisan', N'217', CAST(0x000071EC00000000 AS DateTime), N'Dacanay, Siay, Zambo. Sibugay', N'F', 2, N'MRD', CAST(0x00009FC700000000 AS DateTime), 5, 53, N'OO', N'400192348', N'0617778628', N'090144399003', N'160503110153', NULL, 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (99, N'Kim', N'Jumamil', N'Econg', N'200', CAST(0x00007C0300000000 AS DateTime), N'Sandugan, Larena, Siquijor', N'M', 2, N'MRD', CAST(0x00009D6B00000000 AS DateTime), 5, 75, N'BB', N'275194462000', N'1007789064', N'90143137702', N'150502340842', N'K0407000326', 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (100, N'Emilyn', N'Jumao-as', N'Wagwag', N'173', CAST(0x0000784800000000 AS DateTime), N'Maribago, LapuLapu, Cebu City', N'F', 2, N'MRD', CAST(0x00009C2A00000000 AS DateTime), 5, 55, N'AA', N'267459351', N'0625995732', N'176000129420', N'140500966889', NULL, 0, N'17')
GO
print 'Processed 100 total records'
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (101, N'Christine Joy', N'Labores', N'Sayson', N'186', CAST(0x00007B2700000000 AS DateTime), N'Biasong, Dipolog City', N'F', 2, N'MRD', CAST(0x00009B8D00000000 AS DateTime), 5, 50, N'OO', N'946604805', N'1007613907', N'176000130221', N'140501053976', NULL, 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (102, N'Cherryl', N'Labro', N'Pacaldo', N'159', CAST(0x00007A7700000000 AS DateTime), N'Mazawalo, Palompon, Leyte', N'F', 2, N'MRD', CAST(0x0000A09B00000000 AS DateTime), 5, 55, N'OO', N'264325413000', N'0626442767', N'176000127109', N'140500958738', NULL, 0, N'15')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (103, N'Ian', N'Labro', N'Avila', N'249', CAST(0x00007BB700000000 AS DateTime), N'Tagbilaran City', N'M', 2, N'MRD', CAST(0x0000A09B00000000 AS DateTime), 5, 90, NULL, N'261371882', N'0628153180', N'090145303911', N'170501949313', NULL, 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (104, N'Jose Elmer', N'Lacay', N'Gusarim', N'032', CAST(0x000064F600000000 AS DateTime), N'San Miguel, Polanco, Zambo. del Norte', N'M', 2, N'MRD', CAST(0x000089EF00000000 AS DateTime), 5, 77, NULL, N'184701095', N'1004849936', N'176000112001', N'140501026871', N'J0102038041', 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (105, N'Emily', N'Ladao', N'Sumatra', N'230', CAST(0x00007DA500000000 AS DateTime), N'Baloy, Tablon Cagayan de Oro', N'F', 2, N'SGL', NULL, 4, 45, N'OO', N'404108021000', N'0817269940', N'90144823307', N'140501177276', NULL, 0, N'23')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (106, N'Froilan', N'Lampa', N'Luce', N'192', CAST(0x0000780900000000 AS DateTime), N'Barra, Dipolog City', N'M', 2, N'MRD', CAST(0x00009B2300000000 AS DateTime), 5, 65, N'OO', N'947045239000', N'1007656061', N'176000132629', N'140250643345', N'J0112000652', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (107, N'Arnel', N'Largo', N'Salazar', N'044', CAST(0x0000609E00000000 AS DateTime), N'Ozamiz City', N'M', 2, N'MRD', CAST(0x0000899100000000 AS DateTime), 5, 79, NULL, N'949084209000', N'100428930', N'176000112247', NULL, N'J0188008829', 0, N'04')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (108, N'Rolegen', N'Laput', N'Daguinotas', N'319', CAST(0x0000813200000000 AS DateTime), N'Maria Uray, Dapitan City', N'M', 2, N'SGL', NULL, 5, 68, NULL, NULL, N'1009517661', NULL, N'140501581522', N'J0111004007', 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (109, N'Reynold', N'Layam', N'Mabait', N'321', CAST(0x0000817400000000 AS DateTime), N'Poblacion, Salug Zambo. del Norte', N'M', 2, N'SGL', NULL, 5, 65, N'OO', N'285222816', N'1009574484', N'121064636097', N'140501594756', N'J0109003248', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (110, N'Cyd', N'Lear', N'Sabanal', N'270', CAST(0x00007F1C00000000 AS DateTime), N'Barra, Dipolog City', N'F', 11, N'SGL', NULL, 5, 39, N'BB', N'410922950', N'10090885481', N'121022778011', N'140251266863', NULL, 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (111, N'Grace', N'Licudan', N'Baldecancho', N'294', CAST(0x0000816E00000000 AS DateTime), N'LaPaz Naga, Zambo. Sibugay', N'F', 2, N'SGL', NULL, 5, 57, N'BB', N'408189103', N'1009218915', N'12025142069', N'140501434716', NULL, 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (112, N'Melanie', N'Lomocso', N'Pango', N'183', CAST(0x0000757000000000 AS DateTime), N'Barra, Dipolog City', N'F', 4, N'MRD', CAST(0x00009CDA00000000 AS DateTime), 5, 48, N'BB', N'245630525', N'3399885849', NULL, N'010503375120', N'J0111002578', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (113, N'Cesarevic', N'Lopez', N'Bontia', N'308', CAST(0x00007F7600000000 AS DateTime), N'Brgy. Madasigon, Molave Zambo. del Sur
', N'F', 2, N'SGL', NULL, 5, 42, NULL, N'422922421', N'1009413765', N'912227044818', N'140501532394', NULL, 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (114, N'Ofelia', N'Lozada', N'Tuazon', N'057', CAST(0x00006DAE00000000 AS DateTime), N'Bantayan, Sindangan Zambo. del Norte', N'F', 2, N'MRD', CAST(0x0000946A00000000 AS DateTime), 5, 55, N'BB', N'270835966', N'0619836704', NULL, N'140500542019', NULL, 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (115, N'May', N'Lucero', N'Parangan', N'043', CAST(0x000072B400000000 AS DateTime), N'Dumaguete City', N'F', 14, N'MRD', CAST(0x00009A9100000000 AS DateTime), 5, NULL, N'OO', N'947041945', N'1007164155', N'17000113324', N'190897725480', N'J0105000220', 0, N'04')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (116, N'Arlene', N'Lucrecia', N'Jotojot', N'025', CAST(0x00006F4E00000000 AS DateTime), N'Dipolog City', N'F', 2, N'MRD', CAST(0x0000947200000000 AS DateTime), 4, 45, N'OO', N'300788638', N'1006850376', N'176000111948', N'141500519297', N'J0101037286', 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (117, N'Gardes', N'Lumacad', N'Eniola', N'198', CAST(0x00007C6600000000 AS DateTime), N'Gango, Ozamiz City', N'M', 2, N'SGL', NULL, 5, 55, N'OO', N'275192285', N'0816556146', N'090143007501', N'150252129148', N'K0408001618', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (118, N'Lorna', N'Lumantas', N'Binac', N'019', CAST(0x00005DE600000000 AS DateTime), N'San Miguel, Polanco, Zambo. del Norte', N'F', 2, N'MRD', CAST(0x0000832A00000000 AS DateTime), 5, 56, N'AB', N'920788637', N'1002927915', N'176000111572', N'140500746307', NULL, 0, N'01')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (119, N'Jerry', N'Lumbo', N'Salera', N'035', CAST(0x00006E4300000000 AS DateTime), N'Canawan, Salug, Zambo. del Norte', N'M', 2, N'MRD', CAST(0x00009A8700000000 AS DateTime), 5, 67, N'OO', N'949084073', N'1005537593', N'176000113901', N'140250024114', N'J0198027307', 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (120, N'Rowena', N'Mabalod', N'Terez', N'058', CAST(0x00006A9800000000 AS DateTime), N'Tuyabang Proper, Oroquieta City', N'F', 15, N'MRD', CAST(0x00008FC900000000 AS DateTime), 5, 55, N'AA', N'179160602', N'0811812571', N'176000114412', N'190900863504', NULL, 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (121, N'Rey', N'Mabanag', N'Geronimo', N'245', CAST(0x000076AA00000000 AS DateTime), N'Aguada, Ozamiz City', N'M', 2, N'MRD', CAST(0x0000A06400000000 AS DateTime), 5, 85, NULL, N'285254872000', N'0814812963', N'090145304102', N'150501001823', N'K0409001593', 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (122, N'Kirsten', N'Madura', N'Billones', N'237', CAST(0x00007E5800000000 AS DateTime), N'Bunawan, Calamba Misamis Occidental', N'F', 16, N'SGL', NULL, 5, 43, N'OO', N'294717554', N'0817357056', N'090145304211', N'140501191708', NULL, 0, N'23')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (123, N'Jackqueline ', N'Mahusay', N'Medillen', N'264', CAST(0x0000781F00000000 AS DateTime), N'Cabalquinto, Calubian, Leyte', N'F', 2, N'MRD', CAST(0x000099CD00000000 AS DateTime), 5, 50, N'OO', N'266397134000', N'0626299075', N'164000176021', N'120506899031', NULL, 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (124, N'Jane Ray', N'Magdolot', N'Elcamel', N'271', CAST(0x00007D8F00000000 AS DateTime), N'Dawo, Dapitan City', N'F', 3, N'SGL', NULL, 5, 45, N'OO', N'410923546', N'1008282285', N'121022875584', N'140501188006', NULL, 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (125, N'Jose Ariel', N'Maglangit', N'Sumalpong', N'188', CAST(0x000073CF00000000 AS DateTime), N'Tignao, Lazi Siquijor', N'M', 2, N'SGL', NULL, 5, 68, N'AA', N'300465070', N'0624645773', N'176000130708', NULL, N'M0200047193', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (126, N'Bernie Jonel', N'Manriquez', N'Acas', N'193', CAST(0x00007B0900000000 AS DateTime), N'Dipolog City
', N'M', 2, N'MRD', CAST(0x0000A0F700000000 AS DateTime), 5, 75, N'AB', N'266431430', N'1007671936', N'090143007610', N'140501059311', N'J0104002907', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (127, N'Georgee', N'Marquez', N'Villamil', N'141', CAST(0x0000720E00000000 AS DateTime), N'Sindangan Zambo. del Norte', N'F', 17, N'MRD', CAST(0x000092D400000000 AS DateTime), 4, 45, N'OO', N'947046424', N'1005876063', N'17600012250', N'140500815155', NULL, 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (128, N'Mark Lester', N'Masamayor', N'Selim', N'275', CAST(0x0000805700000000 AS DateTime), N'Villaflor, Oroquieta City', N'M', 2, N'SGL', NULL, 5, 75, N'OO', NULL, N'1008223312', NULL, N'140501335645', N'J0511000117', 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (129, N'Ronel', N'Maylon', N'Ageas', N'324', CAST(0x0000805400000000 AS DateTime), N'Labiray, Sergio Osmena Sr. Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 59, NULL, N'422886886', N'1010249562', N'121062990500', N'140501594764', N'G0212004509', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (130, N'Joje', N'Mayormita', N'Refugio', N'037', CAST(0x000071B000000000 AS DateTime), N'Galas, Dipolog City', N'M', 2, N'MRD', CAST(0x000093B400000000 AS DateTime), 5, 59, N'OO', N'275189449', N'1007132404', N'17600018130', N'140500899561', NULL, 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (131, N'Rene', N'Mendoza', N'Moroscallo', N'022', CAST(0x0000698D00000000 AS DateTime), N'Brgy. Uno Katipunan, Zambo. del Norte', N'M', 2, N'MRD', CAST(0x000092DC00000000 AS DateTime), 5, 78, NULL, N'920788709', N'1005587378', NULL, NULL, N'J0101037103', 0, N'02')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (132, N'Allen Omar', N'Minalang', N'Yusoph', N'328', CAST(0x00007FEB00000000 AS DateTime), N'Lower Campo Islam, Zamboanga del Sur', N'M', 4, N'SGL', NULL, 5, 72, N'BB', N'421276509000', N'1009568241', NULL, N'140251699913', NULL, 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (133, N'Cherrylou', N'Narvacan', N'Alba', N'241', CAST(0x00007D7900000000 AS DateTime), N'Mibang Sta. Filomena, Dipolog City', N'F', 2, N'SGL', NULL, 5, 50, N'BB', N'261115811000', N'1007726904', N'090145304407', N'120507091070', N'J0110003968', 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (134, N'Ginafe', N'Navasquez', N'Lapinid', N'306', CAST(0x0000737C00000000 AS DateTime), N'Ormoc City, Leyte', N'F', 2, N'MRD', CAST(0x0000965C00000000 AS DateTime), 5, 47, N'OO', N'422922736', N'0622019084', NULL, N'190898150724', NULL, 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (135, N'Levi Nazarino', N'Nemenzo', N'Martinez', N'156', CAST(0x000077F800000000 AS DateTime), N'Poblacion Dalaguete, Cebu City', N'M', 2, N'SGL', NULL, 5, 79, N'AB', N'247083041000', N'0626162461', N'176000127099', N'010503508899', N'G0107005351', 0, N'15')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (136, N'Maribel', N'Nenez', N'Llagoso', N'282', CAST(0x000081DE00000000 AS DateTime), N'Manlapay Dumanjug, Cebu City', N'F', 2, N'SGL', NULL, 5, 48, N'OO', N'403329331', N'0630802416', N'121022896419', NULL, NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (137, N'Andy', N'Niza', N'Bagaslao', N'082', CAST(0x0000763A00000000 AS DateTime), N'Ozamiz City', N'M', 2, N'MRD', CAST(0x00009B8B00000000 AS DateTime), 5, 85, N'AA', N'280852191', N'0812765834', N'090134267305', N'140500602321', N'K0403000780', 0, N'08')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (138, N'Elizalde', N'Nonoy', N'Ang', N'291', CAST(0x00007C1E00000000 AS DateTime), N'Gango, Ozamiz City', N'M', 2, N'MRD', CAST(0x00009FBC00000000 AS DateTime), 5, 69, N'AA', N'948526570', N'0811868075', NULL, N'152014918374', N'K0411000440', 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (139, N'Chadie', N'Nuñez', N'Amores', N'269', CAST(0x00007CFA00000000 AS DateTime), N'Gun-ob, Lapulapu Cebu City', N'M', 2, N'SGL', NULL, 5, 60, N'OO', N'289584290000', N'0628488774', N'121022897706', N'120508598047', N'G0107001374', 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (140, N'Maria Elvie', N'Operario', N'Moroscallo', N'118', CAST(0x0000758500000000 AS DateTime), N'Sta. Filomena, Dipolog City', N'F', 2, N'MRD', CAST(0x00009C6B00000000 AS DateTime), 5, 50, N'BB', N'928975691', N'1006862717', N'176000119939', N'140250255043', NULL, 0, N'11')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (141, N'Jonathan', N'Ordinaria', N'Moreno', N'260', CAST(0x0000803100000000 AS DateTime), N'Sto.Nino, Katipunan Zambo. del Norte', N'M', 2, N'MRD', CAST(0x00009EE300000000 AS DateTime), 5, 74, NULL, N'299035059', N'1008076640', N'121011853458', N'140501253517', N'J0108003905', 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (142, N'Larry', N'Orilloza', N'Acero', N'072', CAST(0x00006C3300000000 AS DateTime), N'D''Ban Calamba, Misamis Occidental', N'M', 2, N'MRD', CAST(0x0000966D00000000 AS DateTime), 5, 77, N'OO', N'190592681', N'3327506213', N'176000116588', N'150251238326', N'K1203027377', 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (143, N'Mylyn', N'Panares', N'Doria', N'223', CAST(0x00007FB200000000 AS DateTime), N'Bacong, Salug Zamboanga del Norte', N'F', 2, N'MRD', CAST(0x00009FD100000000 AS DateTime), 5, 55, N'OO', N'283391057', N'1008206863', N'090144615206', N'140501172479', NULL, 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (144, N'Mario', N'Partosa', N'Leon', N'018', CAST(0x0000686A00000000 AS DateTime), N'Tuburan, Dipolog City', N'M', 2, N'MRD', CAST(0x00008C8300000000 AS DateTime), 5, 80, N'OO', N'920788695', N'100684193', NULL, NULL, N'J0100031910', 0, N'01')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (145, N'Franco Nino', N'Pascua', N'Vismanos', N'267', CAST(0x0000724300000000 AS DateTime), N'Balongating, Guipos Zamboanga del Sur', N'M', 2, N'MRD', CAST(0x00009E7A00000000 AS DateTime), 5, 82, N'OO', N'933784719', N'1008393077', NULL, N'160502854493', N'J0311002281', 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (146, N'Suzanne', N'Partosa', N'Partes', N'284', CAST(0x0000809E00000000 AS DateTime), N'Boalan, Zamboanga City', N'F', 2, N'SGL', NULL, 5, 45, N'OO', N'410922755', N'1009177470', NULL, N'140501379944', NULL, 0, N'28')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (147, N'Dalia', N'Pata', N'Gumolon', N'053', CAST(0x00006C3200000000 AS DateTime), N'Oroquieta City', N'F', 2, N'MRD', CAST(0x00008DA000000000 AS DateTime), 5, 60, N'AA', NULL, N'1006851391', N'176000113381', N'190897832740', NULL, 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (148, N'Seth', N'Pausanos', N'Lumantas', N'064', CAST(0x00006DD400000000 AS DateTime), N'Lower Langcangan, Oroquieta City', N'M', 2, N'MRD', CAST(0x000098C600000000 AS DateTime), 5, 75, N'BB', N'280690598', N'0811182777', N'176000115122', N'140500541993', N'K1296004063', 0, N'06')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (149, N'Juvelyn', N'Pelesores', N'Zafra', N'148', CAST(0x0000778D00000000 AS DateTime), N'Candajie, Clarin Bohol', N'F', 2, N'SGL', NULL, 5, 60, N'OO', N'267440053', N'0626149028', N'176000123283', N'140500865500', NULL, 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (150, N'Ma. Freya', N'Pelias', N'Ruda', N'191', CAST(0x0000735E00000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', CAST(0x00009B8600000000 AS DateTime), 5, 42, N'OO', N'243814052000', N'0622076629', N'176000132630', N'120504829672', NULL, 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (151, N'May Ann', N'Pioquinto', N'Cayetano', N'314', CAST(0x0000825900000000 AS DateTime), N'Dipolo Molave, Zambo. del Sur', N'F', 1, N'SGL', NULL, 5, 53, NULL, N'422923061', N'1009462790', N'121056960015', N'140251671490', NULL, 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (152, N'Rosemarie', N'Plazos', N'Redera', N'262', CAST(0x00007B2F00000000 AS DateTime), N'East Poblacion, Manukan ZN', N'F', 2, N'MRD', CAST(0x00009F1000000000 AS DateTime), 5, NULL, N'BB', N'41092242500', N'1008978502', NULL, N'140251408358', NULL, 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (153, N'Maria Chona', N'Quisquis', N'Recentes', N'005', CAST(0x0000622200000000 AS DateTime), N'Estaka, Dipolog City', N'F', 2, N'MRD', CAST(0x0000868600000000 AS DateTime), 4, 61, N'OO', N'174376279', N'1004378274', N'176000107327', N'140500746366', N'J0111000344', 0, N'00')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (154, N'Maria Christine', N'Quiñones', N'Tacujan', N'080', CAST(0x0000734000000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', CAST(0x0000992200000000 AS DateTime), 158, 141, N'AA', N'270835543', N'3375423270', N'140500542027', NULL, NULL, 0, N'08')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (155, N'Merlito ', N'Quitalig', N'Mejos', N'131', CAST(0x000075FD00000000 AS DateTime), N'Landing, Baliangao Misamis Occidental', N'M', 2, N'MRD', CAST(0x0000992400000000 AS DateTime), 5, 91, N'OO', N'275200432', N'0814389276', N'176000122650', N'140500815163', N'K1205000606', 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (156, N'Christian Mar', N'Ramirez', N'Igaran', N'325', CAST(0x0000805C00000000 AS DateTime), N'Tikay, Malolos Bulacan', N'M', 2, N'SGL', NULL, 5, 60, NULL, N'422887182', NULL, NULL, N'140501594772', N'G0812001680', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (157, N'Mark', N'Ramirez', N'Yurong', N'189', CAST(0x0000738200000000 AS DateTime), N'Cebu City', N'M', 2, N'MRD', CAST(0x000099B100000000 AS DateTime), 5, 75, N'OO', N'232194957000', N'0623831122', N'176000131231', N'120505745456', N'G0698050186', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (158, N'Ian Jay', N'Ranoco', N'Anoz', N'329', CAST(0x0000803100000000 AS DateTime), N'Camul, Tampilisan, Zamboanga del Norte', N'M', 18, N'SGL', NULL, 5, 56, N'OO', NULL, N'1010317782', NULL, N'140501631562', N'J0112003299', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (159, N'Michael', N'Realiza ', N'Rendoque', N'182', CAST(0x0000759700000000 AS DateTime), N'Estaka, Dipolog City', N'M', 2, N'MRD', CAST(0x000099F000000000 AS DateTime), 5, 73, N'OO', N'264175701', N'1006919453', N'176000130143', N'14050099078', N'J0107003041', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (160, N'Angelie', N'Paconces', N'Regaña', N'244', CAST(0x00007BA300000000 AS DateTime), N'Hilongos, Leyte', N'F', 2, N'MRD', NULL, 5, 63, NULL, N'261151849', N'0628093211', NULL, N'120506963627', NULL, 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (161, N'Ginalyn', N'Roda', N'Realiza', N'126', CAST(0x0000741900000000 AS DateTime), N'Dapitan City', N'F', 2, N'MRD', CAST(0x00009D7700000000 AS DateTime), 5, 50, N'BB', N'933783411', N'1007085315', N'176000122662', N'140250279554', NULL, 0, N'12')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (162, N'Honey Laine', N'Ronquillo', N'Odchigue', N'133', CAST(0x000079CD00000000 AS DateTime), N'Salay, Misamis Oriental', N'F', 1, N'MRD', CAST(0x0000A05000000000 AS DateTime), 5, NULL, N'OO', N'647046394000', N'1005837167', N'176000122138', N'140500789715', NULL, 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (163, N'David Emmanuel', N'Roxas', N'Roxas', N'228', CAST(0x000079E100000000 AS DateTime), N'Sta. Maria, Bulacan', N'M', 2, N'MRD', CAST(0x0000983E00000000 AS DateTime), 5, 78, N'BB', NULL, N'1005827559', N'001014446899', N'140501118881', N'J0502009136', 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (164, N'Arlyn', N'Sabandal', N'Caliso', N'184', CAST(0x0000798800000000 AS DateTime), N'Caluya, Sapang Dalaga Misamis Occidental', N'F', 2, N'MRD', CAST(0x00009D6200000000 AS DateTime), 5, 58, N'OO', N'275644793', N'0816125658', N'176000130132', N'150257946061', NULL, 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (165, N'Brent Wilkinson', N'Saguin', N'Narvaez', N'243', CAST(0x00007CFE00000000 AS DateTime), N'Turno,Dipolog City', N'M', 2, N'MRD', CAST(0x00009FD200000000 AS DateTime), 5, 73, N'OO', N'404107777000', N'1008309223', N'090145305306', N'140501205482', N'J0106003849', 0, N'24')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (166, N'Cherely', N'Saguin', N'Else', N'048', CAST(0x0000732200000000 AS DateTime), N'Poblacion2, Clarin, Misamis Occidental', N'F', 16, N'MRD', CAST(0x00009FD200000000 AS DateTime), 5, 50, N'AA', NULL, NULL, NULL, NULL, NULL, 0, N'04')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (167, N'Messy Gay', N'Saile', N'Becada', N'276', CAST(0x00007F8800000000 AS DateTime), N'Dipolog City', N'F', 2, N'SGL', NULL, 5, 44, NULL, N'286253232', N'3417231317', NULL, NULL, NULL, 0, N'27')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (168, N'Rudelyn', N'Signar', N'Naret', N'203', CAST(0x000078DE00000000 AS DateTime), N'Molave, Zamboanga del Sur', N'F', 2, N'MRD', CAST(0x00009A3800000000 AS DateTime), 5, 51, N'BB', N'242530686', N'0812772173', N'090143498203', N'120504805641', NULL, 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (169, N'Rechill Lou', N'Simbajon', N'Pulangas', N'332', CAST(0x0000841100000000 AS DateTime), N'Poblacion 4, Misamis Occidental', N'F', 1, N'SGL', NULL, 5, 40, N'BB', NULL, NULL, NULL, NULL, NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (170, N'Mark Herwen', N'Siuyco', N'Manaba', N'302', CAST(0x00007A2700000000 AS DateTime), N'San Roque, Zamboanga del Norte', N'M', 1, N'MRD', CAST(0x00009D6500000000 AS DateTime), 5, 72, N'AA', N'298361455000', NULL, NULL, NULL, N'K1210000671', 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (171, N'Marlyn', N'Soliva', N'Quezon', N'079', CAST(0x00006F5500000000 AS DateTime), N'Patawag, Liloy ZN', N'F', 2, N'MRD', CAST(0x0000933800000000 AS DateTime), 4, 47, N'OO', N'209196569000', N'1007147169', N'17600116566', N'140500602690', NULL, 0, N'07')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (172, N'Martenelle', N'Suicano', N'Cales', N'134', CAST(0x0000764900000000 AS DateTime), N'DMC, Dipolog City', N'M', 2, N'MRD', CAST(0x0000A0BB00000000 AS DateTime), 5, 65, N'OO', N'265181816', N'1005861065', N'176000122262', N'140250582273', N'J0199029902', 0, N'13')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (173, N'Donald', N'Supilanas', N'Miranda', N'085', CAST(0x000071D500000000 AS DateTime), N'Provincial Hospital, Tagbilaran Bohol', N'M', 2, N'MRD', CAST(0x0000963F00000000 AS DateTime), 5, 72, N'AB', NULL, N'1007066826', NULL, NULL, N'J0102038406', 0, N'08')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (174, N'Grace Marie', N'Sularte', N'Maylon', N'326', CAST(0x0000830A00000000 AS DateTime), N'Dapitan City', N'F', 18, N'SGL', NULL, 5, 50, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (175, N'Enrique', N'Sulatre', N'Jaictin', N'179', CAST(0x0000685400000000 AS DateTime), N'Polanco ZN', N'M', 2, N'MRD', CAST(0x000093D300000000 AS DateTime), 5, 68, N'AB', N'940569061', N'3316838811', NULL, N'140500779264', N'J0509001070', 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (176, N'Lovely Mary', N'Tac-an', N'Zaragosa', N'107', CAST(0x0000774F00000000 AS DateTime), N'Lower Lamac, Oroquieta City', N'F', 2, N'MRD', CAST(0x0000980300000000 AS DateTime), 5, 50, N'OO', N'275187980', N'3392360620', N'176000119305', N'140500717153', NULL, 0, N'10')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (177, N'Teresita', N'Tadan', N'Ocado', N'002', CAST(0x00004E1000000000 AS DateTime), N'Irasan, Roxas ZN ', N'F', 2, N'MRD', CAST(0x00006D1800000000 AS DateTime), 5, NULL, N'BB', N'116627858', N'1002847503', N'176000107338', N'140500746447', NULL, 0, N'00')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (178, N'Gerard', N'Tampoog', N'Gamotin', N'307', CAST(0x000076FF00000000 AS DateTime), N'Nailon, Tudela Misamis Occidental', N'M', 2, N'SGL', NULL, 5, 59, N'AB', N'293821679', N'0220463362', N'121025103301', N'150502553315', N'K0411000729', 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (179, N' Zeneth', N'Tanjay', N'Fullido', N'016', CAST(0x000072F800000000 AS DateTime), N'Looc, Plaridel
', N'F', 2, N'MRD', CAST(0x000097B200000000 AS DateTime), 5, 71, N'BB', N'920788644', N'1007164964', N'176000125181', N'140500746374', NULL, 0, N'01')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (180, N'Hermilo Jr.', N'Tagudin', N'Grado', N'190', CAST(0x0000793000000000 AS DateTime), N'Landigan, Baclayon Bohol', N'M', 2, N'SGL', NULL, 5, 70, N'OO', N'937975529', N'1006950263', NULL, N'140501034718', N'G0608203496', 0, N'19')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (181, N'Henry Reyvan', N'Testa', N'Reformina', N'322', CAST(0x000082EF00000000 AS DateTime), N'Goleo, Sindangan ZN', N'M', 1, N'SGL', NULL, 5, 63, N'OO', N'422886569', NULL, N'121062969984', N'140501594799', N'G0812001717', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (182, N'Coralyn', N'Tuga-on', N'Batomalaque', N'299', CAST(0x000081F800000000 AS DateTime), N'Cebu City', N'F', 2, N'SGL', NULL, NULL, NULL, N'OO', N'418261601', N'0631294858', N'121025105690', N'140501532386', NULL, 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (183, N'Lloyd', N'Tuquib', N'Torres', N'238', CAST(0x00007D4D00000000 AS DateTime), N'Basak, Cebu City', N'M', 2, N'SGL', NULL, 5, 52, N'BB', N'263636569', N'0628050160', N'07647960370', N'120507156725', N'G0107004906', 0, N'23')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (184, N'Kristine', N'Ulla', N'Francisco', N'295', CAST(0x000075ED00000000 AS DateTime), N'San Andres, Cainta Rizal', N'F', 2, N'MRD', CAST(0x0000938400000000 AS DateTime), 5, 49, N'OO', N'944271561', N'0815641450', N'182000472438', N'150501282067', NULL, 0, N'29')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (185, N'Grace', N'Uy', N'Realiza', N'051', CAST(0x000060C700000000 AS DateTime), N'Dapitan City', N'F', 2, N'SGL', NULL, 5, 60, N'OO', N'135326147', N'0808616803', N'176000113401', N'150250005603', NULL, 0, N'05')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (186, N'James', N'Uy', N'Ceriales', N'145', CAST(0x0000792A00000000 AS DateTime), N'Cotabato City', N'M', 2, N'SGL', NULL, 5, 63, N'OO', N'275188761', N'0815259198', N'176000123248', N'140500865527', N'K1206000840', 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (187, N'Melody', N'Velasco', N'Manlapaz', N'216', CAST(0x00007BFF00000000 AS DateTime), N'Poblacion Ipil, Zamboanga del Sur', N'F', 6, N'MRD', CAST(0x0000A06A00000000 AS DateTime), 5, 55, N'OO', N'946497029', N'1007675165', N'090144399406', N'140501167785', NULL, 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (188, N'Juliven', N'Verzano', N'Laroya', N'187', CAST(0x00007A0600000000 AS DateTime), N'Balok, Sindangan Zamboanga del Norte', N'M', 2, N'MRD', CAST(0x00009CF200000000 AS DateTime), 5, 60, N'BB', N'275187165', N'1007322612', N'176000130232', N'140501053968', N'J01070022889', 0, N'18')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (189, N'Jenny', N'Vega', N'Caberte', N'176', CAST(0x00007BAA00000000 AS DateTime), N'Poblacion, Ipil Zamboang del Sur', N'F', 1, N'SGL', NULL, 5, 50, N'OO', N'947046416', N'1007261045', N'176000129419', N'140501072008', N'J0510001349', 0, N'17')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (190, N'Uzziel', N'Vicente', N'Guia', N'063', CAST(0x000069CB00000000 AS DateTime), N'Lowet Langcangan, Oroquieta City', N'M', 1, N'MRD', CAST(0x0000944E00000000 AS DateTime), 5, 65, N'OO', N'275195246000', N'1006864760', N'176000115111', N'150000435595', N'K1203026934', 0, N'06')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (191, N'Joan', N'Vidad', N'Marcial', N'268', CAST(0x0000810F00000000 AS DateTime), N'Brgy. Uno, Katipunan Zamboanga del Norte', N'F', 2, N'SGL', NULL, 5, 48, N'OO', N'412839599', N'1009043782', N'090147586402', N'140501303654', NULL, 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (192, N'Pamela', N'Tapales', N'Villacampa', N'301', CAST(0x00007F3500000000 AS DateTime), N'Bais City, Negros Oriental', N'F', 2, N'MRD', NULL, 5, 40, N'BB', N'412904479', N'3406428131', N'121052251903', N'140501504854', NULL, 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (193, N'Alexandria', N'Villarido', N'Bendebel', N'315', CAST(0x0000831300000000 AS DateTime), N'Sto. Nino, Tukuran, Zamboanga del Sur', N'F', 5, N'SGL', NULL, 5, 40, N'AA', N'422889303', N'1009462907', N'', N'140251671628', NULL, 0, N'31')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (194, N'Garlie Jhay', N'Villarmino', N'Seno', N'205', CAST(0x00007B1900000000 AS DateTime), N'Pob. Buug, Pagadian Zambo. Sur', N'M', 3, N'MRD', CAST(0x00009A6F00000000 AS DateTime), 5, 52, N'AA', N'275649846', N'1007644471', N'090143733303', N'14051082356', N'J0108003631', 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (195, N'Yvonne Grace', N'Villaver', N'Bas', N'303', CAST(0x0000817F00000000 AS DateTime), N'Minglanilla, Cebu City', N'F', 2, N'SGL', NULL, 4, 49, N'BB', N'406259198000', N'0631161978', NULL, N'140501532378', NULL, 0, N'30')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (196, N'Raygeline', N'Yabo', N'Ledesma', N'039', CAST(0x0000711900000000 AS DateTime), N'Taboc Norte, Oroquieta City ', N'F', 14, N'MRD', CAST(0x000090D500000000 AS DateTime), 5, 43, N'OO', N'270321236', N'0822188809', N'090131328004', N'190897225399', NULL, 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (197, N'Dale Amadeus', N'Zanoria', N'Besabella', N'327', CAST(0x0000819E00000000 AS DateTime), N'Cebu City', N'M', 2, N'MRD', CAST(0x00009F9F00000000 AS DateTime), 5, 55, N'BB', NULL, N'0632572281', NULL, N'120252714761', N'G0111003022', 0, N'32')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (198, N'Rod Francis', N'Romero', N'Silva', N'376', CAST(0x0000825700000000 AS DateTime), N'Dumaguete, Negros Oriental', N'M', 2, N'SGL', NULL, 5, 58, N'OO', N'436377790000', N'0728366479', NULL, N'120512161338', NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (199, N'Jim Paul', N'Caldera', N'Partosa', N'377', CAST(0x00007EBB00000000 AS DateTime), N'Dumaguete City, Negros Oriental', N'M', 2, N'MRD', CAST(0x0000A1BB00000000 AS DateTime), 172, 143, N'AA', N'426564563000', N'0724714944', N'913200129279', N'120507810611', N'G0204077746', 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (200, N'Richard Brendo', N'Monieva', N'Ompoc', N'378', CAST(0x000085BA00000000 AS DateTime), N'Brgy. Banabe, Pagadian City Zambianga del Norte', N'M', 2, N'SGL', NULL, 169, 132, N'OO', NULL, N'1010964533', N'913333094511', N'140251926979', NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (201, N'Allaine Kristine', N'Quirante', N'Acaylar', N'381', CAST(0x0000843400000000 AS DateTime), N'Sto. Nino, Polanco Zamboanga del Norte', N'F', 2, N'SGL', NULL, 153, 101, NULL, NULL, N'1010963615', N'121105865206', N'140251925468', NULL, 0, N'38')
GO
print 'Processed 200 total records'
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (202, N'Jade', N'Paghasian', N'Bation', N'379', CAST(0x00007A6C00000000 AS DateTime), N'Cang-inte, Siquijor', N'M', 2, N'SGL', NULL, 165, 132, N'OO', NULL, N'0729193243', N'913337023684', N'120253273866', N'G0211002695', 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (203, N'Lydith Marie', N'Barrera', N'Benitez', N'380', CAST(0x000083F900000000 AS DateTime), N'Lawaan,Dapitan City', N'F', 2, N'SGL', NULL, 160, 110, N'BB', NULL, N'1010964423', N'121105932394', N'140251925263', NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (204, N'Mirriam', N'Sumaylo', N'Adaro', N'382', CAST(0x000084DF00000000 AS DateTime), N'Brgy. Dos, Katipunan Zamboanga del Norte

', N'F', 2, N'SGL', NULL, 153, 103, NULL, NULL, N'1010963301', NULL, N'140251925042', NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (205, N'Johannes', N'Acasio', N'Benlot', N'383', CAST(0x00007B1E00000000 AS DateTime), N'Vet. Village, Zamboanga Sibugay', N'M', 2, N'SGL', NULL, 168, 126, N'AA', N'263437540', N'1007783170', NULL, NULL, N'', 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (206, N'Alfie', N'Beres', N'Bontilao', N'384', CAST(0x0000746500000000 AS DateTime), N'Cebu City', N'M', 2, N'MRD', CAST(0x0000974F00000000 AS DateTime), 165, 160, N'AB', N'227695765000', N'0618974007', N'121008192285', NULL, N'G0100263894', 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (207, N'Krishan', N'Gementiza', N'Lagutin', N'385', CAST(0x0000852E00000000 AS DateTime), N'Dipolog City', N'F', 2, N'SGL', NULL, 150, 95, NULL, NULL, N'1011001097', N'121108415534', N'140251944713', NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (208, N'John Raymund', N'Ponte', N'Almirol', N'336', CAST(0x00007AD500000000 AS DateTime), N'Galas, Dipolog City', N'M', 2, N'MRD', CAST(0x0000986F00000000 AS DateTime), 5, 68, N'OO', N'261505852000', N'0627944251', N'164000780916', N'120506838229', N'J0105002057', 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (209, N'Feljore', N'Tan', N'Recentes', N'338', CAST(0x000081B600000000 AS DateTime), N'Dipolog City', N'F', 2, N'SGL', NULL, 4, 40, NULL, NULL, N'1010468644', NULL, NULL, NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (210, N'Alfie', N'Borlasa', N'Japon', N'340', CAST(0x0000844C00000000 AS DateTime), N'Thru-cut, Manasa Compostela Valley Province
', N'M', 2, N'SGL', NULL, 5, 72, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (211, N'Bryan Gil', N'Bello', N'Morte', N'341', CAST(0x00007A6500000000 AS DateTime), N'Dumaguete City', N'M', 1, N'MRD', CAST(0x00009EE200000000 AS DateTime), 5, 62, N'OO', N'403960000', N'0726060780', N'120509829999', NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (212, N'Regan', N'Villafuerte', N'Tamayo', N'342', CAST(0x0000815400000000 AS DateTime), N'Poblacion Gutalac,Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (213, N'Marvin', N'Palban', N'Bellesas', N'343', CAST(0x000074D000000000 AS DateTime), N'Can-avid, Eastern Samar', N'M', 2, N'MRD', CAST(0x0000989900000000 AS DateTime), 5, 74, N'OO', N'228503500000', N'0623556915', NULL, N'120503975918', N'G0107004061', 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (214, N'Ariel', N'Jumawan', N'Dumasapal', N'344', CAST(0x000081DE00000000 AS DateTime), N'Liloy Zamboanga del Norte', N'M', 2, N'SGL', NULL, 5, 60, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (215, N'Norie Mae', N'Torres', N'Lacay', N'345', CAST(0x0000804100000000 AS DateTime), N'Dapitan City', N'F', 2, N'SGL', NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (216, N'Analyn', N'Digamon', N'Birad', N'346', CAST(0x0000824000000000 AS DateTime), N'La Union, Labason Zamboanga del Norte', N'F', 2, N'SGL', NULL, 5, 48, NULL, NULL, N'10105655194', NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (217, N'Jessa', N'Pausal', N'Obordo', N'347', CAST(0x000081CD00000000 AS DateTime), N'Dapitan City', N'F', 2, N'SGL', NULL, 5, 55, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (218, N'Cherry', N'Verganio', N'Divinagracia', N'348', CAST(0x0000838700000000 AS DateTime), N'Sta. Isabel, Dipolog City', N'F', 2, N'SGL', NULL, 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (219, N'Jainaritz', N'Herida', N'Ferolino', N'349', CAST(0x00007FB900000000 AS DateTime), N'Bayugan City, Agusan del Sur', N'F', 6, N'SGL', NULL, 5, 52, N'AB', NULL, NULL, NULL, NULL, NULL, 0, N'34')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (220, N'Lelith', N'Palmero', N'Tejares', N'351', CAST(0x000083D000000000 AS DateTime), N'Buburay, Dimataling Zamboanga del sur', N'F', 2, N'SGL', NULL, 5, 50, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (221, N'Emilyn Joyce', N'Garcia', N'Ramos', N'352', CAST(0x0000791700000000 AS DateTime), N'Dumaguete, Negros Oriental', N'F', 2, N'SGL', NULL, 5, 50, N'BB', N'305282190', N'0723187776', N'121020795575', NULL, N'G0206002021', 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (222, N'Mizie', N'Ministerio', N'Colis', N'353', CAST(0x0000801A00000000 AS DateTime), N'Busay, Cebu City', N'F', 2, N'SGL', NULL, 5, 50, N'AA', NULL, N'0632152300', N'913030029212', NULL, NULL, 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (223, N'Kisleen Joyce', N'Lavilla', N'Acapulco', N'354', CAST(0x000081CA00000000 AS DateTime), N'Sta. Lucia District, Pagadian City', N'F', 2, N'SGL', NULL, 5, 50, N'OO', N'410523953', N'0726616590', N'121088180029', N'110505489926', NULL, 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (224, N'Jon Ian Mark', N'Ortega', N'Baga', N'355', CAST(0x0000853D00000000 AS DateTime), N'Sicayab, Dipolog City', N'M', 2, N'SGL', NULL, 5, 65, N'BB', NULL, N'1010707936', N'913126118664', NULL, N'J0112001385', 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (225, N'Joseph Arsie', N'Santillana', N'Segundo', N'356', CAST(0x00007FA100000000 AS DateTime), N'Loon, Bohol ', N'M', 2, N'SGL', NULL, 5, 60, N'OO', NULL, NULL, NULL, NULL, N'G0112004880', 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (226, N'McKevin King', N'Ocao', N'Siangco', N'357', CAST(0x000080A300000000 AS DateTime), N'Pangi, Siquijor', N'M', 2, N'SGL', NULL, 5, 60, N'AB', N'413572787', N'3428507755', NULL, NULL, N'G0411000270', 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (227, N'Gentle', N'Bernabe', N'Laga', N'358', CAST(0x00007F7300000000 AS DateTime), N'Brgy 2, Kabankalan, Negros Occidental', N'M', 14, N'SGL', NULL, 5, 65, NULL, NULL, N'0725610351', NULL, N'110505718666', NULL, 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (228, N'Luisa Marie', N'Sta. Romana', N'Glorificacion', N'359', CAST(0x000082C100000000 AS DateTime), N'Brgy. Salong, Kabankalan City', N'F', 2, N'SGL', NULL, 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'35')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (229, N'Lalaine Rachel', N'Orcullo', N'Fortuito', N'360', CAST(0x0000844B00000000 AS DateTime), N'Magatas,Sibulan Negros Oriental', N'F', 1, N'SGL', NULL, 4, 55, NULL, NULL, N'0728602997', NULL, NULL, N'G0813001247', 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (230, N'Janice', N'Lampaug', N'Torres', N'361', CAST(0x0000855A00000000 AS DateTime), N'Bolo, Pal-ew, Tanjay City', N'F', 2, N'SGL', NULL, 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (231, N'Ryan', N'Alberio', N'Alpar', N'362', CAST(0x000084A200000000 AS DateTime), N'Tabuan, Bayawan', N'M', 2, N'MRD', CAST(0x0000A14F00000000 AS DateTime), 5, 62, N'OO', NULL, NULL, NULL, NULL, N'G0212005031', 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (232, N'Ryan', N'Cataal', N'Nunez', N'363', CAST(0x0000844400000000 AS DateTime), N'Pob. Mahayag, Zamboanga del Sur', N'M', 6, N'SGL', NULL, 5, 45, N'AA', NULL, N'1010768182', NULL, NULL, N'J0113503467', 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (233, N'Melanie', N'Tusit', N'Capundag', N'364', CAST(0x0000840000000000 AS DateTime), N'Miputak, Dipolog City', N'F', 2, N'SGL', NULL, 5, 52, N'AA', NULL, NULL, NULL, NULL, NULL, 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (234, N'Lalaine', N'Montallana', N'Gemperoso', N'365', CAST(0x0000836700000000 AS DateTime), N'Lawa-an, Dapitan Ctiy', N'F', 2, N'SGL', NULL, 5, 45, N'BB', N'442526139', N'1010656951', NULL, N'140251834500', NULL, 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (235, N'Joyce', N'Patlingrao', N'Apelanio', N'366', CAST(0x0000844000000000 AS DateTime), N'Cebu City', N'F', 2, N'SGL', NULL, 5, 80, NULL, NULL, NULL, N'121095759242', NULL, NULL, 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (236, N'Alera', N'Ochea', N'Sagarino', N'367', CAST(0x000082B100000000 AS DateTime), N'Marigondon, Lapu-lapu Cebu City', N'F', 2, N'SGL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (237, N'Marbien', N'Salvado', N'Navarro', N'369', CAST(0x00007DDD00000000 AS DateTime), N'Cebu City', N'M', 3, N'SGL', NULL, NULL, NULL, NULL, N'259478281000', N'0627967283', N'913214269534', N'120506696076', N'G0108002557', 0, N'36')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (238, N'Irish Vance', N'Trangia', N'Quiamco', N'371', CAST(0x0000827300000000 AS DateTime), N'Siquijor', N'F', 2, N'SGL', NULL, 5, 55, N'AA', NULL, N'0634288230', NULL, NULL, NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (239, N'Johngyver', N'Paulin', N'Sarigumba', N'372', CAST(0x000084F400000000 AS DateTime), N'Talairon, Oroquieta City', N'M', 2, N'SGL', NULL, 5, 52, NULL, N'436702191', NULL, NULL, NULL, NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (240, N'Win Jay', N'Samorin', N'Timboligue', N'373', CAST(0x0000835E00000000 AS DateTime), N'Bantayan, Sindangan Zamboanga del Norte', N'M', 3, N'SGL', NULL, 5, 50, N'OO', NULL, N'1010905479', NULL, NULL, NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (241, N'Shiena Pearl', N'Busa', N'Asentista', N'374', CAST(0x0000857500000000 AS DateTime), N'Calatunan, Sindangan Zamboanga del Norte', N'F', 2, N'SGL', NULL, NULL, 41, NULL, NULL, N'1010903743', NULL, NULL, NULL, 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (242, N'Junrel', N'Villarin', N'Ventolero', N'375', CAST(0x0000819D00000000 AS DateTime), N'Motibot, Dipolog City', N'M', 2, N'SGL', NULL, 5, 59, NULL, N'416054407', N'1009403911', NULL, N'140501516771', N'J0111004219', 0, N'37')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (243, N'Cresencio', N'Bantoto', N'Calubag', N'229', CAST(0x000051F800000000 AS DateTime), N'Libjo, Dauin, Negros Oriental', N'M', 3, N'MRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (244, N'Carl', N'Piñero', N'David', N'208', CAST(0x00006FAF00000000 AS DateTime), N'Manila', N'M', 2, N'MRD', NULL, 5, 63, N'OO', N'212-884-859', N'33-6577309-5', N'', N'14-050095815', N'J01-98-02847', 0, N'20')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (245, N'Manolin', N'Ibañez', N'Tinonga', N'143', CAST(0x0000769900000000 AS DateTime), N'Central Brgy., Dipolog City', N'M', 2, N'MRD', CAST(0x0000A1AF00000000 AS DateTime), 5, 72, N'OO', N'949-085-986', N'100638258-5', N'1760-0012-29', N'14-050083731', N'J01-09-00093', 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (246, N'Joffer', N'Cachin', N'Bejer', N'030', CAST(0x000072EE00000000 AS DateTime), N'Dipolog City', N'M', 2, N'MRD', CAST(0x000097DC00000000 AS DateTime), 5, 105, N'BB', N'264-754-742', N'10-0685036-3', N'14-050051928', N'1760-0011-19', N'JO1-97-024-2', 0, N'03')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (247, N'Ryan', N'Briones', N'Adaza', N'226', CAST(0x00007AD700000000 AS DateTime), N'Pob. Sta. Cruz, Sindangan, Z.N>', N'M', 1, N'MRD', CAST(0x0000A29400000000 AS DateTime), NULL, NULL, N'AA', N'974-046-424', N'10-0823562-7', N'090144823111', N'140501177284', NULL, 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (248, N'Irish Mae', N'Osorio', N'Tabudlong', N'211', CAST(0x00007CF200000000 AS DateTime), NULL, N'F', 2, N'MRD', CAST(0x0000A0B800000000 AS DateTime), 4, 48, N'BB', N'275-187-382-', N'10-08114104', N'090144123701', N'140501139498', NULL, 0, N'21')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (249, N'Haidee', N'Diagmel', N'Ortega', N'061', CAST(0x00006C4100000000 AS DateTime), N'Dipolog City', N'F', 14, N'MRD', CAST(0x00008F3D00000000 AS DateTime), NULL, 65, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'06')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (250, N'Rodrigo', N'Castol', N'Mapas', N'144', CAST(0x000064EA00000000 AS DateTime), N'Balok, Katipunan, Z. N.', N'F', 2, N'MRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'14')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (251, N'Nevele Jane', N'Balacy', N'Crispo', N'266', CAST(0x0000807200000000 AS DateTime), N'Mandih, Sindangan, Z. N.', N'F', 2, N'MRD', CAST(0x0000A13500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'26')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (252, N'Kenneth Carlou', N'Montajes', N'Recentes', N'258', CAST(0x00007C8800000000 AS DateTime), N'Miputak, Diplog City', N'M', 2, N'SGL', NULL, 5, 56, N'OO', N'299-034-091', N'10-0852062-0', N'090145895801', N'140501253509', N'JO1-05-00229', 0, N'25')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (253, N'Malyn', N'Petras', N'Elumba', N'335', CAST(0x0000823700000000 AS DateTime), N'Catarman, Bobon, Northern Samar', N'F', 2, N'MRD', NULL, 152, 58, N'AA', NULL, N'10-1038597-6', NULL, NULL, NULL, 0, N'33')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (254, N'Cherry Mae', N'Sitoy', N'Utbo', N'386', CAST(0x00007FB900000000 AS DateTime), N'Boctol, Tagbilaran, Bohol', N'F', 2, N'SGL', NULL, NULL, 95, N'OO', NULL, N'06-2744098-8', N'121109974080', NULL, NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (255, N'Kathreen', N'Leyson', N'Baybado', N'387', CAST(0x00007F0C00000000 AS DateTime), N'Pob. Ipil, Z.N.', N'F', 19, N'SGL', NULL, 158, 117, N'OO', N'293-758-912', N'10-0895569-3', N'1211-0004-22', N'14-050145223', NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (256, N'Mary Ann', N'Basas', N'Cahutay', N'049', CAST(0x0000725300000000 AS DateTime), N'Ozamiz City', N'F', 2, N'MRD', CAST(0x000097BD00000000 AS DateTime), 5, 50, N'OO', N'947-034-331', N'10-0685109-0', N'176000125170', N'190897832627', NULL, 0, N'04')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (257, N'Janice', N'Salvo', N'Roa', N'388', CAST(0x0000754800000000 AS DateTime), N'Tagbilaran City, Bohol', N'F', 2, N'MRD', CAST(0x00009CEB00000000 AS DateTime), 158, 132, N'AA', NULL, NULL, NULL, NULL, NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (258, N'Rochelle', N'Ladista', N'Gomez', N'389', CAST(0x0000806700000000 AS DateTime), N'Carang, Dapitan City', N'M', 2, N'SGL', NULL, 165, 112, N'OO', NULL, NULL, NULL, NULL, NULL, 0, N'38')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (259, N'Jayfrelle', N'Taclob', N'Socias', N'390', CAST(0x0000859C00000000 AS DateTime), N'Dipolog City, Zamboanga del Norte', N'M', 2, N'SGL', NULL, 180, 154, NULL, NULL, N'10-1110602-8', N'121115595788', N'140252075379', N'JO1-11000758', 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (260, N'Romy Lloyd', N'Casulla', N'Duque', N'391', CAST(0x000086C700000000 AS DateTime), N'Antonino, Labason, ZN', N'M', 2, N'SGL', NULL, 177, 121, NULL, NULL, N'1011106109', N'121115600373', N'142010922908', N'JO1114502211', 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (261, N'Ailene', N'Ebao', N'Bihag', N'392', CAST(0x0000868500000000 AS DateTime), N'Antonino, ZN', N'F', 2, N'SGL', NULL, 155, 108, NULL, NULL, N'101120460', NULL, N'140252075166', NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (262, N'Ricardo, Jr.', N'Gonzaga', N'Sanopao', N'393', CAST(0x000085FE00000000 AS DateTime), N'Lawis, Sindangan, Zn.', N'M', 2, N'SGL', NULL, 170, 137, NULL, NULL, N'1011124547', NULL, NULL, NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (263, N'Shermei', N'de Dios', N'Degara', N'394', CAST(0x0000869D00000000 AS DateTime), N'Mahunodhunod, Cuartero, Capiz', N'F', 2, N'SGL', NULL, 149, 88, NULL, N'447718485', N'1011048539', N'121110766936', N'140501864796', NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (264, N'Grichelle', N'Tumimbang', N'Siong', N'396', CAST(0x000085EB00000000 AS DateTime), N'Dapitan, ZN.', N'F', 2, N'SGL', NULL, 168, 135, N'AA', NULL, NULL, N'121119289378', N'14025095639', NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (265, N'Jenelyn', N'Cadorna', N'Andig', N'397', CAST(0x000085CC00000000 AS DateTime), N'Baga, Naga, Zambo. Sibugay', N'F', 2, N'SGL', NULL, 153, 88, NULL, NULL, NULL, N'121119856001', N'140252092982', NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (266, N'Teodorico I', N'Calumpang', N'Barba', N'398', CAST(0x0000823D00000000 AS DateTime), N'Pob. Pamplona, Negros Oriental', N'M', 2, N'SGL', NULL, 175, 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (267, N'Diana Joy', N'Labadan', NULL, N'399', CAST(0x000082EA00000000 AS DateTime), N'Mobod, Oroquieta City', N'F', 18, N'SGL', NULL, 149, 102, N'AA', N'438012066000', N'0819883421', N'121108656270', N'150253233119', NULL, 0, N'39')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (268, N'Nico', N'Langutan', N'Yap', N'400', CAST(0x000081ED00000000 AS DateTime), N'Zamboanga CIty', N'M', 2, N'SGL', NULL, 163, 137, N'OO', NULL, N'1011187762', NULL, N'140252102481', N'SP226202804', 0, N'40')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (269, N'Dionesio', N'Acain', N'Nacion', N'401', CAST(0x000083A400000000 AS DateTime), N'Patawag, Labason', N'M', 1, N'MRD', CAST(0x0000A04100000000 AS DateTime), 160, 124, NULL, N'453896403', NULL, NULL, NULL, N'JO114001570', 0, N'40')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (270, N'Ararose', N'Regañon', N'Velasco', N'402', CAST(0x000081DB00000000 AS DateTime), N'Turno, Dipolog City', N'F', 2, N'SGL', NULL, 158, 99, N'OO', N'432636721', N'1009291275', N'121044113314', N'020508234296', NULL, 0, N'40')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (271, N'Mark Kevin', N'Comodas', N'Quisquis', N'403', CAST(0x0000848E00000000 AS DateTime), N'Dipolog City, ZN.', N'M', 2, N'SGL', NULL, 163, 124, N'OO', NULL, N'1011190746', N'914177790317', N'140252105057', NULL, 0, N'40')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (272, N'Brendo', N'Templado', N'Maligro', N'224', CAST(0x00007AA300000000 AS DateTime), N'Banigan, Liloy, ZN.', N'M', 19, N'SGL', NULL, 175, 155, N'OO', N'947047510', N'1007731135', NULL, NULL, NULL, 0, N'22')
INSERT [dbo].[employee] ([employee_id], [employee_firstname], [employee_lastname], [employee_middlename], [id_num], [birth_date], [birth_place], [gender], [religion_id], [civil_status], [marriage_date], [height], [weight], [blood_type], [tin], [sss], [hdmf], [phic], [drivers_license], [is_inactive], [pin]) VALUES (273, N'Gee', N'Pagcaliwagan', N'Obnimaga', N'405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'40')
SET IDENTITY_INSERT [dbo].[employee] OFF
/****** Object:  UserDefinedFunction [dbo].[fn_get_sysconfig_value]    Script Date: 10/19/2014 19:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_get_sysconfig_value]
(
	@code varchar(30)
)
RETURNS varchar(50)
AS
BEGIN
    declare @value varchar(50)
    
    select @value = sysconfig_value
      from sysconfig sc (nolock)
     where sc.sysconfig_code = @code
     
	-- Return the result of the function
	RETURN @value
END
GO
/****** Object:  Table [dbo].[wsmessagein]    Script Date: 10/19/2014 19:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wsmessagein](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [int] NOT NULL,
	[ws_message] [xml] NOT NULL,
	[ws_message_date] [datetime] NOT NULL,
	[priority] [int] NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_wsmessagein] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[dtr_get_employee]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dtr_get_employee]
	@id_num varchar(12),
	@pin char(4)
AS
BEGIN
	select e.employee_id,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from employee e (nolock)
	 where e.id_num = @id_num
	   and e.pin = @pin
END
GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessagein_status]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessagein_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
END
GO
/****** Object:  Table [dbo].[dtr]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtr](
	[dtr_id] [int] IDENTITY(1,1) NOT NULL,
	[location_code] [char](3) NULL,
	[remote_dtr_id] [int] NULL,
	[dtr_date] [date] NOT NULL,
	[employee_id] [int] NOT NULL,
	[time_in] [time](7) NOT NULL,
	[time_out] [time](7) NULL,
	[dtr_snapshot_in] [varchar](250) NULL,
	[dtr_snapshot_out] [varchar](250) NULL,
	[dtr_remarks] [varchar](250) NULL,
	[dtrstatus_code] [char](3) NOT NULL,
	[syncstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_dtr] PRIMARY KEY CLUSTERED 
(
	[dtr_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dtr_log_time]
	@employee_id integer,
	@dtr_snapshot varchar(250)
AS
BEGIN
    declare @current_date datetime
	declare @dtr_date date
	declare @dtr_time time(0)
	declare @logged integer
	declare @orphaned integer
	declare @post_message varchar(100) = 'Time posted successfully.'
	declare @log_status varchar(10)
	declare @min_timeout_interval decimal(4,2)
	declare @total_hours decimal(4,2)
	declare @log_complete smallint = 0
	
	-- get current date
	set @current_date = GETDATE()
	
	-- get DTR date
	set @dtr_date = CONVERT(date, @current_date, 101)
	-- get current time
	set @dtr_time = CONVERT(time, @current_date)
	-- get minimum timeout
	set @min_timeout_interval = isnull(dbo.fn_get_sysconfig_value('MIN_TIMEOUT_INTERVAL'),0) / 60.0
	
	-- check if current date's log is complete
	-- meaning employee has logged his/her time
	-- employee can only have 2 "logs" 
	-- per day
	-- for both AM and PM 
	select @logged = COUNT(dtr_id)
	  from dtr d (nolock)
	 where d.dtr_date = @dtr_date
	   and d.employee_id = @employee_id  
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 and @dtr_time < '17:00:00'
	begin
	  insert 
	    into dtr
			 (dtr_date,
			 employee_id,
			 time_in,
			 time_out,
			 dtr_snapshot_in,
			 dtr_snapshot_out,
			 dtr_remarks) 
	  values (@dtr_date
			 ,@employee_id
			 ,@dtr_time
			 ,null
			 ,@dtr_snapshot
			 ,null
			 ,null)
			 
	  -- log status
	  set @log_status = 'IN'
	  set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2)) 
	end
	else if @logged <= 2
	begin 
	  -- check for orphaned record then UPDATE, otherwise INSERT
	  select @orphaned = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.employee_id = @employee_id 
	     and d.time_out is null 
	  
	  -- get total hours
	  -- total hours is used to compare
	  -- with interval..do not allow to log time if hours is less than interval
	  select @total_hours = DATEDIFF(minute,d.time_in,@dtr_time) / 60.0
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.employee_id = @employee_id 
	     and d.time_out is null
	     
	  -- check if afternoon log is complete
	  -- do not allow to log time if afternoon log is complete
	  select @log_complete = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.employee_id = @employee_id
	     and d.time_in > '12:00:00'
	     and d.time_out is not null
	     
	  -- there is no orphaned record
	  -- AM time log is complete
	  -- create log for PM 
	  if @orphaned = 0 and @logged = 1 and @log_complete = 0
	  begin
		  insert 
			into dtr 
				 (dtr_date,
				 employee_id,
				 time_in,
				 time_out,
				 dtr_snapshot_in,
				 dtr_snapshot_out,
				 dtr_remarks)
		  values (@dtr_date
				 ,@employee_id
				 ,@dtr_time
				 ,null
				 ,@dtr_snapshot
				 ,null
				 ,null)
				 
		-- log status
	    set @log_status = 'IN'
		set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  -- complete the time log
	  -- update "time_out" field
	  else if (@orphaned = 1) 
	   and (@total_hours >= @min_timeout_interval)
	  begin
		update dtr
		   set time_out = @dtr_time,
			   dtr_snapshot_out = @dtr_snapshot
		 where dtr_date = @dtr_date
		   and employee_id = @employee_id
		   and time_out is null  
		   
		-- log status
	    set @log_status = 'OUT'
		set @post_message = 'Out - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  else
	  begin
	    -- log status
	    set @log_status = 'REJECTED'
	    set @post_message = 'Rejected - '
	  end
	end
	
	-- return
	select (employee_lastname + ', ' + employee_firstname) employee_name
		   ,@post_message post_message
		   ,@log_status log_status
	  from employee e (nolock)
	 where e.employee_id = @employee_id
END
GO
/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object int,
			@hdoc int, 
			@exists int = 0
			
	set xact_abort on
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object
	  from wsmessagein nolock
	 where messagestatus_code <> 'SYN'
  order by priority, ws_message_date
  
	if @ws_message is not null
	begin
		-- check if record already exists
		select @exists = COUNT(*)
		  from dtr
		 where remote_dtr_id = @pk_event_object
		
		if isnull(@exists,0) = 0 
		begin 
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- update status of message in the wsmessagein table
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
		  
			-- save wsmessage to intended table
			insert into dtr
			select *
			  from openxml(@hdoc, '/dtr', 2) 
			  with dtr	
			  
			-- update the status of the newly-inserted record
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = (select SCOPE_IDENTITY())
			 
			commit transaction
			  
			exec sp_xml_removedocument @hdoc  
		end
		else
		begin
			-- delete the existing record
			-- from the wsmessagein table
			delete
			  from wsmessagein
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
		end
	end
	
  	set xact_abort off  
END
GO
/****** Object:  Table [dbo].[wsmessageout]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wsmessageout](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [int] NOT NULL,
	[ws_message_date] [datetime] NOT NULL,
	[priority] [smallint] NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_wsmessageout] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from date,
	@dtr_date_until date,
	@employee_id integer
AS
BEGIN
	declare @dtr table
	(
		employee_id int,
		employee_name varchar(250),
		dtr_date datetime,
		time_in_am time,
		time_out_am time,
		am_status varchar(15),
    	time_in_pm time,
		time_out_pm time,
		pm_status varchar(15),
		total_hours_am decimal(4,2),
		total_hours_pm decimal(4,2),
		location_code char(3)
	)
	
	-- morning log
	-- with or without afternoon log
	insert into @dtr
	select e.employee_id,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.employee_id = d_am.employee_id
 left join (select dtr_id,
                   dtr_date,
				   employee_id,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= '12:00:00') d_pm 
		on d_pm.employee_id = d_am.employee_id
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < '12:00:00'
  
  -- afternoon log
  -- without morning log
  insert into @dtr
  select e.employee_id,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out) d_pm_only,
		  d_pm_only.location_code
	 from dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.employee_id = d_pm_only.employee_id
	where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
	  and d_pm_only.time_in > '12:00:00'
	  and not exists (select 1 
	                    from @dtr d  
	                   where d.employee_id = e.employee_id)
	
	select employee_id,
		   employee_name,
		   dtr_date,
		   convert(varchar(5),time_in_am) time_in_am,
		   convert(varchar(5),time_out_am) time_out_am,
		   am_status,
		   convert(varchar(5),time_in_pm) time_in_pm,
		   convert(varchar(5),time_out_pm) time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		    location_code
	  from @dtr d
	 where (ISNULL(@employee_id,0) = 0 or d.employee_id = @employee_id)
  order by d.time_out_pm desc,
		   d.time_in_pm desc,
		   d.time_out_am desc,
		   d.time_in_am desc
END
GO
/****** Object:  Trigger [tr_set_remote_dtr_id]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_set_remote_dtr_id]
   ON  [dbo].[dtr]
   AFTER insert
AS 
BEGIN
	declare @remote_dtr_id int
	
	select @remote_dtr_id = remote_dtr_id 
	  from inserted
	   
	if ISNULL(@remote_dtr_id,0) = 0
	begin                   
		update dtr
		   set remote_dtr_id = dtr_id
		 where dtr_id = (select dtr_id 
						   from inserted)
	end
END
GO
/****** Object:  Trigger [tr_set_location_code]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_set_location_code] 
   ON  [dbo].[dtr]
   AFTER INSERT
AS 
BEGIN
	declare @location_code char(3),
		    @employee_id int,
		    @use_paf_location varchar(30)
			
	select @location_code = location_code,
		   @employee_id = employee_id
	  from inserted
	  
	if ISNULL(@location_code,'') = '' 
	begin
		-- check if paf table exists
		if (exists (select 1
		              from INFORMATION_SCHEMA.TABLES 
                     where TABLE_SCHEMA = 'dbo' 
                       and  TABLE_NAME = 'paf'))
		begin
			-- get the location from paf
		    select top 1 @location_code = location_code 
			  from paf p (nolock)
			 where p.employee_id = @employee_id
			   and ISNULL(is_cancelled,0) = 0
		  order by p.effective_date desc
		end
		else
		begin
			set @use_paf_location = isnull(dbo.fn_get_sysconfig_value('USE_PAF_LOCATION'),0)
			
			if ISNULL(@use_paf_location,0) = 0
				set @location_code = dbo.fn_get_sysconfig_value('LOCATION_CODE')
			else
				set @location_code = null
		end

		update dtr
			   set location_code = @location_code
			 where dtr_id = (select dtr_id 
		   					   from inserted)
	end
END
GO
/****** Object:  Trigger [tr_delete_synched_record]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_delete_synched_record]
   ON  [dbo].[wsmessageout]
   AFTER update
AS 
BEGIN
	declare @eventObject char(3),
			@pkEventObject integer,
			@messageStatusCode char(3)
			
	select @eventObject = event_object,
		   @pkEventObject = pk_event_object,
		   @messageStatusCode = messagestatus_code
	  from inserted
	  
	if @messageStatusCode = 'SYN'
	begin
	    -- update the corresponding record
	    if @eventObject = 'DTR'
	    begin
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = @pkEventObject
		end
		
		-- then delete from the wsmessageout table
		delete wsmessageout
		 where event_object = @eventObject
		   and pk_event_object = @pkEventObject
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sync_generate_xml]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object int,
			@ws_message varchar(max),
			@ws_message_date datetime,
			@messagetype_code char(3),
			@messagestatus_code char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'QUE'
  order by ws_message_date asc
  
	-- get xml message
	set @ws_message = (select * 
					     from dtr d (nolock)
				    	where d.dtr_id = @pk_event_object
					      for xml raw ('dtr'), 
					          elements)
				   
	select @event_object as event_object,
		   @pk_event_object as pk_event_object,
		   @ws_message as ws_message,
		   @ws_message_date as ws_message_date,
		   null as priority,
		   dbo.fn_get_sysconfig_value('LOCATION_CODE') as source_location, 
		   'SVR' as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END
GO
/****** Object:  StoredProcedure [dbo].[sync_set_wsmessageout_status]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessageout_status] 
	@event_object char(3),
	@pk_event_object integer,
	@messagestatus_code char(3)
AS
BEGIN
	update wsmessageout
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
END
GO
/****** Object:  StoredProcedure [dbo].[sync_que_record]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sync_que_record]
AS
BEGIN
	declare @dtr_id int
    set xact_abort on
    
    begin transaction
    
    -- get ID
    select @dtr_id = dtr_id
	  from dtr d (nolock) 
	 where d.syncstatus_code = 'NS'
	   and d.time_out is not null
  order by dtr_date desc, 
           time_in desc,
           time_out desc
    
	-- insert record into que
	-- set status to SYN
	-- this status will be changed
	-- to SSV after sending to the 
	-- web server
	if ISNULL(@dtr_id,0) > 0 
	begin
		insert into wsmessageout
		values ('DTR',
			   @dtr_id,
			   GETDATE(),
			   0,
			   'SYN',
			   'QUE')
	 
		-- set sync status of record to QUE
		update dtr 
		   set syncstatus_code = 'QUE'
		 where dtr_id = @dtr_id
	end
	
	commit transaction
	
	set xact_abort off
	 
END
GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessageout_status]    Script Date: 10/19/2014 19:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessageout_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'SSV'
END
GO
/****** Object:  Default [DF_Table_1_is_active]    Script Date: 10/19/2014 19:33:37 ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_Table_1_is_active]  DEFAULT ((0)) FOR [is_inactive]
GO
/****** Object:  Default [DF_wsmessagein_is_synced]    Script Date: 10/19/2014 19:33:37 ******/
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_is_synced]  DEFAULT ((0)) FOR [messagestatus_code]
GO
/****** Object:  Default [DF_dtr_dtr_date]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtr_date]  DEFAULT (getdate()) FOR [dtr_date]
GO
/****** Object:  Default [DF_dtr_dtrstatus_code]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtrstatus_code]  DEFAULT ('OPN') FOR [dtrstatus_code]
GO
/****** Object:  Default [DF_dtr_syncstatus_code]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
/****** Object:  Default [DF_wsmessageout_is_sent]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [DF_wsmessageout_is_sent]  DEFAULT ((0)) FOR [messagestatus_code]
GO
/****** Object:  ForeignKey [FK_wsmessagein_t_wsmessagestatus]    Script Date: 10/19/2014 19:33:37 ******/
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
GO
/****** Object:  ForeignKey [FK_wsmessagein_t_wsmessagetype]    Script Date: 10/19/2014 19:33:37 ******/
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
GO
/****** Object:  ForeignKey [FK_dtr_employee]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
GO
/****** Object:  ForeignKey [FK_dtr_t_dtrstatus]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_dtrstatus] FOREIGN KEY([dtrstatus_code])
REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_dtrstatus]
GO
/****** Object:  ForeignKey [FK_dtr_t_syncstatus]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_syncstatus]
GO
/****** Object:  ForeignKey [FK_wsmessageout_t_wsmessagestatus]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
GO
/****** Object:  ForeignKey [FK_wsmessageout_t_wsmessagetype]    Script Date: 10/19/2014 19:33:39 ******/
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
GO
