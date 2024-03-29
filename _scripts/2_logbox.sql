USE [LogBox]
GO
/****** Object:  Table [dbo].[t_dtrstatus]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_total_hours]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_log_status]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  Table [dbo].[t_wsmessagetype]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  Table [dbo].[t_wsmessagestatus]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  Table [dbo].[t_syncstatus]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  Table [dbo].[wsmessagein]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_get_sysconfig_value]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessagein_status]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessage_status]    Script Date: 10/12/2014 20:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessage_status] 
	@event_object char(3),
	@pk_event_object integer,
	@location_code char(3)
AS
BEGIN
	select messagestatus_code
	  from wsmessage (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @location_code
	   and messagetype_code = 'CHS'
END
GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessage]    Script Date: 10/12/2014 20:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sync_get_wsmessage]
	@destination_location char(3)
AS
BEGIN
	declare @event_object char(3) = NULL,
			@pk_event_object int = NULL
	
	-- get the latest message		
	select top 1 
		   @event_object = event_object,
		   @pk_event_object = pk_event_object
	  from wsmessage wm (nolock)
	 where rtrim(wm.destination_location) = rtrim(@destination_location)
	   and wm.messagestatus_code <> 'SYN'
  order by wm.priority, wm.ws_message_date, wm.last_transaction_date
	
	-- update the latest message
	-- set the transaction date to the current date
	update wsmessage
	   set last_transaction_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and rtrim(destination_location) = rtrim(@destination_location)
	
	-- return the message		
	select *
	  from wsmessage wm (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and rtrim(destination_location) = rtrim(@destination_location)
END
GO
/****** Object:  StoredProcedure [dbo].[dtr_get_employee]    Script Date: 10/12/2014 20:10:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_set_wsmessage_status]    Script Date: 10/12/2014 20:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessage_status] 
	@event_object char(3),
	@pk_event_object integer,
	@messagestatus_code char(3),
	@location_code char(3)
AS
BEGIN
	update wsmessage
	   set messagestatus_code = @messagestatus_code,
		   messagetype_code = 'CHS'
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and destination_location = @location_code
END
GO
/****** Object:  StoredProcedure [dbo].[sync_delete_wsmessage]    Script Date: 10/12/2014 20:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_delete_wsmessage]
	@eventObject char(3),
	@pkEventObject int,
	@locationCode char(3)
AS
BEGIN
	delete wsmessage
	 where event_object = @eventObject
	   and pk_event_object = @pkEventObject
	   and source_location = @locationCode
END
GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_location_code]    Script Date: 10/12/2014 20:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dtr_fn_get_location_code]
(
	@employee_id integer
)
RETURNS char(3)
AS
BEGIN
	declare @location_code_sysconfig varchar(30),
	        @location_code_employee char(3) = null,
			@use_employee_location_code varchar(30),
			@location_code char(3)
			
	set @use_employee_location_code = isnull(dbo.fn_get_sysconfig_value('USE_EMPLOYEE_LOCATION_CODE'),0)
    set @location_code_sysconfig = dbo.fn_get_sysconfig_value('LOCATION_CODE')
    
	if ISNULL(@use_employee_location_code,0) = 1 
	begin  
	   select top 1 @location_code_employee = location_code 
	         from paf p (nolock)
	        where p.employee_id = @employee_id
	          and ISNULL(is_cancelled,0) = 0
	     order by p.effective_date desc
	end

	set @location_code = isnull(@location_code_employee, @location_code_sysconfig) 
	
	return @location_code
END
GO
/****** Object:  Table [dbo].[dtr]    Script Date: 10/12/2014 20:10:56 ******/
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
/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 10/12/2014 20:10:58 ******/
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
/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 10/12/2014 20:10:58 ******/
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
/****** Object:  Table [dbo].[wsmessageout]    Script Date: 10/12/2014 20:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 10/12/2014 20:10:59 ******/
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
		  
			-- save wsmessage to intended table
			insert into dtr
			select *
			  from openxml(@hdoc, '/dtr', 2) 
			  with dtr
			  
			-- update status of message in the wsmessagein table
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object	
			  
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
/****** Object:  StoredProcedure [dbo].[sync_set_wsmessageout_status]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_que_record]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessageout_status]    Script Date: 10/12/2014 20:10:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sync_generate_xml]    Script Date: 10/12/2014 20:10:59 ******/
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
		   dbo.dtr_fn_get_location_code(0) as source_location, -- note: for the employee_id parameter, pass 0 always to get the actual branch code
		   'SVR' as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END
GO
/****** Object:  Default [DF_dtr_dtr_date]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtr_date]  DEFAULT (getdate()) FOR [dtr_date]
GO
/****** Object:  Default [DF_dtr_dtrstatus_code]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtrstatus_code]  DEFAULT ('OPN') FOR [dtrstatus_code]
GO
/****** Object:  Default [DF_dtr_syncstatus_code]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
/****** Object:  Default [DF_wsmessagein_is_synced]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_is_synced]  DEFAULT ((0)) FOR [messagestatus_code]
GO
/****** Object:  Default [DF_wsmessageout_is_sent]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [DF_wsmessageout_is_sent]  DEFAULT ((0)) FOR [messagestatus_code]
GO
/****** Object:  ForeignKey [FK_dtr_employee]    Script Date: 10/12/2014 20:10:56 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
GO
/****** Object:  ForeignKey [FK_dtr_t_dtrstatus]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_dtrstatus] FOREIGN KEY([dtrstatus_code])
REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_dtrstatus]
GO
/****** Object:  ForeignKey [FK_dtr_t_syncstatus]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_syncstatus]
GO
/****** Object:  ForeignKey [FK_wsmessagein_t_wsmessagestatus]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
GO
/****** Object:  ForeignKey [FK_wsmessagein_t_wsmessagetype]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
GO
/****** Object:  ForeignKey [FK_wsmessageout_t_wsmessagestatus]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
GO
/****** Object:  ForeignKey [FK_wsmessageout_t_wsmessagetype]    Script Date: 10/12/2014 20:10:57 ******/
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
GO
