GO

/****** Object:  Index [PK_wsmessagein]    Script Date: 03/09/2015 21:24:34 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[wsmessagein]') AND name = N'PK_wsmessagein')
ALTER TABLE [dbo].[wsmessagein] DROP CONSTRAINT [PK_wsmessagein]
GO



alter table wsmessagein
alter column pk_event_object varchar(30) not null

GO

/****** Object:  Index [PK_wsmessagein]    Script Date: 03/09/2015 21:26:47 ******/
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [PK_wsmessagein] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[source_location] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/****** Object:  Index [PK_wsmessageout]    Script Date: 03/09/2015 21:25:05 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[wsmessageout]') AND name = N'PK_wsmessageout')
ALTER TABLE [dbo].[wsmessageout] DROP CONSTRAINT [PK_wsmessageout]
GO

alter table wsmessageout
alter column pk_event_object varchar(30) not null

GO

/****** Object:  Index [PK_wsmessageout]    Script Date: 03/09/2015 21:28:05 ******/
ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [PK_wsmessageout] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[destination_location] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO

/****** Object:  StoredProcedure [dbo].[sync_set_wsmessageout_status]    Script Date: 03/09/2015 21:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sync_set_wsmessageout_status] 
	@event_object char(3),
	@pk_event_object varchar(30),
	@destination_location char(3),
	@messagestatus_code char(3)
AS
BEGIN
	update wsmessageout
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and destination_location = @destination_location
END

GO

/****** Object:  StoredProcedure [dbo].[sync_generate_xml]    Script Date: 03/09/2015 21:43:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object varchar(30),
			@ws_message varchar(max),
			@ws_message_date datetime,
			@messagetype_code char(3),
			@messagestatus_code char(3),
			@destination_location char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code,
	       @destination_location = wmo.destination_location
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'QUE'
  order by ws_message_date asc
  
	-- get xml message
	-- dtr
	if @event_object = 'DTR'
	begin
		set @ws_message = (select * 
							 from dtr d (nolock)
				    		where d.dtr_id = cast(@pk_event_object as int)
							  for xml raw ('dtr'), 
								  elements)
	end		
	-- end dtr
	-- employee		   
	else if @event_object = 'EMP'
	begin
		set @ws_message = (select * 
							 from employee e (nolock)
				    		where e.id_num = @pk_event_object
							  for xml raw ('employee'), 
								  elements)
	end
	-- end employee
	-- sysuser
	else if @event_object = 'USR'
	begin
		set @ws_message = (select * 
							 from sysuser u (nolock)
				    		where u.id_num = @pk_event_object
							  for xml raw ('sysuser'), 
								  elements)
	end
	-- end sysuser
	-- sysprivilege
	else if @event_object = 'PRV'
	begin
		set @ws_message = (select distinct p.*
						     from sysprivilege p (nolock)
						     join sysroleprivilege rp (nolock)
							   on rp.privilege_code = p.privilege_code
						     join sysuserrole ur (nolock) 
							   on ur.role_code = rp.role_code and ur.id_num = @pk_event_object
						      for xml raw ('sysprivilege'), 
						          root ('sysprivileges'),
						          elements)
	end
	-- end sysprivilege
	-- sysrole
	else if @event_object = 'ROL'
	begin
		set @ws_message = (select ur.*, 
		                          r.role_name
						     from sysuserrole ur (nolock)
						     join sysrole r (nolock)
						       on r.role_code = ur.role_code
							where ur.id_num = @pk_event_object
						      for xml raw ('sysuserrole'), 
						          root ('sysuserroles'),
						          elements)
	end
	-- end sysrole
	-- sysroleprivilege
	else if @event_object = 'RPV'
	begin
		set @ws_message = (select rp.*
						     from sysroleprivilege rp (nolock)
						     join sysuserrole ur (nolock)
						       on ur.role_code = rp.role_code
							where ur.id_num = @pk_event_object
						      for xml raw ('sysroleprivilege'), 
						          root ('sysroleprivileges'),
						          elements)
	end
	-- end sysroleprivilege
	
	-- return query
	select @event_object as event_object,
		   @pk_event_object as pk_event_object,
		   @ws_message as ws_message,
		   @ws_message_date as ws_message_date,
		   null as priority,
		   dbo.fn_get_sysconfig_value('LOCATION_CODE') as source_location, 
		   @destination_location as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END


GO

/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 03/09/2015 21:43:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object varchar(30),
			@source_location char(3),
			@hdoc int, 
			@exists int = 0
			
	set xact_abort on
	
	begin transaction
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location
	  from wsmessagein nolock
	 where messagestatus_code <> 'SYN'
  order by priority, ws_message_date
  
	-- update the ws_message_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set ws_message_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
  
	if @ws_message is not null
	begin
		-- dtr
		if @event_object = 'DTR'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from dtr d (nolock)
			 where d.remote_dtr_id = cast(@pk_event_object as int)
			   and d.location_code = @source_location
			
			if isnull(@exists,0) = 0 
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into dtr
				select *
				  from openxml(@hdoc, '/dtr', 2) 
				  with dtr	
				  
				-- update the status of the newly-inserted record
				update dtr
				   set syncstatus_code = 'SYN'
				 where dtr_id = (select SCOPE_IDENTITY())
				 
			end -- end isnull(@exists,0)
		end 
		-- end dtr
		-- employee
		else if @event_object = 'EMP'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from employee e (nolock)
			 where e.id_num = @pk_event_object
			
			if isnull(@exists,0) = 0 
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into employee
				select *
				  from openxml(@hdoc, '/employee', 2) 
				  with employee	
				  				 
			end -- end isnull(@exists,0)
		end 
		-- end employee
		-- system user
		else if @event_object = 'USR'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from sysuser u (nolock)
			 where u.id_num = @pk_event_object
			
			if isnull(@exists,0) = 0 
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into sysuser
				select *
				  from openxml(@hdoc, '/sysuser', 2) 
				  with sysuser	
				  				 
			end -- end isnull(@exists,0)
		end 
		-- end system user
		-- system privileges
		else if @event_object = 'PRV'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
			-- save wsmessage to intended table
			insert into sysprivilege 
			select *
			  from openxml(@hdoc, '/sysprivileges/sysprivilege', 2) 
			  with (privilege_code varchar(30), 
					privilege_name varchar(50), 
					privilege_description varchar(250)) x
		     where not exists (select 1 
								 from sysprivilege p (nolock)
								where p.privilege_code = x.privilege_code)
		end 
		-- end system privileges
		-- system roles
		else if @event_object = 'ROL'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- insert the missing roles
			insert into sysrole (role_code, role_name)
			select role_code,
			       role_name
			  from openxml(@hdoc, '/sysuserroles/sysuserrole', 2)
			  with (role_code varchar(25),
					role_name varchar(50)) x
			 where not exists (select 1
			                     from sysrole r (nolock)
			                    where r.role_code = x.role_code)
			                       
			-- save wsmessage to intended table
			insert into sysuserrole 
			select *
			  from openxml(@hdoc, '/sysuserroles/sysuserrole', 2) 
			  with sysuserrole		
		end 
		-- end system roles
		-- role privileges
		else if @event_object = 'RPV'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- delete the role privileges
			-- this ensures the assigned privileges are up-to-date
			delete sysroleprivilege
			 where role_code = (select top 1 x.role_code
			                      from openxml(@hdoc, '/sysroleprivileges/sysroleprivilege', 2)
			                      with (role_code varchar(25)) x) 
			                      
			-- reinsert the role privileges
			insert into sysroleprivilege (role_code, privilege_code) 
			select x.role_code,
			       x.privilege_code
			  from openxml(@hdoc, '/sysroleprivileges/sysroleprivilege', 2) 
			  with (role_code varchar(25), 
					privilege_code varchar(30)) x
		end 
		-- end role privileges
				 
		-- update status of message in the wsmessagein table
		update wsmessagein
		   set messagestatus_code = 'SYN'
		 where event_object = @event_object
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
		
		 
		commit transaction
		  
		exec sp_xml_removedocument @hdoc  
	end -- if @ws_message is not null 
	else
	begin
		-- delete the existing record
		-- from the wsmessagein table
		-- delete
		--  from wsmessagein
		-- where event_object = @event_object
		--   and pk_event_object = @pk_event_object
		--   and source_location = @source_location
		   
		-- update status of message in the wsmessagein table
		-- previously the record is deleted, 
		-- however, change the status instead to effectively
		-- change the status of the record in the webserver
		update wsmessagein
		   set messagestatus_code = 'SYN'
		 where event_object = @event_object
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
		   
		commit transaction
	end
	
  	set xact_abort off  
end

GO










