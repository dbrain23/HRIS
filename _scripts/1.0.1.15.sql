insert into t_rosterdetailstatus values ('ATR','Added to skeletal',null)

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_rosterdetail]    Script Date: 27/04/2016 6:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[dtr_get_rosterdetail]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@loc_dep_code char(3),
	@resource_type_code char(3)
AS
BEGIN
	declare @finalised int
	
	-- get number of finalised records
	-- more than 0 means all are finalised
	-- this sets the "roster cells" to read-only or otherwise
	set @finalised = (select COUNT(1)
	                    from roster r (nolock)
	                   where r.roster_date 
	                 between @dtr_date_from
	                     and @dtr_date_until
	                     and r.loc_dep_code = @loc_dep_code
						 and r.resource_type_code = @resource_type_code
	                     and r.syncstatus_code = 'FIN')
	                     
    -- result
    select distinct e.id_num as dtr_id_num,
           e.employee_name,
           r.rd_id,
		   r.remote_rd_id,
		   r.roster_id,
		   r.loc_dep_code,
		   r.id_num,
		   r.parent_roster_id,
		   r.change_reason,
		   r.roster_remarks,
		   r.created_by,
		   r.created_date,
		   r.rdstatus_code,
		   r.status_changed_by,
		   r.status_changed_date,
		   r.syncstatus_code,
		   r.roster_date,
           @finalised
      from dbo.paf_fn_active_employees(@dtr_date_from,@dtr_date_until) e 
 left join (select rd.*,
	               rs.roster_date 
              from roster rs  (nolock)
              join rosterdetail rd (nolock)
                on rd.roster_id = rs.roster_id 
               and rd.loc_dep_code = rs.loc_dep_code
             where (rs.roster_date 
           between @dtr_date_from
               and @dtr_date_until)
               and (rd.loc_dep_code = @loc_dep_code)
               and rd.rdstatus_code in ('ACT','ATR')) r
        on r.id_num = e.id_num
	 where (@resource_type_code = 'LOC' and e.location_code = @loc_dep_code and isnull(e.department_code,'') = '')
	    or (@resource_type_code = 'DEP' and e.department_code = @loc_dep_code)
		-- or (isnull(@resource_type_code,'') = '' and isnull(@loc_dep_code,'') = '')
  order by employee_name
END

