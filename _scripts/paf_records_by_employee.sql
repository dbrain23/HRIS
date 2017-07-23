
	
	create table #paf
	(
		id integer primary key identity,
		paf_id int,
		employee_name varchar(250),
		effective_date datetime,
		position_name varchar(50),
		level_code char(3),
		location_name varchar(50),
		empstatus_name varchar(25),
		allowancetype_name varchar(50),
		allowance_amount decimal(10,2),
		id_num varchar(12),
		salary decimal(10,2) 
	)

	insert into #paf (paf_id, employee_name, effective_date, position_name, level_code, location_name, empstatus_name, allowancetype_name, allowance_amount, id_num,salary)
	select p.paf_id,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   p.effective_date,
	       position_name,
		   tl.level_code,
		   location_name,
		   te.empstatus_name,
		   ta.allowancetype_name,
		   pa.allowance_amount,
		   p.id_num,
		   p.salary
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position tp (nolock)
	    on tp.position_code = p.position_code
	  join t_level tl (nolock)
	    on tl.level_code = tp.level_code
	  join location l (nolock)
	    on l.location_code = p.location_code
	  join t_empstatus te (nolock)
	    on te.empstatus_code = p.empstatus_code
 left join pafallowance pa (nolock)
        on pa.paf_id = p.paf_id
 left join t_allowancetype ta (nolock)
	    on ta.allowancetype_code = pa.allowancetype_code
	 where isnull(p.is_cancelled,0) = 0
	   -- and p.effective_until is null
	   -- and e.id_num = '141'
  order by employee_name, paf_id

  declare @i integer = 1,
          @id_num varchar(12),
		  @id_num2 varchar(12),
		  @cnt integer,
		  @paf_id int,
		  @paf_id2 int

  select @cnt = count(*)
    from #paf

  while @i <= @cnt
  begin
    select @id_num2 = id_num,
	       @paf_id2 = paf_id
	  from #paf
	 where id = @i
	 
	if (@i = 1) or (@id_num <> @id_num2)
	begin
		set @id_num = @id_num2
		set @paf_id = @paf_id2
	end
	else if @id_num = @id_num2 
	begin
	    if @paf_id = @paf_id2
		begin
			update #paf 
			   set employee_name = '',
				   effective_date = null,
				   position_name = '',
				   level_code = '',
				   location_name = '',
				   empstatus_name = ''
			 where id = @i
		end 
		else
		begin
			set @paf_id = @paf_id2

			update #paf 
			   set employee_name = ''
			 where id = @i
		end
	 end

	set @i = @i + 1
  end

  select employee_name,
         --paf_id,
         effective_date,
		 position_name,
		 level_code,
		 salary,
		 location_name,
		 empstatus_name,
		 allowancetype_name,
		 allowance_amount
		 
    from #paf

  drop table #paf

