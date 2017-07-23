
		  
	  alter table wsmessagein
	  add last_transaction_date datetime not null default getdate()
	  
	  alter table wsmessagein
	  add sync_attempts int not null default 0
	  
	  insert into t_wsmessagetype values ('SFX','Sql fix','Ad hoc sql for data correction')
	  insert into t_wsmessagetype values ('SUP','Sql update','Sql update for stored procs, triggers, views, etc.')
	  
	  
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
				@sync_attempts int,
				@hdoc int, 
				@exists int = 0
		
		select top 1 
			   @ws_message = ws_message,
			   @event_object = event_object,
			   @pk_event_object = pk_event_object,
			   @source_location = source_location,
			   @sync_attempts = sync_attempts
		  from wsmessagein 
		 where messagestatus_code <> 'SYN'
		   and event_object <> 'SQL'
	  order by priority, last_transaction_date
	  
		-- update the last_transaction_date column
		-- this forces the record to go back the que
		update wsmessagein 
		   set sync_attempts = ISNULL(sync_attempts,0) + 1
			   ,last_transaction_date = GETDATE()
		 where event_object = @event_object
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
		   
		set xact_abort on
		
		begin transaction
	  
		if @ws_message is not null
		begin
			-- dtr
			if @event_object = 'DTR'
			begin
				-- check if record already exists
				select @exists = COUNT(1)
				  from dtr d 
				 where d.remote_dtr_id = cast(@pk_event_object as int)
				   and d.location_code = @source_location
				
				if (isnull(@exists,0) = 0 and ISNULL(@sync_attempts,0) = 0)
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
				                    
				-- delete the user roles
				-- this ensures that the assigned roles are up-to-date
				delete sysuserrole
				 where id_num = (select top 1 x.id_num
								   from openxml(@hdoc, '/sysroleprivileges/sysroleprivilege', 2)
								   with (id_num varchar(12)) x) 
				                       
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
			-- vacation leave
			else if @event_object = 'VCL'
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
			-- end vacation leave
					 
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

	go

	SET ANSI_NULLS ON
	GO

	SET QUOTED_IDENTIFIER ON
	GO


	CREATE PROCEDURE [dbo].[upd_execute_update]

	AS
	BEGIN
		declare @update nvarchar(max),
				@pk_event_object varchar(30),
				@source_location char(3),
				@sync_attempts int

		select top 1 
			   @update = ws_message,
			   @pk_event_object = pk_event_object,
			   @source_location = source_location,
			   @sync_attempts = sync_attempts
		  from wsmessagein 
		 where messagestatus_code <> 'SYN'
		   and event_object = 'SQL'
	  order by priority
	  
		-- update the last_transaction_date column
		-- this forces the record to go back the que
		update wsmessagein 
		   set sync_attempts = ISNULL(sync_attempts,0) + 1
			   ,last_transaction_date = GETDATE()
		 where event_object = 'SQL'
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
		   
		set xact_abort on
		
		begin tran
						  
		if ISNULL(@update,'') <> ''
		begin
			execute (@update)
			
			-- update the status of the "update"
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = 'SQL'
			   and pk_event_object = @pk_event_object
			   and source_location = @source_location
		end
		
		commit tran
		
		set xact_abort off
	END

	GO


	DENY TAKE OWNERSHIP ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysrolelevel] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY DELETE ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY INSERT ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY UPDATE ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysconfig] TO [LogBoxUser] AS [dbo]
	GO
	DENY DELETE ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY INSERT ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY UPDATE ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[dtr_fn_get_total_hours] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[dtr_fn_get_log_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[t_wsmessagetype] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[t_wsmessagestatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[t_syncstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[t_dtrstatus] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysuserrole] TO [LogBoxUser] AS [dbo]
	GO
	DENY REFERENCES ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysuser] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[sysroleprivilege] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[fn_get_sysconfig_value] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr_get_employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr_get_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr_get_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr_get_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[dtr_get_employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[wsmessagein] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[upd_execute_update] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[upd_execute_update] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[upd_execute_update] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[upd_execute_update] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[upd_execute_update] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_get_wsmessagein_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_get_wsmessagein_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_get_wsmessagein_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_get_wsmessagein_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_get_wsmessagein_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY DELETE ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	DENY UPDATE ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[dtr] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW CHANGE TRACKING ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT DELETE ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT INSERT ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT REFERENCES ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT SELECT ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	GRANT UPDATE ON [dbo].[wsmessageout] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr_log_time] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr_log_time] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr_log_time] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr_log_time] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[dtr_log_time] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_xml_to_db] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_xml_to_db] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_xml_to_db] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_xml_to_db] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_xml_to_db] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[dtr_get_by_date] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[dtr_get_by_date] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[dtr_get_by_date] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[dtr_get_by_date] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[dtr_get_by_date] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_generate_xml] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_generate_xml] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_generate_xml] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_generate_xml] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_generate_xml] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_employee] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_employee] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_set_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_set_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_set_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_set_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_set_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_que_record] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_que_record] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_que_record] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_que_record] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_que_record] TO [LogBoxUser] AS [dbo]
	GO
	DENY TAKE OWNERSHIP ON [dbo].[sync_get_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	DENY VIEW DEFINITION ON [dbo].[sync_get_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT ALTER ON [dbo].[sync_get_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT CONTROL ON [dbo].[sync_get_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
	GRANT EXECUTE ON [dbo].[sync_get_wsmessageout_status] TO [LogBoxUser] AS [dbo]
	GO
