/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    triggers:
        [dbo].[tr_rank_movement], [dbo].[tr_set_location_code], [dbo].[tr_set_remote_dtr_id]

    procedures:
        [dbo].[dtr_get_by_date], [dbo].[dtr_get_by_date_no_joins], [dbo].[dtr_import_dtr], [dbo].[hris_get_paf], [dbo].[hris_get_paf_list], [dbo].[sync_generate_xml], [dbo].[sync_que_record], [dbo].[sync_xml_to_db]

    tables:
        [dbo].[dtr], [dbo].[location], [dbo].[paf]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	16/10/2014 5:45:57 AM

   LEGAL:	2014[Insert Company Name]

   ------------------------------------------------------------ */

SET NOEXEC OFF
SET ANSI_WARNINGS ON
SET XACT_ABORT ON
SET IMPLICIT_TRANSACTIONS OFF
SET ARITHABORT ON
SET NOCOUNT ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
GO
USE [HRIS_Live]
GO

BEGIN TRAN
GO

-- Drop Foreign Key FK_dtr_branch from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_branch from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_branch]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Column branch_code from [dbo].[dtr]
Print 'Drop Column branch_code from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP COLUMN [branch_code]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Add Column department_code to [dbo].[paf]
Print 'Add Column department_code to [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	ADD [department_code] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_by_date]
Print 'Create Procedure [dbo].[dtr_get_by_date]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_import_dtr]
Print 'Create Procedure [dbo].[dtr_import_dtr]'
GO

CREATE PROCEDURE [dbo].[dtr_import_dtr]
AS
BEGIN
	declare @location_code char(3)
	
	if OBJECT_ID('tempdb..##dtr') IS NOT NULL
	begin
		select top 1
			   @location_code = location_code
		  from ##dtr
			
		insert 
		  into dtr
				(location_code,
				remote_dtr_id,
				dtr_date,
				employee_id,
				time_in,
				time_out,
				dtr_snapshot_in,
				dtr_snapshot_out,
				dtr_remarks,
				dtrstatus_code)
		 select dt.location_code,
				dt.dtr_id,
				dt.dtr_date,
				dt.employee_id,
				dt.time_in,
				dt.time_out,
				dt.dtr_snapshot_in,
				dt.dtr_snapshot_out,
				dt.dtr_remarks,
				'IMP'
		   from ##dtr dt
	  left join dtr d (nolock) on d.remote_dtr_id = dt.dtr_id and d.location_code = @location_code
		  where ISNULL(d.dtr_id,0) = 0
     end
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[dtr_get_by_date_no_joins]
Print 'Create Procedure [dbo].[dtr_get_by_date_no_joins]'
GO

CREATE PROCEDURE [dbo].[dtr_get_by_date_no_joins] 
	@dtr_date_from date,
	@dtr_date_until date
AS
BEGIN
	select dtr_id,
	       location_code,
	       dtr_date,
	       employee_id,
	       time_in,
	       time_out,
	       dtr_snapshot_in,
	       dtr_snapshot_out,
	       dtr_remarks,
	       dtrstatus_code 
	  from dtr d (nolock)
	 where d.dtr_date between @dtr_date_from and @dtr_date_until 
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_que_record]
Print 'Create Procedure [dbo].[sync_que_record]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_xml_to_db]
Print 'Create Procedure [dbo].[sync_xml_to_db]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[sync_generate_xml]
Print 'Create Procedure [dbo].[sync_generate_xml]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_set_remote_dtr_id]
Print 'Create Trigger [dbo].[tr_set_remote_dtr_id]'
GO
CREATE TRIGGER [dbo].[tr_set_remote_dtr_id]
   ON  dbo.dtr
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_paf]
Print 'Create Procedure [dbo].[hris_get_paf]'
GO
CREATE PROCEDURE [dbo].[hris_get_paf]
	@paf_id int
