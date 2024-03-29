USE [master]
GO
/****** Object:  Database [HRIS_Dev]    Script Date: 11/07/2016 10:42:17 PM ******/
CREATE DATABASE [HRIS_Dev] ON  PRIMARY 
( NAME = N'hris', FILENAME = N'C:\_Projects\_ASCC\_db\HRIS_2008R2.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hris_log', FILENAME = N'C:\_Projects\_ASCC\_db\HRIS_2008R2.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRIS_Dev] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRIS_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRIS_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRIS_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRIS_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRIS_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRIS_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRIS_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRIS_Dev] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HRIS_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRIS_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRIS_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRIS_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRIS_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRIS_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRIS_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRIS_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRIS_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HRIS_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRIS_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRIS_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRIS_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRIS_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRIS_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRIS_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRIS_Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HRIS_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [HRIS_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRIS_Dev] SET DB_CHAINING OFF 
GO
USE [HRIS_Dev]
GO
/****** Object:  StoredProcedure [dbo].[dtr_change_roster_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_change_roster_status]
	@roster_date_from datetime,
	@roster_date_until datetime,
	@loc_dep_code char(3),
	@resource_type_code char(3),
	@roster_status_code char(3),
	@id_num varchar(12)
AS
BEGIN
	if @roster_status_code = 'INI'
	begin
		update roster
		   set rosterstatus_code = @roster_status_code,
			   initialised_by = @id_num,
			   initialised_date = GETDATE()
		 where roster_date 
	   between @roster_date_from
		   and @roster_date_until
		   and resource_type_code = @resource_type_code
		   and loc_dep_code = @loc_dep_code
    end
    else if @roster_status_code = 'FIN'
	begin
		update roster
		   set rosterstatus_code = @roster_status_code,
			   finalised_by = @id_num,
			   finalised_date = GETDATE()
		 where roster_date 
	   between @roster_date_from
		   and @roster_date_until
		   and resource_type_code = @resource_type_code
		   and loc_dep_code = @loc_dep_code
    end
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_delete_holiday_locations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_delete_holiday_locations]
	@holiday_id integer
AS
BEGIN
	delete holidaylocation
	 where holiday_id = @holiday_id
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
    @location_code char(3) = null,
	@department_code char(3) = null
AS
BEGIN
			create table #dtr
			(
				id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
				employee_name varchar(250),
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
				department_code char(3)
			)

			insert into @employee
			select id_num,
					employee_name,
					location_code,
					department_code
				from dbo.paf_fn_active_employees(@dtr_date_from,@dtr_date_until)

			-- all dtr affected by date range
			select *
              into #alldtr
			  from dtr (nolock) d
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
				
			-- morning log
			-- with or without afternoon log
			insert into #dtr
			select e.id_num,
				   e.employee_name,
				   d_am.dtr_date,
				   d_am.time_in as time_in_am,
				   d_am.time_out as time_out_am,
				   dbo.dtr_fn_get_log_status(d_am.time_in, @current_date) as am_status,
				   d_pm.time_in as time_in_pm,
				   d_pm.time_out as time_out_pm,
				   dbo.dtr_fn_get_log_status(d_pm.time_in, d_am.dtr_date) pm_status,
				   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
				   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
				   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, d_am.dtr_date) total_hours_am,
				   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, d_am.dtr_date) total_hours_pm,
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
			   and d_am.time_in > '07:00:00' -- this excludes logs made before 7:00 am


		  -- afternoon log
		  -- without morning log
		  insert into #dtr
		  select e.id_num,
				 e.employee_name,
				 d_pm_only.dtr_date,
				 null as time_in_am,
				 null as time_out_am,
				 null as am_status,
				 d_pm_only.time_in as time_in_pm,
				 d_pm_only.time_out as time_out_pm,
				 dbo.dtr_fn_get_log_status(d_pm_only.time_in, d_pm_only.dtr_date) pm_status,
				 0 total_hours_am,
				 -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
				 dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, d_pm_only.dtr_date) d_pm_only,
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
			-- and du.timestatus_code = 'APP'

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
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
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
			  join employee e (nolock)
				on e.id_num = o.id_num
		 left join #dtr d 
				on d.id_num = o.id_num
		  	   and d.dtr_date = o.override_date
			 where d.dtr_date is null
			   and o.id_num in (select id_num from #dtr)

			 -- insert undertime with no corresponding log
			insert into #dtr
			select u.id_num,
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
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
			  join employee e (nolock)
				on e.id_num = u.id_num
		 left join #dtr d 
				on d.id_num = u.id_num
		  	   and d.dtr_date = u.undertime_date
			 where d.dtr_date is null
			   and u.id_num in (select id_num from #dtr)
	                    
			-- insert leaves with no corresponding log
			insert into #dtr
			select l.id_num,
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
				   l.leave_date dtr_date,
				   null time_in_am,
				   null time_out_am,
				   null am_status,
				   null time_in_pm,
				   null time_out_pm,
				   null pm_status,
				   0 total_hours_am,
				   0 total_hours_pm,
				   d.location_code
			  from #leaves l 
			  join employee e (nolock)
				on e.id_num = l.id_num
		 left join #dtr d 
				on d.id_num = l.id_num
		  	   and d.dtr_date = l.leave_date
			 where d.dtr_date is null
			   and l.id_num in (select id_num from #dtr) 

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
				   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
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
			select d.id_num,
				   d.employee_name,
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
				   l.leave_date,
				   hl.holiday_date
			  from #dtr d
		 left join #override o
		        on o.override_date = d.dtr_date
			   and o.id_num = d.id_num
		 left join #undertime u
				on u.undertime_date = d.dtr_date
		   	   and u.id_num = d.id_num
		 left join #leaves l
				on l.leave_date = d.dtr_date
		  	   and l.id_num = d.id_num
		 left join #holidaylocations hl
		        on hl.holiday_date = d.dtr_date
			   and d.location_code = hl.location_code collate sql_latin1_general_cp1_ci_as
	      order by d.employee_name,
		           d.dtr_date 

			drop table #dtr
			drop table #override
			drop table #undertime
			drop table #leaves
			drop table #alldtr
			drop table #holidays
			drop table #holidaylocations
     
END



GO
/****** Object:  StoredProcedure [dbo].[dtr_get_by_date_no_joins]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_by_date_no_joins] 
	@dtr_date_from date,
	@dtr_date_until date
AS
BEGIN
	select dtr_id,
	       location_code,
	       dtr_date,
	       id_num,
	       time_in,
	       time_out,
	       dtr_snapshot_in,
	       dtr_snapshot_out,
	       dtr_remarks,
	       dtrstatus_code 
	  from dtr d (nolock)
	 where d.dtr_date between @dtr_date_from and @dtr_date_until 
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_by_employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_by_employee]
	@id_num varchar(12),
	@dtr_date datetime
AS
BEGIN
	select @id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   convert(varchar(12),@dtr_date,107) formatted_dtr_date,
		   fn.*
	  from employee e (nolock)
 left join dbo.dtr_fn_get_dtr(@dtr_date,@dtr_date,@id_num,0) fn
	    on e.id_num = fn.id_num
     where e.id_num = @id_num
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_dtr_for_import]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_dtr_for_import]
AS
BEGIN
	declare @dtr table
	(
		id_num varchar(12),
		employee_name varchar(250),
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
	)
	
	-- morning log
	-- with or without afternoon log
	insert into @dtr
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out) total_hours_pm,
		   d_am.location_code
	  from ##dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_am.id_num
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from ##dtr d (nolock)
			 where d.time_in >= '12:00:00') d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.time_in < '12:00:00'
  
  -- afternoon log
  -- without morning log
  insert into @dtr
  select e.id_num,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out) d_pm_only,
		  d_pm_only.location_code
	 from ##dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.id_num = d_pm_only.id_num
	where d_pm_only.time_in > '12:00:00'
	  and not exists (select 1 
	                    from @dtr d  
	                   where d.employee_id = e.employee_id)
	
	select id_num,
		   employee_name,
		   dtr_date,
		   convert(varchar(5),time_in_am) time_in_am,
		   convert(varchar(5),time_out_am) time_out_am,
		   am_status,
		   convert(varchar(5),time_in_pm) time_in_pm,
		   convert(varchar(5),time_out_pm) time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		    location_code
	  from @dtr d
  order by d.time_out_pm desc,
		   d.time_in_pm desc,
		   d.time_out_am desc,
		   d.time_in_am desc
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_employee]
	@id_num varchar(12),
	@pin char(4)
AS
BEGIN
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from employee e (nolock)
	 where e.id_num = @id_num
	   and e.pin = @pin
END



GO
/****** Object:  StoredProcedure [dbo].[dtr_get_employees]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_employees]
	@dtr_date_from datetime,
	@dtr_date_until datetime
AS
BEGIN
    declare @monthsPrevious int

	-- set the number of months back of employee dtr records
	-- e.g. -1 means employees with dtr records for the last month, -2 means for the last 2 months, etc.
	set @monthsPrevious = -2
		 
	-- result 
	select distinct e.id_num,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from dtr d (nolock)
	  join employee e (nolock)
	    on e.id_num = d.id_num
     where d.dtr_date 
   between DATEADD(m, @monthsPrevious, @dtr_date_from) 
       and @dtr_date_until
  order by employee_name  
  
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_holiday]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_holiday]
	@holiday_id integer
AS
BEGIN
	select *
	  from holiday h (nolock)
	 where h.holiday_id = @holiday_id
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_holiday_locations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_holiday_locations]
	@holiday_id integer
AS
BEGIN
	-- get locations
	select l.location_name,
	       l.location_code location,
	       hl.location_code,
		   hl.holiday_id
	  from location l (nolock)
 left join holidaylocation hl (nolock)
        on hl.location_code = l.location_code
	   and hl.holiday_id = @holiday_id
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_holidays]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_holidays]
	@dtr_date_from datetime,
	@dtr_date_until datetime
AS
BEGIN
	
	select h.*
	  into #holidays
	  from holiday h (nolock)
	 where cast(cast((case isnull(h.holiday_year,0) when 0 then year(@dtr_date_from) else h.holiday_year end) as varchar(4)) +
				right('0' + cast(holiday_month as varchar(2)), 2) +
				right('0' + cast(holiday_day as varchar(2)), 2) as datetime) 
   between @dtr_date_from and @dtr_date_until
	 
	-- return 
	select *
	  from (
			select l.location_name,
				   l.location_code,
				   h.*
			  from location l (nolock)
		 left join holidaylocation hl (nolock)
				on hl.location_code = l.location_code
		 left join #holidays h (nolock)
				on h.holiday_id = hl.holiday_id

			union 
	
			select l.location_name,
				   l.location_code,
				   h.*
			  from location l (nolock),
				   #holidays h 
			 where isnull(h.is_national,0) = 1
			) hh
	order by hh.location_name

	drop table #holidays
END

GO
/****** Object:  StoredProcedure [dbo].[dtr_get_override_by_date_am]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dtr_get_override_by_date_am]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtroverride dto (nolock)
	 where dto.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((isnull(@id_num,'') = '') or (dto.id_num = @id_num ))
	   and dto.am_pm = 'A'
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_override_by_date_pm]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dtr_get_override_by_date_pm]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtroverride dto (nolock)
	 where dto.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((isnull(@id_num,'') = '') or (dto.id_num = @id_num ))
	   and dto.am_pm = 'P'
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_overtime]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_overtime]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrovertime dov (nolock)
	 where dov.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dov.id_num = @id_num))
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_roster]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_roster]
	@first_day datetime,
	@loc_dep_code char(3),
	@resource_type_code char(3)
AS
BEGIN
	declare @last_day datetime
	
	set @last_day = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@first_day)+1,0))
	
	-- get all days
	;WITH saturdays AS 
	(
		select @first_day as currDate
		
		union all
		
		select dateadd(d, 1 ,saturdays.currDate)
		  from saturdays
		 where dateadd(d,1,saturdays.currDate) < @last_day
	)

	select s.currDate,
	       ISNULL(r.roster_id,-1) roster_id,
	       ISNULL(r.rosterstatus_code,'RIP') rosterstatus_code,
	       r.*
	  from saturdays s
 left join (select *
              from roster rs (nolock)
             where (rs.roster_date 
           between @first_day
               and @last_day)
               and rs.loc_dep_code = @loc_dep_code
			   and rs.resource_type_code = @resource_type_code) r
        on r.roster_date = s.currDate
	 where datepart(WEEKDAY,currDate) = 7

	OPTION (MaxRecursion 32)
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_rosterdetail]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_rosterdetail]
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
           r.*,
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
               and rd.rdstatus_code = 'ACT') r
        on r.id_num = e.id_num
	 where (@resource_type_code = 'LOC' and e.location_code = @loc_dep_code and isnull(e.department_code,'') = '')
	    or (@resource_type_code = 'DEP' and e.department_code = @loc_dep_code)
		-- or (isnull(@resource_type_code,'') = '' and isnull(@loc_dep_code,'') = '')
  order by employee_name
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_timelog_summary]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_timelog_summary]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12),
    @location_code char(3) = null,
	@department_code char(3) = null
AS
BEGIN
	create table #dtr
	(
		id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
		employee_name varchar(250),
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
		primary key (id_num, dtr_date)
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

	declare @monthsPrevious int
	declare @employee table
	(
		id_num varchar(12),
		employee_name varchar(100),
		location_code char(3),
		department_code char(3)
	)

	-- set the number of months back of employee dtr records
	-- e.g. -1 means employees with dtr records for the last month, -2 means for the last 2 months, etc.
	set @monthsPrevious = -2

	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'paf')) 
	begin
	    insert into @employee
		select id_num,
		       employee_name,
			   location_code,
			   department_code
		  from dbo.paf_fn_active_employees(DATEADD(mm,@monthsPrevious,@dtr_date_from),@dtr_date_until)
	end
	else
	begin
		insert into @employee
		select id_num,
		       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
			   null,
			   null
		  from employee e (nolock)
	end
	
	-- morning log
	-- with or without afternoon log
	insert into #dtr
	select e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   d_am.dtr_date,
		   d_am.time_in as time_in_am,
		   d_am.time_out as time_out_am,
		   dbo.dtr_fn_get_log_status(d_am.time_in, @current_date) as am_status,
		   d_pm.time_in as time_in_pm,
		   d_pm.time_out as time_out_pm,
		   dbo.dtr_fn_get_log_status(d_pm.time_in, @current_date) pm_status,
		   -- ISNULL(DATEDIFF(minute,d_am.time_in,d_am.time_out)/60.0,0) total_hours_am,
		   -- ISNULL(DATEDIFF(minute,d_pm.time_in,d_pm.time_out)/60.0,0) total_hours_pm
		   dbo.dtr_fn_get_total_hours(d_am.time_in,d_am.time_out, @current_date) total_hours_am,
		   dbo.dtr_fn_get_total_hours(d_pm.time_in,d_pm.time_out, @current_date) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_am.id_num
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= @LOGOUT_AM --'12:00:00'
			   and (ISNULL(@id_num,'') = '' or d.id_num = @id_num)) d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < @LOGOUT_AM --'12:00:00'
	   and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
  
  -- afternoon log
  -- without morning log
  insert into #dtr
  select e.id_num,
	     (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
	      d_pm_only.dtr_date,
		  null as time_in_am,
		  null as time_out_am,
		  null as am_status,
		  d_pm_only.time_in as time_in_pm,
		  d_pm_only.time_out as time_out_pm,
		  dbo.dtr_fn_get_log_status(d_pm_only.time_in, @current_date) pm_status,
		  0 total_hours_am,
		  -- ISNULL(DATEDIFF(minute,d_pm_only.time_in,d_pm_only.time_out)/60.0,0) d_pm_only,
		  dbo.dtr_fn_get_total_hours(d_pm_only.time_in,d_pm_only.time_out, @current_date) d_pm_only,
		  d_pm_only.location_code
	 from dtr d_pm_only (nolock)
	 join employee e (nolock) 
	   on e.id_num = d_pm_only.id_num
	where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
	  and d_pm_only.time_in > @LOGOUT_AM --'12:00:00'
	  and not exists (select 1 
	                    from #dtr d  
	                   where d.id_num = e.id_num)
	  and (ISNULL(@id_num,'') = '' or e.id_num = @id_num)
	                   
	-- get inclusive dates
	;with inclusive_dates
	as
	(
		select @dtr_date_from as dt
		union all
		select dateadd(day, 1, dt)
		  from inclusive_dates
		 where dt < @dtr_date_until
	)
	
	-- select result
	-- join date with the dtr table
	select i.dt, 
	       id_num,
		   employee_name,
		   dtr_date,
		   isnull(convert(varchar(5),time_in_am),'-') time_in_am,
		   isnull(convert(varchar(5),time_out_am),'-') time_out_am,
		   am_status,
		   isnull(convert(varchar(5),time_in_pm),'-') time_in_pm,
		   isnull(convert(varchar(5),time_out_pm),'-') time_out_pm,
		   pm_status,
		   (total_hours_am + total_hours_pm) total_hours,
		   location_code
	  from inclusive_dates i
 left join (
				select *
				  from #dtr
				 where (ISNULL(@id_num,'') = '' or id_num = @id_num)
		   ) d
        on d.dtr_date = i.dt
	
	drop table #dtr
     
END



GO
/****** Object:  StoredProcedure [dbo].[dtr_get_undertime]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_undertime]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrundertime dut (nolock)
	 where dut.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dut.id_num = @id_num))
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_get_undertime_am]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_undertime_am]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrundertime dut (nolock)
	 where dut.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dut.id_num = @id_num))
	   and dut.am_pm = 'A'
END



GO
/****** Object:  StoredProcedure [dbo].[dtr_get_undertime_pm]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_undertime_pm]
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12)
AS
BEGIN
	select *
	  from dtrundertime dut (nolock)
	 where dut.dtr_date between @dtr_date_from and @dtr_date_until
	   and ((ISNULL(@id_num,'') = '') or (dut.id_num = @id_num))
	   and dut.am_pm = 'P'
END



GO
/****** Object:  StoredProcedure [dbo].[dtr_import_dtr]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_import_dtr]
AS
BEGIN
	declare @location_code char(3)
	
	if OBJECT_ID('tempdb..##dtr') IS NOT NULL
	begin
		select top 1
			   @location_code = location_code
		  from ##dtr
			
		insert 
		  into dtr
				(location_code,
				remote_dtr_id,
				dtr_date,
				id_num,
				time_in,
				time_out,
				dtr_snapshot_in,
				dtr_snapshot_out,
				dtr_remarks,
				dtrstatus_code)
		 select dt.location_code,
				dt.dtr_id,
				dt.dtr_date,
				dt.id_num,
				dt.time_in,
				dt.time_out,
				dt.dtr_snapshot_in,
				dt.dtr_snapshot_out,
				dt.dtr_remarks,
				'IMP'
		   from ##dtr dt
	  left join dtr d (nolock) on d.remote_dtr_id = dt.dtr_id and d.location_code = @location_code
		  where ISNULL(d.dtr_id,0) = 0
     end
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_load_exported_dtr]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_load_exported_dtr]
	@dtr_id int,
	@location_code char(3),
	@dtr_date date,
	@id_num int,
	@time_in varchar(25),
	@time_out varchar(25),
	@dtr_snapshot_in varchar(250),
	@dtr_snapshot_out varchar(250),
	@dtr_remarks varchar(250),
	@dtrstatus_code char(3)
AS
BEGIN
    if OBJECT_ID('tempdb..##dtr') IS NULL
	begin	
	create table ##dtr
		(
			dtr_id int,
			location_code char(3),
			dtr_date date,
			id_num varchar(12),
			time_in time(7),
			time_out time(7),
			dtr_snapshot_in varchar(250),
			dtr_snapshot_out varchar(250),
			dtr_remarks varchar(250),
			dtrstatus_code char(3)
		)
	end
	
	insert 
	  into ##dtr
	values (@dtr_id,
			@location_code,
			@dtr_date,
			@id_num,
			@time_in,
			nullif(@time_out,''),
			@dtr_snapshot_in,
			@dtr_snapshot_out,
			@dtr_remarks,
			@dtrstatus_code)
END


GO
/****** Object:  StoredProcedure [dbo].[dtr_log_time]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_log_time]
	@id_num varchar(12),
	@dtr_snapshot varchar(250)
AS
BEGIN
    declare @current_date datetime
	declare @dtr_date date
	declare @dtr_time time(0)
	declare @logged integer
	declare @orphaned integer
	declare @post_message varchar(100) = 'Time posted successfully.'
	declare @log_status varchar(10)
	declare @min_timeout_interval decimal(4,2)
	declare @total_hours decimal(4,2)
	declare @log_complete smallint = 0

	-- constants for min and max login/out times
	declare @LOGIN_AM time(0),
	        @LOGIN_PM time(0),
			@LOGOUT_AM time(0),
			@LOGOUT_PM time(0)

	-- get current date
	set @current_date = GETDATE()

	-- get times
	select @LOGIN_AM = LOGIN_AM,
			@LOGOUT_AM = LOGOUT_AM,
			@LOGIN_PM = LOGIN_PM,
			@LOGOUT_PM = LOGOUT_PM
		from dbo.dtr_fn_get_times(@current_date)
	
	-- get DTR date
	set @dtr_date = CONVERT(date, @current_date, 101)
	-- get current time
	set @dtr_time = CONVERT(time, @current_date)
	-- get minimum timeout
	set @min_timeout_interval = isnull(dbo.fn_get_sysconfig_value('MIN_TIMEOUT_INTERVAL'),0) / 60.0
	
	-- check if current date's log is complete
	-- meaning employee has logged his/her time
	-- employee can only have 2 "logs" per day
	-- for both AM and PM 
	select @logged = COUNT(dtr_id)
	  from dtr d (nolock)
	 where d.dtr_date = @dtr_date
	   and d.id_num = @id_num
	
	-- if not logged, INSERT or UPDATE dtr
	-- UPDATE completes the time log
	-- sets the "time_out" field of the orphaned "time_in" field 
	-- conditions: 0 = no log yet (INSERT), 1 or 2 = logged already (INSERT or UPDATE)
	if @logged = 0 and @dtr_time < @LOGOUT_PM --'17:00:00'
	begin
	  insert 
	    into dtr
			 (dtr_date,
			 id_num,
			 time_in,
			 time_out,
			 dtr_snapshot_in,
			 dtr_snapshot_out,
			 dtr_remarks) 
	  values (@dtr_date
			 ,@id_num
			 ,@dtr_time
			 ,null
			 ,@dtr_snapshot
			 ,null
			 ,null)
			 
	  -- log status
	  set @log_status = 'IN'
	  set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2)) 
	end
	else if @logged <= 2
	begin 
	  -- check for orphaned record then UPDATE, otherwise INSERT
	  select @orphaned = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num
	     and d.time_out is null 
	  
	  -- get total hours
	  -- total hours is used to compare
	  -- with interval..do not allow to log time if hours is less than interval
	  select @total_hours = DATEDIFF(minute,d.time_in,@dtr_time) / 60.0
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num 
	     and d.time_out is null
	     
	  -- check if afternoon log is complete
	  -- do not allow to log time if afternoon log is complete
	  select @log_complete = COUNT(dtr_id)
	    from dtr d (nolock)
	   where d.dtr_date = @dtr_date
	     and d.id_num = @id_num
	     and d.time_in > @LOGOUT_AM --'12:00:00'
	     and d.time_out is not null
	     
	  -- there is no orphaned record
	  -- AM time log is complete
	  -- create log for PM 
	  if @orphaned = 0 and @logged = 1 and @log_complete = 0
	  begin
		  insert 
			into dtr 
				 (dtr_date,
				 id_num,
				 time_in,
				 time_out,
				 dtr_snapshot_in,
				 dtr_snapshot_out,
				 dtr_remarks)
		  values (@dtr_date
				 ,@id_num
				 ,@dtr_time
				 ,null
				 ,@dtr_snapshot
				 ,null
				 ,null)
				 
		-- log status
	    set @log_status = 'IN'
		set @post_message = 'In - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  -- complete the time log
	  -- update "time_out" field
	  else if (@orphaned = 1) 
	   and (@total_hours >= @min_timeout_interval)
	  begin
		update dtr
		   set time_out = @dtr_time,
			   dtr_snapshot_out = @dtr_snapshot
		 where dtr_date = @dtr_date
		   and id_num = @id_num
		   and time_out is null  
		   
		-- log status
	    set @log_status = 'OUT'
		set @post_message = 'Out - ' + CONVERT(VARCHAR,@dtr_time,100) + ' ' --+ LOWER(SUBSTRING(CONVERT(VARCHAR(30), @current_date, 9), 25, 2))  
	  end
	  else
	  begin
	    -- log status
	    set @log_status = 'REJECTED'
	    set @post_message = 'Rejected - '
	  end
	end
	
	-- return
	select (employee_lastname + ', ' + employee_firstname) employee_name
		   ,@post_message post_message
		   ,@log_status log_status
	  from employee e (nolock)
	 where e.id_num = @id_num
END



GO
/****** Object:  StoredProcedure [dbo].[hris_change_leave_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_change_leave_status]
	@leave_id int,
	@location_code char(3),
	@leavestatus_code char(3)
AS
BEGIN
	update leavedetail
	   set leavestatus_code = @leavestatus_code
	 where leave_id = @leave_id
	   and location_code = @location_code  
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_activity_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_activity_status]
AS
BEGIN
	select st.activitystatus_code,
	       st.activitystatus_name
	  from t_activitystatus st (nolock)
  order by st.activitystatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_activity_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_activity_types]
AS
BEGIN
	select at.activitytype_code,
		   at.activitytype_name,
		   at.activitytype_colour
	  from t_activitytype at (nolock)
  order by at.activitytype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_allowance_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_allowance_types]
AS
BEGIN
	select at.allowancetype_code,
	       at.allowancetype_name,
	       lat.location_code
	  from t_allowancetype at (nolock)
 left join locationallowancetype lat (nolock)
	    on lat.allowancetype_code = at.allowancetype_code
  order by at.allowancetype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_am_pm]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_am_pm]
AS
BEGIN
	select 'A' value, 
	       'AM' display
	union
	select 'P' value,
	       'PM' display
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_blood_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_blood_types]
AS
BEGIN
	declare @temp_blood_types table(
		value char(2),
		display varchar(12)
	)
	
	insert @temp_blood_types
	select 'AA','Type A'
	union
	select 'AB','Type AB'
	union
	select 'BB','Type B'
	union
	select 'OO','Type O'
	
	select * 
	  from @temp_blood_types
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_civil_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_civil_status]
AS
BEGIN
	declare @temp_civil_status table(
		value char(3),
		display varchar(12)
	)
	
	insert @temp_civil_status
	select 'SGL','Single'
	union
	select 'MRD','Married'
	union
	select 'SEP','Separated'
	union
	select 'WDW','Widowed'
	
	select * 
	  from @temp_civil_status
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_departments]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_departments]
AS
BEGIN
	select d.department_code,
		   d.department_name,
		   ld.location_code
	  from department d (nolock)
	  join locationdepartment ld (nolock) on ld.department_code = d.department_code
  order by d.department_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_emp_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_emp_status]
AS
BEGIN
	select es.empstatus_code,
		   es.empstatus_name
	  from t_empstatus es (nolock)
  order by es.empstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_employees]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_employees]
AS
BEGIN
	select e.employee_id,
		   e.id_num,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name
	  from employee e (nolock)
  order by e.employee_lastname,
		   e.employee_firstname
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_gender]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_gender]
AS
BEGIN
	declare @temp_gender table(
		value char(1),
		display varchar(12)
	)
	
	insert @temp_gender
	select 'M','Male'
	union
	select 'F','Female'
	
	select * 
	  from @temp_gender
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_holiday_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_holiday_types]
AS
BEGIN
	select holidaytype_code,
	       holidaytype_name,
		   holiday_rate
	  from t_holidaytype (nolock)
  order by holidaytype_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_leave_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_leave_reasons]
AS
BEGIN
	select lr.leavereason_code,
	       lr.leavereason_name,
	       (lr.leavereason_code + ' - ' + lr.leavereason_name) leavereason_name_long,
		   lr.leavetype_code
	  from t_leavereason lr (nolock)
	 where isnull(lr.is_active,0) = 1
  order by lr.leavereason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_leave_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_leave_status]
AS
BEGIN
	select ls.leavestatus_code,
	       ls.leavestatus_name
	  from t_leavestatus ls (nolock)
  order by ls.leavestatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_leave_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_leave_types]
AS
BEGIN
	select leavetype_code,
		   leavetype_name
	  from t_leavetype lt (nolock)
  order by lt.leavetype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_leaveapp_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_leaveapp_status]
AS
BEGIN
	select leaveappstatus_code,
	       leaveappstatus_name
	  from t_leaveapplicationstatus las (nolock)
  order by las.leaveappstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_location_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_location_types]
AS
BEGIN
	select l.locationtype_code,
		   l.locationtype_name,
		   l.has_department
	  from t_locationtype l (nolock)
	 where l.locationtype_code <> 'SVR'
  order by l.locationtype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_locations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_locations]
AS
BEGIN
	select l.location_code,
		   l.location_name
	  from location l (nolock)
	 where l.locationtype_code <> 'SVR'
  order by l.location_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_months]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_months]
AS
BEGIN
	select 1 month_num, 'January' month_name
	union
	select 2 month_num, 'February' month_name
	union
	select 3 month_num, 'March' month_name
	union
	select 4 month_num, 'April' month_name
	union
	select 5 month_num, 'May' month_name
	union
	select 6 month_num, 'June' month_name
	union
	select 7 month_num, 'July' month_name
	union
	select 8 month_num, 'August' month_name
	union
	select 9 month_num, 'September' month_name
	union
	select 10 month_num, 'October' month_name
	union
	select 11 month_num, 'November' month_name
	union
	select 12 month_num, 'December' month_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_occupations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_occupations]
AS
BEGIN
	select o.occupation_id,
		   o.occupation_name
	  from t_occupation o (nolock)
  order by o.occupation_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_override_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_override_reasons]
AS
BEGIN
	select ovr.override_reason_code,
	       override_reason_name
	  from t_overridereason ovr (nolock)
  order by ovr.override_reason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_overtime_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_overtime_reasons]
AS
BEGIN
	select ovr.overtime_reason_code,
	       overtime_reason_name
	  from t_overtimereason ovr (nolock)
  order by ovr.overtime_reason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_paf_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_paf_status]
AS
BEGIN
	select ps.pafstatus_code,
	       ps.pafstatus_name
	  from t_pafstatus ps (nolock)
  order by ps.pafstatus_name	
END

GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_position]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_position]
AS
BEGIN
	select p.position_code,
		   (p.position_name + ' - ' + p.level_code) position,
		   l.rank
	  from t_position p (nolock)
	  join t_level l (nolock) on l.level_code = p.level_code
  order by p.position_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_position_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_position_status]
AS
BEGIN
	select ps.posstatus_code,
		   ps.posstatus_name
	  from t_positionstatus ps (nolock)
  order by ps.posstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_position_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_position_types]
AS
BEGIN
	select positiontype_code,
	       positiontype_name
	  from t_positiontype (nolock)
  order by positiontype_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_provinces]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_provinces]
AS
BEGIN
	select p.province_id,
		   (rtrim(p.abbreviation) + ' - ' + p.province_name) province
	  from t_province p (nolock)
  order by p.province_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_relations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_relations]
AS
BEGIN
	select r.relation_id,
		   r.relation_name
	  from t_relation r (nolock)
  order by r.relation_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_religions]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_dd_get_religions]
AS
BEGIN
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 't_religion')) 
	begin 
		select r.religion_id,
			   r.religion_name
		  from t_religion r (nolock)
	  order by r.religion_name	  
	end
	else
	begin
		select null,
		       null
	end
END



GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_resource_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_resource_types]
AS
BEGIN
	declare @resourceType table
	(
		resource_type char(3),
		code char(3),
		name varchar(50)
	)
	
	insert into @resourceType
	select 'LOC' resource_type,
	       l.location_code code,
		   l.location_name name
	  from location l (nolock)
	 where l.locationtype_code <> 'SVR'	

	 union

	select 'DEP' resource_type,
		    d.department_code code,
			d.department_name + ' (DEPARTMENT)' name
		from department d (nolock)	
	
	-- return
	select *
	  from @resourceType
  order by name

END

GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_salary_frequencies]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_salary_frequencies]
AS
BEGIN
	select sf.frequency_code,
		   sf.frequency_name
	  from t_salaryfrequency sf (nolock)
  order by sf.frequency_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_time_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_time_status]
AS
BEGIN
	select ts.timestatus_code,
	       ts.timestatus_name
	  from t_timestatus ts (nolock)
  order by ts.timestatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_town_with_prov]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_dd_get_town_with_prov]
AS
BEGIN
	select t.town_id,
		   (t.town_name + ' - ' + p.abbreviation) as town
	  from t_town t (nolock)
	  join t_province p (nolock)
	    on p.province_id = t.province_id
  order by t.town_name,
		   p.province_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_dd_get_undertime_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_dd_get_undertime_reasons]
AS
BEGIN
	select ut.undertime_reason_code,
	       ut.undertime_reason_name
	  from t_undertimereason ut (nolock)
  order by ut.undertime_reason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_delete_departments]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_delete_departments]
	@location_code char(3)
AS
BEGIN
	delete locationdepartment
	 where location_code = @location_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_delete_leave_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_delete_leave_reasons]
	@remote_leave_id int,
	@location_code char(3)
AS
BEGIN
	delete leavereason
     where remote_leave_id = @remote_leave_id
       and location_code = @location_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_account_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_account_types]
AS
BEGIN
	select *
	  from t_accounttype (nolock)
  order by accounttype_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_activities]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_activities]
	@start_date datetime,
	@end_date datetime
AS
BEGIN
	select *
	  from activity a (nolock)
	 where a.activity_startdate between @start_date and @end_date
	    or a.activity_enddate between @start_date and @end_date
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_activity_employees]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_activity_employees]
	@activity_id integer
AS
BEGIN
	select *
	  from activityemployee ae (nolock)
	 where ae.activity_id = @activity_id
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_activity_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_activity_status]
AS
BEGIN
	select *
	  from t_activitystatus st (nolock)
  order by st.activitystatus_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_activity_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_activity_types]
AS
BEGIN
	select *
	  from t_activitytype at (nolock)
  order by at.activitytype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_adjustment_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_adjustment_types]	
AS
BEGIN
	select *
	  from t_adjustmenttype (nolock)
  order by adjustmenttype_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_allowance_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_allowance_types]
AS
BEGIN
	select *
	  from t_allowancetype at (nolock)
  order by at.allowancetype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_allowance_types_by_location]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_allowance_types_by_location]
	@location_code char(3)
AS
BEGIN
	select *
	  from locationallowancetype la (nolock)
	 where la.location_code = @location_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_areas]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_areas]
AS
BEGIN
	select *
	  from area (nolock)
  order by area_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_departments]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_departments]
AS
BEGIN
	select *
	  from department d (nolock)
  order by d.department_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_departments_by_location]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_departments_by_location]
	@location_code char(3)
AS
BEGIN
	select *
	  from locationdepartment ld (nolock)
	 where ld.location_code = @location_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_emp_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_emp_status]
AS
BEGIN
	select *
	  from t_empstatus es (nolock)
  order by es.empstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empaddress_h]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_empaddress_h]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empaddress ea (nolock)
	 where ea.id_num = @id_num
	   and address_type = 'H'
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empaddress_p]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_empaddress_p]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empaddress ea (nolock)
	 where ea.id_num = @id_num
	   and address_type = 'P'
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empcontact_h]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_empcontact_h]
	@id_num int
AS
BEGIN
	select *
	  from empcontact ec (nolock)
	 where ec.id_num = @id_num
	   and contact_type = 'H'
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empcontact_p]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_empcontact_p]
	@id_num int
AS
BEGIN
	select *
	  from empcontact ec (nolock)
	 where ec.id_num = @id_num
	   and contact_type = 'P'
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empemergency]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_empemergency]
	@id_num int
AS
BEGIN
	select *
	  from empemergency ee (nolock)
	 where ee.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_empfamily]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_empfamily]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from empfamily ef (nolock)
	 where ef.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_employee]
	@id_num varchar(12)
AS
BEGIN
	select *
	  from employee e (nolock)
	 where e.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_employees]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_employees]
	@lastname varchar(50),
	@firstname varchar(50),
	@option int
AS
BEGIN

	if @lastname = '' 
	  set @lastname = null
	 
	if @firstname = ''
	  set @firstname = null
	  
	-- partial
	if @option = 1
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (e.employee_lastname like '%' + @lastname + '%'))
		   and (@firstname is null or (e.employee_firstname like '%' + @firstname + '%'))
		   and isnull(e.is_external,0) = 0
	  order by e.employee_lastname,
			   e.employee_firstname
	end 
	else if @option = 2
	begin
		select e.id_num,
			   e.employee_lastname,
			   e.employee_firstname,
			   e.employee_middlename
		  from employee e (nolock)
		 where (@lastname is null or (lower(e.employee_lastname) = lower(@lastname)))
		   and (@firstname is null or (lower(e.employee_firstname) = (@firstname)))
		   and isnull(e.is_external,0) = 0
	  order by e.employee_lastname,
			   e.employee_firstname
	end
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_holiday_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_holiday_types]
AS
BEGIN
	select *
	  from t_holidaytype (nolock)
  order by holidaytype_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_latest_paf]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_latest_paf]
	@id_num int
AS
BEGIN
	select top 1 *
	  from paf p (nolock)
	 where p.id_num = @id_num
	   and isnull(p.is_cancelled,0) = 0
	   and p.pafstatus_code = 'APP'
  order by p.effective_date desc
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_latest_paf_allowances]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_latest_paf_allowances]
	@paf_id int
AS
BEGIN
	select *
	  from pafallowance pa (nolock)
	  join (select lat.allowancetype_code
		      from locationallowancetype lat (nolock)
		      join paf p (nolock) 
		        on p.location_code = lat.location_code
		     where p.paf_id = @paf_id
		   ) a
		on a.allowancetype_code = pa.allowancetype_code
	 where pa.paf_id = @paf_id
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leave]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leave]
	@leave_id integer,
	@location_code char(3)
AS
BEGIN
	select *
	  from leave l (nolock)
	 where l.leave_id = @leave_id
	   and l.location_code = @location_code
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_leave_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leave_reasons]
AS
BEGIN
	select *
	  from t_leavereason lr (nolock)
  order by lr.leavereason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leave_reasons_with_parent]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leave_reasons_with_parent]
AS
BEGIN
	select lr1.leavereason_code,
	       lr1.leavereason_name,
	       lr1.leavetype_code,
	       lr1.parent_reason_code,
	       lr2.leavereason_name as parent_reason_name
	  from t_leavereason lr1 (nolock)
 left join t_leavereason lr2 (nolock)
        on lr1.parent_reason_code = lr2.leavereason_code
     where lr1.parent_reason_code is not null
  order by lr2.leavereason_name, lr1.leavereason_name
END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_leave_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[hris_get_leave_types]
AS
BEGIN
	select *
	  from t_leavetype lt (nolock)
  order by lt.leavetype_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leaveapplication_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[hris_get_leaveapplication_status]
AS
BEGIN
	select *
	  from t_leaveapplicationstatus las (nolock)
  order by las.leaveappstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leavedetail]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leavedetail]
	@leave_id integer,
	@location_code char(3)
AS
BEGIN
	select *
	  from leavedetail ld (nolock)
	 where ld.leave_id = @leave_id
	   and ld.location_code = @location_code
  order by ld.leave_date
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leaves]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leaves]
	@from_date datetime,
	@until_date datetime,
	@id_num varchar(12),
	@location_code char(3) = null,
	@department_code char(3) = null
AS
BEGIN
	declare @employee table
	(
		id_num varchar(12),
		employee_name varchar(100),
		location_code char(3),
		department_code char(3)
	)

	insert into @employee
	select id_num,
		    employee_name,
			location_code,
			department_code
		from dbo.paf_fn_active_employees(@from_date,@until_date)

    select distinct e.id_num as dtr_id_num,
           e.employee_name,
           ll.*
      from @employee e
 left join (select ld.leave_date,
                   l.leave_id,
                   l.location_code,
				   l.leave_application_date,
				   l.id_num,
				   l.leavetype_code,
				   l.justification,
				   l.leaveappstatus_code,
				   l.leave_remarks,
				   l.created_by,
				   l.created_date,
				   l.modified_by,
				   l.modified_date,
				   l.status_changed_by,
				   l.status_changed_date,
				   ld.leavestatus_code
              from leavedetail ld  (nolock)
			  join leave l (nolock) 
			    on l.leave_id = ld.leave_id
			   and l.location_code = ld.location_code
			where ld.leave_date
           between @from_date
               and @until_date) ll
        on ll.id_num = e.id_num 
     where ((isnull(@location_code,'') = '' or (e.location_code = @location_code)))-- location code
	   and ((isnull(@department_code,'') = '' or (e.department_code = @department_code))) -- department code
	   and (isnull(@id_num,'') = '' or e.id_num = @id_num)
  order by employee_name

END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_leaves_by_employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_get_leaves_by_employee]
	@id_num varchar(12)
AS
BEGIN
	-- This procedure is used to check for leaves agains the newly-added leaves to prevent duplication
	select *
	  from leave l (nolock)
	  join leavedetail ld (nolock)
	    on l.leave_id = ld.leave_id
	   and l.location_code = ld.location_code
	 where l.id_num = @id_num
	   and ld.leavestatus_code in ('PND','APP')

END

GO
/****** Object:  StoredProcedure [dbo].[hris_get_levels]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_levels]
AS
BEGIN
	select *
	  from t_level l (nolock)
  order by l.level_code 
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_locations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_locations]
AS
BEGIN
	select *
	  from location l (nolock)
  order by l.location_code
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_occupations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_occupations]
AS
BEGIN
	select *
	  from t_occupation o (nolock)
  order by o.occupation_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_overridereasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_get_overridereasons]
AS
BEGIN
	select *
	  from t_overridereason (nolock) ovr
  order by ovr.override_reason_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_overtime_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[hris_get_overtime_reasons]
AS
BEGIN
	select *
	  from t_overtimereason ot (nolock)
  order by ot.overtime_reason_name
END



GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_paf]
	@paf_id int
AS
BEGIN
	select p.paf_id,
		   p.effective_date,
		   p.effective_until,
		   p.id_num,
		   p.salary,
		   p.frequency_code,
		   p.position_code,
		   p.empstatus_code,
		   p.posstatus_code,
		   p.location_code,
		   p.department_code,
		   p.paf_remarks,
		   p.created_by,
		   p.created_date,
		   p.modified_by,
		   p.modified_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.is_cancelled,
		   p.pafstatus_code
	  from paf p (nolock)
	 where paf_id = @paf_id
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf_allowances]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_paf_allowances]
	@paf_id int
AS
BEGIN
	select *
	  from pafallowance pa (nolock)
     where pa.paf_id = @paf_id
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf_comp]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_paf_comp]
	@paf_id int
AS
BEGIN
	select *
	  from pafcomponent (nolock)
	 where paf_id = @paf_id
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf_list]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_paf_list]
	@id_num varchar(12),
	@user_id_num varchar(12)
AS
BEGIN
	select p.paf_id,
		   e.id_num,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.employee_middlename,
		   (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   ps.position_name,
		   pst.posstatus_name,
		   es.empstatus_name,
		   l.location_name,
		   p.salary,
		   p.effective_date,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.pafstatus_code,
		   p.is_cancelled,
		   e.is_external
	  from paf p (nolock)
	  join employee e (nolock) on e.id_num = p.id_num
	  join t_position ps (nolock) on ps.position_code = p.position_code
	  join t_empstatus es (nolock) on es.empstatus_code = p.empstatus_code
	  join t_positionstatus pst (nolock) on pst.posstatus_code = p.posstatus_code
	  join location l (nolock) on l.location_code = p.location_code
	 where (ISNULL(@id_num,'') = '' or p.id_num = @id_num)
	   and (ps.level_code in ( 
							   select distinct level_code
							     from sysroleprivilege rp (nolock)
							     join sysuserrole ur (nolock) 
								   on ur.role_code = rp.role_code and ur.id_num = @user_id_num
							     join sysrolelevel rl (nolock)
								   on rl.role_code = rp.role_code
							    where rp.privilege_code = 'PAF_VIEW')
							 ) 
  order by employee_name, p.paf_id desc
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_position_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_position_status]
AS
BEGIN
	select *
	  from t_positionstatus ps (nolock)
  order by ps.posstatus_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_positions]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_positions]
AS
BEGIN
	select *
	  from t_position p (nolock)
  order by p.position_name 
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_provinces]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_provinces]
AS
BEGIN
	select *
	  from t_province p (nolock)
  order by p.province_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_relations]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_relations]
AS
BEGIN
	select *
	  from t_relation r (nolock)
  order by r.relation_name 
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_religions]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_religions]
AS
BEGIN
	select *
	  from t_religion r (nolock)
  order by r.religion_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_salaryfrequencies]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_salaryfrequencies]
AS
BEGIN
	select *
	  from t_salaryfrequency sf (nolock)
  order by sf.frequency_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_sysusers]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_sysusers]
AS
BEGIN
	select *
	  from sysuser u (nolock)
  order by u.username
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_towns]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hris_get_towns]
AS
BEGIN
	select *
	  from t_town t (nolock)
  order by t.town_name
END


GO
/****** Object:  StoredProcedure [dbo].[hris_get_undertime_reasons]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[hris_get_undertime_reasons]
AS
BEGIN
	select *
	  from t_undertimereason ut (nolock)
  order by ut.undertime_reason_name
END



GO
/****** Object:  StoredProcedure [dbo].[hris_paf_effective_until]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[hris_paf_effective_until]
	@id_num varchar(12)
AS
BEGIN
	declare @paf_cnt int,
		    @i int = 1,
		    @j int = 1,
		    @effective_until datetime,
		    @paf_id int
		    
	-- iterate through the paf record of each employee.. sort by effective_from column
	-- set the EFFECTIVE_UNTIL column based on the next paf record's effective_from column
	-- EFFECTIVE_UNTIL should be a day less from the effective_from column's value
	-- (i.e. EFFECTIVE_FROM = '10/30/2013' then EFFECTIVE_UNTIL = '10/29/2013')
	
		 
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
END

GO
/****** Object:  StoredProcedure [dbo].[hris_rep_attendance]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hris_rep_attendance]
	@dateFrom datetime,
	@dateUntil datetime,
	@locationCode char(3)
AS
BEGIN
	select (e.employee_lastname + ', ' + e.employee_firstname + ISNULL(e.employee_middlename + ' ','')) employee,
		   '' position_name,
		   e.id_num, 	
		   0 days_attended,
		   0 leave_without_pay,
		   0 leave_with_pay,
		   0 leave_bus_trip,
		   0 holiday_pay,
		   0 paid_days,
		   0 undertime,
		   0 late
	  from dtr d (nolock)
	  join employee e (nolock)
	    on e.employee_id = d.employee_id
	 where ((@dateFrom is null) or (d.dtr_date >= @dateFrom))
	   and ((@dateUntil is null) or (d.dtr_date <= @dateUntil))
	   and ((@locationCode is null) or (d.location_code = @locationCode))
END


GO
/****** Object:  StoredProcedure [dbo].[pr_close_payroll]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_close_payroll]
	@payroll_code char(15)
AS
BEGIN
	-- This routine sets the selected payroll's status to FIN = Finalised
	-- Finalised means modifying records of the selected period is restricted

	set xact_abort on

	begin tran

		-- close the payroll
		update payrollcode
		   set payrollstatus_code = 'FIN'
		 where payroll_code = @payroll_code

		-- remove the zero deductions
		delete payrolldeduction
		 where payroll_code = @payroll_code
		   and deduction_amount = 0 

	commit tran
END


GO
/****** Object:  StoredProcedure [dbo].[pr_dd_get_adjustment_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_dd_get_adjustment_types]
AS
BEGIN
	select a.adjustmenttype_code,
	       a.adjustmenttype_name,
		   a.is_deduction
	  from t_adjustmenttype a (nolock)
  order by a.adjustmenttype_name
END

GO
/****** Object:  StoredProcedure [dbo].[pr_dd_get_deduction_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_dd_get_deduction_types]
AS
BEGIN
	select dt.deductiontype_code,
	       dt.deductiontype_name
	  from t_deductiontype dt (nolock)
  order by dt.deductiontype_name
END

GO
/****** Object:  StoredProcedure [dbo].[pr_dd_payroll_period]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_dd_payroll_period]
AS
BEGIN
    exec dbo.pr_generate_payroll_code
    
	select payroll_code,
	       (convert(varchar(10),pc.payroll_from,101) + ' - ' + convert(varchar(10),pc.payroll_until,101)) payroll_period
	  from payrollcode pc (nolock)
  order by pc.payroll_until desc
END

GO
/****** Object:  StoredProcedure [dbo].[pr_declare_dependents]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_declare_dependents]
	@payroll_code char(15),
	@id_num varchar(12),
	@declare smallint
AS
BEGIN
    declare @payroll_from datetime,
			@payroll_until datetime,
			@dependents int

	set xact_abort on

	begin transaction

	-- update employee record
	update employee
	   set declare_dependents = @declare
	 where id_num = @id_num

	 -- get dependents
	 select @dependents = count(id_num)
	   from empfamily ef (nolock)
	  where isnull(ef.is_dependent,0) = 1
		and isnull(ef.is_deceased,0) = 0
		and id_num = @id_num

	 -- update payroll record
	 update payroll
	    set dependents = (case when @declare = 1 then @dependents else null end)
	  where id_num = @id_num
	    and payroll_code = @payroll_code

	 -- payroll dates
	 select @payroll_from = pc.payroll_from,
			@payroll_until = pc.payroll_until
	   from payrollcode pc (nolock)
	  where pc.payroll_code = @payroll_code

	 -- employee record
	 select *
	   into #employee
	   from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

	 -- update withholding tax
	 update pd
	    set deduction_amount = 
			dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,dbo.pr_fn_get_declared_salary(e.positiontype_code),(case when @declare = 1 then @dependents else null end))
	   from payrolldeduction pd
	   join #employee e
	     on e.id_num = pd.id_num
	  where pd.payroll_code = @payroll_code
	    and deductiontype_code = 'WTX'
		and pd.id_num = @id_num
	
	  drop table #employee

	  commit transaction
END

GO
/****** Object:  StoredProcedure [dbo].[pr_generate_payroll]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_generate_payroll]
	@payroll_code char(15)
AS
BEGIN
		-- This routine generates the payroll by automatically adding records for deductions, allowances, etc.

		declare @payroll_from datetime,
				@payroll_until datetime,
				@payrollstatus_code char(3),
				@working_days int,
				@saturdays int, 
				@sundays int,
				@payroll_code_previous char(15)

	  -- get the status and dates
	  select @payroll_from = payroll_from,
			 @payroll_until = payroll_until,
			 @payrollstatus_code = payrollstatus_code
	    from dbo.pr_fn_get_payroll_details(@payroll_code)

	   -- get previous payroll code
	   -- used to get previous deduction amount to populate current payroll
	   select top 1 @payroll_code_previous = payroll_code
	     from payrollcode 
	    where payroll_from < @payroll_from -- payroll_code < @payroll_code
	 order by payroll_from desc

	   -- do no proceed if the status is other than INP = In progress
	   if @payrollstatus_code = 'INP'
	   begin
			  set xact_abort on

			  begin transaction

			  -- get days
			  select @working_days = working_days,
			         @saturdays = saturdays,
					 @sundays = sundays
			    from dbo.dtr_fn_get_working_days(@payroll_from, @payroll_until) 

			  -- employees
			  select *
				into #employee
				from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)
	 
			  -- get all dtr records covered by the payroll period
			  create table #dtr
			  (
				id_num varchar(12) collate SQL_Latin1_General_CP1_CI_AS,
				dtr_date datetime,
				time_in_am time,
				time_out_am time,
				time_in_pm time,
				time_out_pm time,
				total_hours_am decimal(4,2),
				total_hours_pm decimal(4,2),
				location_code char(3)
				--primary key (id_num, dtr_date)
			  )

			  insert #dtr
			  select *
				from dbo.dtr_fn_get_dtr(@payroll_from,@payroll_until,null,1)
					  
			select te.id_num,
				   te.employee_name,
				   te.location_code,
				   l.location_name,
				   te.salary,
				   te.frequency_code,
				   te.position_code,
				   @working_days working_days,
				   @saturdays saturdays,
				   sum(total_hours_am) + sum(total_hours_pm) total_hours
			  into #hours
			  from #dtr td
		right join #employee te
				on td.id_num = te.id_num
			  join location l (nolock)
				on l.location_code = te.location_code
		  group by te.id_num, 
				   te.employee_name, 
				   te.location_code, 
				   l.location_name,
				   te.salary,
				   te.frequency_code,
				   te.position_code        

			-- hours
			select *,
				   (case when ((total_hours / 8.00) + @saturdays + @sundays) > @working_days
					then @working_days 
					else ((total_hours / 8.00) + @saturdays + @sundays)
					end 
				   ) days_attended
			  into #days
			  from #hours

			  -- get leaves
			  -- both with and without pay
			  select leave_date,
			         id_num,
					 is_paid,
					 am_pm
			    into #leaves
			    from leavedetail ld (nolock)
				join leave l (nolock)
				  on l.leave_id = ld.leave_id
				 and l.location_code = ld.location_code
			   where ld.leave_date between @payroll_from and @payroll_until
			     and leavestatus_code = 'APP'

			  -- get undertime
			  select sum(datediff(ss,time_from,time_until) / 60.00) undertime,
			         id_num
			    into #undertime
			    from dtrundertime u (nolock)
			   where u.dtr_date between @payroll_from and @payroll_until
			     and u.timestatus_code = 'APP'
			group by id_num

			  -- get overtime

			  -- get dependents
			select count(id_num) dependents,
				   id_num
			  into #dependents
			  from empfamily ef (nolock)
			 where isnull(ef.is_dependent,0) = 1
			   and isnull(ef.is_deceased,0) = 0
		  group by ef.id_num

			  -- insert new payroll record
			  insert 
				into payroll (payroll_code, id_num, number_of_days, undertime, leaves_with_pay, leaves_without_pay, skeletal, dependents, salary, declared_salary)
			  select @payroll_code,
					 e.id_num,
					
					 /***** number of days present *****/
					 isnull((case when e.empstatus_code in ('PRO','PRE') then d.days_attended - (@saturdays + @sundays) else d.days_attended end),0.00),
					 /***** number of days present *****/

					 /***** undertime *****/
					 (select undertime 
						from #undertime 
					   where id_num = e.id_num),
					 /***** undertime *****/
					 
					 /***** leaves (fullday + half-day leaves) *****/ 
					 /***** with pay *****/
					 (nullif(((select count(id_num) 
					     from #leaves l1
						where l1.id_num = e.id_num
						  and isnull(l1.is_paid,0) = 1
						  and isnull(am_pm,'') = '') 
						  
						+

					   (select count(id_num) / 2.00 
					     from #leaves l2
						where l2.id_num = e.id_num
						  and isnull(l2.is_paid,0) = 1
						  and isnull(am_pm,'') <> ''))
					 ,0)),
					 /***** with pay *****/
					 /***** without pay *****/
					 (nullif(((select count(id_num) 
					     from #leaves l1
						where l1.id_num = e.id_num
						  and isnull(l1.is_paid,0) = 0
						  and isnull(am_pm,'') = '') 
						  
						+

					   -- AM only
					   (select count(id_num) * 3.50 / 8.00 
					     from #leaves l2
						where l2.id_num = e.id_num
						  and isnull(l2.is_paid,0) = 0
						  and isnull(am_pm,'') = 'A')

						+

						-- PM only
						(select count(id_num) * 4.50 / 8.00 
					     from #leaves l3
						where l3.id_num = e.id_num
						  and isnull(l3.is_paid,0) = 0
						  and isnull(am_pm,'') = 'P'))

					 ,0)),
					 /***** without pay *****/
				     /***** leaves *****/
				     
					 null,

					 /***** dependents *****/
					 (case isnull(e.declare_dependents,0) when 1 then nullif(dp.dependents,0) else null end),
					 /***** dependents *****/

					 (case e.frequency_code when 'MLY' then e.salary / 2.00 else e.salary end), -- actual salary
					 dbo.pr_fn_get_declared_salary(e.positiontype_code) -- declared salary
				from #employee e
		   left join payroll pr 
				  on pr.id_num = e.id_num
				 and pr.payroll_code = @payroll_code
		   left join #days d
		          on d.id_num = e.id_num
		   left join #dependents dp
		          on dp.id_num = e.id_num
			   where isnull(pr.id_num,'') = ''

			  -- update payroll
			  update p
			     set number_of_days = isnull((case when e.empstatus_code in ('PRO','PRE') then d.days_attended - (@saturdays + @sundays) else d.days_attended end),0.00), 
				     
					 undertime = (select undertime 
									from #undertime 
								   where id_num = e.id_num), 

					 leaves_with_pay =  (nullif(((select count(id_num) 
										from #leaves l1
									where l1.id_num = p.id_num
										and isnull(l1.is_paid,0) = 1
										and isnull(am_pm,'') = '') 
						  
									+

									(select count(id_num) / 2.00 
										from #leaves l2
									where l2.id_num = p.id_num
										and isnull(l2.is_paid,0) = 1
										and isnull(am_pm,'') <> ''))
									,0)),

					 leaves_without_pay =  (nullif(((select count(id_num) 
														from #leaves l1
													where l1.id_num = p.id_num
														and isnull(l1.is_paid,0) = 0
														and isnull(am_pm,'') = '') 
						  
										+

										-- AM only
									   (select count(id_num) * 3.50 / 8.00 
										 from #leaves l2
										where l2.id_num = e.id_num
										  and isnull(l2.is_paid,0) = 0
										  and isnull(am_pm,'') = 'A')

										+

										-- PM only
										(select count(id_num) * 4.50 / 8.00 
										 from #leaves l3
										where l3.id_num = e.id_num
										  and isnull(l3.is_paid,0) = 0
										  and isnull(am_pm,'') = 'P'))
									,0)),
					 skeletal = null, 
					 dependents =  (case isnull(e.declare_dependents,0) when 1 then nullif(dp.dependents,0) else null end), 
					 salary = (case e.frequency_code when 'MLY' then e.salary / 2.00 else e.salary end), 
					 declared_salary = dbo.pr_fn_get_declared_salary(e.positiontype_code) 
			    from payroll p
				join #employee e
				  on e.id_num = p.id_num
				join #days d
		          on d.id_num = e.id_num
		   left join #dependents dp
		          on dp.id_num = e.id_num
			   where p.payroll_code = @payroll_code

			  -- allowances
			  insert
				into payrollallowance (payroll_code, id_num, allowancetype_code, allowance_amount)
			  select @payroll_code,
					 e.id_num,
					 pf.allowancetype_code,
					 sum(pf.allowance_amount) / 2.00
				from #employee e
				join pafallowance pf (nolock)
				  on pf.paf_id = e.paf_id
				join t_allowancetype ta (nolock)
				  on ta.allowancetype_code = pf.allowancetype_code
				 and isnull(ta.is_voucher,0) = 0
			   where not exists (select 1
								   from payrollallowance pa
								  where pa.payroll_code = @payroll_code
									and pa.id_num = e.id_num
									and pa.allowancetype_code = pf.allowancetype_code)
			group by e.id_num,
					 pf.allowancetype_code
     
			-- get gross
		   select d.*,
				  round((case when d.frequency_code = 'MLY'
				  then (e.salary / 2.00) - ((working_days - days_attended) * (e.salary * 12 / 365.00))
				  else e.salary * days_attended * 1.00  
				  end
				  ),2) as gross,
				  (dbo.pr_fn_get_declared_salary(e.positiontype_code)) as declared_salary,
				  dp.dependents
			 into #payroll
			 from #days d
			 join #employee e
			   on e.id_num = d.id_num
		left join #dependents dp
			   on dp.id_num = d.id_num

			  -- insert the required deduction
			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount)
			  select @payroll_code,
					 pr.id_num,
					 td.deductiontype_code,
					 isnull((
						case td.deductiontype_code
						when 'SSS' then dbo.pr_fn_get_sss_contribution(pr.salary)
						when 'PAG' then dbo.pr_fn_get_pagibig_contribution(empstatus_code)
						when 'WTX' then dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,pr.declared_salary,pr.dependents)
						when 'PHL' then dbo.pr_fn_get_phic_contribution(e.positiontype_code)
						end
					 ),0) deduction_amount
				from #payroll pr, 
					 t_deductiontype td (nolock),
					  #employee e 
			   where td.deductiontype_code in ('SSS','PAG','WTX','PHL')
				 and e.id_num = pr.id_num 
				 and not exists (select 1 
								   from payrolldeduction pd 
								  where pd.id_num = pr.id_num
								    and pd.payroll_code = @payroll_code
									and pd.deductiontype_code = td.deductiontype_code)

			  -- update deductions as variables could have been possibly changed.. i.e. gross, dependents, etc.
			  update pd
			     set deduction_amount = isnull((
						case pd.deductiontype_code
						when 'SSS' then dbo.pr_fn_get_sss_contribution(pr.salary)
						when 'PAG' then dbo.pr_fn_get_pagibig_contribution(empstatus_code)
						when 'WTX' then dbo.pr_fn_get_withholding_tax(e.empstatus_code,e.positiontype_code,pr.declared_salary,pr.dependents)
						when 'PHL' then dbo.pr_fn_get_phic_contribution(e.positiontype_code)
						end
					 ),0)
			    from payrolldeduction pd
				join #employee e
				  on e.id_num = pd.id_num 
				join #payroll pr
				  on pr.id_num = pd.id_num
			   where pd.payroll_code = @payroll_code
			     and pd.deductiontype_code in ('SSS','PAG','WTX','PHL') 

			  -- non-required deductions
			  -- check previous payroll and insert first
			  -- this would populate the amount entered previously
			  select *
			    into #deduction
			    from payrolldeduction pd (nolock)
			   where pd.payroll_code = @payroll_code_previous
			     and pd.deductiontype_code not in ('SSS','PAG','WTX','PHL')

			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount, bcf_amount, bcf_sub_location_code)
			  select @payroll_code,
			         d.id_num,
					 d.deductiontype_code,
					 d.deduction_amount,
					 d.bcf_amount,
					 d.bcf_sub_location_code
			    from #deduction d
				join #employee e
				  on e.id_num = d.id_num
			   where not exists (select 1 
								   from payrolldeduction pd (nolock) 
								  where pd.id_num = d.id_num
								    and pd.payroll_code = @payroll_code
								    and pd.deductiontype_code = d.deductiontype_code)

			  -- insert deductions that have been added recently
			  insert 
				into payrolldeduction (payroll_code, id_num, deductiontype_code, deduction_amount)
			  select @payroll_code,
					 pr.id_num,
					 td.deductiontype_code,
					 0.00
				from #payroll pr, 
					 t_deductiontype td (nolock),
					 #employee e
			   where e.id_num = pr.id_num
				 and not exists (select 1 
								   from payrolldeduction pd 
								  where pd.id_num = pr.id_num
								    and pd.payroll_code = @payroll_code
									and pd.deductiontype_code = td.deductiontype_code)

			  -- adjustments
			  -- check previous adjustments and insert
			  -- NOTE: make this an option in the UI.. for now this will do
			  select *
			    into #adjustments
			    from payrolladjustment pa (nolock)
			   where pa.payroll_code = @payroll_code_previous

			  insert 
				into payrolladjustment (payroll_code, id_num, adjustmenttype_code, adjustment_amount)
			  select @payroll_code,
			         a.id_num,
					 a.adjustmenttype_code,
					 a.adjustment_amount
			    from #adjustments a
				join #employee e
				  on e.id_num = a.id_num
			   where not exists (select 1 
								   from payrolladjustment pa (nolock) 
								  where pa.id_num = a.id_num
								    and pa.payroll_code = @payroll_code
								    and pa.adjustmenttype_code = a.adjustmenttype_code)
			
			  -- select * from #undertime FOR CHECKING PURPOSES

			  drop table #employee
			  drop table #dtr
			  drop table #hours
			  drop table #leaves
			  drop table #days
			  drop table #payroll
			  drop table #dependents
			  drop table #deduction
			  drop table #adjustments

			  commit transaction

		end

