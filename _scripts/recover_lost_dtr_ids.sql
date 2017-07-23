
	
	set xact_abort on

	begin tran
	declare @dtr_id int

	set @dtr_id = 36193 -- 66680

	--delete dtr
	-- where location_code in ('TOL','ZAM')

	select *
	  into #dtr
	  from dtr
	  where dtr_id > @dtr_id

	delete dtr
	 where dtr_id > @dtr_id

	dbcc checkident(dtr,reseed,@dtr_id)

	set identity_insert dbo.dtr off

	insert dtr (dtr_date, time_in, time_out, dtr_snapshot_in, dtr_snapshot_out, dtr_remarks, remote_dtr_id, dtrstatus_code, syncstatus_code, location_code, id_num)
	select dtr_date, time_in, time_out, dtr_snapshot_in, dtr_snapshot_out, dtr_remarks, remote_dtr_id, dtrstatus_code, syncstatus_code, location_code, id_num
	  from #dtr

	drop table #dtr

	commit tran


