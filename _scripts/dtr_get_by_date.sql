
ALTER PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
    @location_code char(3) = null,
	@department_code char(3) = null,
	@positiontype_code char(3) = null,
	@pending_undertime_only smallint = 0
AS
BEGIN
			create table #dtr
			(
				id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
				--employee_name varchar(250),
				dtr_date datetime,
				time_in_am time,
				time_out_am time,
				am_status varchar(15),

    			time_in_pm time,
				time_out_pm time,
				pm_status varchar(15),
				total_hours_am decimal(4,2),
				total_hours_pm decimal(4,2),
				location_code char(3)
				-- primary key (id_num, dtr_date)  -- removed temporarily to allow duplicate records.. check id_num = 231, date = 2015-10-05
			)

			declare @current_date datetime

			set @current_date = getdate()

			-- constants for min and max login/out times
			declare @LOGIN_AM time(0),
					@LOGIN_PM time(0),
					@LOGOUT_AM time(0),
					@LOGOUT_PM time(0)

			-- get times
			select @LOGIN_AM = LOGIN_AM,
				   @LOGOUT_AM = LOGOUT_AM,
				   @LOGIN_PM = LOGIN_PM,
				   @LOGOUT_PM = LOGOUT_PM
			  from dbo.dtr_fn_get_times(@current_date)

			declare @employee table
			(
				id_num varchar(12),
				employee_name varchar(100),
				location_code char(3),
				department_code char(3),
				position_type_code char(3)
			)

			if (exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'dbo' and TABLE_NAME = 'paf'))
			begin
				insert into @employee
				select id_num,
						employee_name,
						location_code,
						department_code,
						positiontype_code
				   from dbo.paf_fn_active_employees(@dtr_date_from,@dtr_date_until) e
				  where (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
				    and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
				    and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)
				    and (ISNULL(@positiontype_code,'') = '' or e.positiontype_code = @positiontype_code)
			end
			else
			begin
				insert into @employee
				select id_num,
				       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
					   e.location_code,
					   e.department_code,
					   e.positiontype_code
				  from employee (nolock) e
				   where (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
				    and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
				    and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)
				    and (ISNULL(@positiontype_code,'') = '' or e.positiontype_code = @positiontype_code)
			end

			-- include external employees
			insert into @employee
				select id_num,
				       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
					   e.location_code,
					   e.department_code,
					   e.positiontype_code
				  from employee (nolock) e
				   where (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
				    and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
				    and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)
				    and (ISNULL(@positiontype_code,'') = '' or e.positiontype_code = @positiontype_code)
					and isnull(e.is_external,0) = 1

			-- all dtr affected by date range
			select *
              into #alldtr
			  from dtr (nolock) d
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.dtrstatus_code <> 'CNL'
				
			-- morning log
			-- with or without afternoon log
			insert into #dtr
			select e.id_num,
				   --e.employee_name,
				   d_am.dtr_date,
				   d_am.time_in as time_in_am,
				   d_am.time_out as time_out_am,
				   dbo.dtr_fn_get_log_status(d_am.time_in, @current_date) as am_status,
				   d_pm.time_in as time_in_pm,
				   d_pm.time_out as time_out_pm,
				   dbo.dtr_fn_get_log_status(d_pm.time_in, d_am.dtr_date) pm_status,
				   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
				   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
				   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, d_am.dtr_date,0) total_hours_am,
				   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, d_am.dtr_date,0) total_hours_pm,
				   d_am.location_code
			  from #alldtr d_am 
			  join @employee e 
			    on e.id_num = d_am.id_num
		 left join (select dtr_id,
						   dtr_date,
						   id_num,
						   time_in,
						   time_out,
						   location_code 
					  from #alldtr d 
					 where d.time_in >= @LOGOUT_AM --'12:00:00'
					   and (ISNULL(@id_num,'') = '' or d.id_num = @id_num)) d_pm 
				on d_pm.id_num = d_am.id_num
			   and d_pm.dtr_date = d_am.dtr_date
			   and d_pm.location_code = d_am.location_code
			 where d_am.time_in < @LOGOUT_AM --'12:00:00'
			   and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
			   and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
			   and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)
			   and (ISNULL(@positiontype_code,'') = '' or e.position_type_code = @positiontype_code)
			   and d_am.time_in > '07:00:00' -- this excludes logs made before 7:00 am


		  -- afternoon log
		  -- without morning log
		  insert into #dtr
		  select e.id_num,
				 -- e.employee_name,
				 d_pm_only.dtr_date,
				 null as time_in_am,
				 null as time_out_am,
				 null as am_status,
				 d_pm_only.time_in as time_in_pm,
				 d_pm_only.time_out as time_out_pm,
				 dbo.dtr_fn_get_log_status(d_pm_only.time_in, d_pm_only.dtr_date) pm_status,
				 0 total_hours_am,
				 -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
				 dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, d_pm_only.dtr_date,0) d_pm_only,
				 d_pm_only.location_code
			from #alldtr d_pm_only (nolock)
			join @employee e 
			  on e.id_num = d_pm_only.id_num
		   where d_pm_only.time_in > @LOGOUT_AM --'12:00:00'
			 and not exists (select 1 
			  				   from #dtr d  
						      where d.id_num = e.id_num
							    and d.dtr_date = d_pm_only.dtr_date)
			 and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
			 and (ISNULL(@location_code,'') = '' or e.location_code = @location_code)
			 and (ISNULL(@department_code,'') = '' or e.department_code = @department_code)
			 and (ISNULL(@positiontype_code,'') = '' or e.position_type_code = @positiontype_code)
			 and d_pm_only.time_out > @LOGIN_PM -- excludes logs made after 12:00 but is intended for the morning, i.e. 12:05 - 12:37

			-- get override
			select dtr_date override_date,
				   id_num,
				   location_code
			  into #override
			  from dtroverride do (nolock)
			 where do.dtr_date between @dtr_date_from and @dtr_date_until
			 --and isnull(do.is_cancelled,0) = 0
		  group by dtr_date, id_num, location_code

			-- get undertime
			select dtr_date undertime_date,
				   id_num
			  into #undertime
			  from dtrundertime du (nolock)
			 where du.dtr_date between @dtr_date_from and @dtr_date_until
			   and ((isnull(@pending_undertime_only,0) = 0) or (du.timestatus_code = 'PND'))

			-- get undertime AM
			select dtr_date undertime_date,
				   id_num,
				   time_from,
				   time_until,
				   timestatus_code
			  into #undertime_AM 
			  from dtrundertime ua (nolock)
			 where ua.dtr_date between @dtr_date_from and @dtr_date_until
			   and ua.am_pm = 'A'
			   and ((isnull(@pending_undertime_only,0) = 0) or (ua.timestatus_code = 'PND'))

			-- get undertime PM
			select dtr_date undertime_date,
				   id_num,
				   time_from,
				   time_until,
				   timestatus_code
			  into #undertime_PM 
			  from dtrundertime up (nolock)
			 where up.dtr_date between @dtr_date_from and @dtr_date_until
			   and up.am_pm = 'P'
			   and ((isnull(@pending_undertime_only,0) = 0) or (up.timestatus_code = 'PND'))

			-- get leaves
			select leave_date,
				   id_num
			  into #leaves
			  from leavedetail ld (nolock)
			  join leave l (nolock)
				on l.location_code = ld.location_code
			   and l.leave_id = ld.leave_id
			 where ld.leave_date between @dtr_date_from and @dtr_date_until
			   and ld.leavestatus_code = 'APP'

			-- insert overrides with no corresponding log
			insert into #dtr
			select o.id_num,
				   -- (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   o.override_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   o.location_code
			  from #override o 
			  --join employee e (nolock)
				--on e.id_num = o.id_num
		 left join #dtr d 
				on d.id_num = o.id_num
		  	   and d.dtr_date = o.override_date
			 where d.dtr_date is null
			   and o.id_num in (select id_num from #dtr)

			 -- insert undertime with no corresponding log
			insert into #dtr
			select u.id_num,
				   -- (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   u.undertime_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   d.location_code
			  from #undertime u 
			  --join employee e (nolock)
				--on e.id_num = u.id_num
		 left join #dtr d 
				on d.id_num = u.id_num
		  	   and d.dtr_date = u.undertime_date
			 where d.dtr_date is null
			   and u.id_num in (select id_num from #dtr)
	                    
			-- insert leaves with no corresponding log
			insert into #dtr
			select l.id_num,
				   --(e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   l.leave_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   e.location_code
			  from #leaves l 
			  join employee e (nolock)
				on e.id_num = l.id_num
		 --left join #dtr d 
		--		on d.id_num = l.id_num
		 -- 	   and d.dtr_date = l.leave_date
		--	 where d.dtr_date is null
		--	   and l.id_num in (select id_num from #dtr) 
		     where not exists (select 1 from #dtr d where d.id_num = l.id_num and d.dtr_date = l.leave_date)

			-- get holidays
			select holiday_id,
			       (cast(cast((case isnull(h.holiday_year,0) when 0 then year(@dtr_date_from) else h.holiday_year end) as varchar(4)) +
						right('0' + cast(holiday_month as varchar(2)), 2) +
						right('0' + cast(holiday_day as varchar(2)), 2) as datetime)) holiday_date,
				   is_national
			  into #holidays
			  from holiday h (nolock)
			 where cast(cast((case isnull(h.holiday_year,0) when 0 then year(@dtr_date_from) else h.holiday_year end) as varchar(4)) +
						right('0' + cast(holiday_month as varchar(2)), 2) +
						right('0' + cast(holiday_day as varchar(2)), 2) as datetime) 
           between @dtr_date_from and @dtr_date_until

		    -- get locations affected by holiday
			select *
			  into #holidaylocations
			  from (
					select hl.location_code,
						   h.*
					  from holidaylocation hl (nolock)
				      join #holidays h (nolock)
						on h.holiday_id = hl.holiday_id

					union 
	
					select l.location_code,
						   h.*
					  from location l (nolock),
						   #holidays h 
					 where isnull(h.is_national,0) = 1
					) hh 

			-- insert holidays
			insert into #dtr
			select e.id_num,
				   --(e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   hl.holiday_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   ee.location_code
			  from #holidaylocations hl,
			       @employee ee,
				   employee e 			 
		     where e.id_num in (select id_num from #dtr)
			   and e.id_num = ee.id_num
			   and ee.location_code = hl.location_code
			 
			CREATE NONCLUSTERED INDEX nci_id_num_date ON #dtr(id_num, dtr_date) 

			-- select result
			if isnull(@pending_undertime_only,0) = 0
			begin
				select e.id_num,
						-- d.employee_name,
						e.employee_name,
						d.dtr_date,
						isnull(convert(varchar(5),d.time_in_am),'-') time_in_am,
						isnull(convert(varchar(5),d.time_out_am),'-') time_out_am,
						d.am_status,
						isnull(convert(varchar(5),d.time_in_pm),'-') time_in_pm,
						isnull(convert(varchar(5),d.time_out_pm),'-') time_out_pm,
						d.pm_status,
						(total_hours_am + total_hours_pm) total_hours,
						d.location_code,
						o.override_date,
						u.undertime_date,
						isnull(convert(varchar(5),ua.time_from),'-') ua_time_from,
						isnull(convert(varchar(5),ua.time_until),'-') ua_time_until,
						ts1.timestatus_name ua_timestatus,
						isnull(convert(varchar(5),up.time_from),'-') up_time_from,
						isnull(convert(varchar(5),up.time_until),'-') up_time_until,
						ts2.timestatus_name up_timestatus,
						l.leave_date,
						hl.holiday_date
				   from @employee e
			  left join #dtr d
				     on e.id_num = d.id_num
			  left join #override o
					 on o.override_date = d.dtr_date
					and o.id_num = d.id_num
			  left join #undertime u
					 on u.undertime_date = d.dtr_date
		   			and u.id_num = d.id_num
			  left join #undertime_AM ua
				 	 on ua.undertime_date = d.dtr_date
		   			and ua.id_num = d.id_num
			  left join #undertime_PM up
				 	 on up.undertime_date = d.dtr_date
		   			and up.id_num = d.id_num
			  left join #leaves l
					 on l.leave_date = d.dtr_date
		  		    and l.id_num = d.id_num
			  left join #holidaylocations hl
					on hl.holiday_date = d.dtr_date
				   and d.location_code = hl.location_code collate sql_latin1_general_cp1_ci_as
			 left join t_timestatus ts1 (nolock)
			        on ts1.timestatus_code = ua.timestatus_code
			 left join t_timestatus ts2 (nolock)
			        on ts2.timestatus_code = up.timestatus_code
			  order by employee_name,
				   	   d.dtr_date 
			end
			else
			begin
				 select e.id_num,
						e.employee_name,
						d.dtr_date,
						isnull(convert(varchar(5),d.time_in_am),'-') time_in_am,
						isnull(convert(varchar(5),d.time_out_am),'-') time_out_am,
						d.am_status,
						isnull(convert(varchar(5),d.time_in_pm),'-') time_in_pm,
						isnull(convert(varchar(5),d.time_out_pm),'-') time_out_pm,
						d.pm_status,
						(total_hours_am + total_hours_pm) total_hours,
						d.location_code,
						o.override_date,
						u.undertime_date,
						isnull(convert(varchar(5),ua.time_from),'-') ua_time_from,
						isnull(convert(varchar(5),ua.time_until),'-') ua_time_until,
						ts1.timestatus_name ua_timestatus,
						isnull(convert(varchar(5),up.time_from),'-') up_time_from,
						isnull(convert(varchar(5),up.time_until),'-') up_time_until,
						ts2.timestatus_name up_timestatus,
						l.leave_date,
						hl.holiday_date
				   from @employee e
			  left join #dtr d
				     on e.id_num = d.id_num
			  left join #override o
					 on o.override_date = d.dtr_date
					and o.id_num = d.id_num
			       join #undertime u
				 	 on u.undertime_date = d.dtr_date
		   			and u.id_num = d.id_num
				   join #undertime_AM ua
				 	 on ua.undertime_date = d.dtr_date
		   			and ua.id_num = d.id_num
				   join #undertime_PM up
				 	 on up.undertime_date = d.dtr_date
		   			and up.id_num = d.id_num
			  left join #leaves l
					 on l.leave_date = d.dtr_date
		  			and l.id_num = d.id_num
			  left join #holidaylocations hl
					 on hl.holiday_date = d.dtr_date
					and d.location_code = hl.location_code collate sql_latin1_general_cp1_ci_as
			  left join t_timestatus ts1 (nolock)
			         on ts1.timestatus_code = ua.timestatus_code
			  left join t_timestatus ts2 (nolock)
			         on ts2.timestatus_code = up.timestatus_code
			   order by employee_name,
						d.dtr_date 
			end

			select * from #dtr
			select * from #leaves

			drop table #dtr
			drop table #override
			drop table #undertime
			drop table #undertime_AM
			drop table #undertime_PM
			drop table #leaves
			drop table #alldtr
			drop table #holidays
			drop table #holidaylocations
     
END




