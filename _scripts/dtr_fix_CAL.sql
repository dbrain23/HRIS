
	use LogBox_CAL

	set xact_abort on

	begin tran

	select *
	  into #dtr
	  from dtr

	-- delete all 
	delete dtr

	-- reseed
	-- DBCC CHECKIDENT (dtr, RESEED, 0)

	insert employee
	select *
	  from HRIS.dbo.employee se
	 where se.id_num not in (select id_num from employee)

	-- turn off identity
	SET IDENTITY_INSERT dtr ON

	-- copy
	insert dtr (dtr_id,location_code,remote_dtr_id,dtr_date,time_in,time_out,dtr_snapshot_in,dtr_snapshot_out,dtr_remarks,dtrstatus_code,syncstatus_code,id_num)
	select remote_dtr_id,location_code,remote_dtr_id,dtr_date,time_in,time_out,dtr_snapshot_in,dtr_snapshot_out,dtr_remarks,dtrstatus_code,syncstatus_code,id_num
	  from HRIS.dbo.dtr
	 where location_code = 'CAL'

	SET IDENTITY_INSERT dtr OFF

	-- copy the records from the temp table
	insert dtr (location_code,remote_dtr_id,dtr_date,time_in,time_out,dtr_snapshot_in,dtr_snapshot_out,dtr_remarks,dtrstatus_code,syncstatus_code,id_num)
	select location_code,remote_dtr_id,dtr_date,time_in,time_out,dtr_snapshot_in,dtr_snapshot_out,dtr_remarks,dtrstatus_code,syncstatus_code,id_num
	  from #dtr

	-- update location and remote dtr id columns
	update dtr
	   set location_code = 'CAL',
	       remote_dtr_id = dtr_id
	 where isnull(location_code,'') = ''


	drop table #dtr


	commit tran

	