END

GO
/****** Object:  StoredProcedure [dbo].[pr_generate_payroll_code]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_generate_payroll_code]
AS
BEGIN
	declare @previous_from datetime,
	        @previous_until datetime,
	        @previous_payroll_code varchar(15),
	        @next_from datetime,
	        @next_until datetime,
	        @new_payroll_code varchar(15),
	        @current_day int,
	        @current_month int,
	        @current_year int,
	        @code_count int,
			@current_date datetime
	
	declare @FIFTH int = 5,
	        @TWENTIETH int = 20
	        
	--check date
	--if current date is greater than payroll period
	--create new payroll code
	select @code_count = count(payroll_code)
	  from payrollcode

	-- get current date
	set @current_date = getdate()

	select @current_day = DATEPART(dd,@current_date),
	       @current_month = DATEPART(mm,@current_date),
	       @current_year = DATEPART(yy,@current_date)
	
	-- get previous dates
	if @code_count > 0
	begin
		select top 1 @previous_from = payroll_from
			   ,@previous_until = payroll_until
			   ,@previous_payroll_code = payroll_code
		  from payrollcode
	  order by payroll_from desc
	end

	if (@current_date > dateadd(dd,1,@previous_until))
		or (@code_count = 0)
	begin
	    -- current day falls between 6 - 20 of the current month 
		if @current_day between (@FIFTH + 1) and @TWENTIETH
		begin
			if @current_month < 10 
			begin
				-- month is between January and September
				set @next_from = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month as varchar) + '-' + CAST((@FIFTH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month  as varchar) + '-' + CAST(@TWENTIETH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
			else
			begin
				-- month is between October and December
				set @next_from = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month as varchar) + '-' + CAST((@FIFTH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month  as varchar) + '-' + CAST(@TWENTIETH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
		end
		else -- current day falls is greater than 21 
		begin
			if @code_count = 0
			begin
				set @current_month = @current_month - 1
			end

			if @current_month < 10 
			begin
				-- month is between January and September
				set @next_from = CAST((CAST(@current_year as varchar) + '-0' + CAST(@current_month as varchar) + '-' + CAST((@TWENTIETH + 1) as varchar)) as datetime) 
				set @next_until = CAST((CAST(@current_year as varchar) + '-0' + CAST((@current_month + 1)  as varchar) + '-' + CAST(@FIFTH as varchar)) as datetime) 
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
			else
			begin
				-- month is between October and December
				set @next_from = CAST((CAST(@current_year as varchar) + '-' + CAST(@current_month as varchar) + '-' + CAST((@TWENTIETH + 1) as varchar)) as datetime) 
				
				if @current_month < 12 
					set @next_until = CAST((CAST(@current_year as varchar) + '-' + CAST((@current_month + 1)  as varchar) + '-' + CAST(@FIFTH as varchar)) as datetime) 
				else
					set @next_until = CAST((CAST((@current_year + 1) as varchar) + '-01-' + CAST(@FIFTH as varchar)) as datetime) -- set to January of the following year 
					
				set @new_payroll_code = CONVERT(varchar(10),@next_until,112)
			end
		end
		
		-- finalise (close) previous payroll code
		--update payrollcode 
		--   set payrollstatus_code = 'FIN'
		-- where payroll_code = @previous_payroll_code
		
		-- insert new code
		insert 
		  into payrollcode 
		values (
			   ltrim(@new_payroll_code)
			   ,@next_from
			   ,@next_until
			   ,'INP'
			   )
	end

END


GO
/****** Object:  StoredProcedure [dbo].[pr_get_active_allowances]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_active_allowances]
	@payroll_code char(15),
	@id_num varchar(15)
AS
BEGIN
	-- this routine gets the active allowances of the employee for payroll purposes
	-- not all allowances are included in the payroll but for this routine
	-- all allowances are assumed to be included
	-- otherwise, allowances can be removed from the list from the UI

    declare @dtr_date_from datetime,
	        @dtr_date_until datetime,
			@paf_id integer

	-- get the paf ID based on the payroll code parameter
	-- this is used to get the allowances
	
	select @dtr_date_from = payroll_from,
	       @dtr_date_until = payroll_until
	  from payrollcode pc (nolock)
	 where pc.payroll_code = @payroll_code 

	 select @paf_id = paf_id
	  from paf p (nolock)
     where isnull(p.effective_until,@dtr_date_until) between @dtr_date_from and @dtr_date_until
	   and p.effective_date <= @dtr_date_from
	   and isnull(p.is_cancelled,0) = 0
	   and p.id_num = @id_num

	-- return allowances
	select *
	  from pafallowance pa (nolock)
	 where pa.paf_id = @paf_id
END

GO
/****** Object:  StoredProcedure [dbo].[pr_get_deduction_types]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_deduction_types]
AS
BEGIN
	select *
	  from t_deductiontype dt (nolock)
  order by dt.deductiontype_name
END

GO
/****** Object:  StoredProcedure [dbo].[pr_get_dependents]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_get_dependents]
AS
BEGIN
		-- get number of dependents
		select count(id_num) dependents,
			   id_num
		  into #dependents
		  from empfamily ef (nolock)
		 where isnull(ef.is_dependent,0) = 1
		   and isnull(ef.is_deceased,0) = 0
	  group by ef.id_num

		-- return
		select e.id_num,
		       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
			   d.dependents,
			   e.declare_dependents
		  from employee e
		  join #dependents d
		    on d.id_num = e.id_num
	  order by employee_name	 

		drop table #dependents
END

GO
/****** Object:  StoredProcedure [dbo].[pr_get_payroll]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_get_payroll]
	@payroll_code char(15),
	@id_num varchar(12) = null
AS
BEGIN
			declare @dtr_date_from datetime,
					@dtr_date_until datetime,
					@working_days int,
					@saturdays int, 
					@sundays int,
					@payroll_status char(3)
			 
			-- get date range
			select @dtr_date_from = payroll_from,
				   @dtr_date_until = payroll_until,
				   @payroll_status = payrollstatus_code
			  from payrollcode pc (nolock)
			 where pc.payroll_code = @payroll_code 

			-- get number of days required and number of saturdays
			select @working_days = working_days,
				   @saturdays = saturdays, 
				   @sundays = sundays
			  from dbo.dtr_fn_get_working_days(@dtr_date_from, @dtr_date_until)

			-- get the employees affected by the date range
			-- use the paf table
			select *
			  into #employee
			  from dbo.paf_fn_active_employees(dateadd(mm,-2,@dtr_date_from),@dtr_date_until) e
			 where (isnull(@id_num,'') = '' or e.id_num = @id_num)
	        
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

			select pr.payroll_code,
			       pr.id_num,
				   pr.number_of_days,
				   isnull(pr.leaves_with_pay,0.00) leaves_with_pay,
				   isnull(pr.leaves_without_pay,0.00) leaves_without_pay,
				   isnull(pr.undertime,0.00) undertime,
				   isnull(round((case when e.frequency_code = 'MLY'
				   then 
					  -- (salary / 2.00) - ((@days_covered - case pr.number_of_days when 0 then @days_covered else pr.number_of_days end) * (salary * 12 / 365.00))
					  -- (pr.salary) - ((isnull(pr.leaves,0) * (pr.salary * 12 / 365.00)) + (isnull(pr.undertime,0) * (pr.salary * 12 / 365.00)) )
					  pr.salary
				   else
				      pr.salary * pr.number_of_days * 1.00  
				   end
				   ),2),00) as gross,
				   sf.frequency_name,
				   (convert(varchar(10),@dtr_date_from,101) + ' - ' + convert(varchar(10),@dtr_date_until,101)) period,
				   isnull(d.deduction,0.00) deduction,
				   isnull(a.allowance,0.00) allowance,
				   (isnull(adp.adjustment_plus,0.00) - isnull(adm.adjustment_minus,0.00)) adjustment,
				   pr.salary,
				   pr.dependents
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
			 where pr.payroll_code = @payroll_code
		  
			-- return
			select p.*,
			       e.employee_name,
				   e.location_code,
				   e.department_code,
				   e.declare_dependents,
				   (
						(p.leaves_without_pay + (p.undertime / 60.00 / 8.00)) * dbo.pr_fn_get_daily_rate(e.salary)
				   ) as undertime_lwop,
				   ((p.undertime / 60.00 / 8.00) * dbo.pr_fn_get_daily_rate(e.salary)) ut,
				   ((p.leaves_without_pay) * dbo.pr_fn_get_daily_rate(e.salary)) lwop,
				   (
						(case e.frequency_code when 'MLY' then p.salary else p.salary * p.number_of_days end) + allowance + adjustment -
						((p.leaves_without_pay + (p.undertime / 60.00 / 8.00)) * dbo.pr_fn_get_daily_rate(e.salary)) - deduction

						
				   ) as net,
				   ps.payrollstatus_code,
				   ps.payrollstatus_name,
				   @working_days working_days
			  from #payroll p
			  join #employee e 
			    on e.id_num = p.id_num
			  join payrollcode pc (nolock)
			    on pc.payroll_code = p.payroll_code
			  join t_payrollstatus ps (nolock)
				on ps.payrollstatus_code = pc.payrollstatus_code
		  order by e.employee_name

			drop table #employee
			drop table #payroll
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus

END

GO
/****** Object:  StoredProcedure [dbo].[pr_get_payroll_adjustments]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_payroll_adjustments]
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select pa.*,
	       a.is_deduction
	  from payrolladjustment pa (nolock)
	  join t_adjustmenttype a (nolock)
	    on a.adjustmenttype_code = pa.adjustmenttype_code
	 where pa.payroll_code = @payroll_code
	   and pa.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[pr_get_payroll_allowances]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_payroll_allowances]
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select *
	  from payrollallowance pa (nolock)
	 where pa.payroll_code = @payroll_code
	   and pa.id_num = @id_num
END

GO
/****** Object:  StoredProcedure [dbo].[pr_get_payroll_deductions]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_payroll_deductions]
	@payroll_code char(15),
	@id_num varchar(12)
AS
BEGIN
	select pd.*,
	       dt.has_bcf,
		   dt.is_required
	  from payrolldeduction pd (nolock)
	  join t_deductiontype dt (nolock)
	    on dt.deductiontype_code = pd.deductiontype_code
	 where pd.payroll_code = @payroll_code
	   and pd.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[pr_get_pending_paf]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_get_pending_paf]
	@payroll_code char(15)
AS
BEGIN
	declare @payroll_from datetime,
	        @payroll_until datetime

	select @payroll_from = payroll_from,
	       @payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@payroll_code)

	-- get pending PAF records
	select 1 
	  from paf p (nolock)
	 where p.effective_date between @payroll_from and @payroll_until
	   and isnull(p.is_cancelled,0) = 0
	   and p.pafstatus_code = 'PND'

END

GO
/****** Object:  StoredProcedure [dbo].[rpt_paf]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[rpt_paf]	
	@paf_id	integer
AS
BEGIN
	declare @date_hired datetime 
	declare @date_regularized datetime

	-- get date hired
	select @date_hired = effective_date
	  from paf p (nolock)
     where p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
  order by effective_date desc

	-- get date regularized
	select @date_regularized = effective_date
	  from paf p (nolock)
     where p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
	   and p.empstatus_code = 'REG'
  order by effective_date desc

	-- get previous PAF details
	select p.id_num,
	       p.salary salary_previous,
		   ps.position_name position_previous,
		   l.location_name location_previous,
		   lv.level_name job_level_previous,
	       dbo.rpt_fn_get_concat_paf_allowances(paf_id,'TYPE') allowances_previous
	  into #paf_previous
	  from paf p (nolock)
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
	  join location l (nolock)
	    on l.location_code = p.location_code
 left join t_level lv (nolock)
        on lv.level_code = ps.level_code
     where paf_id < @paf_id
	   and p.id_num = (select id_num 
	                     from paf (nolock) 
                        where paf_id = @paf_id)
	   and isnull(is_cancelled,0) = 0
  order by effective_date asc

	-- return
	select e.id_num,
	       ps.position_name position,
		   l.location_name location,
		   lv.level_name job_level,
		   upper(e.employee_firstname + ' ' + isnull(substring(e.employee_middlename,1,1) + '. ','') + e.employee_lastname) employee_name,
		   convert(varchar(25),@date_hired,107) date_hired,
		   convert(varchar(25),@date_regularized,107) date_regularized,
		   es.empstatus_name employment_status,
		   convert(varchar(25),p.effective_date,107) effective_date,
		  
		   -- /*** salary ***/
		   (
				case when p.salary = pp.salary_previous then ' - '
				else convert(varchar,convert(money,p.salary),1)  + ' ' + upper(sf.frequency_name) end
		   ) salary,
		   -- /*** salary ***/
		   
		   dbo.rpt_fn_get_concat_paf_allowances(paf_id,'TYPE') allowances,
		   (convert(varchar,convert(money,pp.salary_previous),1) + ' ' + upper(sf.frequency_name)) salary_previous,
		   
		   --  /*** position ***/
		   (
				case when ps.position_name = pp.position_previous then ' - '
				else ps.position_name end
		   ) position2,
		   --  /*** position ***/

		   --  /*** location ***/
		   (
				case when l.location_name = pp.location_previous then ' - '
				else l.location_name end
		   ) location2,
		   --  /*** location ***/

		   --  /*** job level ***/
		   (
				case when lv.level_name = pp.job_level_previous then ' - '
				else lv.level_name end
		   ) job_level2,
		   --  /*** job level ***/

		   pp.position_previous,
		   pp.job_level_previous,
		   pp.location_previous,
	       pp.allowances_previous
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
	  join t_salaryfrequency sf
	    on sf.frequency_code = p.frequency_code
 left join t_level lv (nolock)
        on lv.level_code = ps.level_code
	  join location l (nolock)
	    on l.location_code = p.location_code
 left join #paf_previous pp
        on pp.id_num = p.id_num
	  join t_empstatus es
	    on es.empstatus_code = p.empstatus_code
	 where p.paf_id = @paf_id

	 drop table #paf_previous