AS
BEGIN
	select p.paf_id,
		   p.effective_date,
		   p.effective_until,
		   p.employee_id,
		   p.salary,
		   p.frequency_code,
		   p.position_code,
		   p.empstatus_code,
		   p.posstatus_code,
		   p.location_code,
		   p.department_code,
		   p.paf_remarks,
		   p.created_by,
		   p.created_date,
		   p.modified_by,
		   p.modified_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.is_cancelled
	  from paf p (nolock)
	 where paf_id = @paf_id
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Procedure [dbo].[hris_get_paf_list]
Print 'Create Procedure [dbo].[hris_get_paf_list]'
GO
CREATE PROCEDURE [dbo].[hris_get_paf_list]
	@employee_id int,
	@user_id int
AS
BEGIN
	select p.paf_id,
		   e.employee_id,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   ps.position_name,
		   pst.posstatus_name,
		   es.empstatus_name,
		   l.location_name,
		   p.salary,
		   p.effective_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement
	  from paf p (nolock)
	  join employee e (nolock) on e.employee_id = p.employee_id
	  join t_position ps (nolock) on ps.position_code = p.position_code
	  join t_empstatus es (nolock) on es.empstatus_code = p.empstatus_code
	  join t_positionstatus pst (nolock) on pst.posstatus_code = p.posstatus_code
	  join location l (nolock) on l.location_code = p.location_code
	 where (@employee_id = 0 or p.employee_id = @employee_id)
	   and (ps.level_code in ( 
							   select distinct level_code
							     from sysroleprivilege rp (nolock)
							     join sysuserrole ur (nolock) 
								   on ur.role_code = rp.role_code and ur.user_id = @user_id
							     join sysrolelevel rl (nolock)
								   on rl.role_code = rp.role_code
							    where rp.privilege_code = 'PAF_VIEW')
							 ) 
  order by p.paf_id desc
END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_rank_movement]
Print 'Create Trigger [dbo].[tr_rank_movement]'
GO
CREATE TRIGGER [dbo].[tr_rank_movement] 
   ON  dbo.paf 
   AFTER INSERT
AS 
BEGIN
    declare @paf_id int,
            @employee_id int,
            @old_position char(3),
	        @new_position char(3),
	        @old_rank int,
	        @new_rank int,
	        @rank_movement int,
	        @initial int
	
	-- get details of inserted PAF        
	select @paf_id = paf_id,
		   @employee_id = employee_id,
		   @new_position = position_code
      from inserted
      
    -- get rank of new position
    select @new_rank = "rank"
      from t_level l (nolock)
      join t_position p (nolock) on p.level_code = l.level_code
     where p.position_code = @new_position
     
    -- check if paf is initial
    select @initial = COUNT(paf_id)
      from paf pf (nolock) 
     where pf.employee_id = @employee_id
       and isnull(pf.is_cancelled,0) = 0
     
    if @initial = 1 set @old_rank = @new_rank
    else
    begin 
		-- get previous position
		select top 1 @old_position = pf.position_code 
		  from paf pf (nolock)
		 where pf.employee_id = @employee_id
		   and pf.paf_id <> @paf_id
		   and isnull(pf.is_cancelled,0) = 0
	  order by pf.effective_date desc, pf.paf_id desc
	  
		-- get rank of previous position
		select @old_rank = "rank"
		  from t_level l (nolock)
		  join t_position p (nolock) on p.level_code = l.level_code
		 where p.position_code = @old_position
	end
	 
	-- compare rank
	if @new_rank = @old_rank set @rank_movement = 0 -- no change
	else if @new_rank > @old_rank set @rank_movement = -1 -- demotion
	else set @rank_movement = 1 -- promotion
	
	-- update rank_movement column of INSERTED paf
	update paf
	   set rank_movement = @rank_movement
	 where paf_id = @paf_id 

END
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Trigger [dbo].[tr_set_location_code]
Print 'Create Trigger [dbo].[tr_set_location_code]'
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

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_location on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_location on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_location_t_locationtype on [dbo].[location]
Print 'Create Foreign Key FK_location_t_locationtype on [dbo].[location]'
GO
ALTER TABLE [dbo].[location]
	WITH CHECK
	ADD CONSTRAINT [FK_location_t_locationtype]
	FOREIGN KEY ([locationtype_code]) REFERENCES [dbo].[t_locationtype] ([locationtype_code])
