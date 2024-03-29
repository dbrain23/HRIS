
ALTER PROCEDURE [dbo].[rpt_payroll_register]
	@payroll_code char(15)
AS
BEGIN

			declare @payroll_from date,
					@payroll_until date,
					@working_days decimal(8,2)
	
			-- get payroll period
			select @payroll_from = payroll_from,
				   @payroll_until = payroll_until
			  from dbo.pr_fn_get_payroll_details(@payroll_code)

			-- get working days
			select @working_days = working_days
			  from dbo.dtr_fn_get_working_days(@payroll_from, @payroll_until) 

			-- employee details
			select *
			  into #employee
			  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

			-- get deductions
			select pd.id_num id_num,
				   sum(pd.deduction_amount) deduction
			  into #deductions
			  from payrolldeduction pd (nolock)
			 where pd.payroll_code = @payroll_code
		  group by pd.id_num

			-- get allowances
			select pa.id_num id_num,
				   sum(pa.allowance_amount) allowance
			  into #allowances
			  from payrollallowance pa (nolock)
			 where pa.payroll_code = @payroll_code
		  group by pa.id_num

			-- get adjustments (plus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_plus
			  into #adjustments_plus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 0
		  group by pad.id_num

			-- get adjustments (minus)
			select pad.id_num id_num,
				   sum(pad.adjustment_amount) adjustment_minus
			  into #adjustments_minus
			  from payrolladjustment pad
			  join t_adjustmenttype at (nolock)
			    on at.adjustmenttype_code = pad.adjustmenttype_code
			 where pad.payroll_code = @payroll_code
			   and isnull(at.is_deduction,0) = 1 
		  group by pad.id_num

			-- holidays
			select count(loc_code) holidays, loc_code
			  into #holidays
			  from dbo.dtr_fn_get_holidays(@payroll_from, @payroll_until) 
			 where holiday_id is not null
			   and datepart(dw,holiday_date) <> 1 -- exclude sundays
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

			-- business trip full
			select count(*) btrips_full, id_num
			  into #btrips_full
			  from leavedetail ld (nolock)
			  join leave l (nolock)
				on l.leave_id = ld.leave_id
			   and l.location_code = ld.location_code
			 where l.leavetype_code = 'BT'
			   and isnull(ld.am_pm,'') = ''
			   and ld.leave_date between @payroll_from and @payroll_until
			   and ld.leavestatus_code = 'APP'
			   and datename(dw, ld.leave_date) not in ('Saturday','Sunday')
		  group by id_num

			-- business trip half AM
			select count(*) btrips_am, id_num
			  into #btrips_am
			  from leavedetail ld (nolock)
			  join leave l (nolock)
				on l.leave_id = ld.leave_id
			   and l.location_code = ld.location_code
			 where l.leavetype_code = 'BT'
			   and isnull(ld.am_pm,'') = 'A'
			   and ld.leave_date between @payroll_from and @payroll_until
			   and ld.leavestatus_code = 'APP'
			   and datename(dw, ld.leave_date) not in ('Saturday','Sunday')
		  group by id_num

			-- business trip half AM
			select count(*) btrips_pm, id_num
			  into #btrips_pm
			  from leavedetail ld (nolock)
			  join leave l (nolock)
				on l.leave_id = ld.leave_id
			   and l.location_code = ld.location_code
			 where l.leavetype_code = 'BT'
			   and isnull(ld.am_pm,'') = 'P'
			   and ld.leave_date between @payroll_from and @payroll_until
			   and ld.leavestatus_code = 'APP'
			   and datename(dw, ld.leave_date) not in ('Saturday','Sunday')
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

		  select pr.payroll_code,
			       pr.id_num,
				   pr.number_of_days, -- actual days
				   -- days for payroll
				   (case when  (pr.number_of_days + isnull(leaves_with_pay,0) + isnull(leaves_without_pay,0) + 
				                (isnull(late,0) / 60.00 / 8.00 ) + (isnull(undertime,0) / 60.00 / 8.00 ) + 
								(isnull(undertime_without_pay,0) / 60.00 / 8.00 ) + isnull(pr.business_trips,0)) + 0.01 > @working_days
					then @working_days 
					else (pr.number_of_days + isnull(leaves_with_pay,0) + isnull(leaves_without_pay,0) + 
					     (isnull(late,0) / 60.00 / 8.00 ) + (isnull(undertime,0) / 60.00 / 8.00 ) + 
						 (isnull(undertime_without_pay,0) / 60.00 / 8.00 ) + isnull(pr.business_trips,0))
					end 
				   ) days_payroll,
				   isnull(pr.leaves_with_pay,0.00) leaves_with_pay,
				   isnull(pr.leaves_without_pay,0.00) leaves_without_pay,
				   isnull(pr.undertime,0.00) undertime,
				   isnull(pr.undertime_without_pay,0.00) undertime_without_pay,
				   isnull(pr.late,0.00) late,
				   /************** gross *****************/
				   isnull(round((case when e.frequency_code = 'MLY'
				   then 
					  pr.salary
				   else
				      pr.salary *
					   (
					     case when (pr.number_of_days + isnull(leaves_with_pay,0) 
						    + isnull(leaves_without_pay,0) 
							+ (isnull(late,0) / 60.00 / 8.00 ) 
							+ (isnull(undertime,0) / 60.00 / 8.00 ) 
							+ (isnull(undertime_without_pay,0) / 60.00 / 8.00 ) 
							+ (isnull(pr.business_trips,0)) 
							+  ( 
					  		    (case when e.empstatus_code in ('PRE','PRO') then 
											isnull(hr.holidays,0)  
										else isnull(hr.holidays,0) + isnull(hs.holidays,0) 
										end)
							   )) + 0.01 > @working_days
					then @working_days 
					else 
						(
							pr.number_of_days 
							+ isnull(leaves_with_pay,0) 
							+ isnull(leaves_without_pay,0) 
							+ (isnull(late,0) / 60.00 / 8.00 ) 
							+ (isnull(undertime,0) / 60.00 / 8.00 ) 
							+ (isnull(undertime_without_pay,0) / 60.00 / 8.00 ) 
							+ (isnull(pr.business_trips,0))  
							+ (
							   (case when e.empstatus_code in ('PRE','PRO') then 
											isnull(hr.holidays,0)  
										else isnull(hr.holidays,0) + isnull(hs.holidays,0) 
										end)
							   )
						)
					end 
				   ) * 1.00  
				   end
				   ),2),00) as gross,
				    /************** gross *****************/
				   sf.frequency_name,
				   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) period,
				   isnull(d.deduction,0.00) deduction,
				   isnull(a.allowance,0.00) allowance,
				   (isnull(adp.adjustment_plus,0.00) - isnull(adm.adjustment_minus,0.00)) adjustment,
				   isnull(adp.adjustment_plus,0.00) adjustment_plus,
				   isnull(adm.adjustment_minus,0.00) adjustment_minus,
				   pr.salary,
				   pr.dependents,
				   e.frequency_code,
				   h.holidays,
				   e.empstatus_code,
				   pr.credit_location,
				   pr.business_trips
			  into #payroll
			  from payroll pr
		      join #employee e
		        on e.id_num = pr.id_num
			  join t_salaryfrequency sf (nolock)
				on sf.frequency_code = e.frequency_code collate SQL_Latin1_General_CP1_CI_AS
		 left join #deductions d
				on d.id_num = pr.id_num
		 left join #allowances a
				on a.id_num = pr.id_num
		 left join #adjustments_plus adp
				on adp.id_num = pr.id_num
		 left join #adjustments_minus adm
				on adm.id_num = pr.id_num
		 left join #btrips_full btf
                on btf.id_num = e.id_num
		 left join #btrips_am bta
                on bta.id_num = e.id_num
		 left join #btrips_pm btp
                on btp.id_num = e.id_num
		 left join #holidays h
                on h.loc_code = e.location_code
		 left join #holidays_regular hr
                on hr.loc_code = e.location_code
         left join #holidays_special hs
                on hs.loc_code = e.location_code
		 left join #btrips_full_sat btfs
                on btfs.id_num = e.id_num
		 left join #btrips_am_sat btas
			    on btas.id_num = e.id_num
		 left join #btrips_pm_sat btps
				on btps.id_num = e.id_num
			 where pr.payroll_code = @payroll_code

			-- compute all leaves, undertimes, lates, etc against the daily rate and round off to 2 decimal digits
			-- previously, rounding off was done at the net amount
			-- this solution has been proposed to hopefully solve the discrepancy issues due to rounding off
			select p.*,
			       e.employee_name employee_name,
				   isnull(credit_location,e.location_code) location_code,
				   e.department_code department_code,
				   e.declare_dependents declare_dependents,
				   ps.payrollstatus_code payrollstatus_code,
				   ps.payrollstatus_name payrollsatus_name,
				   /***** amounts *****/
				   -- round((isnull(p.undertime_without_pay,0) / 60.00 / 8.00) * dbo.pr_fn_get_daily_rate(e.salary),2) ut,
				   round((isnull(p.undertime_without_pay,0) / 60.00 / 8.00) * (case when e.frequency_code = 'MLY' then dbo.pr_fn_get_daily_rate(e.salary) else e.salary end),2) ut,
				   round((isnull(p.late,0) / 60.00 / 8.00) * (case when e.frequency_code = 'MLY' then dbo.pr_fn_get_daily_rate(e.salary) else e.salary end),2) lt,
				   round((case when e.frequency_code = 'DLY' then 0 else @working_days - p.days_payroll end) * dbo.pr_fn_get_daily_rate(e.salary),2) incomplete,
				   --round((isnull(p.leaves_without_pay,0)) * dbo.pr_fn_get_daily_rate(e.salary),2) lwop  
				   round((isnull(p.leaves_without_pay,0)) * (case when e.frequency_code = 'MLY' then dbo.pr_fn_get_daily_rate(e.salary) else e.salary end),2) lwop 

				   /***** amounts *****/
			  into #amounts
			  from #payroll p
			  join #employee e 
			    on e.id_num = p.id_num
			  join payrollcode pc (nolock)
			    on pc.payroll_code = p.payroll_code
			  join t_payrollstatus ps (nolock)
				on ps.payrollstatus_code = pc.payrollstatus_code
		 left join #adjustments_plus ap
		        on ap.id_num = p.id_num
		 left join #adjustments_minus am
		        on am.id_num = p.id_num
		 left join #btrips_full btf
                on btf.id_num = e.id_num
		 left join #btrips_am bta
                on bta.id_num = e.id_num
		 left join #btrips_pm btp
                on btp.id_num = e.id_num
		  
			-- return
			select upper(p.employee_name) employee_name,
			       (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
			       @working_days working_days,
				   p.number_of_days days_attended,
				   p.days_payroll days_payroll,
				   p.holidays,
				   p.leaves_with_pay leave_with_pay,
				   p.leaves_without_pay leave_without_pay,
				   ((p.ut + p.lwop) * -1) undertime_lwop,
				   (p.lwop * -1) lwop,
				   (p.ut * -1) ut,
				   (incomplete * -1) incomplete,
				   null awol,
				   (isnull(p.business_trips,0)) business_trip,
				   (case when p.frequency_code = 'MLY' then (p.salary * 2) else 0.00 end) monthly,
				   (case when p.frequency_code = 'MLY' then p.salary else 0.00 end) semi_monthly,
				   (case when p.frequency_code = 'MLY' then (dbo.pr_fn_get_daily_rate(p.salary * 2)) else p.salary end) daily_rate,
				   allowance,
				   adjustment,
				   p.undertime_without_pay undertime_without_pay,
				   (lt * -1) late,
				   (deduction * -1) deduction,
				   ((gross + allowance + adjustment) - (lwop + ut + late)) gross_allowance,
				   ((gross + adjustment) - (lwop + ut + late)) gross_pay,
				   (case when ((gross + allowance + adjustment) - (ut + lt + lwop + deduction + incomplete)) < 0 then 0.00 
				         else ((gross + allowance + adjustment) - (ut + lt + lwop + deduction + incomplete)) end) net,
				   p.location_code,
				   p.department_code,
				   p.id_num,
				   p.salary,
				   l.location_name,
				   ((gross + adjustment) - (lwop + ut + lt + incomplete)) gross_salary,
				   adjustment,
				   0 adjustment_allow,
				   p.empstatus_code,
				   0 overtime,
				   null others
			  from #amounts p
			  join location l (nolock) 
			    on l.location_code = p.location_code
		  order by l.location_name,
		           p.employee_name

			drop table #employee
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus
			drop table #btrips_full
			drop table #btrips_am
			drop table #btrips_pm
			drop table #holidays
			drop table #btrips
			drop table #btrips_am_sat
			drop table #btrips_pm_sat
			drop table #btrips_full_sat
			drop table #holidays_regular
			drop table #holidays_special
			drop table #amounts

END

