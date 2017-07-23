
	set xact_abort on
	
	begin tran
	
	alter table dtr
	add id_num varchar(12)
	go
	update d
	   set d.id_num = e.id_num
	  from dtr d
	  join employee e
	    on e.employee_id = d.employee_id
	go
	
	commit tran
	
	set xact_abort off