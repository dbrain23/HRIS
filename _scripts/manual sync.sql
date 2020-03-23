
select *
  from wsmessageout
 where event_object = 'LVD'

	delete from wsmessageout
 where event_object = 'LVD'

	-- override
	/*
	declare @dtr_date date
	declare @id_num varchar(12)
	declare @am_pm char(1)

	DECLARE msg CURSOR
    FOR select dtr_date,id_num,am_pm from dtroverride;

	open msg;

	fetch next from msg into @dtr_date, @id_num, @am_pm

	while @@FETCH_STATUS = 0
	begin
		update dtroverride 
		   set override_date = DATEADD(MINUTE,1,override_date) 	
		 where dtr_date = @dtr_date
		   and id_num = @id_num
		   and am_pm = @am_pm

		fetch next from msg into @dtr_date, @id_num, @am_pm
	end
	
	close msg
	deallocate msg
	*/

	-- dtrundertime
	/*
	declare @dtr_date date
	declare @id_num varchar(12)
	declare @am_pm char(1)

	DECLARE msg CURSOR
    FOR select dtr_date,id_num,am_pm from dtrundertime;

	open msg;

	fetch next from msg into @dtr_date, @id_num, @am_pm

	while @@FETCH_STATUS = 0
	begin
		update dtrundertime 
		   set created_date = DATEADD(MINUTE,1,created_date) 	
		 where dtr_date = @dtr_date
		   and id_num = @id_num
		   and am_pm = @am_pm

		fetch next from msg into @dtr_date, @id_num, @am_pm
	end
	
	close msg
	deallocate msg
	*/

	-- leave
	/*
	declare @leave_id int
	declare @location_code char(3)
	
	DECLARE msg CURSOR
    FOR select leave_id,location_code from leave;

	open msg;

	fetch next from msg into @leave_id, @location_code

	while @@FETCH_STATUS = 0
	begin
		update leave 
		   set created_date = DATEADD(MINUTE,1,created_date) 	
		 where leave_id = @leave_id
		   and location_code = @location_code

		fetch next from msg into @leave_id, @location_code
	end
	
	close msg
	deallocate msg
	*/

	-- leave detail
	declare @leave_id int
	declare @location_code char(3)
	declare @leave_date datetime
	declare @am_pm char(1)
	
	DECLARE msg CURSOR
    FOR select leave_id,location_code, leave_date, am_pm from leavedetail;

	open msg;

	fetch next from msg into @leave_id, @location_code, @leave_date, @am_pm

	while @@FETCH_STATUS = 0
	begin
		update leavedetail 
		   set created_date = DATEADD(MINUTE,1,created_date) 	
		 where leave_id = @leave_id
		   and location_code = @location_code
		   and leave_date = @leave_date
		   and (isnull(am_pm,'') = '' or (am_pm = @am_pm))

		fetch next from msg into @leave_id, @location_code, @leave_date, @am_pm
	end
	
	close msg
	deallocate msg

