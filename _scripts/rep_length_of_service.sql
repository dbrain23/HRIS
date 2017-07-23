
	 -- get paf where validity is open ended (effect_until is null)
	 -- this means that the employee is current
	 -- filter out cancelled paf
	 select p.id_num as id_num,
	        p.salary as current_salary,
	        p.frequency_code as frequency_code
	   into #tmpPaf
	   from paf p (nolock)
	  where ISNULL(p.is_cancelled,0) = 0
		and p.effective_until is null
   group by p.id_num, p.salary, p.frequency_code
   
	-- date hired
	select p.id_num as id_num,
		   MIN(p.effective_date) as date_hired
	  into #tmpDateHired
	  from paf p (nolock)
	  join #tmpPaf tp (nolock)
	    on tp.id_num = p.id_num
	 where ISNULL(p.is_cancelled,0) = 0
  group by p.id_num
	  
	 select (e.employee_lastname + ', ' + e.employee_firstname) as employee,
	        (datediff(hour,e.birth_date,GETDATE())/8766) as age,
	        tdh.date_hired,
	        (cast((datediff(MONTH,tdh.date_hired,GETDATE()) / 12) as varchar) + ' years ' +
	         cast((datediff(MONTH,tdh.date_hired,GETDATE()) % 12) as varchar) + ' months'
	        ) as length_of_service,
	        (cast(tp.current_salary as varchar(25)) + ' / ' +  sf.frequency_name) as current_salary
	   from #tmpPaf tp (nolock)
	   join #tmpDateHired tdh (nolock)
	     on tdh.id_num = tp.id_num
	   join employee e (nolock)
	     on e.id_num = tp.id_num 
	   join t_salaryfrequency sf (nolock)
	     on sf.frequency_code = tp.frequency_code
   order by e.employee_lastname, e.employee_firstname
	   
	 drop table #tmpPaf
	 drop table #tmpDateHired
  
  
 