ALTER TABLE [dbo].[location]
	CHECK CONSTRAINT [FK_location_t_locationtype]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_location_area on [dbo].[location]
Print 'Create Foreign Key FK_location_area on [dbo].[location]'
GO
ALTER TABLE [dbo].[location]
	WITH CHECK
	ADD CONSTRAINT [FK_location_area]
	FOREIGN KEY ([area_code]) REFERENCES [dbo].[area] ([area_code])
ALTER TABLE [dbo].[location]
	CHECK CONSTRAINT [FK_location_area]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_department on [dbo].[paf]
Print 'Create Foreign Key FK_paf_department on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_department]
	FOREIGN KEY ([department_code]) REFERENCES [dbo].[department] ([department_code])
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_department]

GO


IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

-- Drop Table [dbo].[branch]
Print 'Drop Table [dbo].[branch]'
GO
DROP TABLE [dbo].[branch]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF

/* ------------------------------------------------------------

DESCRIPTION: Schema Synchronization Script for Object(s) \r\n
    tables:
        [dbo].[dtr], [dbo].[locationdepartment], [dbo].[paf], [dbo].[sysrolelevel], [dbo].[sysroleprivilege], [dbo].[sysuserrole]

     Make BRYAN-ULTRA\MYINSTANCE.HRIS_Live Equal BRYAN-ULTRA\MYINSTANCE.HRIS

   AUTHOR:	[Insert Author Name]

   DATE:	19/10/2014 6:58:39 PM

   LEGAL:	2014[Insert Company Name]

   ------------------------------------------------------------ */

SET NOEXEC OFF
SET ANSI_WARNINGS ON
SET XACT_ABORT ON
SET IMPLICIT_TRANSACTIONS OFF
SET ARITHABORT ON
SET NOCOUNT ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
GO
USE [HRIS_Live]
GO

BEGIN TRAN
GO

-- Drop Foreign Key FK_dtr_t_syncstatus from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_t_syncstatus from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_t_syncstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtr_t_dtrstatus from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_t_dtrstatus from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_t_dtrstatus]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_dtr_location from [dbo].[dtr]
Print 'Drop Foreign Key FK_dtr_location from [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr] DROP CONSTRAINT [FK_dtr_location]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_paf_location from [dbo].[paf]
Print 'Drop Foreign Key FK_paf_location from [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf] DROP CONSTRAINT [FK_paf_location]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysrolelevel_sysrole from [dbo].[sysrolelevel]
Print 'Drop Foreign Key FK_sysrolelevel_sysrole from [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_sysrole]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysrolelevel_t_level from [dbo].[sysrolelevel]
Print 'Drop Foreign Key FK_sysrolelevel_t_level from [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel] DROP CONSTRAINT [FK_sysrolelevel_t_level]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysroleprivilege_sysprivilege from [dbo].[sysroleprivilege]
Print 'Drop Foreign Key FK_sysroleprivilege_sysprivilege from [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysroleprivilege_sysrole from [dbo].[sysroleprivilege]
Print 'Drop Foreign Key FK_sysroleprivilege_sysrole from [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege] DROP CONSTRAINT [FK_sysroleprivilege_sysrole]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysuserrole_sysuser from [dbo].[sysuserrole]
Print 'Drop Foreign Key FK_sysuserrole_sysuser from [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysuser]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Drop Foreign Key FK_sysuserrole_sysrole from [dbo].[sysuserrole]
Print 'Drop Foreign Key FK_sysuserrole_sysrole from [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole] DROP CONSTRAINT [FK_sysuserrole_sysrole]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_syncstatus on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_syncstatus]
	FOREIGN KEY ([syncstatus_code]) REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_syncstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_t_dtrstatus on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_t_dtrstatus on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_t_dtrstatus]
	FOREIGN KEY ([dtrstatus_code]) REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_t_dtrstatus]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_dtr_location on [dbo].[dtr]
