

	--Name, 
	--position, 
	--lenght of service per position, 
	--branch, 
	--position status , 
	--date range (regardless sa branch)
	
	-- employee name, position name
	select p.id_num,
	       (e.employee_lastname + ', ' + e.employee_firstname) as employee_name,
	       pos.position_name,
	       p.position_code
	       --l.location_name as branch,
	       --ps.posstatus_name as position_status
	  into #temp1
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position pos (nolock)
	    on pos.position_code = p.position_code
	 where isnull(p.is_cancelled,0) = 0
  group by p.id_num, employee_lastname, employee_firstname, position_name, p.position_code
  order by e.employee_lastname, e.employee_firstname
  
  -- length of service, date range
  select id_num, 
         position_code, 
	     min(effective_date) as effective_date, 
	     max(isnull(effective_until,CAST(getdate() as DATE))) as effective_until
    into #temp2
    from paf p (nolock)
   where isnull(p.is_cancelled,0) = 0
group by id_num, position_code


	select t1.id_num,
		   t1.employee_name,
		   t1.position_name,
		   t2.effective_date,
		   t2.effective_until
	  into #temp3
	  from #temp1 t1
	  join #temp2 t2
	    on t1.id_num = t2.id_num
	   and t1.position_code = t2.position_code
	   
	-- current position status, location and salary
	select id_num,
		   location_code,
	       posstatus_code, 
	       (cast(salary as varchar(25)) + ' / ' +  sf.frequency_name) as salary
	  into #temp4 
	  from paf p (nolock)
	  join t_salaryfrequency sf (nolock)
	    on sf.frequency_code = p.frequency_code
	 where ISNULL(is_cancelled,0) = 0
	   and effective_until is null
	
	-- total length of service   
	select id_num,
	       sum(datediff(MONTH,t.effective_date,t.effective_until)) as total_length_of_service
	  into #temp5
	  from #temp3 t
  group by id_num

	select t.employee_name,
	       t.position_name,
	       t.effective_date,
	       t.effective_until, 
	       (cast((datediff(MONTH,t.effective_date,t.effective_until) / 12) as varchar) + ' year(s) ' +
	         cast((datediff(MONTH,t.effective_date,t.effective_until) % 12) as varchar) + ' month(s)'
	        ) as length_of_service,
	       --datediff(MONTH,t.effective_date,t.effective_until) as months,
	       --v.total_length_of_service,
	       (cast((v.total_length_of_service / 12) as varchar) + ' year(s) ' +
	         cast((v.total_length_of_service % 12) as varchar) + ' month(s)'
	        ) as total_length_of_service,
	       ps.posstatus_name as current_position_status,
	       l.location_name as current_branch,
	       u.salary as current_salary                                                                                             
	  from #temp3 t
	  join #temp4 u
	    on u.id_num = t.id_num
	  join t_positionstatus ps (nolock)
	    on ps.posstatus_code = u.posstatus_code
	  join location l (nolock)
	    on l.location_code = u.location_code
	  join #temp5 v
	    on v.id_num = t.id_num
  order by t.employee_name, t.effective_date	
	  
	drop table #temp1
	drop table #temp2
	drop table #temp3
	drop table #temp4
	drop table #temp5