END

GO
/****** Object:  StoredProcedure [dbo].[rpt_paf_signatories]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[rpt_paf_signatories]
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
	  where position_code in ('BM','AM','HRM','COO','NAM')

	-- return
	select (select upper(s.employee_name_full) from #signatories s where position_code = 'HRM') as human_resource,
		   (
				case @level_code when '7' then ''
				else
					(select upper(s.employee_name_full) from #signatories s where position_code = 'BM' and location_code = @location_code)
				end
		   
		   ) as branch_manager,

		   (select upper(s.employee_name_full) from #signatories s where position_code = 'COO') as chief_operating_officer,

		   (	
				case when @level_code in ('8','9','10') then ''
				else
					(select upper(s.employee_name) 
					  from #signatories s 
					 where position_code in ('AM','NAM')
					   and location_code in (select location_code from location l (nolock) where area_code = @area_code))
				end
			
			) as area_manager

    drop table #signatories  
END


GO
/****** Object:  StoredProcedure [dbo].[rpt_payslip]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rpt_payslip]
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

			select upper(e.employee_name) employee_name,
				   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) as payroll_period,
				   @working_days as working_days,
				   pr.number_of_days as days_attended,
				   null as holidays,
				   pr.leaves_with_pay as leave_with_pay,
				   pr.leaves_without_pay as leave_without_pay,
				   null as awol,
				   null as business_trip,
				   pr.salary as semi_monthly_rate,
				   isnull(allowance,0.00) as allowance,
				   (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) as adjustment,
				   pr.undertime as undertime,
				   ((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary))) * -1.00 as undertime_lwop,
				   (d.deduction * -1.00) as deduction,
				   /****** gross pay ******/
				   (
						(case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) -
						((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary)))

				   ) as gross_pay,
				   /****** gross pay ******/
				   /****** net pay ******/
				   (
						(case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00)) -
						((isnull(pr.leaves_without_pay,0.00) + (isnull(pr.undertime / 60.00 / 8.00,0.00))) * (dbo.pr_fn_get_daily_rate(e.salary))) - isnull(deduction,0.00)

						--isnull(((case e.frequency_code when 'MLY' then pr.salary else pr.salary * pr.number_of_days end) - isnull(deduction,0.00) + isnull(allowance,0.00) + (isnull(ap.adjustment_plus,0.00) - isnull(am.adjustment_minus,0.00))),0.00) 
				   ) as net,
				   /****** net pay ******/
				   /****** deduction types ******/
				   dbo.rpt_fn_get_payroll_deductions(e.id_num,@payroll_code,'TYPE') as deduction_types,
				   /****** deduction types ******/
				   /****** deduction amount ******/
				   dbo.rpt_fn_get_payroll_deductions(e.id_num,@payroll_code,'AMOUNT') as deduction_amount,
				   /****** deduction amount ******/
				   e.location_code,
				   e.department_code
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
			 where pr.payroll_code = @payroll_code
		  order by employee_name

			drop table #employee
			drop table #deductions
			drop table #allowances
			drop table #adjustments_plus
			drop table #adjustments_minus

END

