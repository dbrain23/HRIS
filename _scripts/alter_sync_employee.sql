USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[sync_employee]    Script Date: 03/25/2015 11:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sync_employee]
	@id_num varchar(12),
	@sync_employee_record int,
	@sync_user_account int,
	@destination_location char(3)
AS
BEGIN
	-- synch the employee record and/or user account to the selected destination
	-- when the selected destination is null.. synch the employee record to all locations
	-- and use the latest paf location for the user account
	
	-- employee record
    if isnull(@sync_employee_record,0) = 1 
    begin
		insert 
		  into wsmessageout
		select 'EMP',
			   @id_num,
			   GETDATE(),
			   0,
			   location_code,
			   'SYN',
			   'QUE'
		  from location l (nolock)
	 left join wsmessageout wmo (nolock)
			on wmo.destination_location = l.location_code
		   and wmo.event_object = 'EMP'
		   and wmo.pk_event_object = @id_num
		 where isnull(wmo.pk_event_object,'') = '' 
		   and ((nullif(@destination_location,'') is null) or (l.location_code = @destination_location))
    end
     
    -- user account
    if ISNULL(@sync_user_account,0) = 1 
    begin
		if nullif(@destination_location,'') is null 
			set @destination_location = (select top 1 location_code
										   from paf p (nolock)
										  where p.id_num = @id_num
										    and isnull(p.is_cancelled,0) = 0
									   order by p.effective_date desc)
		                    
		if ISNULL(@destination_location,'') <> ''
		begin
			-- insert the privs
			insert 
			  into wsmessageout
		    select 'PRV',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE'
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'PRV'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
			
			-- insert the roles
			insert 
			  into wsmessageout
		    select 'ROL',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE'
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'ROL'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
		   
		    -- insert the role privileges   
		    insert 
			  into wsmessageout
		    select 'RPV',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE'
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'RPV'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
			
			-- insert the user account
			insert 
			  into wsmessageout
		    select 'USR',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE'
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'USR'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
	    end
    end 
END
