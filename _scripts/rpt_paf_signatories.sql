

ALTER PROCEDURE [dbo].[rpt_paf_signatories]
	@paf_id integer
AS
BEGIN
	declare @location_code char(3),
	        @created_date date,
			@area_code char(3),
			@position_code char(3),
			@level_code char(3)
	
	-- get paf details
	select @location_code = location_code,
	       @created_date = created_date,
		   @position_code = pf.position_code,
		   @level_code = level_code
	  from paf (nolock) pf
	  join t_position (nolock) ps
	    on ps.position_code = pf.position_code
	 where paf_id = @paf_id

	 -- get area code
	 select @area_code = area_code
	   from location l (nolock)
	  where l.location_code = @location_code
	 
	 select *
	   into #signatories
	   from dbo.paf_fn_active_employees(dateadd(ww,-1,@created_date),@created_date)
	  where position_code in ('BM','AM','HRM','COO','NAM','AH')

	-- return
	select (select top 1 upper(s.employee_name_full) from #signatories s where position_code = 'HRM') as human_resource,
		  (
				case @level_code when '7' then ''
				else
					(select top 1 upper(s.employee_name_full) from #signatories s where position_code = 'BM' and location_code = @location_code)
				end
		   
		   ) as branch_manager, 

		   --(select top 1 upper(s.employee_name_full) from #signatories s where position_code = 'COO') as chief_operating_officer,
		   '' as chief_operating_officer,


		   (	
				case when @level_code in ('8','9','10') then ''
				else
					(select top 1 upper(s.employee_name_full) 
					  from #signatories s 
					 where position_code in ('AM','NAM','AH')
					   and location_code in (select location_code from location l (nolock) where area_code = @area_code))
				end
			
			) as area_manager

    drop table #signatories  
END

