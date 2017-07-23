
-- this ad-hoc sql fixes duplicate dtr records due to misconfiguration of the "BAY" branch

 update d1
    set d1.dtr_date = '2000-01-01'
   from dtr d1
   join ( 
			select id_num, remote_dtr_id
			  from dtr
			 where location_code = 'BAY' 
		) d2
	 on d1.id_num = d2.id_num
	and d1.remote_dtr_id = d2.remote_dtr_id
  where d1.location_code = 'CO'