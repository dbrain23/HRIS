

	-- SQL script fix for populating the EFFECTIVE_UNTIL column in the PAF table

	declare @id_num varchar(12),
		    @employees int,
		    @paf_cnt int,
		    @i int = 1,
		    @j int = 1,
		    @effective_until datetime,
		    @paf_id int
		    
	-- get employee count
	select @employees = COUNT(id_num)
	  from employee (nolock)
	
	-- iterate through the employee table
	-- iterate through the paf record of each employee.. sort by effective_from column
	-- set the EFFECTIVE_UNTIL column based on the next paf record's effective_from column
	-- EFFECTIVE_UNTIL should be a day less from the effective_from column's value
	-- (i.e. EFFECTIVE_FROM = '10/30/2013' then EFFECTIVE_UNTIL = '10/29/2013')
	
	declare @tempEmployee table
	(
		id int identity,
		id_num varchar(12)
	)
	
	-- insert the id numbers
	insert 
	  into @tempEmployee
	select e.id_num
	  from employee e (nolock)

	while @i <= @employees
	begin
		set @id_num = (select id_num
		                 from @tempEmployee te
		                where te.id = @i)
		 
		create table #paf (
			id int identity,
			paf_id int not null,
			effective_date datetime not null,
			effective_until datetime
		)
		 
		insert into #paf
		select p.paf_id,
			   p.effective_date,
			   null
		  from paf p (nolock)
		 where p.id_num = @id_num
		   and isnull(p.is_cancelled,0) = 0
	  order by p.effective_date desc
	  
		select @paf_cnt = COUNT(paf_id)
		  from #paf
		  
		-- start at the second record
		-- it is assumed that the first paf record is the latest (on this temporary table)
		-- and therefore should be null
		set @j = 2
		
		while @j <= @paf_cnt
		begin
			-- get the effective date of the record above (j - 1) the current record (j)
			select @effective_until = vp.effective_date
			  from #paf vp 
		     where vp.id = (@j - 1)
		     
		    -- get the paf id of the current record (j)
		    select @paf_id = paf_id
		      from #paf vp 
		     where vp.id = @j
		     
		    -- update the effective_until column of the paf record
		    update #paf 
		       set effective_until = dateadd(day,-1,@effective_until)
		     where paf_id = @paf_id
		     
			set @j = @j + 1
		end
		
		-- update the paf table
		update p
		   set p.effective_until = vp.effective_until
		  from paf p
		  join #paf vp 
		    on vp.paf_id = p.paf_id
		   and vp.effective_until is not null
		
		set @i = @i + 1
		
		drop table #paf
	end