Print 'Create Foreign Key FK_dtr_location on [dbo].[dtr]'
GO
ALTER TABLE [dbo].[dtr]
	WITH CHECK
	ADD CONSTRAINT [FK_dtr_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[dtr]
	CHECK CONSTRAINT [FK_dtr_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_locationdepartment_location on [dbo].[locationdepartment]
Print 'Create Foreign Key FK_locationdepartment_location on [dbo].[locationdepartment]'
GO
ALTER TABLE [dbo].[locationdepartment]
	WITH CHECK
	ADD CONSTRAINT [FK_locationdepartment_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[locationdepartment]
	CHECK CONSTRAINT [FK_locationdepartment_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_locationdepartment_department on [dbo].[locationdepartment]
Print 'Create Foreign Key FK_locationdepartment_department on [dbo].[locationdepartment]'
GO
ALTER TABLE [dbo].[locationdepartment]
	WITH CHECK
	ADD CONSTRAINT [FK_locationdepartment_department]
	FOREIGN KEY ([department_code]) REFERENCES [dbo].[department] ([department_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[locationdepartment]
	CHECK CONSTRAINT [FK_locationdepartment_department]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_paf_location on [dbo].[paf]
Print 'Create Foreign Key FK_paf_location on [dbo].[paf]'
GO
ALTER TABLE [dbo].[paf]
	WITH CHECK
	ADD CONSTRAINT [FK_paf_location]
	FOREIGN KEY ([location_code]) REFERENCES [dbo].[location] ([location_code])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[paf]
	CHECK CONSTRAINT [FK_paf_location]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysrolelevel_sysrole on [dbo].[sysrolelevel]
Print 'Create Foreign Key FK_sysrolelevel_sysrole on [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel]
	WITH CHECK
	ADD CONSTRAINT [FK_sysrolelevel_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysrolelevel]
	CHECK CONSTRAINT [FK_sysrolelevel_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysrolelevel_t_level on [dbo].[sysrolelevel]
Print 'Create Foreign Key FK_sysrolelevel_t_level on [dbo].[sysrolelevel]'
GO
ALTER TABLE [dbo].[sysrolelevel]
	WITH CHECK
	ADD CONSTRAINT [FK_sysrolelevel_t_level]
	FOREIGN KEY ([level_code]) REFERENCES [dbo].[t_level] ([level_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysrolelevel]
	CHECK CONSTRAINT [FK_sysrolelevel_t_level]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysroleprivilege_sysprivilege on [dbo].[sysroleprivilege]
Print 'Create Foreign Key FK_sysroleprivilege_sysprivilege on [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege]
	WITH CHECK
	ADD CONSTRAINT [FK_sysroleprivilege_sysprivilege]
	FOREIGN KEY ([privilege_code]) REFERENCES [dbo].[sysprivilege] ([privilege_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysroleprivilege]
	CHECK CONSTRAINT [FK_sysroleprivilege_sysprivilege]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysroleprivilege_sysrole on [dbo].[sysroleprivilege]
Print 'Create Foreign Key FK_sysroleprivilege_sysrole on [dbo].[sysroleprivilege]'
GO
ALTER TABLE [dbo].[sysroleprivilege]
	WITH CHECK
	ADD CONSTRAINT [FK_sysroleprivilege_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysroleprivilege]
	CHECK CONSTRAINT [FK_sysroleprivilege_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysuserrole_sysuser on [dbo].[sysuserrole]
Print 'Create Foreign Key FK_sysuserrole_sysuser on [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole]
	WITH CHECK
	ADD CONSTRAINT [FK_sysuserrole_sysuser]
	FOREIGN KEY ([user_id]) REFERENCES [dbo].[sysuser] ([user_id])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysuserrole]
	CHECK CONSTRAINT [FK_sysuserrole_sysuser]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
-- Create Foreign Key FK_sysuserrole_sysrole on [dbo].[sysuserrole]
Print 'Create Foreign Key FK_sysuserrole_sysrole on [dbo].[sysuserrole]'
GO
ALTER TABLE [dbo].[sysuserrole]
	WITH CHECK
	ADD CONSTRAINT [FK_sysuserrole_sysrole]
	FOREIGN KEY ([role_code]) REFERENCES [dbo].[sysrole] ([role_code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[sysuserrole]
	CHECK CONSTRAINT [FK_sysuserrole_sysrole]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF





