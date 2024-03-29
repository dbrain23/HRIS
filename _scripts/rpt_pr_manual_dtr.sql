


ALTER PROCEDURE [dbo].[rpt_pr_manual_dtr]
	@payroll_code char(15)
AS
BEGIN
	declare @payroll_from datetime,
			@payroll_until datetime,
			@working_days int,
			@saturdays int, 
			@sundays int

	-- get the status and dates
	select @payroll_from = payroll_from,
		   @payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@payroll_code)

	-- working days, sundays, saturdays
	select @working_days = working_days,
		   @saturdays = saturdays,
		   @sundays = sundays
      from dbo.dtr_fn_get_working_days(@payroll_from, @payroll_until)
	  
	-- get employees
	select *
	  into #employee 
	  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until) e
	-- where e.empstatus_code not in ('PRO','PRE') removed as discussed Feb 9 2017

	-- holidays regular
	select count(loc_code) holidays, loc_code
	  into #holidays_regular
	  from dbo.dtr_fn_get_holidays(@payroll_from, @payroll_until) 
	 where holiday_id is not null
	   and datepart(dw,holiday_date) <> 1 -- exclude sundays
	   and holidaytype_code = 'RH'
  group by loc_code

  -- holidays special
	select count(loc_code) holidays, loc_code
	  into #holidays_special
	  from dbo.dtr_fn_get_holidays(@payroll_from, @payroll_until) 
	 where holiday_id is not null
	   and datepart(dw,holiday_date) <> 1 -- exclude sundays
	   and holidaytype_code = 'SPL'
  group by loc_code

	-- get all business trips
	select id_num,
		   ld.am_pm,
		   ld.leave_date
	  into #btrips
	  from leavedetail ld (nolock)
	  join leave l (nolock)
		on l.leave_id = ld.leave_id
	   and l.location_code = ld.location_code
	 where l.leavetype_code = 'BT'
	   and ld.leave_date between @payroll_from and @payroll_until
	   and ld.leavestatus_code = 'APP'

	-- business trip full excluding Saturdays
	select count(*) btrips_full, id_num
	  into #btrips_full
	  from #btrips
	 where isnull(am_pm,'') = ''
	   and datename(dw, leave_date) not in ('Saturday','Sunday')
	 group by id_num

	-- business trip half AM excluding Saturdays
	select count(*) btrips_am, id_num
	  into #btrips_am
	  from #btrips
	 where isnull(am_pm,'') = 'A'
	   and datename(dw, leave_date) not in ('Saturday','Sunday')
	 group by id_num

	-- business trip half PM excluding Saturdays
	select count(*) btrips_pm, id_num
	  into #btrips_pm
	  from #btrips
	 where isnull(am_pm,'') = 'P'
	   and datename(dw, leave_date) not in ('Saturday','Sunday')
  group by id_num

	-- business trip full including Saturdays
	select count(*) btrips_full_sat, id_num
	  into #btrips_full_sat
	  from #btrips
	 where isnull(am_pm,'') = ''
	   and datename(dw, leave_date) in ('Saturday','Sunday')
	 group by id_num

	-- business trip half AM including Saturdays
	select count(*) btrips_am_sat, id_num
	  into #btrips_am_sat
	  from #btrips
	 where isnull(am_pm,'') = 'A'
	   and datename(dw, leave_date) in ('Saturday','Sunday')
	 group by id_num

	-- business trip half PM including Saturdays
	select count(*) btrips_pm_sat, id_num
	  into #btrips_pm_sat
	  from #btrips
	 where isnull(am_pm,'') = 'P'
	   and datename(dw, leave_date) in ('Saturday','Sunday')
  group by id_num

    -- leaves without pay excluding maternity and business trips
	select am_pm,
	       l.id_num,
		   d.leave_date
	  into #leaves_without_pay
	  from leavedetail d (nolock)
	  join leave l (nolock)
	    on l.location_code = d.location_code
	   and l.leave_id = d.leave_id
	 where d.leave_date 
   between @payroll_from
       and @payroll_until
	   and leavestatus_code = 'APP'
	   -- and leavetype_code <> 'MT'
	   and leavetype_code not in ('MT','BT')
	   and isnull(d.is_paid,0) = 0

	-- leaves without pay maternity only
	select count(*) maternity,
	       l.id_num
	  into #maternity
	  from leavedetail d (nolock)
	  join leave l (nolock)
	    on l.location_code = d.location_code
	   and l.leave_id = d.leave_id
	 where d.leave_date 
   between @payroll_from
       and @payroll_until
	   and leavestatus_code = 'APP'
	   and leavetype_code = 'MT'
	   and isnull(d.is_paid,0) = 0
  group by id_num

	-- result
	select (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
	       e.id_num,
		   e.employee_name employee_name,
		   e.location_code,
		   e.department_code,
		   e.empstatus_code,
		   l.location_name,
		   /****** worked days *******/
		   -- (case when isnull((nullif(p.number_of_days,0) - (case when (isnull(@sundays,0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 
		   --    else @sundays end) - isnull(h.holidays,0)),0) = 0 then '0.00' else convert(varchar,convert(money, (nullif(p.number_of_days,0) -  (case when (isnull(@sundays,0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 else @sundays end) -  (case when (isnull(h.holidays,0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 else h.holidays end))),2) end)  worked_days, 
		   ((case when isnull((nullif(p.number_of_days,0) - (case when (isnull(@sundays,0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 
		         else @sundays end) - isnull((case when e.empstatus_code in ('PRE','PRO') then isnull(hr.holidays,0) else isnull(hr.holidays,0) + isnull(hs.holidays,0) end),0)),0) = 0 then '0.00' 
				 else convert(varchar,convert(money, (nullif(p.number_of_days,0) -  (case when (isnull(@sundays,0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 
				 else @sundays end) -  (case when (isnull((case when e.empstatus_code in ('PRE','PRO') then isnull(hr.holidays,0) else isnull(hr.holidays,0) + isnull(hs.holidays,0) end),0) = 0) or e.empstatus_code in ('PRE','PRO') then 0 
				 else isnull((case when e.empstatus_code in ('PRE','PRO') then isnull(hr.holidays,0) else isnull(hr.holidays,0) + isnull(hs.holidays,0) end),0) end))),2) end) 
				 - (case when e.empstatus_code in ('PRE','PRO') then 0.00 else isnull(undertime_without_pay,0) / 60.00 / 8.00 end))  worked_days, 
		   /****** worked days *******/
		   (case when (isnull(@sundays,0) = 0) or e.empstatus_code in ('PRE','PRO') then '0.00' else convert(varchar,convert(money,@sundays),1) end) sundays,
		   (case when isnull(@saturdays,0) = 0 then '0.00' else convert(varchar,convert(money,@saturdays),1) end) saturdays,
		   (case when e.empstatus_code in ('PRE','PRO') then convert(varchar,convert(money,isnull(hr.holidays,0)),1) else convert(varchar,convert(money,isnull(hr.holidays,0) + isnull(hs.holidays,0)),1) end) holidays,
		   -- (case when isnull(h.holidays,0) = 0 then '0.00' else convert(varchar,convert(money,h.holidays),1) end) holidays,
		   /****** business trips *******/
		   (case when isnull((isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 0.5000,0) + isnull(btp.btrips_pm * 0.5000,0)) + (case when e.empstatus_code in ('PRE','PRO') then isnull((isnull(btfs.btrips_full_sat,0) + isnull(btas.btrips_am_sat * 0.5000,0) + isnull(btps.btrips_pm_sat * 0.5000,0)),0) else 0 end),0) = 0 then '0.00' else convert(varchar,convert(money,(isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 0.5000,0) + isnull(btp.btrips_pm * 0.5000,0) + (case when e.empstatus_code in ('PRE','PRO') then isnull((isnull(btfs.btrips_full_sat,0) + isnull(btas.btrips_am_sat * 0.5000,0) + isnull(btps.btrips_pm_sat * 0.5000,0)),0) else 0 end))),2) end) btrips,
		   /****** business trips *******/
		   (case when isnull(p.leaves_with_pay,0) = 0 then '0.0000' else convert(varchar,convert(money,p.leaves_with_pay),2) end) leaves_with_pay,
		   /****** total compensable *****/
		   ((case when isnull(number_of_days + 
								isnull(
								        isnull(p.business_trips,0) +
								       /* (isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 0.5000,0) + isnull(btp.btrips_pm * 0.5000,0) + isnull(p.undertime,0))  + 
									   (case when e.empstatus_code in ('PRE','PRO') then 
									         isnull((isnull(btfs.btrips_full_sat,0) + isnull(btas.btrips_am_sat * 0.5000,0) + isnull(btps.btrips_pm_sat * 0.5000,0)),0) 
										else 0 end
									   ) +*/
									   (case when e.empstatus_code in ('PRE','PRO') then isnull(hr.holidays,0) 
									    else isnull(hr.holidays,0) + isnull(hs.holidays,0) end
									   ),0
									   ) + isnull(p.leaves_with_pay,0),0) = 0 then '0.00' 
				  else convert(varchar,convert(money,number_of_days + 
										       isnull((isnull(p.business_trips,0) + 
											           /*isnull(btf.btrips_full,0) + 
											           isnull(bta.btrips_am * 0.5000,0) + 
													   isnull(btp.btrips_pm * 0.5000,0) + */
													   isnull(p.undertime / 60.00 / 8.00,0)),0) + 
													   isnull(p.leaves_with_pay,0) + 
													   (case when e.empstatus_code in ('PRE','PRO') 
													         then isnull((--isnull(btfs.btrips_full_sat,0) + 
															              --isnull(btas.btrips_am_sat * 0.5000,0) + 
																		  --isnull(btps.btrips_pm_sat * 0.5000,0) +
																		  (case when e.empstatus_code in ('PRE','PRO') 
																		        then isnull(hr.holidays,0) 
																				else isnull(hr.holidays,0) + isnull(hs.holidays,0) end)),0) 
															 else 0 end)),2) end) - -- (case when e.empstatus_code in ('PRE','PRO') then (isnull(undertime_without_pay,0) / 60.00 / 8.00) else 0.00 end)) total_compensable_days,
																				  	   (case when e.empstatus_code in ('PRE','PRO') then 0.00 else isnull(undertime_without_pay,0) / 60.00 / 8.00 end))  total_compensable_days,
		   /****** total compensable *****/
		   -- (case when isnull(p.leaves_without_pay,0) = 0 then '0.0000' else convert(varchar,convert(money,p.leaves_without_pay),1) end) leaves_without_pay,
		   /****** leaves without pay *******/
		   convert(varchar,convert(money,isnull((select count(*) from #leaves_without_pay lwop where lwop.id_num = e.id_num and isnull(am_pm,'') = '' and lwop.leave_date <= isnull(p.generate_date,@payroll_until)) * 1.0000,0) + isnull((select count(*) from #leaves_without_pay lwop where lwop.id_num = e.id_num and am_pm = 'A' and lwop.leave_date <= isnull(p.generate_date,@payroll_until) ) * 0.5000,0) + isnull((select count(*) from #leaves_without_pay lwop where lwop.id_num = e.id_num and am_pm = 'P' and lwop.leave_date <= isnull(p.generate_date,@payroll_until)) * 0.5000,0)),2) leaves_without_pay,
		   /****** leaves without pay *******/
		   (case when isnull(p.undertime_without_pay,0) = 0 then '0.00' else convert(varchar,convert(money,isnull(p.undertime_without_pay,0)),1) end) undertime_late,
		   (case when isnull(p.late,0) = 0 then '0.00' else convert(varchar,convert(money,isnull(p.late,0)),1) end) late,
		   (case when isnull(@working_days,0) = 0 then '0.00' else convert(varchar,convert(money,@working_days),1) end) total_number_of_days,
		   /****** maternity *******/
		   convert(varchar,convert(money,isnull((select maternity from #maternity m where m.id_num = e.id_num),0)),2) maternity_paternity,
		   /****** maternity *******/
		   (case when isnull(p.undertime_without_pay,0) = 0 then '0.00' else convert(varchar,convert(money,p.undertime_without_pay),2) end) undertime,
		   (case when isnull(p.undertime,0) = 0 then '0.00' else convert(varchar,convert(money,p.undertime),1) end) undertime_with_pay,
		   (case when isnull(p.late,0) = 0 then '0.00' else convert(varchar,convert(money,p.late),1) end) late,
		   /****** incomplete *******/
		   convert(varchar,convert(money,
		   (case when e.empstatus_code in ('PRO','PRE') then 0 else @working_days -
			   (case 
				when  (p.number_of_days + isnull(p.leaves_with_pay,0) + isnull(p.leaves_without_pay,0) + (isnull(p.late,0) / 60.00 / 8.00 ) + (isnull(p.undertime,0) / 60.00 / 8.00 ) + (isnull(p.undertime_without_pay,0) / 60.00 / 8.00 ) + (isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 4.00 / 8.00,0) + isnull(btp.btrips_pm * 4.00 / 8.00 ,0) + isnull(btfs.btrips_full_sat,0) + isnull(btas.btrips_am_sat * 0.5000,0) + isnull(btps.btrips_pm_sat * 0.5000,0))) + 0.01 > @working_days
				then @working_days 
				else (p.number_of_days + isnull(p.leaves_with_pay,0) + isnull(p.leaves_without_pay,0) + (isnull(p.late,0) / 60.00 / 8.00 ) + (isnull(p.undertime,0) / 60.00 / 8.00 ) + (isnull(p.undertime_without_pay,0) / 60.00 / 8.00 ) + (isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 4.00 / 8.00,0) + isnull(btp.btrips_pm * 4.00 / 8.00,0) + isnull(btfs.btrips_full_sat,0) + isnull(btas.btrips_am_sat * 0.5000,0) + isnull(btps.btrips_pm_sat * 0.5000,0)))
				end 
				)
			end
		   )),2) incomplete,
		   /****** incomplete *******/
		   btfs.btrips_full_sat
	  from payroll p (nolock)
	  join #employee e (nolock)
	    on e.id_num = p.id_num
	  join location l (nolock)
	    on e.location_code = l.location_code
 left join #holidays_regular hr
        on hr.loc_code = e.location_code
 left join #holidays_special hs
        on hs.loc_code = e.location_code
 left join #btrips_full btf
        on btf.id_num = e.id_num
 left join #btrips_am bta
        on bta.id_num = e.id_num
 left join #btrips_pm btp
        on btp.id_num = e.id_num
 left join #btrips_full_sat btfs
        on btfs.id_num = e.id_num
 left join #btrips_am_sat btas
        on btas.id_num = e.id_num
 left join #btrips_pm_sat btps
        on btps.id_num = e.id_num
	 where p.payroll_code = @payroll_code
  order by l.location_name,
           employee_name

	-- drop temp tables
	drop table #holidays_regular
	drop table #holidays_special
	drop table #btrips
	drop table #btrips_full
	drop table #btrips_am
	drop table #btrips_pm
	drop table #btrips_full_sat
	drop table #btrips_am_sat
	drop table #btrips_pm_sat
	drop table #employee
	drop table #leaves_without_pay
	drop table #maternity
END