GO
/****** Object:  StoredProcedure [dbo].[rpt_pr_deduction_summary]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[rpt_pr_deduction_summary]
	@payroll_code char(15)
AS
BEGIN
		declare @deduction_code char(3),
				@deduction_name varchar(25),
				@payroll_from date,
				@payroll_until date

		create table #deduction 
		(
			id_num varchar(12)
		)

		-- get payroll period
		select @payroll_from = payroll_from,
			   @payroll_until = payroll_until
		  from dbo.pr_fn_get_payroll_details(@payroll_code)

		-- employee details
		select *
		  into #employee
		  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

		insert into #deduction
		select id_num
		  from payroll (nolock)
		 where payroll_code = @payroll_code


		-- get all deductions
		select pd.id_num,
		       pd.deductiontype_code,
			   pd.deduction_amount
		  into #employee_deduction
		  from payrolldeduction pd (nolock)
		 where pd.payroll_code = @payroll_code 

		-- get deduction types and add each type as a column to the return table
		declare deductiontype cursor
			for select coalesce(dt.display_name,dt.deductiontype_name),
			           dt.deductiontype_code
		          from t_deductiontype dt (nolock)
			  order by sort_order, display_name, deductiontype_name

		open deductiontype
		fetch next from deductiontype
		into @deduction_name, @deduction_code;

		while @@fetch_status = 0
		begin
		    set @deduction_name = replace(@deduction_name,' ','_')

		    -- add the column
			-- NOTE: added "COL@" preceding the column name for parsing purposes in the UI side
			execute('alter table #deduction	add COL@' + @deduction_name + ' varchar(25) ')

			-- update the column
			execute('update d' +
					'   set COL@' + @deduction_name + ' = isnull(ed.deduction_amount,0.00)
					   from #deduction d
				  left join #employee_deduction ed 
						 on ed.id_num = d.id_num  collate Latin1_General_CI_AS
					  where ed.deductiontype_code = ''' + @deduction_code + '''')

			fetch next from deductiontype
			into @deduction_name, @deduction_code;
		end

		close deductiontype
		deallocate deductiontype

		-- total
		select id_num,
			   sum(deduction_amount) total_deduction
		  into #total
		  from #employee_deduction
	  group by id_num

		-- return
		select e.employee_name,
		       e.location_code,
			   e.department_code,
			   upper(l.location_name) location_name,
			   d.*,
			   (t.total_deduction * 1.00) total_deduction,
			   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period
		  from #deduction d
		  join #employee e
		    on e.id_num = d.id_num collate SQL_Latin1_General_CP1_CI_AS
		  join #total t
			on t.id_num = d.id_num collate SQL_Latin1_General_CP1_CI_AS
		  join location l (nolock)
		    on l.location_code = e.location_code 
	  order by l.location_name, e.employee_name
		
		drop table #deduction
		drop table #employee_deduction
		drop table #total
		drop table #employee

END

GO
/****** Object:  StoredProcedure [dbo].[rpt_pr_variance]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[rpt_pr_variance]
	@payroll_code char(15),
	@variance_amount decimal(8,2) = 0
AS
BEGIN
	declare @previous_payroll_code char(15),
	        @payroll_from date,
			@payroll_until date,
			@previous_payroll_from date,
			@previous_payroll_until date

	-- get payroll period details
	select @payroll_from = payroll_from,
		   @payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@payroll_code)

	-- employee details
	select *
	  into #employee
	  from dbo.paf_fn_active_employees(@payroll_from, @payroll_until)

	select top 1 @previous_payroll_code = payroll_code
	  from payrollcode pc (nolock)
     where pc.payroll_code <> @payroll_code
	   and pc.payroll_from < @payroll_from
  order by pc.payroll_from desc

	-- get previous payroll period details
	select @previous_payroll_from = payroll_from,
		   @previous_payroll_until = payroll_until
	  from dbo.pr_fn_get_payroll_details(@previous_payroll_code)

	-- get deductions of payroll code param
	select pd.id_num,
	       pd.deductiontype_code,
		   pd.deduction_amount
	  into #deduction
	  from payrolldeduction pd (nolock)
	 where pd.payroll_code = @payroll_code

	-- get deductions of previous payroll
	select pd.id_num,
	       pd.deductiontype_code,
		   pd.deduction_amount
	  into #deduction_previous
	  from payrolldeduction pd (nolock)
	 where pd.payroll_code = @previous_payroll_code

	-- add deduction types that exists only in the previous payroll
	insert into #deduction
	select dp.id_num,
	       dp.deductiontype_code,
		   0.00
	  from #deduction_previous dp
	 where not exists (select 1
	                     from #deduction d
						where d.id_num = dp.id_num
						  and d.deductiontype_code = dp.deductiontype_code)

	-- get allowances of payroll code param
	select pa.id_num,
           pa.allowancetype_code,
		   pa.allowance_amount
	  into #allowance
	  from payrollallowance pa (nolock)
	 where pa.payroll_code = @payroll_code

	-- get allowances from previous payroll
	select pa.id_num,
           pa.allowancetype_code,
		   pa.allowance_amount
	  into #allowance_previous
	  from payrollallowance pa (nolock)
	 where pa.payroll_code = @previous_payroll_code

	-- add allowance types that exists only in the previous payroll
	insert into #allowance
	select ap.id_num,
	       ap.allowancetype_code,
		   0.00
	  from #allowance_previous ap
	 where not exists (select 1
	                     from #allowance a
						where a.id_num = ap.id_num
						  and a.allowancetype_code = ap.allowancetype_code)
	
	select * from
		(
					-- deduction
					select e.employee_name,
						   e.location_code,
						   e.department_code,
						   l.location_name,
						   d.id_num,
						   d.deductiontype_code,
						   coalesce(td.display_name,td.deductiontype_name) as deductiontype_name,
						   d.deduction_amount,
						   dp.deduction_amount as previous_deduction_amount,
						   (isnull(d.deduction_amount,0.00) - isnull(dp.deduction_amount,0.00)) as variance_amount,
						   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
						   (convert(varchar(10),@previous_payroll_from,101) + ' - ' + convert(varchar(10),@previous_payroll_until,101)) previous_payroll_period,
						   1 as display_order
					  from #deduction d 
				 left join #deduction_previous dp
						on dp.deductiontype_code = d.deductiontype_code
					   and dp.id_num = d.id_num
					  join #employee e 
						on e.id_num = d.id_num
					  join location l (nolock)
						on l.location_code = e.location_code
					  join t_deductiontype td (nolock)
						on td.deductiontype_code = d.deductiontype_code
					 where ((isnull(d.deduction_amount,0.00) - isnull(dp.deduction_amount,0.00)) > isnull(@variance_amount,0.00) 
						or (isnull(dp.deduction_amount,0.00) - isnull(d.deduction_amount,0.00)) > isnull(@variance_amount,0.00))
						-- or (isnull(dp.deduction_amount,0.00) - isnull(d.deduction_amount,0.00)) = 0.00

					union

					-- allowances
					select e.employee_name,
						   e.location_code,
						   e.department_code,
						   l.location_name,
						   a.id_num,
						   a.allowancetype_code,
						   ad.allowancetype_name as deductiontype_name,
						   a.allowance_amount,
						   ap.allowance_amount as previous_deduction_amount,
						   (isnull(a.allowance_amount,0.00) - isnull(ap.allowance_amount,0.00)) as variance_amount,
						   (convert(varchar(10),@payroll_from,101) + ' - ' + convert(varchar(10),@payroll_until,101)) payroll_period,
						   (convert(varchar(10),@previous_payroll_from,101) + ' - ' + convert(varchar(10),@previous_payroll_until,101)) previous_payroll_period,
						   2 as display_sort
					  from #allowance a 
				 left join #allowance_previous ap
						on ap.allowancetype_code = a.allowancetype_code
					   and ap.id_num = a.id_num
					  join #employee e 
						on e.id_num = a.id_num
					  join location l (nolock)
						on l.location_code = e.location_code
					  join t_allowancetype ad (nolock)
						on ad.allowancetype_code = a.allowancetype_code
					 where ((isnull(a.allowance_amount,0.00) - isnull(ap.allowance_amount,0.00)) > isnull(@variance_amount,0.00) 
						or (isnull(ap.allowance_amount,0.00) - isnull(a.allowance_amount,0.00)) > isnull(@variance_amount,0.00))
						-- or (isnull(dp.deduction_amount,0.00) - isnull(d.deduction_amount,0.00)) = 0.00
		) r
	order by r.employee_name, r.display_order, r.deductiontype_name

	drop table #deduction
	drop table #deduction_previous
	drop table #allowance
	drop table #allowance_previous
END

GO
/****** Object:  StoredProcedure [dbo].[sec_delete_levels]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_delete_levels]
	@role_code varchar(25)
AS
BEGIN
	delete 
	  from sysrolelevel
	 where role_code = @role_code
END


GO
/****** Object:  StoredProcedure [dbo].[sec_delete_privileges]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_delete_privileges]
	@role_code varchar(25)
AS
BEGIN
	delete 
	  from sysroleprivilege 
	 where role_code = @role_code
END


GO
/****** Object:  StoredProcedure [dbo].[sec_delete_roles]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_delete_roles]
	@id_num varchar(12)
AS
BEGIN
	delete 
	  from sysuserrole
	 where id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[sec_generate_username]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sec_generate_username]
	@id_num varchar(12)
AS
BEGIN
	declare @firstname varchar(50)
	declare @lastname varchar(50)
	
	select @firstname = employee_firstname,
		   @lastname = employee_lastname
	  from employee (nolock)
	 where id_num = @id_num
	 
	declare @username varchar(25)
	
	-- get initials of name and concatenate id number
	set @username = LEFT(@firstname,1) + LEFT(@lastname,1) + @id_num
	
	select @username
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_levels_by_role]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_levels_by_role]
	@role_code varchar(25)
AS
BEGIN
	select * 
	  from sysrolelevel rl (nolock)
	 where rl.role_code = @role_code
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_pin]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_pin]
	@id_num int
AS
BEGIN
	select pin
	  from employee e (nolock)
	 where e.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_privileges]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_privileges]
AS
BEGIN
	select *
	  from sysprivilege p (nolock)
  order by p.privilege_name
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_privileges_by_role]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sec_get_privileges_by_role]
	@role_code varchar(25)
AS
BEGIN
	select *
	  from sysroleprivilege srp (nolock)
	 where srp.role_code = @role_code
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_roles]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_roles]
AS
BEGIN
	select *
	  from sysrole r (nolock)
  order by r.role_name 
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_user]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_user]
	@id_num varchar(12)
AS
BEGIN
	select * 
	  from sysuser u (nolock)
	 where u.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_user_rights]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_user_rights]
	@id_num varchar(12)
AS
BEGIN
	select distinct privilege_code
	  from sysroleprivilege rp (nolock)
	  join sysuserrole ur (nolock) 
	    on ur.role_code = rp.role_code and ur.id_num = @id_num
	  
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_user_roles]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_user_roles]
	@id_num varchar(12)
AS
BEGIN
     -- assigned roles
	 select *
	   from sysuserrole ur (nolock)
	  where ur.id_num = @id_num
END


GO
/****** Object:  StoredProcedure [dbo].[sec_get_users]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sec_get_users]
AS
BEGIN
	select e.id_num,
	       e.employee_lastname,
		   e.employee_firstname,
		   e.employee_middlename,
		   (employee_lastname + ', ' + employee_firstname) employee_name,
		   u.*
	  from employee e (nolock)
 left join sysuser u (nolock)
        on u.id_num = e.id_num
  order by employee_name
END

GO
/****** Object:  StoredProcedure [dbo].[sync_delete_wsmessage]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_delete_wsmessage]
	@eventObject char(3),
	@pkEventObject int,
	@locationCode char(3)
AS
BEGIN
	delete wsmessage
	 where event_object = @eventObject
	   and pk_event_object = @pkEventObject
	   and source_location = @locationCode
END


GO
/****** Object:  StoredProcedure [dbo].[sync_employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sync_employee]
	@id_num varchar(12),
	@sync_employee_record int,
	@sync_user_account int,
	@destination_location char(3)
AS
BEGIN
	-- synch the employee record and/or user account to the selected destination
	-- when the selected destination is null.. synch the employee record to all locations
	-- and use the latest paf location for the user account
	
	-- employee record
    if isnull(@sync_employee_record,0) = 1 
    begin
		insert 
		  into wsmessageout
		select 'EMP',
			   @id_num,
			   GETDATE(),
			   0,
			   location_code,
			   'SYN',
			   'QUE',
			   GETDATE()
		  from location l (nolock)
	 left join wsmessageout wmo (nolock)
			on wmo.destination_location = l.location_code
		   and wmo.event_object = 'EMP'
		   and wmo.pk_event_object = @id_num
		 where isnull(wmo.pk_event_object,'') = '' 
		   and ((nullif(@destination_location,'') is null) or (l.location_code = @destination_location))
    end
     
    -- user account
    if ISNULL(@sync_user_account,0) = 1 
    begin
		if nullif(@destination_location,'') is null 
			set @destination_location = (select top 1 location_code
										   from paf p (nolock)
										  where p.id_num = @id_num
										    and isnull(p.is_cancelled,0) = 0
									   order by p.effective_date desc)
		                    
		if ISNULL(@destination_location,'') <> ''
		begin
			-- insert the privs
			insert 
			  into wsmessageout
		    select 'PRV',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE',
				   GETDATE()
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'PRV'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
			
			-- insert the roles
			insert 
			  into wsmessageout
		    select 'ROL',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE',
				   GETDATE()
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'ROL'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
		   
		    -- insert the role privileges   
		    insert 
			  into wsmessageout
		    select 'RPV',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE',
				   GETDATE()
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'RPV'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
			
			-- insert the user account
			insert 
			  into wsmessageout
		    select 'USR',
				   @id_num,
				   GETDATE(),
				   0,
				   @destination_location,
				   'SYN',
				   'QUE',
				   GETDATE()
			  from sysuser u (nolock)
	     left join wsmessageout wmo (nolock)
			    on wmo.destination_location = @destination_location
		       and wmo.event_object = 'USR'
		       and wmo.pk_event_object = @id_num
		     where u.id_num = @id_num
		       and isnull(wmo.pk_event_object,'') = ''
	    end
    end 
END


GO
/****** Object:  StoredProcedure [dbo].[sync_generate_xml]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sync_generate_xml]
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object varchar(30),
			@ws_message varchar(max),
			@ws_message_date datetime,
			@messagetype_code char(3),
			@messagestatus_code char(3),
			@destination_location char(3)
			
	select top 1
	       @event_object = wmo.event_object,
	       @pk_event_object = wmo.pk_event_object,
	       @ws_message_date = wmo.ws_message_date,
	       @messagetype_code = wmo.messagetype_code,
	       @destination_location = wmo.destination_location
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'QUE'
  order by ws_message_date asc
  
	-- update the ws_message_date column
	-- this forces the record to go back the que
	update wsmessageout
	   set ws_message_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and destination_location = @destination_location
  
	-- get xml message
	-- dtr
	if @event_object = 'DTR'
	begin
		set @ws_message = (select * 
							 from dtr d (nolock)
				    		where d.dtr_id = cast(@pk_event_object as int)
							  for xml raw ('dtr'), 
								  elements)
	end		
	-- end dtr
	-- employee		   
	else if @event_object = 'EMP'
	begin
		set @ws_message = (select * 
							 from employee e (nolock)
				    		where e.id_num = @pk_event_object
							  for xml raw ('employee'), 
								  elements)
	end
	-- end employee
	-- sysuser
	else if @event_object = 'USR'
	begin
		set @ws_message = (select * 
							 from sysuser u (nolock)
				    		where u.id_num = @pk_event_object
							  for xml raw ('sysuser'), 
								  elements)
	end
	-- end sysuser
	-- sysprivilege
	else if @event_object = 'PRV'
	begin
		set @ws_message = (select distinct p.*
						     from sysprivilege p (nolock)
						     join sysroleprivilege rp (nolock)
							   on rp.privilege_code = p.privilege_code
						     join sysuserrole ur (nolock) 
							   on ur.role_code = rp.role_code and ur.id_num = @pk_event_object
						      for xml raw ('sysprivilege'), 
						          root ('sysprivileges'),
						          elements)
	end
	-- end sysprivilege
	-- sysrole
	else if @event_object = 'ROL'
	begin
		set @ws_message = (select ur.*, 
		                          r.role_name
						     from sysuserrole ur (nolock)
						     join sysrole r (nolock)
						       on r.role_code = ur.role_code
							where ur.id_num = @pk_event_object
						      for xml raw ('sysuserrole'), 
						          root ('sysuserroles'),
						          elements)
	end
	-- end sysrole
	-- sysroleprivilege
	else if @event_object = 'RPV'
	begin
		set @ws_message = (select rp.*
						     from sysroleprivilege rp (nolock)
						     join sysuserrole ur (nolock)
						       on ur.role_code = rp.role_code
							where ur.id_num = @pk_event_object
						      for xml raw ('sysroleprivilege'), 
						          root ('sysroleprivileges'),
						          elements)
	end
	-- end sysroleprivilege
	-- leave
	else if @event_object = 'LVE'
	begin
		set @ws_message = (select * 
							 from leave l (nolock)
				    		where l.leave_id = cast(@pk_event_object as int)
							  for xml raw ('leave'), 
								  elements)
	end
	-- end leave
	-- leave detail
	else if @event_object = 'LVD'
	begin
		set @ws_message = (select * 
							 from leavedetail ld (nolock)
				    		where ld.leave_date = cast(left(@pk_event_object,8) as datetime)
							  and ld.leave_id = cast(substring(@pk_event_object,9,len(@pk_event_object)) as int)
							  for xml raw ('leavedetail'), 
								  elements)
	end
	-- end leave detail
	-- undertime
	else if @event_object = 'UDT'
	begin
		set @ws_message = (select * 
							 from dtrundertime du (nolock)
				    		where du.dtr_date = cast(left(@pk_event_object,8) as datetime)
							  and du.am_pm = substring(@pk_event_object,9,1)
							  and du.id_num = substring(@pk_event_object,10,len(@pk_event_object))
							  for xml raw ('dtrundertime'), 
								  elements)
	end
	-- end override
	else if @event_object = 'OVR'
	begin
		set @ws_message = (select * 
							 from dtroverride do (nolock)
				    		where do.dtr_date = cast(left(@pk_event_object,8) as datetime)
							  and do.am_pm = substring(@pk_event_object,9,1)
							  and do.id_num = substring(@pk_event_object,10,len(@pk_event_object))
							  for xml raw ('dtroverride'), 
								  elements)
	end
	-- end override

	
	-- return query
	select @event_object as event_object,
		   @pk_event_object as pk_event_object,
		   @ws_message as ws_message,
		   @ws_message_date as ws_message_date,
		   null as priority,
		   dbo.fn_get_sysconfig_value('LOCATION_CODE') as source_location, 
		   @destination_location as destination_location,
		   @messagetype_code as messagetype_code,
		   'QUE' as messagestatus_code 
END




GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessage]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sync_get_wsmessage]
	@destination_location char(3)
AS
BEGIN
	declare @event_object char(3) = NULL,
			@pk_event_object varchar(30) = NULL,
			@source_location char(3) = null
	
	-- get the latest message		
	select top 1 
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location
	  from wsmessage wm (nolock)
	 where rtrim(wm.destination_location) = rtrim(@destination_location)
	   and wm.messagestatus_code <> 'SYN'
  order by wm.priority desc, wm.last_transaction_date, wm.ws_message_date 
	
	-- update the latest message
	-- set the transaction date to the current date
	update wsmessage
	   set last_transaction_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   and rtrim(destination_location) = rtrim(@destination_location)
	
	-- return the message		
	if isnull(@event_object,'') <> '' 
	begin
		select top 1 *
		  from wsmessage wm (nolock)
		 where event_object = @event_object
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
		   and rtrim(destination_location) = rtrim(@destination_location)
		   and wm.messagestatus_code <> 'SYN'
	end
	else
	begin
		select null as event_object
			   ,null as pk_event_object
			   ,'' as ws_message
               ,null as ws_message_date
               ,null as source_location
               ,null as destination_location
               ,null as priority
               ,null as messagetype_code
               ,null as messagestatus_code
               ,null as last_transaction_date
  	end
END



GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessage_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessage_status] 
	@event_object char(3),
	@pk_event_object varchar(30),
	@source_location char(3),
	@destination_location char(3)
AS
BEGIN
	select isnull(messagestatus_code,'') messagestatus_code
	  from wsmessage (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   and destination_location = @destination_location
	   and messagetype_code = 'CHS'
END


GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessagein_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessagein_status] 
AS
BEGIN
	declare @event_object char(3),
			@pk_event_object varchar(30),
			@source_location char(3)
			
	select top 1
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location
	  from wsmessagein wmi (nolock)
	 where wmi.messagestatus_code = 'SYN'
  order by priority, ws_message_date
			
	-- update the ws_message_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set ws_message_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code,
		   source_location
	  from wsmessagein wmi (nolock)
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
END

GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessageout_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_get_wsmessageout_status] 
AS
BEGIN
	select top 1
		   event_object,
		   pk_event_object,
		   messagestatus_code,
		   destination_location
	  from wsmessageout wmo (nolock)
	 where wmo.messagestatus_code = 'SSV'
END


GO
/****** Object:  StoredProcedure [dbo].[sync_que_record]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sync_que_record]
AS
BEGIN
	declare @dtr_id int
    set xact_abort on
    
    begin transaction
    
    -- get ID
    select @dtr_id = dtr_id
	  from dtr d (nolock) 
	 where d.syncstatus_code = 'NS'
	   and d.time_out is not null
  order by dtr_date desc, 
           time_in desc,
           time_out desc
    
	-- insert record into que
	-- set status to SYN
	-- this status will be changed
	-- to SSV after successfully sending to the 
	-- web server
	if ISNULL(@dtr_id,0) > 0 
	begin
		-- check if the record has been qued
		-- insert if no record exists 
		-- update when record exists .. change the status to QUE to resync the record
		if not exists (select 1 
		                 from wsmessageout w
		                where w.event_object = 'DTR'
		                  and CAST(w.pk_event_object as int) = @dtr_id)
		begin                 
			insert into wsmessageout
			values ('DTR',
				   @dtr_id,
				   GETDATE(),
				   0,
				   'SVR',
				   'SYN',
				   'QUE',
				   GETDATE())
		end
		else
		begin
			update wsmessageout
			   set messagestatus_code = 'QUE',
			       messagetype_code = 'SYN'
			 where event_object = 'DTR'
		                  and CAST(pk_event_object as int) = @dtr_id 
		end
	 
		-- set sync status of record to QUE
		update dtr 
		   set syncstatus_code = 'QUE'
		 where dtr_id = @dtr_id
	end
	
	commit transaction
	
	set xact_abort off
	 
END



GO
/****** Object:  StoredProcedure [dbo].[sync_set_wsmessage_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessage_status] 
	@event_object char(3),
	@pk_event_object varchar(30),
	@messagestatus_code char(3),
	@source_location char(3),
	@destination_location char(3)
AS
BEGIN
	update wsmessage
	   set messagestatus_code = @messagestatus_code,
		   messagetype_code = 'CHS'
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   and destination_location = @destination_location
END


GO
/****** Object:  StoredProcedure [dbo].[sync_set_wsmessageout_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sync_set_wsmessageout_status] 
	@event_object char(3),
	@pk_event_object varchar(30),
	@destination_location char(3),
	@messagestatus_code char(3)
AS
BEGIN
	update wsmessageout
	   set messagestatus_code = @messagestatus_code
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and destination_location = @destination_location
	   --and messagestatus_code = 'QUE' -- this is to make sure only one record gets updated
	                                  -- all records matching the previous where clause
	                                  -- gets updated
END



GO
/****** Object:  StoredProcedure [dbo].[sync_xml_to_db]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sync_xml_to_db]
AS
BEGIN
	declare @ws_message xml,
			@event_object char(3),
			@pk_event_object varchar(30),
			@source_location char(3),
			@sync_attempts int,
			@hdoc int, 
			@exists int = 0
	
	select top 1 
		   @ws_message = ws_message,
		   @event_object = event_object,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location,
		   @sync_attempts = sync_attempts
	  from wsmessagein 
	 where messagestatus_code <> 'SYN'
	   and event_object <> 'SQL'
  order by priority, last_transaction_date
  
	-- update the last_transaction_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set sync_attempts = ISNULL(sync_attempts,0) + 1
	       ,last_transaction_date = GETDATE()
	 where event_object = @event_object
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   
	set xact_abort on
	
	begin transaction
  
	if @ws_message is not null
	begin
		-- dtr
		if @event_object = 'DTR'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from dtr d 
			 where d.remote_dtr_id = cast(@pk_event_object as int)
			   and d.location_code = @source_location
			
			if (isnull(@exists,0) = 0 and ISNULL(@sync_attempts,0) = 0)
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into dtr
				select *
				  from openxml(@hdoc, '/dtr', 2) 
				  with dtr	
				  
				-- update the status of the newly-inserted record
				update dtr
				   set syncstatus_code = 'SYN'
				 where dtr_id = (select SCOPE_IDENTITY())
				 
			end -- end isnull(@exists,0)
		end 
		-- end dtr
		-- employee
		else if @event_object = 'EMP'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from employee e (nolock)
			 where e.id_num = @pk_event_object
			
			if isnull(@exists,0) = 0 
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into employee
				select *
				  from openxml(@hdoc, '/employee', 2) 
				  with employee	
				  				 
			end -- end isnull(@exists,0)
		end 
		-- end employee
		-- system user
		else if @event_object = 'USR'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from sysuser u (nolock)
			 where u.id_num = @pk_event_object
			
			if isnull(@exists,0) = 0 
			begin 
				exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
				-- save wsmessage to intended table
				insert into sysuser
				select *
				  from openxml(@hdoc, '/sysuser', 2) 
				  with sysuser	
				  				 
			end -- end isnull(@exists,0)
		end 
		-- end system user
		-- system privileges
		else if @event_object = 'PRV'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			  
			-- insert missing privileges
			insert into sysprivilege 
			select *
			  from openxml(@hdoc, '/sysprivileges/sysprivilege', 2) 
			  with (privilege_code varchar(30), 
					privilege_name varchar(50), 
					privilege_description varchar(250)) x
		     where not exists (select 1 
								 from sysprivilege p (nolock)
								where p.privilege_code = x.privilege_code)
		end 
		-- end system privileges
		-- system roles
		else if @event_object = 'ROL'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- insert the missing roles
			insert into sysrole (role_code, role_name)
			select role_code,
			       role_name
			  from openxml(@hdoc, '/sysuserroles/sysuserrole', 2)
			  with (role_code varchar(25),
					role_name varchar(50)) x
			 where not exists (select 1
			                     from sysrole r (nolock)
			                    where r.role_code = x.role_code)
			                    
			-- delete the user roles
			-- this ensures that the assigned roles are up-to-date
			delete sysuserrole
			 where id_num = (select top 1 x.id_num
		                       from openxml(@hdoc, '/sysuserroles/sysuserrole', 2)
		                       with (id_num varchar(12)) x) 
			                       
			-- insert the updated roles
			insert into sysuserrole 
			select *
			  from openxml(@hdoc, '/sysuserroles/sysuserrole', 2) 
			  with sysuserrole		
		end 
		-- end system roles
		-- role privileges
		else if @event_object = 'RPV'
		begin
			exec sp_xml_preparedocument @hdoc output, @ws_message	
			
			-- delete the role privileges
			-- this ensures the assigned privileges are up-to-date
			delete sysroleprivilege
			 where role_code = (select top 1 x.role_code
			                      from openxml(@hdoc, '/sysroleprivileges/sysroleprivilege', 2)
			                      with (role_code varchar(25)) x) 
			                      
			-- reinsert the role privileges
			insert into sysroleprivilege (role_code, privilege_code) 
			select x.role_code,
			       x.privilege_code
			  from openxml(@hdoc, '/sysroleprivileges/sysroleprivilege', 2) 
			  with (role_code varchar(25), 
					privilege_code varchar(30)) x
		end 
		-- end role privileges
		-- leave
		else if @event_object = 'LVE'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from leave l (nolock)
			 where l.leave_id = cast(@pk_event_object as int)
			   and l.location_code = @source_location

			exec sp_xml_preparedocument @hdoc output, @ws_message
			
			if isnull(@exists,0) = 0 
			begin 
				-- save wsmessage to intended table

				set identity_insert dbo.leave on

				insert into dbo.leave (leave_id,
				       location_code,
					   leave_application_date,
					   id_num,
					   leavetype_code,
					   justification,
					   leaveappstatus_code,
					   leave_remarks,
					   created_by,
					   created_date,
					   modified_by,
					   modified_date,
					   status_changed_by,
					   status_changed_date)
				select leave_id,
				       location_code,
					   leave_application_date,
					   id_num,
					   leavetype_code,
					   justification,
					   leaveappstatus_code,
					   leave_remarks,
					   created_by,
					   created_date,
					   modified_by,
					   modified_date,
					   status_changed_by,
					   status_changed_date
				  from openxml(@hdoc, '/leave', 2)  
				  with (leave_id int,
				       location_code char(3),
					   leave_application_date datetime,
					   id_num varchar(12),
					   leavetype_code char(3),
					   justification varchar(50),
					   leaveappstatus_code char(3),
					   leave_remarks varchar(250),
					   created_by varchar(12),
					   created_date datetime,
					   modified_by varchar(12),
					   modified_date datetime,
					   status_changed_by varchar(12),
					   status_changed_date datetime) 

				set identity_insert dbo.leave off
				 
			end -- end isnull(@exists,0)
			else
			begin
				update l
				   set l.leave_application_date = lx.leave_application_date,
				       l.id_num = lx.id_num,
					   l.leavetype_code = lx.leavetype_code,
					   l.justification = lx.justification,
					   l.leaveappstatus_code = lx.leaveappstatus_code,
					   l.leave_remarks = lx.leave_remarks,
					   l.created_by = lx.created_by,
					   l.created_date = lx.created_date,
					   l.modified_by = lx.modified_by,
					   l.modified_date = lx.modified_date,
					   l.status_changed_by = lx.status_changed_by,
					   l.status_changed_date = lx.status_changed_date
				  from leave l
				  join (select *
						  from openxml(@hdoc, '/leave', 2) 
						  with (leave_id int,
								location_code char(3),
								leave_application_date datetime,
								id_num varchar(12),
								leavetype_code char(3),
								justification varchar(50),
								leaveappstatus_code char(3),
								leave_remarks varchar(250),
								created_by varchar(12),
								created_date datetime,
								modified_by varchar(12),
								modified_date datetime,
								status_changed_by varchar(12),
								status_changed_date datetime)) lx
				    on lx.leave_id = l.leave_id
				   and lx.location_code = l.location_code
				 where l.leave_id = cast(@pk_event_object as int)
			       and l.location_code = @source_location
				  	
			end
			
		end 
		-- end leave
		-- leave detail
		else if @event_object = 'LVD'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from leavedetail ld (nolock)
			 where ld.leave_id = cast(substring(@pk_event_object,9,len(@pk_event_object)) as int)
			   and ld.location_code = @source_location
			   and ld.leave_date = cast(left(@pk_event_object,8) as datetime)

			exec sp_xml_preparedocument @hdoc output, @ws_message
			
			if isnull(@exists,0) = 0 
			begin 
				-- save wsmessage to intended table
				insert into leavedetail
				select *
				  from openxml(@hdoc, '/leavedetail', 2) 
				  with leavedetail	
				 
			end -- end isnull(@exists,0)
			else
			begin
				update ld
				   set ld.leave_date = ldx.leave_date,
				       ld.am_pm = ldx.am_pm,
					   ld.is_paid = ldx.is_paid,
					   ld.leavestatus_code = ldx.leavestatus_code,
					   ld.leavereason_code = ldx.leavereason_code,
					   ld.leave_remarks = ldx.leave_remarks,
					   ld.created_by = ldx.created_by,
					   ld.created_date = ldx.created_date,
					   ld.modified_by = ldx.modified_by,
					   ld.modified_date = ldx.modified_date,
					   ld.status_changed_by = ldx.status_changed_by,
					   ld.status_changed_date = ldx.status_changed_date
				  from leavedetail ld
				  join (select *
						  from openxml(@hdoc, '/leavedetail', 2) 
						  with leavedetail) ldx
				    on ldx.leave_id = ld.leave_id
				   and ldx.location_code = ld.location_code
				   and ldx.leave_date = ld.leave_date
				 where ld.leave_id = cast(substring(@pk_event_object,9,len(@pk_event_object)) as int)
			       and ld.location_code = @source_location
			       and ld.leave_date = cast(left(@pk_event_object,8) as datetime)
				  	
			end
			
		end 
		-- end leave detail
		-- undertime
		else if @event_object = 'UDT'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from dtrundertime ud (nolock)
			 where ud.dtr_date = cast(left(@pk_event_object,8) as datetime)
			   and ud.id_num = substring(@pk_event_object,10,len(@pk_event_object)) 
			   and ud.am_pm = substring(@pk_event_object,9,1)

			exec sp_xml_preparedocument @hdoc output, @ws_message
			
			if isnull(@exists,0) = 0 
			begin 
				-- save wsmessage to intended table
				insert into dtrundertime
				select *
				  from openxml(@hdoc, '/dtrundertime', 2) 
				  with dtrundertime	
				 
			end -- end isnull(@exists,0)
			else
			begin
				update ud
				   set ud.time_from = udx.time_from,
				       ud.time_until = udx.time_until,
					   ud.undertime_reason_code = udx.undertime_reason_code,
					   ud.created_by = udx.created_by,
					   ud.created_date = udx.created_date,
					   ud.modified_by = udx.modified_by,
					   ud.modified_date = udx.modified_date,
					   ud.syncstatus_code = udx.syncstatus_code,
					   ud.timestatus_code = udx.timestatus_code,
					   ud.status_changed_by = udx.status_changed_by,
					   ud.status_changed_date = udx.status_changed_date,
					   ud.am_pm = udx.am_pm,
					   ud.is_paid = udx.is_paid
				  from dtrundertime ud
				  join (select *
						  from openxml(@hdoc, '/dtrundertime', 2) 
						  with dtrundertime) udx
				    on udx.dtr_date = ud.dtr_date
				   and udx.id_num = ud.id_num
				   and udx.am_pm = ud.am_pm
				 where ud.dtr_date = cast(left(@pk_event_object,8) as datetime)
			       and ud.id_num = substring(@pk_event_object,10,len(@pk_event_object)) 
			       and ud.am_pm = substring(@pk_event_object,9,1)
				  	
			end
			
		end 
		-- end undertime
		-- override
		else if @event_object = 'OVR'
		begin
			-- check if record already exists
			select @exists = COUNT(1)
			  from dtroverride od (nolock)
			 where od.dtr_date = cast(left(@pk_event_object,8) as datetime)
			   and od.id_num = substring(@pk_event_object,10,len(@pk_event_object)) 
			   and od.am_pm = substring(@pk_event_object,9,1)

			exec sp_xml_preparedocument @hdoc output, @ws_message
			
			if isnull(@exists,0) = 0 
			begin 
				-- save wsmessage to intended table
				insert into dtroverride
				select *
				  from openxml(@hdoc, '/dtroverride', 2) 
				  with dtroverride	
				 
			end -- end isnull(@exists,0)
			else
			begin
				update od
				   set od.time_in = odx.time_in,
				       od.time_out = odx.time_out,
					   od.override_reason_code = odx.override_reason_code,
					   od.overriden_by = odx.overriden_by,
					   od.override_date = odx.override_date,
					   od.modified_by = odx.modified_by,
					   od.modified_date = odx.modified_date,
					   od.syncstatus_code = odx.syncstatus_code,
					   od.location_code = odx.location_code,
					   od.is_cancelled = odx.is_cancelled
				  from dtroverride od
				  join (select *
						  from openxml(@hdoc, '/dtroverride', 2) 
						  with dtroverride) odx
				    on odx.dtr_date = od.dtr_date
				   and odx.id_num = od.id_num
				   and odx.am_pm = od.am_pm
				 where od.dtr_date = cast(left(@pk_event_object,8) as datetime)
			       and od.id_num = substring(@pk_event_object,10,len(@pk_event_object)) 
			       and od.am_pm = substring(@pk_event_object,9,1)
				  	
			end
			
		end 
		-- end undertime
				 
		-- update status of message in the wsmessagein table
		if @@ROWCOUNT > 0 
		begin
			update wsmessagein
			   set messagestatus_code = 'SYN'
			 where event_object = @event_object
			   and pk_event_object = @pk_event_object
			   and source_location = @source_location
		end
		 
		commit transaction
		  
		exec sp_xml_removedocument @hdoc  
	end -- if @ws_message is not null 
	--else
	--begin
		-- delete the existing record
		-- from the wsmessagein table
		-- delete
		--  from wsmessagein
		-- where event_object = @event_object
		--   and pk_event_object = @pk_event_object
		--   and source_location = @source_location
		   
		-- update status of message in the wsmessagein table
		-- previously the record is deleted, 
		-- however, change the status instead to effectively
		-- change the status of the record in the webserver
		--update wsmessagein
		--   set messagestatus_code = 'SYN'
		-- where event_object = @event_object
		--   and pk_event_object = @pk_event_object
		--   and source_location = @source_location
		   
		--commit transaction
	--end
	
  	set xact_abort off  
end



GO
/****** Object:  StoredProcedure [dbo].[sys_get_sysconfig]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sys_get_sysconfig]
AS
BEGIN
	select *
	  from sysconfig sc (nolock)
END


GO
/****** Object:  StoredProcedure [dbo].[upd_execute_update]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[upd_execute_update]

AS
BEGIN
    declare @update nvarchar(max),
			@pk_event_object varchar(30),
			@source_location char(3),
			@sync_attempts int

	select top 1 
		   @update = ws_message,
		   @pk_event_object = pk_event_object,
		   @source_location = source_location,
		   @sync_attempts = sync_attempts
	  from wsmessagein 
	 where messagestatus_code <> 'SYN'
	   and event_object = 'SQL'
  order by priority, pk_event_object, last_transaction_date
  
	-- update the last_transaction_date column
	-- this forces the record to go back the que
	update wsmessagein 
	   set sync_attempts = ISNULL(sync_attempts,0) + 1
	       ,last_transaction_date = GETDATE()
	 where event_object = 'SQL'
	   and pk_event_object = @pk_event_object
	   and source_location = @source_location
	   
	set xact_abort on
	
	begin tran
					  
	if ISNULL(@update,'') <> ''
	begin
		execute (@update)
		
		-- update the status of the "update"
		update wsmessagein
		   set messagestatus_code = 'SYN'
		 where event_object = 'SQL'
		   and pk_event_object = @pk_event_object
		   and source_location = @source_location
	end
	
	commit tran
	
	set xact_abort off
END


GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_dtr]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[dtr_fn_get_dtr]
(
    -- Add the parameters for the function here
	@dtr_date_from datetime,
	@dtr_date_until datetime,
	@id_num varchar(12) = null,
	@include_override smallint = 1
)
RETURNS @dtr TABLE 
(
	id_num varchar(12),
	dtr_date datetime,
	time_in_am time,
	time_out_am time,
	time_in_pm time,
	time_out_pm time,
	total_hours_am decimal(4,2),
	total_hours_pm decimal(4,2),
	location_code char(3)
)
AS
BEGIN
	declare @override table
	(
		dtr_date datetime,
		id_num varchar(12),
		time_in time,
		time_out time,
		am_pm char(1),
		location_code char(3)
	)
	
	-- get override
	if @include_override = 1
	begin
		insert @override
		select dtr_date,
			   id_num,
			   time_in,
			   time_out,
			   am_pm,
			   location_code
		  from dtroverride (nolock)
		 where dtr_date between @dtr_date_from and @dtr_date_until
		   and isnull(is_cancelled,0) = 0
	end

	insert @dtr
	select d_am.id_num,
		   d_am.dtr_date,
		   coalesce(ov_am.time_in,d_am.time_in) as time_in_am,
		   coalesce(ov_am.time_out,d_am.time_out) as time_out_am,
		   coalesce(ov_pm.time_in,d_pm.time_in) as time_in_pm,
		   coalesce(ov_pm.time_out,d_pm.time_out) as time_out_pm,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_am.time_in,d_am.time_in),coalesce(ov_am.time_out,d_am.time_out), @dtr_date_until) total_hours_am,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_pm.time_in,d_pm.time_in),coalesce(ov_pm.time_out,d_pm.time_out), @dtr_date_until) total_hours_pm,
		   d_am.location_code
	  from dtr d_am (nolock)
 left join @override ov_am
        on ov_am.id_num = d_am.id_num
	   and ov_am.dtr_date = d_am.dtr_date
	   and ov_am.am_pm = 'A'
 left join @override ov_pm
        on ov_pm.id_num = d_am.id_num
	   and ov_pm.dtr_date = d_am.dtr_date
	   and ov_pm.am_pm = 'P'
 left join (select dtr_id,
                   dtr_date,
				   id_num,
                   time_in,
                   time_out 
			  from dtr d (nolock)
			 where d.dtr_date between @dtr_date_from and @dtr_date_until
			   and d.time_in >= '12:00:00') d_pm 
		on d_pm.id_num = d_am.id_num
	   and d_pm.dtr_date = d_am.dtr_date
     where d_am.dtr_date between @dtr_date_from and @dtr_date_until
       and d_am.time_in < '12:00:00'
	   and ((isnull(@id_num,'') = '') or (d_am.id_num = @id_num))
  
	-- afternoon log
	-- without morning log
	insert @dtr
	select d_pm_only.id_num,
	       d_pm_only.dtr_date,
		   ov_am.time_in as time_in_am,
		   ov_am.time_out as time_out_am,
		   coalesce(ov_pm.time_in,d_pm_only.time_in) as time_in_pm,
		   coalesce(ov_pm.time_out,d_pm_only.time_out) as time_out_pm,
		   0 total_hours_am,
		   dbo.dtr_fn_get_total_hours(coalesce(ov_pm.time_in,d_pm_only.time_in),coalesce(ov_pm.time_out,d_pm_only.time_out), @dtr_date_until) d_pm_only,
		   d_pm_only.location_code
	  from dtr d_pm_only (nolock)
	  join employee e (nolock) 
	    on e.id_num = d_pm_only.id_num
 left join @override ov_am
        on ov_am.id_num = d_pm_only.id_num
	   and ov_am.dtr_date = d_pm_only.dtr_date
	   and ov_am.am_pm = 'A'
 left join @override ov_pm
        on ov_pm.id_num = d_pm_only.id_num
	   and ov_pm.dtr_date = d_pm_only.dtr_date
	   and ov_pm.am_pm = 'P'
	 where d_pm_only.dtr_date between @dtr_date_from and @dtr_date_until
   	   and d_pm_only.time_in > '12:00:00'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = e.id_num
						  and d.dtr_date = d_pm_only.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (d_pm_only.id_num = @id_num))

	-- overrides with no logs at all
	insert @dtr
	select ov_am.id_num,
	       ov_am.dtr_date,
		   ov_am.time_in,
		   ov_am.time_out,
		   ov_pm.time_in,
		   ov_pm.time_out,
		   dbo.dtr_fn_get_total_hours(ov_am.time_in,ov_am.time_out, @dtr_date_until) total_hours_am,
		   dbo.dtr_fn_get_total_hours(ov_pm.time_in,ov_pm.time_out, @dtr_date_until) total_hours_pm,
		   ov_am.location_code
	  from @override ov_am
 left join @override ov_pm
        on ov_pm.dtr_date = ov_am.dtr_date
	   and ov_pm.id_num = ov_am.id_num
	   and ov_pm.am_pm = 'P'
     where ov_am.am_pm = 'A'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = ov_am.id_num
						  and d.dtr_date = ov_am.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (ov_am.id_num = @id_num))

	-- afternoon overrides with no morning overrides or logs
	insert @dtr
	select ov_pm.id_num,
	       ov_pm.dtr_date,
		   null,
		   null,
		   ov_pm.time_in,
		   ov_pm.time_out,
		   0 total_hours_am,
		   dbo.dtr_fn_get_total_hours(ov_pm.time_in,ov_pm.time_out, @dtr_date_until) total_hours_pm,
		   ov_pm.location_code
	  from @override ov_pm
	 where ov_pm.am_pm = 'P'
	   and not exists (select 1 
						 from @dtr d  
						where d.id_num = ov_pm.id_num
						  and d.dtr_date = ov_pm.dtr_date) 
	   and ((isnull(@id_num,'') = '') or (ov_pm.id_num = @id_num))

	return 
END

GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_location_code]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[dtr_fn_get_location_code]
(
)
RETURNS char(3)
AS
BEGIN
	declare	@location_code char(3)
			
	set @location_code = dbo.fn_get_sysconfig_value('LOCATION_CODE')
    	
	return @location_code
END


GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_log_status]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[dtr_fn_get_log_status]
(
	@time_in time,
	@current_date datetime
)
RETURNS varchar(15)
AS
BEGIN
	-- Declare the return variable here
	declare @log_status varchar(15)
	
	-- NOTE:
	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon

	if (@current_date < '2015-10-01') or (DATEPART(DW, @current_date) = 7)
	begin
		if (@time_in between '08:10:59' and '11:59:59') or (@time_in between '13:10:59' and '17:00:00')
			set @log_status = 'UNDERTIME'
		else if (@time_in between '08:00:59' and '08:10:01') or (@time_in between '13:00:59' and '13:10:01')
			set @log_status = 'LATE'
	end
	else
	begin
		if (@time_in between '08:40:59' and '11:59:59') or (@time_in between '13:10:59' and '17:30:00')
			set @log_status = 'UNDERTIME'
		else if (@time_in between '08:30:59' and '08:40:01') or (@time_in between '13:00:59' and '13:10:01')
			set @log_status = 'LATE'
	end
	
	-- Return the result of the function
	return @log_status
END



GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_times]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[dtr_fn_get_times]
(
	@current_date datetime
)
RETURNS 
@times TABLE 
(
	LOGIN_AM time(0),
	LOGOUT_AM time(0),
	LOGIN_PM time(0),
	LOGOUT_PM time(0)
)
AS
BEGIN
	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon
	-- Saturdays remain the same time 8:00 - 12:00

	if (@current_date < '2015-10-01') or (DATEPART(DW, @current_date) = 7)
	begin
		insert 
		  into @times
		values ('08:00:00',
		       '12:00:00',
		       '13:00:00',
		       '17:00:00')
	end
	else
	begin
		insert
		  into @times
		values ('08:30:00',
		       '12:00:00',
		       '13:00:00',
		       '17:30:00')
	end
	
	return 
END

GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_total_hours]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[dtr_fn_get_total_hours]
(
	@time_in time,
	@time_out time,
	@dtr_date datetime
)
RETURNS decimal(4,2)
AS
BEGIN
	declare @total_hours decimal(4,2)

	-- constants for min and max login/out times
	declare @LOGIN_AM time(0),
			@LOGIN_AM_PLUS_ALLOWANCE time(0),
	        @LOGIN_PM time(0),
			@LOGIN_PM_PLUS_ALLOWANCE time(0),
			@LOGOUT_AM time(0),
			@LOGOUT_PM time(0)

	-- NOTE:
	-- starting OCTOBER 2015 work shift has been changed from 8:00 - 12:00 to 8:30 - 12:00 in the morning
	-- and from 1:00 - 5:00 to 1:00 - 5:30 in the afternoon
	if (@dtr_date < '2015-10-01') or (DATEPART(DW, @dtr_date) = 7)
	begin
		set @LOGIN_AM = '08:00:00'
		set @LOGIN_AM_PLUS_ALLOWANCE = '08:11:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGIN_PM_PLUS_ALLOWANCE = '13:11:00'
		set @LOGOUT_PM = '17:00:00'
	end
	else
	begin
		set @LOGIN_AM = '08:30:00'
		set @LOGIN_AM_PLUS_ALLOWANCE = '08:41:00'
		set @LOGOUT_AM = '12:00:00'
		set @LOGIN_PM = '13:00:00'
		set @LOGIN_PM_PLUS_ALLOWANCE = '13:11:00'
		set @LOGOUT_PM = '17:30:00'
	end

	-- morning
	if (@time_in < @LOGOUT_AM) --'12:00:00')
	begin
		if (@time_in < @LOGIN_AM_PLUS_ALLOWANCE) --'08:11:00')
			set @time_in = @LOGIN_AM --'08:00:00'
		
		if (isnull(@time_out,@time_in) > @LOGOUT_AM) -- '12:00:00')
			set @time_out = @LOGOUT_AM -- '12:00:00'
		else if (isnull(@time_out,@time_in) < @LOGIN_AM_PLUS_ALLOWANCE) -- '08:11:00')
			set @time_out = @time_in
	end	
	else
	-- afternoon
	begin 
		if (@time_in < @LOGIN_PM_PLUS_ALLOWANCE) --'13:11:00')
			set @time_in = @LOGIN_PM -- '13:00:00'
		else if (@time_in > @LOGOUT_PM) -- '17:00:00')
			set @time_in = @LOGOUT_PM -- '17:00:00'	
			
		if (isnull(@time_out,@time_in) > @LOGOUT_PM) -- '17:00:00')
			set @time_out = @LOGOUT_PM -- '17:00:00'
		else if (isnull(@time_out,@time_in) < @LOGIN_PM_PLUS_ALLOWANCE) -- '13:11:00')
			set @time_out = @time_in
	end
	
	set @total_hours = DATEDIFF(minute,@time_in,isnull(@time_out,@time_in)) / 60.0

	return isnull(@total_hours,0)
END


GO
/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_working_days]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[dtr_fn_get_working_days]
(
	@dtr_date_from datetime,
	@dtr_date_until datetime
)
RETURNS @days TABLE
(
	working_days int,
	saturdays int,
	sundays int
)
AS
BEGIN
	-- this function returns the working days, Saturdays and Sundays
	-- alternatively, DATEDIFF can be used to get the number of days
	-- however, instead of using another function (in this case DATEDIFF), this function has been utilised

	declare @working_days int = 0,
		    @saturdays int = 0,
			@sundays int = 0,
	        @d datetime

	set @d = @dtr_date_from
	
	while @d <= @dtr_date_until
	begin
	  if datename(dw, @d) = 'Sunday'
		set @sundays = @sundays + 1

	  if datename(dw, @d) = 'Saturday'
	    set @saturdays = @saturdays + 1 

	  set @d = dateadd(dd, 1, @d)

	  set @working_days = @working_days + 1
	end 

	insert @days
	select @working_days,
	       @saturdays,
		   @sundays

	return
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_get_sysconfig_value]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_get_sysconfig_value]
(
	@code varchar(30)
)
RETURNS varchar(50)
AS
BEGIN
    declare @value varchar(50)
    
    select @value = sysconfig_value
      from sysconfig sc (nolock)
     where sc.sysconfig_code = @code
     
	-- Return the result of the function
	RETURN @value
END


GO
/****** Object:  UserDefinedFunction [dbo].[paf_fn_active_employees]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[paf_fn_active_employees]
(
	-- Add the parameters for the function here
	@dtr_date_from datetime,
	@dtr_date_until datetime
)
RETURNS @employee TABLE 
(
	id_num varchar(12) primary key,
	employee_name varchar(250),
	employee_name_full varchar(250),
	location_code char(3),
	salary decimal(10,2),
	frequency_code char(3),
	paf_id int,
	department_code char(3),
	position_code char(3),
	empstatus_code char(3),
	declare_dependents smallint,
	positiontype_code char(3)
)
AS
BEGIN
	insert @employee
	select e.id_num,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   (e.employee_firstname + isnull(' ' + substring(e.employee_middlename,1,1) + '. ',' ') + e.employee_lastname) employee_name_full,
		   location_code,
		   salary,
		   frequency_code,
		   paf_id,
		   department_code,
		   p.position_code,
		   empstatus_code,
		   declare_dependents,
		   ps.positiontype_code
	  from paf p (nolock)
	  join employee e (nolock)
	    on e.id_num = p.id_num
	  join t_position ps (nolock)
	    on ps.position_code = p.position_code
     where (
		   ((p.effective_until is null) and (p.effective_date between @dtr_date_from and @dtr_date_until))
		or ((p.effective_until is null) and (p.effective_date <= @dtr_date_from))
	    or ((p.effective_until is not null) and (@dtr_date_until <= p.effective_until) and (@dtr_date_from >= p.effective_date))
		or ((p.effective_until is not null) and (@dtr_date_until <= p.effective_until) and (p.effective_date between @dtr_date_from and @dtr_date_until))
		   )
	   and isnull(p.is_cancelled,0) = 0 
	   and p.pafstatus_code = 'APP'

	return
END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_daily_rate]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_daily_rate]
(
	@salary decimal(10,2)
)
RETURNS decimal(10,2)
AS
BEGIN

	return @salary * 12.00 / 365.00

END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_declared_salary]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_declared_salary]
(
	@positiontype_code char(3)
)
RETURNS decimal(8,2)
AS
BEGIN
	
	declare @salary decimal(8,2)
	
	select @salary =
		case when @positiontype_code in ('COO') then 15000.00
		     when @positiontype_code in ('AM') then 13000.00
			 when @positiontype_code in ('DH') then 12000.00
			 when @positiontype_code in ('BM') then 11000.00
			 else 8500.00 -- staff
	end

	-- Return the result of the function
	return @salary

END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_pagibig_contribution]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_pagibig_contribution]
(
	@employee_status char(3)
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @pagibig decimal(10,2)

	if @employee_status = 'PRO'
	  set @pagibig = 200.00 
    else
	  set @pagibig = 300.00
	
	-- Return the result of the function
	RETURN @pagibig / 2.00

END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_payroll_details]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_payroll_details]	
(	
	@payroll_code char(15) 
)
RETURNS @dates TABLE 
(
	payroll_from date,
	payroll_until date,
	payrollstatus_code char(3)
)
AS
BEGIN
	-- return
	insert @dates
	select payroll_from,
	       payroll_until,
		   payrollstatus_code
	  from payrollcode pr (nolock)
	 where pr.payroll_code = @payroll_code
	
	return
END
GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_phic_contribution]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_phic_contribution]
(
	@position_code char(3)
)
RETURNS decimal(10,2)
AS
BEGIN
	-- Declare the return variable here
	declare @phic decimal(10,2)

	if @position_code in ('BM','DH')
		set @phic = 137.50
	else if @position_code in ('AM','COO')
		set @phic = 150.00
	else
	    set @phic = 125.00

	-- Return the result of the function
	return @phic / 2.00

END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_sss_contribution]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_sss_contribution]
(
	@salary decimal(10,2)
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @sss_contribution decimal(10,2)

	select @sss_contribution =
			case when @salary between 1000 and 1249.99 then 36.30 -- 120.00
			     when @salary between 1250 and 1749.99 then 54.50 -- 175.00
				 when @salary between 1750 and 2249.99 then 72.70 -- 230.00
				 when @salary between 2250 and 2749.99 then 90.80 -- 285.00
				 when @salary between 2750 and 3249.99 then 109.00 -- 340.00
				 when @salary between 3250 and 3749.99 then 127.20 -- 395.00
				 when @salary between 3750 and 4249.99 then 145.30 -- 450.00
				 when @salary between 4250 and 4749.99 then 163.50 -- 505.00
				 when @salary between 4750 and 5249.99 then 181.70 -- 560.00
				 when @salary between 5250 and 5749.99 then 199.80 -- 615.00
				 when @salary between 5750 and 6249.99 then 218.00 -- 670.00
				 when @salary between 6250 and 6749.99 then 236.20 -- 725.00
				 when @salary between 6750 and 7249.99 then 254.30 -- 780.00
				 when @salary between 7250 and 7749.99 then 272.50 -- 835.00
				 when @salary between 7750 and 8249.99 then 290.70 -- 890.00
				 when @salary between 8250 and 8749.99 then 308.80 -- 945.00
				 when @salary between 8750 and 9249.99 then 327.00 -- 1000.00
				 when @salary between 9250 and 9749.99 then 345.20 -- 1055.00
				 when @salary between 9750 and 10249.99 then 363.30 -- 1110.00
				 when @salary between 10250 and 10749.99 then 381.50 -- 1165.00
				 when @salary between 10750 and 11249.99 then 399.70 -- 1220.00
				 when @salary between 11250 and 11749.99 then 417.80 -- 1275.00
				 when @salary between 11750 and 12249.99 then 436.00 -- 1330.00
				 when @salary between 12250 and 12749.99 then 454.20 -- 1385.00
				 when @salary between 12750 and 13249.99 then 472.30 -- 1440.00
				 when @salary between 13250 and 13749.99 then 490.50 -- 1495.00
				 when @salary between 13750 and 14249.99 then 508.70 -- 1550.00
				 when @salary between 14250 and 14749.99 then 526.80 -- 1605.00
				 when @salary between 14750 and 15249.99 then 545.00 -- 1680.00
				 when @salary between 15250 and 15749.99 then 563.20 -- 1735.00
				 when @salary >= 15750 then 581.30 -- 1790
				 else 0
			end

	-- Return the result of the function
	return @sss_contribution / 2.00

END

GO
/****** Object:  UserDefinedFunction [dbo].[pr_fn_get_withholding_tax]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[pr_fn_get_withholding_tax]
(
	@empstatus_code char(3),
	@positiontype_code char(3),
	@declared_salary decimal(10,2), 
	@dependents int
)
RETURNS decimal(10,2)
AS
BEGIN
	declare @withholding_tax decimal(10,2) = 0
	declare @net decimal(10,2)

	-- exemptions
	declare @exemption decimal(10,2) = 50000
	declare @dependents_exemption decimal(10,2) = 25000

	-- sss/phic/hdmf
	declare @deductions decimal(10,2)


	if @empstatus_code = 'REG'
	begin
		-- set deductions according to position type
		-- these values are based from computations retrieved from payroll person
		-- refer to spreadsheet
		select @deductions =
			case when @positiontype_code in ('COO') then 11670.00 
				 when @positiontype_code in ('AM') then 10767.60
				 when @positiontype_code in ('DH') then 10332.00
				 when @positiontype_code in ('BM') then 9896.40
				 else 7605.60 -- staff
		end
		
		-- get net salary
		set @net = (@declared_salary * 12) - @deductions - (@exemption + (isnull(@dependents,0) * @dependents_exemption))
	
		-- tax rate
		select @withholding_tax =
				case when @net between 0.00 and 10000 then @net * 0.05
					 when @net between 10001 and 30000 then ((@net - 10000) * 0.10) + 500
					 when @net between 30001 and 70000 then ((@net - 30000) * 0.15) + 2500
					 when @net between 70001 and 140000 then ((@net - 70000) * 0.20) + 8500
					 when @net between 140001 and 250000 then ((@net - 140000) * 0.25) + 22500
					 when @net between 250001 and 500000 then ((@net - 250000) * 0.30) + 50000
					 else ((@net - 500000) * 0.32) + 125000
				end
	end

	if @withholding_tax < 0.00
		set @withholding_tax = 0.00

	return @withholding_tax / 23.00
END

GO
/****** Object:  UserDefinedFunction [dbo].[rpt_fn_get_concat_paf_allowances]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[rpt_fn_get_concat_paf_allowances]
(
	@paf_id int
	,@value_to_retrieve char(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @allowances_str varchar(250)
	declare @i int
	declare @cnt int
	declare @allowance_name varchar(100)
    declare @amount varchar(100)
    declare @empty char(25)
	declare @allowance table
	(
		pk integer primary key identity(1,1)
		,allowancetype_name varchar(100)
		,allowance_amount varchar(100)
	)
	
	insert into @allowance 
	select at.allowancetype_name,
		   convert(varchar,convert(money,pa.allowance_amount),1) allowance_amount
	  from pafallowance pa (nolock)
	  join t_allowancetype at (nolock)
	    on at.allowancetype_code = pa.allowancetype_code
	 where pa.paf_id = @paf_id
			
			
	select @cnt = count(pk) 
	  from @allowance
	
	set @i = 1
	set @allowances_str = ''
	-- set @empty = '               ';

	declare @start integer
	
	-- concatenate
	while @i <= @cnt
	begin
		select @allowance_name = allowancetype_name,
			   @amount = allowance_amount
		  from @allowance
		  where pk = @i
		
		if @i > 1 set @allowances_str = @allowances_str + char(13)
		
		if @value_to_retrieve = 'TYPE'
		begin
			-- set @allowances_str = @allowances_str + substring(@allowance_name + @empty,1,18)
			set @start = isnull(charindex(' Allowance',@allowance_name),0)
			if @start > 0
				set @allowances_str = @allowances_str + substring(@allowance_name,1,@start)
			else
				set @allowances_str = @allowances_str + @allowance_name
		end
		else if @value_to_retrieve = 'AMOUNT'
			set @allowances_str = @allowances_str + rtrim(@amount)
		
		set @i = @i + 1
	end 
	
	if @allowances_str = '' 
		set @allowances_str = ' - '

	return @allowances_str

END

GO
/****** Object:  UserDefinedFunction [dbo].[rpt_fn_get_payroll_deductions]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[rpt_fn_get_payroll_deductions]
(
	@id_num varchar(12),
	@payroll_code char(15),
	@value_to_retrieve char(10)
)
RETURNS varchar(250)
AS
BEGIN
	declare @deduction_str varchar(250)
	declare @i int
	declare @cnt int
	declare @deduction_name varchar(100)
    declare @amount varchar(100)
    declare @empty char(25)
	declare @deduction table
	(
		pk integer primary key identity(1,1),
		deductiontype_name varchar(100),
		deduction_amount varchar(100)
	)
	
	insert into @deduction 
	select coalesce(dt.display_name,dt.deductiontype_name),
	       (
				case when pd.deduction_amount > 0 then convert(varchar,convert(money,isnull(pd.deduction_amount,0.00)),1) else '-' end

		   ) allowance_amount
	  from t_deductiontype dt (nolock)
 left join (
				select d.deductiontype_code,
				       d.deduction_amount
				  from payrolldeduction d (nolock)
				 where d.id_num = @id_num
				   and d.payroll_code = @payroll_code
           ) pd 
	    on pd.deductiontype_code = dt.deductiontype_code
  order by dt.sort_order, dt.display_name, dt.deductiontype_name
			
			
	select @cnt = count(pk) 
	  from @deduction
	
	set @i = 1
	set @deduction_str = ''
	set @empty = '               ';

	declare @start integer
	
	-- concatenate
	while @i <= @cnt
	begin
		select @deduction_name = deductiontype_name,
			   @amount = deduction_amount
		  from @deduction
		 where pk = @i
		
		if @i > 1 set @deduction_str = @deduction_str + char(13)
		
		if @value_to_retrieve = 'TYPE'
			set @deduction_str = @deduction_str + substring(@deduction_name + @empty,1,18)
		else if @value_to_retrieve = 'AMOUNT'
			set @deduction_str = @deduction_str + rtrim(@amount)
		
		set @i = @i + 1
	end 
	
	return @deduction_str

END

GO
/****** Object:  UserDefinedFunction [dbo].[sync_fn_get_pk_event_object]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[sync_fn_get_pk_event_object]
(
	@event_object char(3)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	declare @pk_event_object int
	declare @max int

	-- Add the T-SQL statements to compute the return value here
	select @max = max(wmo.pk_event_object) 
      from wsmessageout wmo (nolock)
     where wmo.event_object = @event_object

	set @pk_event_object = ISNULL(@max,0) + 1
	
	-- Return the result of the function
	return @pk_event_object

END


GO
/****** Object:  Table [dbo].[activity]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[activity](
	[activity_id] [int] IDENTITY(1,1) NOT NULL,
	[activity_subject] [varchar](100) NOT NULL,
	[activity_description] [varchar](250) NULL,
	[activitytype_code] [char](3) NOT NULL,
	[activity_startdate] [datetime] NOT NULL,
	[activity_enddate] [datetime] NOT NULL,
	[activity_location] [varchar](100) NULL,
	[activity_resource] [varchar](100) NULL,
	[activitystatus_code] [char](3) NOT NULL,
	[is_cancelled] [smallint] NOT NULL,
 CONSTRAINT [PK_activity] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[activityemployee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[activityemployee](
	[activity_id] [int] NOT NULL,
	[employee_id] [varchar](12) NOT NULL,
 CONSTRAINT [PK_activityemployee] PRIMARY KEY CLUSTERED 
(
	[activity_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[area]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[area](
	[area_code] [char](3) NOT NULL,
	[area_name] [varchar](25) NOT NULL,
	[area_description] [varchar](250) NULL,
 CONSTRAINT [PK_area] PRIMARY KEY CLUSTERED 
(
	[area_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[department]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[department_code] [char](3) NOT NULL,
	[department_name] [varchar](50) NULL,
	[department_description] [varchar](250) NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[department_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtr]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtr](
	[dtr_id] [int] IDENTITY(1,1) NOT NULL,
	[location_code] [char](3) NULL,
	[remote_dtr_id] [int] NULL,
	[dtr_date] [date] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[time_in] [time](7) NOT NULL,
	[time_out] [time](7) NULL,
	[dtr_snapshot_in] [varchar](250) NULL,
	[dtr_snapshot_out] [varchar](250) NULL,
	[dtr_remarks] [varchar](250) NULL,
	[dtrstatus_code] [char](3) NOT NULL,
	[syncstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_dtr] PRIMARY KEY CLUSTERED 
(
	[dtr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtroverride]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtroverride](
	[dtr_date] [date] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[am_pm] [char](1) NOT NULL,
	[location_code] [char](3) NOT NULL,
	[time_in] [time](7) NULL,
	[time_out] [time](7) NULL,
	[override_reason_code] [char](3) NOT NULL,
	[overriden_by] [varchar](12) NOT NULL,
	[override_date] [datetime] NOT NULL,
	[is_cancelled] [smallint] NOT NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[syncstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_dtroverride_1] PRIMARY KEY CLUSTERED 
(
	[dtr_date] ASC,
	[id_num] ASC,
	[am_pm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtrovertime]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtrovertime](
	[dtr_date] [date] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[time_from] [time](7) NOT NULL,
	[time_until] [time](7) NOT NULL,
	[overtime_reason_code] [char](3) NOT NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[syncstatus_code] [char](3) NOT NULL,
	[timestatus_code] [char](3) NOT NULL,
	[status_changed_by] [varchar](12) NULL,
	[status_changed_date] [datetime] NULL,
 CONSTRAINT [PK_dtrovertime] PRIMARY KEY CLUSTERED 
(
	[dtr_date] ASC,
	[id_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtrundertime]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dtrundertime](
	[dtr_date] [date] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[time_from] [time](7) NOT NULL,
	[time_until] [time](7) NOT NULL,
	[undertime_reason_code] [char](3) NOT NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[syncstatus_code] [char](3) NOT NULL,
	[timestatus_code] [char](3) NOT NULL,
	[status_changed_by] [varchar](12) NULL,
	[status_changed_date] [datetime] NULL,
	[is_paid] [smallint] NOT NULL,
	[am_pm] [char](1) NOT NULL,
 CONSTRAINT [PK_dtrundertime] PRIMARY KEY CLUSTERED 
(
	[dtr_date] ASC,
	[id_num] ASC,
	[am_pm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empaddress]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empaddress](
	[empaddress_id] [int] IDENTITY(1,1) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[street] [varchar](100) NULL,
	[barangay] [varchar](50) NULL,
	[town_id] [int] NULL,
	[address_type] [char](1) NULL,
	[is_present] [smallint] NOT NULL,
 CONSTRAINT [PK_empaddress] PRIMARY KEY CLUSTERED 
(
	[empaddress_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empcontact]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empcontact](
	[empcontact_id] [int] IDENTITY(1,1) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[mobile_no] [varchar](25) NULL,
	[landline_no] [varchar](25) NULL,
	[email] [varchar](50) NULL,
	[contact_type] [char](1) NOT NULL,
	[is_present] [char](1) NOT NULL,
 CONSTRAINT [PK_empcont] PRIMARY KEY CLUSTERED 
(
	[empcontact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empeducation]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empeducation](
	[id_num] [varchar](12) NOT NULL,
	[attainment_code] [varchar](15) NOT NULL,
	[year_started] [smallint] NULL,
	[year_ended] [smallint] NULL,
	[school_code] [varchar](10) NULL,
	[course_code] [varchar](10) NULL,
 CONSTRAINT [PK_empeducation_1] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC,
	[attainment_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empemergency]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empemergency](
	[empemergency_id] [int] IDENTITY(1,1) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[em_name] [varchar](150) NULL,
	[em_address] [varchar](250) NULL,
	[em_relation] [varchar](25) NULL,
	[em_contact] [varchar](50) NULL,
	[em_email] [varchar](50) NULL,
 CONSTRAINT [PK_empemergency] PRIMARY KEY CLUSTERED 
(
	[empemergency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empfamily]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empfamily](
	[empfamily_id] [int] IDENTITY(1,1) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[ef_firstname] [varchar](50) NOT NULL,
	[ef_lastname] [varchar](50) NOT NULL,
	[ef_middlename] [varchar](50) NULL,
	[ef_birth_date] [datetime] NULL,
	[occupation_id] [int] NULL,
	[relation_id] [int] NOT NULL,
	[is_dependent] [smallint] NOT NULL,
	[is_deceased] [smallint] NOT NULL,
 CONSTRAINT [PK_empfamily] PRIMARY KEY CLUSTERED 
(
	[empfamily_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[emplocdept]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[emplocdept](
	[id_num] [varchar](12) NOT NULL,
	[location_code] [char](3) NOT NULL,
	[department_code] [char](3) NULL,
 CONSTRAINT [PK_emplocdept] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id_num] [varchar](12) NOT NULL,
	[employee_firstname] [varchar](50) NOT NULL,
	[employee_lastname] [varchar](50) NOT NULL,
	[employee_middlename] [varchar](50) NULL,
	[birth_date] [datetime] NULL,
	[birth_place] [varchar](150) NULL,
	[gender] [char](1) NULL,
	[religion_id] [int] NULL,
	[civil_status] [char](3) NULL,
	[marriage_date] [datetime] NULL,
	[height] [int] NULL,
	[weight] [int] NULL,
	[blood_type] [char](2) NULL,
	[tin] [varchar](12) NULL,
	[sss] [varchar](12) NULL,
	[hdmf] [varchar](12) NULL,
	[phic] [varchar](12) NULL,
	[drivers_license] [varchar](12) NULL,
	[is_inactive] [smallint] NULL,
	[pin] [char](2) NULL,
	[declare_dependents] [smallint] NULL,
	[is_external] [smallint] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empskill]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empskill](
	[id_num] [varchar](12) NOT NULL,
	[skill_id] [int] NOT NULL,
 CONSTRAINT [PK_empskill_1] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC,
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[group]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[group](
	[group_code] [char](3) NOT NULL,
	[group_name] [varchar](50) NOT NULL,
	[group_description] [varchar](250) NULL,
	[groupstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_group] PRIMARY KEY CLUSTERED 
(
	[group_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[groupemployee]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[groupemployee](
	[group_code] [char](3) NOT NULL,
	[employee_id] [varchar](12) NOT NULL,
	[id_num] [varchar](12) NULL,
 CONSTRAINT [PK_groupemployee] PRIMARY KEY CLUSTERED 
(
	[group_code] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[holiday]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[holiday](
	[holiday_id] [int] IDENTITY(1,1) NOT NULL,
	[holiday_year] [smallint] NULL,
	[holiday_month] [smallint] NOT NULL,
	[holiday_day] [smallint] NOT NULL,
	[holiday_name] [varchar](50) NOT NULL,
	[holiday_description] [varchar](250) NULL,
	[holidaytype_code] [char](3) NULL,
	[is_national] [smallint] NOT NULL,
	[holiday_remarks] [varchar](250) NULL,
	[is_recurring] [smallint] NOT NULL,
	[created_by] [char](3) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [char](3) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_holiday_1] PRIMARY KEY CLUSTERED 
(
	[holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[holidaylocation]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[holidaylocation](
	[holiday_id] [int] NOT NULL,
	[location_code] [char](3) NOT NULL,
 CONSTRAINT [PK_holidaylocation] PRIMARY KEY CLUSTERED 
(
	[holiday_id] ASC,
	[location_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[leave]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[leave](
	[leave_id] [int] IDENTITY(1,1) NOT NULL,
	[location_code] [char](3) NOT NULL,
	[leave_application_date] [datetime] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[leavetype_code] [char](3) NOT NULL,
	[justification] [varchar](50) NULL,
	[leaveappstatus_code] [char](3) NOT NULL,
	[leave_remarks] [varchar](250) NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[status_changed_by] [varchar](12) NULL,
	[status_changed_date] [datetime] NULL,
 CONSTRAINT [PK_leave_1] PRIMARY KEY CLUSTERED 
(
	[leave_id] ASC,
	[location_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[leavecredit]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[leavecredit](
	[year] [int] NOT NULL,
	[employee_id] [varchar](12) NOT NULL,
	[id_num] [varchar](12) NULL,
	[leavetype_code] [char](3) NOT NULL,
	[leave_credits] [int] NOT NULL,
 CONSTRAINT [PK_leavecredit_1] PRIMARY KEY CLUSTERED 
(
	[year] ASC,
	[employee_id] ASC,
	[leavetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[leavedetail]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[leavedetail](
	[leave_id] [int] NOT NULL,
	[location_code] [char](3) NOT NULL,
	[leave_date] [datetime] NOT NULL,
	[am_pm] [char](1) NULL,
	[is_paid] [smallint] NOT NULL,
	[leavestatus_code] [char](3) NOT NULL,
	[leavereason_code] [char](3) NOT NULL,
	[leave_remarks] [varchar](250) NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[status_changed_by] [varchar](12) NULL,
	[status_changed_date] [datetime] NULL,
 CONSTRAINT [PK_leavedetail_1] PRIMARY KEY CLUSTERED 
(
	[leave_id] ASC,
	[location_code] ASC,
	[leave_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
	[location_code] [char](3) NOT NULL,
	[location_name] [varchar](50) NOT NULL,
	[location_address] [varchar](150) NULL,
	[location_landline_no] [varchar](25) NULL,
	[location_mobile_no] [varchar](25) NULL,
	[location_email] [varchar](50) NULL,
	[locationtype_code] [char](3) NOT NULL,
	[area_code] [char](3) NULL,
	[is_inactive] [smallint] NOT NULL,
	[parent_location_code] [char](3) NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[location_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[locationallowancetype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[locationallowancetype](
	[location_code] [char](3) NOT NULL,
	[allowancetype_code] [char](3) NOT NULL,
	[allowance_amount] [decimal](10, 2) NULL,
	[valid_from] [datetime] NOT NULL,
	[valid_until] [datetime] NULL,
 CONSTRAINT [PK_locationallowance] PRIMARY KEY CLUSTERED 
(
	[allowancetype_code] ASC,
	[location_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[locationdepartment]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[locationdepartment](
	[location_code] [char](3) NOT NULL,
	[department_code] [char](3) NOT NULL,
 CONSTRAINT [PK_locationdepartment] PRIMARY KEY CLUSTERED 
(
	[location_code] ASC,
	[department_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paf]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paf](
	[paf_id] [int] IDENTITY(1,1) NOT NULL,
	[effective_date] [datetime] NOT NULL,
	[effective_until] [datetime] NULL,
	[id_num] [varchar](12) NOT NULL,
	[salary] [decimal](10, 2) NULL,
	[position_code] [char](3) NOT NULL,
	[empstatus_code] [char](3) NOT NULL,
	[posstatus_code] [char](3) NOT NULL,
	[location_code] [char](3) NOT NULL,
	[paf_remarks] [varchar](250) NULL,
	[rank_movement] [smallint] NOT NULL,
	[is_cancelled] [smallint] NOT NULL,
	[frequency_code] [char](3) NULL,
	[created_by] [varchar](12) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
	[department_code] [char](3) NULL,
	[pafstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_paf] PRIMARY KEY CLUSTERED 
(
	[paf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pafallowance]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pafallowance](
	[pafallowance_id] [int] IDENTITY(1,1) NOT NULL,
	[paf_id] [int] NOT NULL,
	[allowance_amount] [decimal](10, 2) NOT NULL,
	[allowancetype_code] [char](3) NOT NULL,
 CONSTRAINT [PK_pafallowance] PRIMARY KEY CLUSTERED 
(
	[pafallowance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pafcomponent]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pafcomponent](
	[paf_id] [int] NOT NULL,
	[pafcomp_type_code] [char](3) NOT NULL,
 CONSTRAINT [PK_pafcomponent] PRIMARY KEY CLUSTERED 
(
	[paf_id] ASC,
	[pafcomp_type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payroll]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payroll](
	[payroll_code] [char](15) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[number_of_days] [decimal](8, 2) NOT NULL,
	[undertime] [decimal](8, 2) NULL,
	[overtime] [decimal](8, 2) NULL,
	[leaves_with_pay] [decimal](8, 4) NULL,
	[leaves_without_pay] [decimal](8, 4) NULL,
	[skeletal] [decimal](8, 2) NULL,
	[dependents] [smallint] NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[declared_salary] [decimal](8, 2) NOT NULL,
	[remarks] [varchar](250) NULL,
 CONSTRAINT [PK_payroll_1] PRIMARY KEY CLUSTERED 
(
	[payroll_code] ASC,
	[id_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payrolladjustment]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payrolladjustment](
	[payroll_code] [char](15) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[adjustmenttype_code] [char](3) NOT NULL,
	[adjustment_amount] [decimal](10, 2) NOT NULL,
	[remarks] [varchar](250) NULL,
	[created_by] [varchar](12) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_payrolladjustment] PRIMARY KEY CLUSTERED 
(
	[payroll_code] ASC,
	[id_num] ASC,
	[adjustmenttype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payrollallowance]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payrollallowance](
	[payroll_code] [char](15) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[allowancetype_code] [char](3) NOT NULL,
	[allowance_amount] [decimal](10, 2) NOT NULL,
	[remarks] [varchar](250) NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_payrollallowance] PRIMARY KEY CLUSTERED 
(
	[payroll_code] ASC,
	[id_num] ASC,
	[allowancetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payrollcode]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payrollcode](
	[payroll_code] [char](15) NOT NULL,
	[payroll_from] [datetime2](0) NOT NULL,
	[payroll_until] [datetime2](0) NULL,
	[payrollstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_payrollcode_payroll_code] PRIMARY KEY CLUSTERED 
(
	[payroll_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payrolldeduction]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payrolldeduction](
	[payroll_code] [char](15) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[deductiontype_code] [char](3) NOT NULL,
	[deduction_amount] [decimal](10, 2) NOT NULL,
	[bcf_amount] [decimal](10, 2) NULL,
	[bcf_sub_location_code] [char](3) NULL,
	[remarks] [varchar](250) NULL,
	[modified_by] [varchar](12) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_payrolldeduction] PRIMARY KEY CLUSTERED 
(
	[payroll_code] ASC,
	[id_num] ASC,
	[deductiontype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roster]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roster](
	[roster_id] [int] IDENTITY(1,1) NOT NULL,
	[loc_dep_code] [char](3) NOT NULL,
	[resource_type_code] [char](3) NOT NULL,
	[roster_date] [date] NOT NULL,
	[rosterstatus_code] [char](3) NOT NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[initialised_by] [varchar](12) NULL,
	[initialised_date] [datetime] NULL,
	[finalised_by] [varchar](12) NULL,
	[finalised_date] [datetime] NULL,
	[syncstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_roster] PRIMARY KEY CLUSTERED 
(
	[roster_id] ASC,
	[loc_dep_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rosterdetail]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rosterdetail](
	[rd_id] [int] IDENTITY(1,1) NOT NULL,
	[remote_rd_id] [int] NULL,
	[roster_id] [int] NOT NULL,
	[loc_dep_code] [char](3) NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[parent_roster_id] [int] NULL,
	[change_reason] [varchar](250) NULL,
	[roster_remarks] [varchar](250) NULL,
	[created_by] [varchar](12) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[rdstatus_code] [char](3) NOT NULL,
	[status_changed_by] [varchar](12) NULL,
	[status_changed_date] [datetime] NULL,
	[syncstatus_code] [char](3) NOT NULL,
 CONSTRAINT [PK_rosterdetail_1] PRIMARY KEY CLUSTERED 
(
	[rd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysconfig]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysconfig](
	[sysconfig_code] [varchar](30) NOT NULL,
	[sysconfig_name] [varchar](50) NOT NULL,
	[sysconfig_description] [varchar](250) NULL,
	[sysconfig_value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sysconfig] PRIMARY KEY CLUSTERED 
(
	[sysconfig_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysprivilege]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysprivilege](
	[privilege_code] [varchar](30) NOT NULL,
	[privilege_name] [varchar](50) NOT NULL,
	[privilege_description] [varchar](250) NULL,
 CONSTRAINT [PK_sysprivilege] PRIMARY KEY CLUSTERED 
(
	[privilege_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysrole]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysrole](
	[role_code] [varchar](25) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
	[role_description] [varchar](250) NULL,
 CONSTRAINT [PK_sysrole] PRIMARY KEY CLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysrolelevel]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysrolelevel](
	[role_code] [varchar](25) NOT NULL,
	[level_code] [char](3) NOT NULL,
 CONSTRAINT [PK_sysrolelevel] PRIMARY KEY CLUSTERED 
(
	[role_code] ASC,
	[level_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysroleprivilege]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysroleprivilege](
	[role_code] [varchar](25) NOT NULL,
	[privilege_code] [varchar](30) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysupdate]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysupdate](
	[update_batch_no] [varchar](50) NOT NULL,
	[update_date] [date] NOT NULL,
	[update_priority] [int] NOT NULL,
	[destination_location] [char](3) NOT NULL,
	[update_string] [nvarchar](max) NOT NULL,
	[update_status] [char](3) NOT NULL,
 CONSTRAINT [PK_sysupdate] PRIMARY KEY CLUSTERED 
(
	[update_batch_no] ASC,
	[update_priority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuser]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysuser](
	[id_num] [varchar](12) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password] [varchar](15) NOT NULL,
 CONSTRAINT [PK_sysuser] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_sysuser] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuserrole]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysuserrole](
	[id_num] [varchar](12) NOT NULL,
	[role_code] [varchar](25) NOT NULL,
 CONSTRAINT [PK_sysuserrole] PRIMARY KEY CLUSTERED 
(
	[id_num] ASC,
	[role_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_accounttype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_accounttype](
	[accounttype_code] [char](3) NOT NULL,
	[accounttype_name] [varchar](25) NOT NULL,
	[accounttype_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_accounttype] PRIMARY KEY CLUSTERED 
(
	[accounttype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_activitystatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_activitystatus](
	[activitystatus_code] [char](3) NOT NULL,
	[activitystatus_name] [varchar](25) NOT NULL,
	[activitystatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_activitystatus] PRIMARY KEY CLUSTERED 
(
	[activitystatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_activitytype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_activitytype](
	[activitytype_code] [char](3) NOT NULL,
	[activitytype_name] [varchar](25) NOT NULL,
	[activitytype_description] [varchar](250) NULL,
	[activitytype_colour] [varchar](10) NULL,
	[is_log_required] [smallint] NOT NULL,
 CONSTRAINT [PK_t_activitytype] PRIMARY KEY CLUSTERED 
(
	[activitytype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_adjustmenttype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_adjustmenttype](
	[adjustmenttype_code] [char](3) NOT NULL,
	[adjustmenttype_name] [varchar](25) NOT NULL,
	[adjustmenttype_description] [varchar](250) NULL,
	[is_deduction] [smallint] NOT NULL,
 CONSTRAINT [PK_t_adjustmenttype] PRIMARY KEY CLUSTERED 
(
	[adjustmenttype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_allowancetype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_allowancetype](
	[allowancetype_code] [char](3) NOT NULL,
	[allowancetype_name] [varchar](25) NOT NULL,
	[allowancetype_description] [varchar](250) NULL,
	[is_voucher] [smallint] NOT NULL,
 CONSTRAINT [PK_t_allowancetype] PRIMARY KEY CLUSTERED 
(
	[allowancetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_course]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_course](
	[course_code] [varchar](10) NOT NULL,
	[course_name] [varchar](100) NOT NULL,
	[course_description] [varchar](250) NULL,
 CONSTRAINT [PK__t_course__8F1EF7AE0CA5D9DE] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_deductiontype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_deductiontype](
	[deductiontype_code] [char](3) NOT NULL,
	[deductiontype_name] [varchar](25) NOT NULL,
	[deductiontype_description] [varchar](250) NULL,
	[accounttype_code] [char](3) NULL,
	[is_required] [smallint] NOT NULL,
	[display_name] [varchar](25) NULL,
	[sort_order] [smallint] NULL,
	[has_bcf] [smallint] NOT NULL,
 CONSTRAINT [PK_t_deductiontype] PRIMARY KEY CLUSTERED 
(
	[deductiontype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_dtrstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_dtrstatus](
	[dtrstatus_code] [char](3) NOT NULL,
	[dtrstatus_name] [varchar](25) NOT NULL,
	[dtrstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_dtrstatus] PRIMARY KEY CLUSTERED 
(
	[dtrstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_educationalattainment]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_educationalattainment](
	[attainment_code] [varchar](15) NOT NULL,
	[attainment_name] [varchar](50) NOT NULL,
	[attainment_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_educationalattainment] PRIMARY KEY CLUSTERED 
(
	[attainment_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_empstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_empstatus](
	[empstatus_code] [char](3) NOT NULL,
	[empstatus_name] [varchar](25) NOT NULL,
	[empstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_empstatus] PRIMARY KEY CLUSTERED 
(
	[empstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_groupstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_groupstatus](
	[groupstatus_code] [char](3) NOT NULL,
	[groupstatus_name] [varchar](25) NOT NULL,
	[groupstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_groupstatus] PRIMARY KEY CLUSTERED 
(
	[groupstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_holidaytype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_holidaytype](
	[holidaytype_code] [char](3) NOT NULL,
	[holidaytype_name] [varchar](25) NOT NULL,
	[holidaytype_description] [varchar](250) NULL,
	[holiday_rate] [float] NOT NULL,
 CONSTRAINT [PK_t_holidaytype] PRIMARY KEY CLUSTERED 
(
	[holidaytype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_leaveapplicationstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_leaveapplicationstatus](
	[leaveappstatus_code] [char](3) NOT NULL,
	[leaveappstatus_name] [varchar](25) NOT NULL,
	[leaveappstatus_description] [varchar](250) NULL,
	[close_record] [smallint] NOT NULL,
 CONSTRAINT [PK_t_leaveapplicationstatus] PRIMARY KEY CLUSTERED 
(
	[leaveappstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_leavereason]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_leavereason](
	[leavereason_code] [char](3) NOT NULL,
	[leavereason_name] [varchar](50) NOT NULL,
	[leavereason_description] [varchar](250) NULL,
	[leavetype_code] [char](3) NOT NULL,
	[is_active] [smallint] NOT NULL,
 CONSTRAINT [PK_t_leavereason] PRIMARY KEY CLUSTERED 
(
	[leavereason_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_leavestatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_leavestatus](
	[leavestatus_code] [char](3) NOT NULL,
	[leavestatus_name] [varchar](25) NOT NULL,
	[leavestatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_leavestatus] PRIMARY KEY CLUSTERED 
(
	[leavestatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_leavetype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_leavetype](
	[leavetype_code] [char](3) NOT NULL,
	[leavetype_name] [varchar](25) NOT NULL,
	[leavetype_description] [varchar](250) NULL,
	[max_days] [float] NOT NULL,
 CONSTRAINT [PK_t_leavetype] PRIMARY KEY CLUSTERED 
(
	[leavetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_level]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_level](
	[level_code] [char](3) NOT NULL,
	[level_name] [varchar](25) NOT NULL,
	[level_description] [varchar](250) NULL,
	[rank] [tinyint] NOT NULL,
 CONSTRAINT [PK_t_level] PRIMARY KEY CLUSTERED 
(
	[level_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_locationtype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_locationtype](
	[locationtype_code] [char](3) NOT NULL,
	[locationtype_name] [varchar](50) NOT NULL,
	[locationtype_description] [varchar](150) NULL,
	[has_department] [smallint] NOT NULL,
 CONSTRAINT [PK_t_locationtype] PRIMARY KEY CLUSTERED 
(
	[locationtype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_occupation]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_occupation](
	[occupation_id] [int] IDENTITY(1,1) NOT NULL,
	[occupation_name] [varchar](50) NOT NULL,
	[occupation_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_occupation] PRIMARY KEY CLUSTERED 
(
	[occupation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_overridereason]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_overridereason](
	[override_reason_code] [char](3) NOT NULL,
	[override_reason_name] [varchar](25) NOT NULL,
	[override_reason_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_overridereason] PRIMARY KEY CLUSTERED 
(
	[override_reason_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_overtimereason]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_overtimereason](
	[overtime_reason_code] [char](3) NOT NULL,
	[overtime_reason_name] [varchar](25) NOT NULL,
	[overtime_reason_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_overtimereason] PRIMARY KEY CLUSTERED 
(
	[overtime_reason_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_pafcomptype]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_pafcomptype](
	[pafcomp_type_code] [char](3) NOT NULL,
	[pafcomp_type_name] [varchar](25) NOT NULL,
	[pafcomp_type_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_pafcomptype] PRIMARY KEY CLUSTERED 
(
	[pafcomp_type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_pafstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_pafstatus](
	[pafstatus_code] [char](3) NOT NULL,
	[pafstatus_name] [varchar](25) NOT NULL,
	[pafstatus_description] [varchar](50) NULL,
 CONSTRAINT [PK_t_pafstatus] PRIMARY KEY CLUSTERED 
(
	[pafstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_payrollstatus]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_payrollstatus](
	[payrollstatus_code] [char](3) NOT NULL,
	[payrollstatus_name] [varchar](25) NOT NULL,
	[payrollstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_payrollstatus] PRIMARY KEY CLUSTERED 
(
	[payrollstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_position]    Script Date: 11/07/2016 10:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_position](
	[position_code] [char](3) NOT NULL,
	[position_name] [varchar](25) NULL,
	[position_description] [varchar](250) NULL,
	[level_code] [char](3) NULL,
	[max_persons] [int] NULL,
	[positiontype_code] [char](3) NOT NULL,
 CONSTRAINT [PK_t_position] PRIMARY KEY CLUSTERED 
(
	[position_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_positionstatus]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_positionstatus](
	[posstatus_code] [char](3) NOT NULL,
	[posstatus_name] [varchar](25) NOT NULL,
	[posstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_positionstatus] PRIMARY KEY CLUSTERED 
(
	[posstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_positiontype]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_positiontype](
	[positiontype_code] [char](3) NOT NULL,
	[positiontype_name] [varchar](25) NOT NULL,
	[positiontype_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_positiontype] PRIMARY KEY CLUSTERED 
(
	[positiontype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_province]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_province](
	[province_id] [int] IDENTITY(1,1) NOT NULL,
	[province_name] [varchar](50) NOT NULL,
	[abbreviation] [varchar](10) NOT NULL,
 CONSTRAINT [PK_t_province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_t_province] UNIQUE NONCLUSTERED 
(
	[abbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_relation]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_relation](
	[relation_id] [int] IDENTITY(1,1) NOT NULL,
	[relation_name] [varchar](50) NOT NULL,
	[relation_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_relation] PRIMARY KEY CLUSTERED 
(
	[relation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_religion]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_religion](
	[religion_id] [int] IDENTITY(1,1) NOT NULL,
	[religion_name] [varchar](50) NULL,
	[religion_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_religion] PRIMARY KEY CLUSTERED 
(
	[religion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_rosterdetailstatus]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_rosterdetailstatus](
	[rdstatus_code] [char](3) NOT NULL,
	[rdstatus_name] [varchar](25) NOT NULL,
	[rdstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_rosterdetailstatus] PRIMARY KEY CLUSTERED 
(
	[rdstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_salaryfrequency]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_salaryfrequency](
	[frequency_code] [char](3) NOT NULL,
	[frequency_name] [varchar](25) NOT NULL,
	[frequency_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_salaryfrequency_1] PRIMARY KEY CLUSTERED 
(
	[frequency_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_school]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_school](
	[school_code] [varchar](10) NOT NULL,
	[school_name] [varchar](100) NOT NULL,
	[town_id] [int] NULL,
 CONSTRAINT [PK__t_school__27CA6CF408D548FA] PRIMARY KEY CLUSTERED 
(
	[school_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_skill]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_skill](
	[skill_id] [int] IDENTITY(1,1) NOT NULL,
	[skill_name] [varchar](50) NOT NULL,
	[skill_description] [varchar](250) NULL,
 CONSTRAINT [PK__t_skill__FBBA837922951AFD] PRIMARY KEY CLUSTERED 
(
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_syncstatus]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_syncstatus](
	[syncstatus_code] [char](3) NOT NULL,
	[syncstatus_name] [varchar](25) NULL,
	[syncstatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_sysncstatus] PRIMARY KEY CLUSTERED 
(
	[syncstatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_timestatus]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_timestatus](
	[timestatus_code] [char](3) NOT NULL,
	[timestatus_name] [varchar](25) NOT NULL,
	[timestatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_timestatus] PRIMARY KEY CLUSTERED 
(
	[timestatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_town]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_town](
	[town_id] [int] IDENTITY(1,1) NOT NULL,
	[town_name] [varchar](50) NOT NULL,
	[province_id] [int] NOT NULL,
 CONSTRAINT [PK_t_town] PRIMARY KEY CLUSTERED 
(
	[town_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_undertimereason]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_undertimereason](
	[undertime_reason_code] [char](3) NOT NULL,
	[undertime_reason_name] [varchar](25) NOT NULL,
	[undertime_reason_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_undertimereason] PRIMARY KEY CLUSTERED 
(
	[undertime_reason_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_wsmessagestatus]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_wsmessagestatus](
	[messagestatus_code] [char](3) NOT NULL,
	[messagestatus_name] [varchar](25) NOT NULL,
	[messagestatus_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_wsmessagestatus] PRIMARY KEY CLUSTERED 
(
	[messagestatus_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_wsmessagetype]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_wsmessagetype](
	[messagetype_code] [char](3) NOT NULL,
	[messagetype_name] [varchar](25) NOT NULL,
	[messagetype_description] [varchar](250) NULL,
 CONSTRAINT [PK_t_wsmessagetype] PRIMARY KEY CLUSTERED 
(
	[messagetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wsmessage]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wsmessage](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [varchar](30) NOT NULL,
	[ws_message] [varchar](max) NOT NULL,
	[ws_message_date] [datetime] NOT NULL,
	[source_location] [char](3) NOT NULL,
	[destination_location] [char](3) NOT NULL,
	[priority] [smallint] NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
	[last_transaction_date] [datetime] NOT NULL,
 CONSTRAINT [PK_wsmessage] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[source_location] ASC,
	[destination_location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wsmessagein]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wsmessagein](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [varchar](30) NOT NULL,
	[ws_message] [varchar](max) NULL,
	[ws_message_date] [datetime] NOT NULL,
	[source_location] [char](3) NOT NULL,
	[priority] [int] NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
	[last_transaction_date] [datetime] NOT NULL,
	[sync_attempts] [int] NOT NULL,
 CONSTRAINT [PK_wsmessagein] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[source_location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wsmessageout]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wsmessageout](
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [varchar](30) NOT NULL,
	[ws_message_date] [datetime] NOT NULL,
	[priority] [smallint] NULL,
	[destination_location] [char](3) NOT NULL,
	[messagetype_code] [char](3) NOT NULL,
	[messagestatus_code] [char](3) NOT NULL,
	[last_transaction_date] [datetime] NOT NULL,
 CONSTRAINT [PK_wsmessageout] PRIMARY KEY CLUSTERED 
(
	[event_object] ASC,
	[pk_event_object] ASC,
	[destination_location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtr]    Script Date: 11/07/2016 10:42:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtr] ON [dbo].[dtr]
(
	[location_code] ASC,
	[remote_dtr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [IX_dtr] ON [dbo].[dtr] DISABLE
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtr_idnum_date]    Script Date: 11/07/2016 10:42:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_dtr_idnum_date] ON [dbo].[dtr]
(
	[id_num] ASC,
	[dtr_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_leavecredit_year]    Script Date: 11/07/2016 10:42:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_leavecredit_year] ON [dbo].[leavecredit]
(
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[activity] ADD  CONSTRAINT [DF_activity_is_cancelled]  DEFAULT ((0)) FOR [is_cancelled]
GO
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtr_date]  DEFAULT (getdate()) FOR [dtr_date]
GO
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_dtrstatus_code]  DEFAULT ('OPN') FOR [dtrstatus_code]
GO
ALTER TABLE [dbo].[dtr] ADD  CONSTRAINT [DF_dtr_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[dtroverride] ADD  CONSTRAINT [DF_dtroverride_location_code]  DEFAULT ([dbo].[fn_get_sysconfig_value]('LOCATION_CODE')) FOR [location_code]
GO
ALTER TABLE [dbo].[dtroverride] ADD  CONSTRAINT [DF_dtroverride_override_date]  DEFAULT (getdate()) FOR [override_date]
GO
ALTER TABLE [dbo].[dtroverride] ADD  CONSTRAINT [DF_dtroverride_is_cancelled]  DEFAULT ((0)) FOR [is_cancelled]
GO
ALTER TABLE [dbo].[dtroverride] ADD  CONSTRAINT [DF_dtroverride_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[dtrovertime] ADD  CONSTRAINT [DF_dtrovertime_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[dtrovertime] ADD  CONSTRAINT [DF_dtrovertime_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[dtrovertime] ADD  CONSTRAINT [DF_dtrovertime_timestatus_code]  DEFAULT ('PND') FOR [timestatus_code]
GO
ALTER TABLE [dbo].[dtrundertime] ADD  CONSTRAINT [DF_dtrundertime_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[dtrundertime] ADD  CONSTRAINT [DF_dtrundertime_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[dtrundertime] ADD  CONSTRAINT [DF_dtrundertime_timestatus_code]  DEFAULT ('PND') FOR [timestatus_code]
GO
ALTER TABLE [dbo].[dtrundertime] ADD  CONSTRAINT [DF_dtrundertime_is_paid]  DEFAULT ((1)) FOR [is_paid]
GO
ALTER TABLE [dbo].[dtrundertime] ADD  CONSTRAINT [DF_dtrundertime_am_pm]  DEFAULT ('A') FOR [am_pm]
GO
ALTER TABLE [dbo].[empaddress] ADD  CONSTRAINT [DF_empaddress_address_type]  DEFAULT ('H') FOR [address_type]
GO
ALTER TABLE [dbo].[empaddress] ADD  CONSTRAINT [DF_empaddress_is_present]  DEFAULT ((0)) FOR [is_present]
GO
ALTER TABLE [dbo].[empcontact] ADD  CONSTRAINT [DF_empcontact_contact_type]  DEFAULT ('H') FOR [contact_type]
GO
ALTER TABLE [dbo].[empcontact] ADD  CONSTRAINT [DF_empcontact_is_present]  DEFAULT ((0)) FOR [is_present]
GO
ALTER TABLE [dbo].[empfamily] ADD  CONSTRAINT [DF_empfamily_is_dependent]  DEFAULT ((0)) FOR [is_dependent]
GO
ALTER TABLE [dbo].[empfamily] ADD  CONSTRAINT [DF_empfamily_is_deceased]  DEFAULT ((0)) FOR [is_deceased]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_Table_1_is_active]  DEFAULT ((0)) FOR [is_inactive]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_employee_declare_dependents]  DEFAULT ((0)) FOR [declare_dependents]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_employee_is_external]  DEFAULT ((0)) FOR [is_external]
GO
ALTER TABLE [dbo].[holiday] ADD  CONSTRAINT [DF_holiday_is_national]  DEFAULT ((0)) FOR [is_national]
GO
ALTER TABLE [dbo].[holiday] ADD  CONSTRAINT [DF_holiday_is_recurring]  DEFAULT ((0)) FOR [is_recurring]
GO
ALTER TABLE [dbo].[holiday] ADD  CONSTRAINT [DF_holiday_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[leave] ADD  CONSTRAINT [DF_leave_location_code]  DEFAULT ([dbo].[fn_get_sysconfig_value]('LOCATION_CODE')) FOR [location_code]
GO
ALTER TABLE [dbo].[leave] ADD  CONSTRAINT [DF_leave_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[leavedetail] ADD  CONSTRAINT [DF_leavedetail_is_paid]  DEFAULT ((1)) FOR [is_paid]
GO
ALTER TABLE [dbo].[leavedetail] ADD  CONSTRAINT [DF_leavedetail_leavestatus_code]  DEFAULT ('PND') FOR [leavestatus_code]
GO
ALTER TABLE [dbo].[leavedetail] ADD  CONSTRAINT [DF_leavedetail_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[location] ADD  CONSTRAINT [DF_location_is_inactive]  DEFAULT ((0)) FOR [is_inactive]
GO
ALTER TABLE [dbo].[locationallowancetype] ADD  CONSTRAINT [DF_locationallowancetype_valid_from]  DEFAULT (getdate()) FOR [valid_from]
GO
ALTER TABLE [dbo].[paf] ADD  CONSTRAINT [DF_paf_rank_movement]  DEFAULT ((0)) FOR [rank_movement]
GO
ALTER TABLE [dbo].[paf] ADD  CONSTRAINT [DF_paf_is_cancelled]  DEFAULT ((0)) FOR [is_cancelled]
GO
ALTER TABLE [dbo].[paf] ADD  CONSTRAINT [DF_paf_pafstatus_code]  DEFAULT ('PND') FOR [pafstatus_code]
GO
ALTER TABLE [dbo].[payrollcode] ADD  CONSTRAINT [DF__payrollco__payro__6B24EA82]  DEFAULT (NULL) FOR [payroll_until]
GO
ALTER TABLE [dbo].[roster] ADD  CONSTRAINT [DF_roster_rosterstatus_code]  DEFAULT ('RIP') FOR [rosterstatus_code]
GO
ALTER TABLE [dbo].[roster] ADD  CONSTRAINT [DF_roster_created_date_1]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[roster] ADD  CONSTRAINT [DF_roster_syncstatus_code_1]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[rosterdetail] ADD  CONSTRAINT [DF_roster_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[rosterdetail] ADD  CONSTRAINT [DF_rosterdetail_rdstatus_code]  DEFAULT ('ACT') FOR [rdstatus_code]
GO
ALTER TABLE [dbo].[rosterdetail] ADD  CONSTRAINT [DF_roster_syncstatus_code]  DEFAULT ('NS') FOR [syncstatus_code]
GO
ALTER TABLE [dbo].[t_activitytype] ADD  CONSTRAINT [DF_t_activitytype_is_login_required]  DEFAULT ((0)) FOR [is_log_required]
GO
ALTER TABLE [dbo].[t_adjustmenttype] ADD  CONSTRAINT [DF_t_adjustmenttype_is_deduction]  DEFAULT ((0)) FOR [is_deduction]
GO
ALTER TABLE [dbo].[t_allowancetype] ADD  CONSTRAINT [DF_t_allowancetype_is_voucher]  DEFAULT ((0)) FOR [is_voucher]
GO
ALTER TABLE [dbo].[t_deductiontype] ADD  CONSTRAINT [DF_t_deductiontype_is_required]  DEFAULT ((0)) FOR [is_required]
GO
ALTER TABLE [dbo].[t_deductiontype] ADD  CONSTRAINT [DF_t_deductiontype_has_bcf]  DEFAULT ((0)) FOR [has_bcf]
GO
ALTER TABLE [dbo].[t_leaveapplicationstatus] ADD  CONSTRAINT [DF_t_leaveapplicationstatus_is_closed]  DEFAULT ((0)) FOR [close_record]
GO
ALTER TABLE [dbo].[t_leavereason] ADD  CONSTRAINT [DF_t_leavereason_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[t_leavetype] ADD  CONSTRAINT [DF_t_leavetype_max_days]  DEFAULT ((0)) FOR [max_days]
GO
ALTER TABLE [dbo].[t_locationtype] ADD  CONSTRAINT [DF_t_locationtype_has_department]  DEFAULT ((0)) FOR [has_department]
GO
ALTER TABLE [dbo].[t_position] ADD  CONSTRAINT [DF_t_position_positiontype_code]  DEFAULT ('STF') FOR [positiontype_code]
GO
ALTER TABLE [dbo].[wsmessage] ADD  CONSTRAINT [DF_wsmessage_last_transaction_date]  DEFAULT (getdate()) FOR [last_transaction_date]
GO
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_is_synced]  DEFAULT ((0)) FOR [messagestatus_code]
GO
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_last_transaction_date]  DEFAULT (getdate()) FOR [last_transaction_date]
GO
ALTER TABLE [dbo].[wsmessagein] ADD  CONSTRAINT [DF_wsmessagein_sync_attempts]  DEFAULT ((0)) FOR [sync_attempts]
GO
ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [DF_wsmessageout_is_sent]  DEFAULT ((0)) FOR [messagestatus_code]
GO
ALTER TABLE [dbo].[wsmessageout] ADD  CONSTRAINT [DF_wsmessageout_last_transaction_date]  DEFAULT (getdate()) FOR [last_transaction_date]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_t_activitystatus] FOREIGN KEY([activitystatus_code])
REFERENCES [dbo].[t_activitystatus] ([activitystatus_code])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_t_activitystatus]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_t_activitytype] FOREIGN KEY([activitytype_code])
REFERENCES [dbo].[t_activitytype] ([activitytype_code])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_t_activitytype]
GO
ALTER TABLE [dbo].[activityemployee]  WITH CHECK ADD  CONSTRAINT [FK_activityemployee_activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[activity] ([activity_id])
GO
ALTER TABLE [dbo].[activityemployee] CHECK CONSTRAINT [FK_activityemployee_activity]
GO
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_employee]
GO
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_location]
GO
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_dtrstatus] FOREIGN KEY([dtrstatus_code])
REFERENCES [dbo].[t_dtrstatus] ([dtrstatus_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_dtrstatus]
GO
ALTER TABLE [dbo].[dtr]  WITH CHECK ADD  CONSTRAINT [FK_dtr_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[dtr] CHECK CONSTRAINT [FK_dtr_t_syncstatus]
GO
ALTER TABLE [dbo].[dtroverride]  WITH CHECK ADD  CONSTRAINT [FK_dtroverride_t_overridereason] FOREIGN KEY([override_reason_code])
REFERENCES [dbo].[t_overridereason] ([override_reason_code])
GO
ALTER TABLE [dbo].[dtroverride] CHECK CONSTRAINT [FK_dtroverride_t_overridereason]
GO
ALTER TABLE [dbo].[dtroverride]  WITH CHECK ADD  CONSTRAINT [FK_dtroverride_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[dtroverride] CHECK CONSTRAINT [FK_dtroverride_t_syncstatus]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_employee]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_sysuser]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_sysuser1] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_sysuser1]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_sysuser2] FOREIGN KEY([status_changed_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_sysuser2]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_t_overtimereason] FOREIGN KEY([overtime_reason_code])
REFERENCES [dbo].[t_overtimereason] ([overtime_reason_code])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_t_overtimereason]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_t_syncstatus]
GO
ALTER TABLE [dbo].[dtrovertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrovertime_t_timestatus] FOREIGN KEY([timestatus_code])
REFERENCES [dbo].[t_timestatus] ([timestatus_code])
GO
ALTER TABLE [dbo].[dtrovertime] CHECK CONSTRAINT [FK_dtrovertime_t_timestatus]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_employee]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_sysuser]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_sysuser1] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_sysuser1]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_sysuser2] FOREIGN KEY([status_changed_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_sysuser2]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_t_syncstatus]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_t_timestatus] FOREIGN KEY([timestatus_code])
REFERENCES [dbo].[t_timestatus] ([timestatus_code])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_t_timestatus]
GO
ALTER TABLE [dbo].[dtrundertime]  WITH CHECK ADD  CONSTRAINT [FK_dtrundertime_t_undertimereason] FOREIGN KEY([undertime_reason_code])
REFERENCES [dbo].[t_undertimereason] ([undertime_reason_code])
GO
ALTER TABLE [dbo].[dtrundertime] CHECK CONSTRAINT [FK_dtrundertime_t_undertimereason]
GO
ALTER TABLE [dbo].[empaddress]  WITH CHECK ADD  CONSTRAINT [FK_empaddress_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empaddress] CHECK CONSTRAINT [FK_empaddress_employee]
GO
ALTER TABLE [dbo].[empcontact]  WITH CHECK ADD  CONSTRAINT [FK_empcontact_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empcontact] CHECK CONSTRAINT [FK_empcontact_employee]
GO
ALTER TABLE [dbo].[empeducation]  WITH CHECK ADD  CONSTRAINT [FK_empeducation_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empeducation] CHECK CONSTRAINT [FK_empeducation_employee]
GO
ALTER TABLE [dbo].[empeducation]  WITH CHECK ADD  CONSTRAINT [FK_empeducation_t_course] FOREIGN KEY([course_code])
REFERENCES [dbo].[t_course] ([course_code])
GO
ALTER TABLE [dbo].[empeducation] CHECK CONSTRAINT [FK_empeducation_t_course]
GO
ALTER TABLE [dbo].[empeducation]  WITH CHECK ADD  CONSTRAINT [FK_empeducation_t_educationalattainment] FOREIGN KEY([attainment_code])
REFERENCES [dbo].[t_educationalattainment] ([attainment_code])
GO
ALTER TABLE [dbo].[empeducation] CHECK CONSTRAINT [FK_empeducation_t_educationalattainment]
GO
ALTER TABLE [dbo].[empeducation]  WITH CHECK ADD  CONSTRAINT [FK_empeducation_t_school] FOREIGN KEY([school_code])
REFERENCES [dbo].[t_school] ([school_code])
GO
ALTER TABLE [dbo].[empeducation] CHECK CONSTRAINT [FK_empeducation_t_school]
GO
ALTER TABLE [dbo].[empemergency]  WITH CHECK ADD  CONSTRAINT [FK_empemergency_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empemergency] CHECK CONSTRAINT [FK_empemergency_employee]
GO
ALTER TABLE [dbo].[empfamily]  WITH CHECK ADD  CONSTRAINT [FK_empfamily_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empfamily] CHECK CONSTRAINT [FK_empfamily_employee]
GO
ALTER TABLE [dbo].[empfamily]  WITH CHECK ADD  CONSTRAINT [FK_empfamily_t_occupation] FOREIGN KEY([occupation_id])
REFERENCES [dbo].[t_occupation] ([occupation_id])
GO
ALTER TABLE [dbo].[empfamily] CHECK CONSTRAINT [FK_empfamily_t_occupation]
GO
ALTER TABLE [dbo].[empfamily]  WITH CHECK ADD  CONSTRAINT [FK_empfamily_t_relation] FOREIGN KEY([relation_id])
REFERENCES [dbo].[t_relation] ([relation_id])
GO
ALTER TABLE [dbo].[empfamily] CHECK CONSTRAINT [FK_empfamily_t_relation]
GO
ALTER TABLE [dbo].[emplocdept]  WITH CHECK ADD  CONSTRAINT [FK_emplocdept_department] FOREIGN KEY([department_code])
REFERENCES [dbo].[department] ([department_code])
GO
ALTER TABLE [dbo].[emplocdept] CHECK CONSTRAINT [FK_emplocdept_department]
GO
ALTER TABLE [dbo].[emplocdept]  WITH CHECK ADD  CONSTRAINT [FK_emplocdept_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[emplocdept] CHECK CONSTRAINT [FK_emplocdept_employee]
GO
ALTER TABLE [dbo].[emplocdept]  WITH CHECK ADD  CONSTRAINT [FK_emplocdept_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
GO
ALTER TABLE [dbo].[emplocdept] CHECK CONSTRAINT [FK_emplocdept_location]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_t_religion] FOREIGN KEY([religion_id])
REFERENCES [dbo].[t_religion] ([religion_id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_t_religion]
GO
ALTER TABLE [dbo].[empskill]  WITH CHECK ADD  CONSTRAINT [FK_empskill_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empskill] CHECK CONSTRAINT [FK_empskill_employee]
GO
ALTER TABLE [dbo].[empskill]  WITH CHECK ADD  CONSTRAINT [FK_empskill_t_skill] FOREIGN KEY([skill_id])
REFERENCES [dbo].[t_skill] ([skill_id])
GO
ALTER TABLE [dbo].[empskill] CHECK CONSTRAINT [FK_empskill_t_skill]
GO
ALTER TABLE [dbo].[group]  WITH CHECK ADD  CONSTRAINT [FK_group_t_groupstatus] FOREIGN KEY([groupstatus_code])
REFERENCES [dbo].[t_groupstatus] ([groupstatus_code])
GO
ALTER TABLE [dbo].[group] CHECK CONSTRAINT [FK_group_t_groupstatus]
GO
ALTER TABLE [dbo].[groupemployee]  WITH CHECK ADD  CONSTRAINT [FK_groupemployee_group] FOREIGN KEY([group_code])
REFERENCES [dbo].[group] ([group_code])
GO
ALTER TABLE [dbo].[groupemployee] CHECK CONSTRAINT [FK_groupemployee_group]
GO
ALTER TABLE [dbo].[holiday]  WITH CHECK ADD  CONSTRAINT [FK_holiday_t_holidaytype] FOREIGN KEY([holidaytype_code])
REFERENCES [dbo].[t_holidaytype] ([holidaytype_code])
GO
ALTER TABLE [dbo].[holiday] CHECK CONSTRAINT [FK_holiday_t_holidaytype]
GO
ALTER TABLE [dbo].[holidaylocation]  WITH CHECK ADD  CONSTRAINT [FK_holidaylocation_holiday] FOREIGN KEY([holiday_id])
REFERENCES [dbo].[holiday] ([holiday_id])
GO
ALTER TABLE [dbo].[holidaylocation] CHECK CONSTRAINT [FK_holidaylocation_holiday]
GO
ALTER TABLE [dbo].[holidaylocation]  WITH CHECK ADD  CONSTRAINT [FK_holidaylocation_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
GO
ALTER TABLE [dbo].[holidaylocation] CHECK CONSTRAINT [FK_holidaylocation_location]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_employee]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_sysuser]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_sysuser1] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_sysuser1]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_sysuser2] FOREIGN KEY([status_changed_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_sysuser2]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_t_leaveapplicationstatus] FOREIGN KEY([leaveappstatus_code])
REFERENCES [dbo].[t_leaveapplicationstatus] ([leaveappstatus_code])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_t_leaveapplicationstatus]
GO
ALTER TABLE [dbo].[leave]  WITH CHECK ADD  CONSTRAINT [FK_leave_t_leavetype] FOREIGN KEY([leavetype_code])
REFERENCES [dbo].[t_leavetype] ([leavetype_code])
GO
ALTER TABLE [dbo].[leave] CHECK CONSTRAINT [FK_leave_t_leavetype]
GO
ALTER TABLE [dbo].[leavecredit]  WITH CHECK ADD  CONSTRAINT [FK_leavecredit_t_leavetype] FOREIGN KEY([leavetype_code])
REFERENCES [dbo].[t_leavetype] ([leavetype_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[leavecredit] CHECK CONSTRAINT [FK_leavecredit_t_leavetype]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_leave] FOREIGN KEY([leave_id], [location_code])
REFERENCES [dbo].[leave] ([leave_id], [location_code])
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_leave]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_sysuser]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_sysuser1] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_sysuser1]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_sysuser2] FOREIGN KEY([status_changed_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_sysuser2]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_t_leavereason] FOREIGN KEY([leavereason_code])
REFERENCES [dbo].[t_leavereason] ([leavereason_code])
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_t_leavereason]
GO
ALTER TABLE [dbo].[leavedetail]  WITH CHECK ADD  CONSTRAINT [FK_leavedetail_t_leavestatus] FOREIGN KEY([leavestatus_code])
REFERENCES [dbo].[t_leavestatus] ([leavestatus_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[leavedetail] CHECK CONSTRAINT [FK_leavedetail_t_leavestatus]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_location_area] FOREIGN KEY([area_code])
REFERENCES [dbo].[area] ([area_code])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_location_area]
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD  CONSTRAINT [FK_location_t_locationtype] FOREIGN KEY([locationtype_code])
REFERENCES [dbo].[t_locationtype] ([locationtype_code])
GO
ALTER TABLE [dbo].[location] CHECK CONSTRAINT [FK_location_t_locationtype]
GO
ALTER TABLE [dbo].[locationallowancetype]  WITH CHECK ADD  CONSTRAINT [FK_locationallowancetype_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
GO
ALTER TABLE [dbo].[locationallowancetype] CHECK CONSTRAINT [FK_locationallowancetype_location]
GO
ALTER TABLE [dbo].[locationallowancetype]  WITH CHECK ADD  CONSTRAINT [FK_locationallowancetype_t_allowancetype] FOREIGN KEY([allowancetype_code])
REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
GO
ALTER TABLE [dbo].[locationallowancetype] CHECK CONSTRAINT [FK_locationallowancetype_t_allowancetype]
GO
ALTER TABLE [dbo].[locationdepartment]  WITH CHECK ADD  CONSTRAINT [FK_locationdepartment_department] FOREIGN KEY([department_code])
REFERENCES [dbo].[department] ([department_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[locationdepartment] CHECK CONSTRAINT [FK_locationdepartment_department]
GO
ALTER TABLE [dbo].[locationdepartment]  WITH CHECK ADD  CONSTRAINT [FK_locationdepartment_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[locationdepartment] CHECK CONSTRAINT [FK_locationdepartment_location]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_department] FOREIGN KEY([department_code])
REFERENCES [dbo].[department] ([department_code])
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_department]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_employee]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_location] FOREIGN KEY([location_code])
REFERENCES [dbo].[location] ([location_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_location]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_t_empstatus] FOREIGN KEY([empstatus_code])
REFERENCES [dbo].[t_empstatus] ([empstatus_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_t_empstatus]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_t_pafstatus] FOREIGN KEY([pafstatus_code])
REFERENCES [dbo].[t_pafstatus] ([pafstatus_code])
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_t_pafstatus]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_t_positionstatus] FOREIGN KEY([posstatus_code])
REFERENCES [dbo].[t_positionstatus] ([posstatus_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_t_positionstatus]
GO
ALTER TABLE [dbo].[paf]  WITH CHECK ADD  CONSTRAINT [FK_paf_t_salaryfrequency] FOREIGN KEY([frequency_code])
REFERENCES [dbo].[t_salaryfrequency] ([frequency_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[paf] CHECK CONSTRAINT [FK_paf_t_salaryfrequency]
GO
ALTER TABLE [dbo].[pafallowance]  WITH CHECK ADD  CONSTRAINT [FK_pafallowance_pafallowance] FOREIGN KEY([paf_id])
REFERENCES [dbo].[paf] ([paf_id])
GO
ALTER TABLE [dbo].[pafallowance] CHECK CONSTRAINT [FK_pafallowance_pafallowance]
GO
ALTER TABLE [dbo].[pafallowance]  WITH CHECK ADD  CONSTRAINT [FK_pafallowance_t_allowancetype] FOREIGN KEY([allowancetype_code])
REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[pafallowance] CHECK CONSTRAINT [FK_pafallowance_t_allowancetype]
GO
ALTER TABLE [dbo].[pafcomponent]  WITH CHECK ADD  CONSTRAINT [FK_pafcomponent_paf] FOREIGN KEY([paf_id])
REFERENCES [dbo].[paf] ([paf_id])
GO
ALTER TABLE [dbo].[pafcomponent] CHECK CONSTRAINT [FK_pafcomponent_paf]
GO
ALTER TABLE [dbo].[pafcomponent]  WITH CHECK ADD  CONSTRAINT [FK_pafcomponent_t_pafcomptype] FOREIGN KEY([pafcomp_type_code])
REFERENCES [dbo].[t_pafcomptype] ([pafcomp_type_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[pafcomponent] CHECK CONSTRAINT [FK_pafcomponent_t_pafcomptype]
GO
ALTER TABLE [dbo].[payroll]  WITH CHECK ADD  CONSTRAINT [FK_payroll_payrollcode] FOREIGN KEY([payroll_code])
REFERENCES [dbo].[payrollcode] ([payroll_code])
GO
ALTER TABLE [dbo].[payroll] CHECK CONSTRAINT [FK_payroll_payrollcode]
GO
ALTER TABLE [dbo].[payrolladjustment]  WITH CHECK ADD  CONSTRAINT [FK_payrolladjustment_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[payrolladjustment] CHECK CONSTRAINT [FK_payrolladjustment_employee]
GO
ALTER TABLE [dbo].[payrolladjustment]  WITH CHECK ADD  CONSTRAINT [FK_payrolladjustment_payrollcode] FOREIGN KEY([payroll_code])
REFERENCES [dbo].[payrollcode] ([payroll_code])
GO
ALTER TABLE [dbo].[payrolladjustment] CHECK CONSTRAINT [FK_payrolladjustment_payrollcode]
GO
ALTER TABLE [dbo].[payrolladjustment]  WITH CHECK ADD  CONSTRAINT [FK_payrolladjustment_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[payrolladjustment] CHECK CONSTRAINT [FK_payrolladjustment_sysuser]
GO
ALTER TABLE [dbo].[payrolladjustment]  WITH CHECK ADD  CONSTRAINT [FK_payrolladjustment_t_adjustmenttype] FOREIGN KEY([adjustmenttype_code])
REFERENCES [dbo].[t_adjustmenttype] ([adjustmenttype_code])
GO
ALTER TABLE [dbo].[payrolladjustment] CHECK CONSTRAINT [FK_payrolladjustment_t_adjustmenttype]
GO
ALTER TABLE [dbo].[payrollallowance]  WITH CHECK ADD  CONSTRAINT [FK_payrollallowance_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[payrollallowance] CHECK CONSTRAINT [FK_payrollallowance_employee]
GO
ALTER TABLE [dbo].[payrollallowance]  WITH CHECK ADD  CONSTRAINT [FK_payrollallowance_payrollcode] FOREIGN KEY([payroll_code])
REFERENCES [dbo].[payrollcode] ([payroll_code])
GO
ALTER TABLE [dbo].[payrollallowance] CHECK CONSTRAINT [FK_payrollallowance_payrollcode]
GO
ALTER TABLE [dbo].[payrollallowance]  WITH CHECK ADD  CONSTRAINT [FK_payrollallowance_sysuser] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[payrollallowance] CHECK CONSTRAINT [FK_payrollallowance_sysuser]
GO
ALTER TABLE [dbo].[payrollallowance]  WITH CHECK ADD  CONSTRAINT [FK_payrollallowance_t_allowancetype] FOREIGN KEY([allowancetype_code])
REFERENCES [dbo].[t_allowancetype] ([allowancetype_code])
GO
ALTER TABLE [dbo].[payrollallowance] CHECK CONSTRAINT [FK_payrollallowance_t_allowancetype]
GO
ALTER TABLE [dbo].[payrollcode]  WITH CHECK ADD  CONSTRAINT [payroll$fk_payrollcode_status] FOREIGN KEY([payrollstatus_code])
REFERENCES [dbo].[t_payrollstatus] ([payrollstatus_code])
GO
ALTER TABLE [dbo].[payrollcode] CHECK CONSTRAINT [payroll$fk_payrollcode_status]
GO
ALTER TABLE [dbo].[payrolldeduction]  WITH CHECK ADD  CONSTRAINT [FK_payrolldeduction_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[payrolldeduction] CHECK CONSTRAINT [FK_payrolldeduction_employee]
GO
ALTER TABLE [dbo].[payrolldeduction]  WITH CHECK ADD  CONSTRAINT [FK_payrolldeduction_location] FOREIGN KEY([bcf_sub_location_code])
REFERENCES [dbo].[location] ([location_code])
GO
ALTER TABLE [dbo].[payrolldeduction] CHECK CONSTRAINT [FK_payrolldeduction_location]
GO
ALTER TABLE [dbo].[payrolldeduction]  WITH CHECK ADD  CONSTRAINT [FK_payrolldeduction_payrollcode] FOREIGN KEY([payroll_code])
REFERENCES [dbo].[payrollcode] ([payroll_code])
GO
ALTER TABLE [dbo].[payrolldeduction] CHECK CONSTRAINT [FK_payrolldeduction_payrollcode]
GO
ALTER TABLE [dbo].[payrolldeduction]  WITH CHECK ADD  CONSTRAINT [FK_payrolldeduction_sysuser] FOREIGN KEY([modified_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[payrolldeduction] CHECK CONSTRAINT [FK_payrolldeduction_sysuser]
GO
ALTER TABLE [dbo].[payrolldeduction]  WITH CHECK ADD  CONSTRAINT [FK_payrolldeduction_t_deductiontype] FOREIGN KEY([deductiontype_code])
REFERENCES [dbo].[t_deductiontype] ([deductiontype_code])
GO
ALTER TABLE [dbo].[payrolldeduction] CHECK CONSTRAINT [FK_payrolldeduction_t_deductiontype]
GO
ALTER TABLE [dbo].[roster]  WITH CHECK ADD  CONSTRAINT [FK_roster_t_syncstatus1] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[roster] CHECK CONSTRAINT [FK_roster_t_syncstatus1]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_roster_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_roster_employee]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_roster_t_syncstatus] FOREIGN KEY([syncstatus_code])
REFERENCES [dbo].[t_syncstatus] ([syncstatus_code])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_roster_t_syncstatus]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_rosterdetail_roster] FOREIGN KEY([roster_id], [loc_dep_code])
REFERENCES [dbo].[roster] ([roster_id], [loc_dep_code])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_rosterdetail_roster]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_rosterdetail_sysuser] FOREIGN KEY([created_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_rosterdetail_sysuser]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_rosterdetail_sysuser1] FOREIGN KEY([status_changed_by])
REFERENCES [dbo].[sysuser] ([id_num])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_rosterdetail_sysuser1]
GO
ALTER TABLE [dbo].[rosterdetail]  WITH CHECK ADD  CONSTRAINT [FK_rosterdetail_t_rosterdetailstatus] FOREIGN KEY([rdstatus_code])
REFERENCES [dbo].[t_rosterdetailstatus] ([rdstatus_code])
GO
ALTER TABLE [dbo].[rosterdetail] CHECK CONSTRAINT [FK_rosterdetail_t_rosterdetailstatus]
GO
ALTER TABLE [dbo].[sysrolelevel]  WITH CHECK ADD  CONSTRAINT [FK_sysrolelevel_sysrole] FOREIGN KEY([role_code])
REFERENCES [dbo].[sysrole] ([role_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sysrolelevel] CHECK CONSTRAINT [FK_sysrolelevel_sysrole]
GO
ALTER TABLE [dbo].[sysrolelevel]  WITH CHECK ADD  CONSTRAINT [FK_sysrolelevel_t_level] FOREIGN KEY([level_code])
REFERENCES [dbo].[t_level] ([level_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sysrolelevel] CHECK CONSTRAINT [FK_sysrolelevel_t_level]
GO
ALTER TABLE [dbo].[sysroleprivilege]  WITH CHECK ADD  CONSTRAINT [FK_sysroleprivilege_sysprivilege] FOREIGN KEY([privilege_code])
REFERENCES [dbo].[sysprivilege] ([privilege_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sysroleprivilege] CHECK CONSTRAINT [FK_sysroleprivilege_sysprivilege]
GO
ALTER TABLE [dbo].[sysroleprivilege]  WITH CHECK ADD  CONSTRAINT [FK_sysroleprivilege_sysrole] FOREIGN KEY([role_code])
REFERENCES [dbo].[sysrole] ([role_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sysroleprivilege] CHECK CONSTRAINT [FK_sysroleprivilege_sysrole]
GO
ALTER TABLE [dbo].[sysuser]  WITH CHECK ADD  CONSTRAINT [FK_sysuser_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[sysuser] CHECK CONSTRAINT [FK_sysuser_employee]
GO
ALTER TABLE [dbo].[sysuserrole]  WITH CHECK ADD  CONSTRAINT [FK_sysuserrole_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO
ALTER TABLE [dbo].[sysuserrole] CHECK CONSTRAINT [FK_sysuserrole_employee]
GO
ALTER TABLE [dbo].[sysuserrole]  WITH CHECK ADD  CONSTRAINT [FK_sysuserrole_sysrole] FOREIGN KEY([role_code])
REFERENCES [dbo].[sysrole] ([role_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sysuserrole] CHECK CONSTRAINT [FK_sysuserrole_sysrole]
GO
ALTER TABLE [dbo].[t_deductiontype]  WITH CHECK ADD  CONSTRAINT [FK_t_deductiontype_t_accounttype] FOREIGN KEY([accounttype_code])
REFERENCES [dbo].[t_accounttype] ([accounttype_code])
GO
ALTER TABLE [dbo].[t_deductiontype] CHECK CONSTRAINT [FK_t_deductiontype_t_accounttype]
GO
ALTER TABLE [dbo].[t_leavereason]  WITH CHECK ADD  CONSTRAINT [FK_t_leavereason_t_leavetype] FOREIGN KEY([leavetype_code])
REFERENCES [dbo].[t_leavetype] ([leavetype_code])
GO
ALTER TABLE [dbo].[t_leavereason] CHECK CONSTRAINT [FK_t_leavereason_t_leavetype]
GO
ALTER TABLE [dbo].[t_position]  WITH CHECK ADD  CONSTRAINT [FK_t_position_t_level] FOREIGN KEY([level_code])
REFERENCES [dbo].[t_level] ([level_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[t_position] CHECK CONSTRAINT [FK_t_position_t_level]
GO
ALTER TABLE [dbo].[t_position]  WITH CHECK ADD  CONSTRAINT [FK_t_position_t_positiontype] FOREIGN KEY([positiontype_code])
REFERENCES [dbo].[t_positiontype] ([positiontype_code])
GO
ALTER TABLE [dbo].[t_position] CHECK CONSTRAINT [FK_t_position_t_positiontype]
GO
ALTER TABLE [dbo].[t_school]  WITH CHECK ADD  CONSTRAINT [FK_t_school_t_town] FOREIGN KEY([town_id])
REFERENCES [dbo].[t_town] ([town_id])
GO
ALTER TABLE [dbo].[t_school] CHECK CONSTRAINT [FK_t_school_t_town]
GO
ALTER TABLE [dbo].[t_town]  WITH CHECK ADD  CONSTRAINT [FK_t_town_t_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[t_province] ([province_id])
GO
ALTER TABLE [dbo].[t_town] CHECK CONSTRAINT [FK_t_town_t_province]
GO
ALTER TABLE [dbo].[wsmessage]  WITH CHECK ADD  CONSTRAINT [FK_wsmessage_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessage] CHECK CONSTRAINT [FK_wsmessage_t_wsmessagestatus]
GO
ALTER TABLE [dbo].[wsmessage]  WITH CHECK ADD  CONSTRAINT [FK_wsmessage_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessage] CHECK CONSTRAINT [FK_wsmessage_t_wsmessagetype]
GO
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagestatus]
GO
ALTER TABLE [dbo].[wsmessagein]  WITH CHECK ADD  CONSTRAINT [FK_wsmessagein_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessagein] CHECK CONSTRAINT [FK_wsmessagein_t_wsmessagetype]
GO
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagestatus] FOREIGN KEY([messagestatus_code])
REFERENCES [dbo].[t_wsmessagestatus] ([messagestatus_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagestatus]
GO
ALTER TABLE [dbo].[wsmessageout]  WITH CHECK ADD  CONSTRAINT [FK_wsmessageout_t_wsmessagetype] FOREIGN KEY([messagetype_code])
REFERENCES [dbo].[t_wsmessagetype] ([messagetype_code])
GO
ALTER TABLE [dbo].[wsmessageout] CHECK CONSTRAINT [FK_wsmessageout_t_wsmessagetype]
GO
/****** Object:  Trigger [dbo].[tr_set_location_code]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_set_location_code] 
		   ON  [dbo].[dtr]
		   AFTER INSERT
		AS 
		BEGIN
		    -- this is a test
		    
			declare @location_code char(3),
					@id_num varchar(12),
					@use_paf_location varchar(30)
					
			select @location_code = location_code,
				   @id_num = id_num
			  from inserted
			  
			if ISNULL(@location_code,'') = '' 
			begin
				-- check if paf table exists
				if (exists (select 1
							  from INFORMATION_SCHEMA.TABLES 
							 where TABLE_SCHEMA = 'dbo' 
							   and  TABLE_NAME = 'paf'))
				begin
					-- get the location from paf
					select top 1 @location_code = location_code 
					  from paf p (nolock)
					 where p.id_num = @id_num
					   and ISNULL(is_cancelled,0) = 0
				  order by p.effective_date desc
				end
				else
				begin
					set @use_paf_location = isnull(dbo.fn_get_sysconfig_value('USE_PAF_LOCATION'),0)
					
					if ISNULL(@use_paf_location,0) = 0
						set @location_code = dbo.fn_get_sysconfig_value('LOCATION_CODE')
					else
						set @location_code = null
				end

				update dtr
					   set location_code = @location_code
					 where dtr_id = (select dtr_id 
		   							   from inserted)
			end
		END

GO
/****** Object:  Trigger [dbo].[tr_set_remote_dtr_id]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_set_remote_dtr_id]
   ON  [dbo].[dtr]
   AFTER insert
AS 
BEGIN
	declare @remote_dtr_id int
	
	select @remote_dtr_id = remote_dtr_id 
	  from inserted
	   
	if ISNULL(@remote_dtr_id,0) = 0
	begin                   
		update dtr
		   set remote_dtr_id = dtr_id
		 where dtr_id = (select dtr_id 
						   from inserted)
	end
END

GO
/****** Object:  Trigger [dbo].[tr_sync_override]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_sync_override]
   ON  [dbo].[dtroverride]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @pk_event_object varchar(30)

	if exists (select * from deleted)
	begin
		select @pk_event_object = (convert(varchar(8),dtr_date,112)) + am_pm + cast(id_num as varchar)
		  from deleted
	end
	else
	begin
		select @pk_event_object = (convert(varchar(8),dtr_date,112)) + am_pm + cast(id_num as varchar)
		  from inserted
	end
		  	
	if exists(select 1 from wsmessageout where event_object = 'OVT' and pk_event_object = @pk_event_object)
	begin
		update wsmessageout
		   set messagestatus_code = 'QUE',
			   messagetype_code = 'SYN',
			   last_transaction_date = GETDATE()
		 where event_object = 'OVR'
		   and pk_event_object = @pk_event_object
	end
	else
	begin
		-- insert into wmessageout
		insert into wsmessageout
		select 'OVR',
			   @pk_event_object,
			   GETDATE(),
			   0,
			   'SVR',
			   'SYN',
			   'QUE',
			   GETDATE()
		  from inserted
	end

END

GO
/****** Object:  Trigger [dbo].[tr_sync_undertime]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_sync_undertime]
   ON  [dbo].[dtrundertime]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @pk_event_object varchar(30)

	if exists (select * from deleted)
	begin
		select @pk_event_object = (convert(varchar(8),dtr_date,112)) + am_pm + cast(id_num as varchar)
		  from deleted
	end
	else
	begin
		select @pk_event_object = (convert(varchar(8),dtr_date,112)) + am_pm + cast(id_num as varchar)
		  from inserted
	end
		  	
	if exists(select 1 from wsmessageout where event_object = 'UDT' and pk_event_object = @pk_event_object)
	begin
		update wsmessageout
		   set messagestatus_code = 'QUE',
			   messagetype_code = 'SYN',
			   last_transaction_date = GETDATE()
		 where event_object = 'UDT'
		   and pk_event_object = @pk_event_object
	end
	else
	begin
		-- insert into wmessageout
		insert into wsmessageout
		select 'UDT',
			   @pk_event_object,
			   GETDATE(),
			   0,
			   'SVR',
			   'SYN',
			   'QUE',
			   GETDATE()
		  from inserted
	end

END

GO
/****** Object:  Trigger [dbo].[tr_set_pin]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_set_pin]
   ON  [dbo].[employee]
   AFTER INSERT
AS 
BEGIN
	declare @id_num varchar(12),
	        @pin char(2)
	
	select @id_num = id_num,
	       @pin = pin
	  from inserted 
	
	if ISNULL(@pin,'') = ''
      update employee 
         set pin = SUBSTRING(id_num,1,2)
       where id_num = @id_num

END

GO
/****** Object:  Trigger [dbo].[tr_sync_leave]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_sync_leave]
   ON  [dbo].[leave]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- Note: This trigger is for Kiosk ONLY!!! Do not deploy to SERVER

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @leave_id integer

	if exists (select * from deleted)
	begin
		select @leave_id = leave_id
		  from deleted

		update wsmessageout
		   set messagestatus_code = 'QUE',
		       messagetype_code = 'SYN',
			   last_transaction_date = GETDATE()
		 where event_object = 'LVE'
		   and pk_event_object = @leave_id	
	end
	else
	begin
		select @leave_id = leave_id 
		  from inserted

		-- insert into wmsessageout
		insert into wsmessageout
		values ('LVE',
				@leave_id,
				GETDATE(),
				0,
				'SVR',
				'SYN',
				'QUE',
				GETDATE())
	end

	
END

GO
/****** Object:  Trigger [dbo].[tr_sync_leavedetail]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_sync_leavedetail]
   ON  [dbo].[leavedetail]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- Note: This trigger is for Kiosk ONLY!!! Do not deploy to SERVER

	declare @pk_event_object varchar(30)

	if exists (select * from deleted)
	begin
		select @pk_event_object = (convert(varchar(8),leave_date,112)) + cast(leave_id as varchar)
		  from deleted
	end
	else
	begin
		select @pk_event_object = (convert(varchar(8),leave_date,112)) + cast(leave_id as varchar)
		  from inserted
	end
		  	
	if exists(select 1 from wsmessageout where event_object = 'LVD' and pk_event_object = @pk_event_object)
	begin
		update wsmessageout
		   set messagestatus_code = 'QUE',
			   messagetype_code = 'SYN',
			   last_transaction_date = GETDATE()
		 where event_object = 'LVD'
		   and pk_event_object = @pk_event_object
	end
	else
	begin
		-- insert into wmessageout
		insert into wsmessageout
		select 'LVD',
			   (convert(varchar(8),leave_date,112)) + cast(leave_id as varchar),
			   GETDATE(),
			   0,
			   'SVR',
			   'SYN',
			   'QUE',
			   GETDATE()
		  from inserted
	end

	
END

GO
/****** Object:  Trigger [dbo].[tr_rank_movement]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_rank_movement] 
   ON  [dbo].[paf] 
   AFTER INSERT
AS 
BEGIN
    declare @paf_id int,
            @id_num int,
            @old_position char(3),
	        @new_position char(3),
	        @old_rank int,
	        @new_rank int,
	        @rank_movement int,
	        @initial int
	
	-- get details of inserted PAF        
	select @paf_id = paf_id,
		   @id_num = id_num,
		   @new_position = position_code
      from inserted
      
    -- get rank of new position
    select @new_rank = "rank"
      from t_level l (nolock)
      join t_position p (nolock) on p.level_code = l.level_code
     where p.position_code = @new_position
     
    -- check if paf is initial
    select @initial = COUNT(paf_id)
      from paf pf (nolock) 
     where pf.id_num = @id_num
       and isnull(pf.is_cancelled,0) = 0
     
    if @initial = 1 set @old_rank = @new_rank
    else
    begin 
		-- get previous position
		select top 1 @old_position = pf.position_code 
		  from paf pf (nolock)
		 where pf.id_num = @id_num
		   and pf.paf_id <> @paf_id
		   and isnull(pf.is_cancelled,0) = 0
	  order by pf.effective_date desc, pf.paf_id desc
	  
		-- get rank of previous position
		select @old_rank = "rank"
		  from t_level l (nolock)
		  join t_position p (nolock) on p.level_code = l.level_code
		 where p.position_code = @old_position
	end
	 
	-- compare rank
	if @new_rank = @old_rank set @rank_movement = 0 -- no change
	else if @new_rank > @old_rank set @rank_movement = -1 -- demotion
	else set @rank_movement = 1 -- promotion
	
	-- update rank_movement column of INSERTED paf
	update paf
	   set rank_movement = @rank_movement
	 where paf_id = @paf_id 

END

GO
/****** Object:  Trigger [dbo].[tr_set_remote_rd_id]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_set_remote_rd_id]
   ON  [dbo].[rosterdetail]
   AFTER insert
AS 
BEGIN
	declare @remote_rd_id int
	
	select @remote_rd_id = remote_rd_id 
	  from inserted
		   
	if ISNULL(@remote_rd_id,0) = 0
	begin                   
		update rosterdetail
		   set remote_rd_id = rd_id
		 where rd_id = (select rd_id 
						   from inserted)
	end
END

GO
/****** Object:  Trigger [dbo].[tr_delete_synched_record]    Script Date: 11/07/2016 10:42:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_delete_synched_record]
   ON  [dbo].[wsmessageout]
   AFTER update
AS 
BEGIN
	declare @eventObject char(3),
			@pkEventObject varchar(3),
			@messageStatusCode char(3)
			
	select @eventObject = event_object,
		   @pkEventObject = pk_event_object,
		   @messageStatusCode = messagestatus_code
	  from inserted
	
	if @eventObject = 'DTR'  
	begin
	    -- update the corresponding record
	    if @messageStatusCode = 'SYN'
	    begin
			update dtr
			   set syncstatus_code = 'SYN'
			 where dtr_id = cast(@pkEventObject as int)
		end
		
		-- then delete from the wsmessageout table
		delete wsmessageout
		 where event_object = @eventObject
		   and pk_event_object = @pkEventObject
	end
	else
	begin
		delete wsmessageout
		 where event_object = @eventObject
		   and pk_event_object = @pkEventObject
	end
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H = Home; P = Present' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empaddress', @level2type=N'COLUMN',@level2name=N'address_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H = Home; P = Present' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empcontact', @level2type=N'COLUMN',@level2name=N'contact_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sets the allowance for the specified location. Null means users need to set this values when adding a new paf record.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'locationallowancetype', @level2type=N'COLUMN',@level2name=N'allowance_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1 Demotion; 0 No change; 1 Promotion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paf', @level2type=N'COLUMN',@level2name=N'rank_movement'
GO
USE [master]
GO
ALTER DATABASE [HRIS_Dev] SET  READ_WRITE 
GO
