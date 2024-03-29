
ALTER PROCEDURE [dbo].[rpt_pr_sched_of_salary]
	@payroll_code char(15),
	@regular smallint = 0,
	@probationary smallint = 0
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
			  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until) p
			 where (isnull(@regular,0) = 1 and p.empstatus_code in ('REG','RRE'))
			    or (isnull(@probationary,0) = 1 and p.empstatus_code in ('PRE','PRO'))

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
			   and at.adjustmenttype_code in ('SAA','SAD')
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
			   and at.adjustmenttype_code in ('SAA','SAD')
		  group by pad.id_num

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

			select pr.salary,
				   (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) adjustment,
				   (isnull(pr.leaves_without_pay,0) * dbo.pr_fn_get_daily_rate(e.salary)) leaves_without_pay,
				   (isnull((pr.undertime_without_pay / 60.00 / 8.00),0) * dbo.pr_fn_get_daily_rate(e.salary)) undertime_without_pay,
				   isnull(allowance,0.00) as allowances,
                   (round((isnull(pr.late,0) / 60.00 / 8.00) * (case when e.frequency_code = 'MLY' then dbo.pr_fn_get_daily_rate(e.salary) else e.salary end),2)) as late,
				   isnull(credit_location,e.location_code) location_code,
				   -- incomplete
				   ((@working_days -
					   (case when  (pr.number_of_days + isnull(leaves_with_pay,0) + isnull(leaves_without_pay,0) + (isnull(late,0) / 60.00 / 8.00 ) + (isnull(undertime,0) / 60.00 / 8.00 ) + (isnull(undertime_without_pay,0) / 60.00 / 8.00 ) + (isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 3.50 / 8.00,0) + isnull(btp.btrips_pm * 4.50 / 8.00 ,0))) + 0.01 > @working_days
						then @working_days 
						else (pr.number_of_days + isnull(leaves_with_pay,0) + isnull(leaves_without_pay,0) + (isnull(late,0) / 60.00 / 8.00 ) + (isnull(undertime,0) / 60.00 / 8.00 ) + (isnull(undertime_without_pay,0) / 60.00 / 8.00 ) + (isnull(btf.btrips_full,0) + isnull(bta.btrips_am * 3.50 / 8.00,0) + isnull(btp.btrips_pm * 4.50 / 8.00,0)))
						end 
					   ) 

				   ) * dbo.pr_fn_get_daily_rate(e.salary)) incomplete
			  into #payroll
			  from payroll (nolock) pr
			  join #employee e
				on e.id_num = pr.id_num
		 left join #deductions d
		        on d.id_num = e.id_num
		 left join #allowances a
		        on a.id_num = pr.id_num
		 left join #adjustments_plus ap
		        on ap.id_num = pr.id_num
		 left join #adjustments_minus am
		        on am.id_num = pr.id_num
		 left join #btrips_full btf
                on btf.id_num = pr.id_num
		 left join #btrips_am bta
                on bta.id_num = pr.id_num
		 left join #btrips_pm btp
                on btp.id_num = pr.id_num
			 where pr.payroll_code = @payroll_code

			select l.location_name branch,
				   sum(salary) salary, -- salaries_and_wages,
				   sum(adjustment) adjustment,
				   sum(leaves_without_pay) leaves_without_pay,
				   sum(undertime_without_pay) undertime_without_pay,
			       sum(allowances) allowances, -- staff_benefits,
				   sum(late) late,
				   sum(incomplete) incomplete,
				   isnull(null,0) adjustment_staff_benefits,
				   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
				   l.location_code
			  into #result
			  from #payroll p
			  join location (nolock) l
			    on p.location_code = l.location_code
		  group by location_name,
		           l.location_code

			-- result
			select p.branch branch,
				   (salary) salaries_and_wages,
				   (adjustment) adjustment,
				   (undertime_without_pay) * - 1 undertime_without_pay,
				   (leaves_without_pay) * -1 leaves_without_pay,
				   (incomplete) * -1 incomplete,  
				   late as lt,
				   -- ((salary + adjustment) - (leaves_without_pay + undertime_without_pay + incomplete + late)) total_salaries_and_wages
				   ((salary + adjustment) - (leaves_without_pay + undertime_without_pay + late + incomplete)) total_salaries_and_wages,
				   (allowances) total_staff_benefits,
				   isnull(null,0) adjustment_staff_benefits,
				   ((salary + adjustment + allowances) - (leaves_without_pay + undertime_without_pay + incomplete)) total,
				   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period
			  from #result p
		  order by p.branch

			drop table #employee
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus
			drop table #btrips_full
			drop table #btrips_am
			drop table #btrips_pm
			drop table #payroll
			drop table #result

END



