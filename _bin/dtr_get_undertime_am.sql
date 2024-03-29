
/****** Object:  StoredProcedure [dbo].[dtr_get_undertime_am]    Script Date: 17/09/2018 8:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[dtr_get_undertime_am]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select dut.*,
	       e.employee_lastname,
		   e.employee_firstname,
		   (e.employee_firstname + ' ' + e.employee_lastname) employee_name,
		   p.positiontype_name,
		   r.undertime_reason_name,
		   l.location_name,
		   cast(dut.dtr_date as datetime) dtr_date_f,
		   cast(dut.time_from as datetime) time_from_f,
		   cast(dut.time_until as datetime) time_until_f,
		   (case when dut.timestatus_code = 'APP' then dut.status_changed_date else null end) approved_date,
		   (case when dut.timestatus_code = 'APP' then (e2.employee_firstname + ' ' + e2.employee_lastname) else '' end) approved_by,
		   t.timestatus_name
	  from dtrundertime dut (nolock)
	  join employee e (nolock)
	    on e.id_num = dut.id_num
 left join employee e2 (nolock)
	    on e2.id_num = dut.status_changed_by
	  join t_positiontype p (nolock)
	    on e.positiontype_code = p.positiontype_code
	  join t_undertimereason r (nolock)
	    on r.undertime_reason_code = dut.undertime_reason_code
      join location l (nolock)
	    on l.location_code = e.location_code
	  join t_timestatus t (nolock)
	    on t.timestatus_code = dut.timestatus_code
	 where dut.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dut.id_num = @id_num))
	   and dut.am_pm = 'A'
END

