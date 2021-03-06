USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[dtr_import_dtr]    Script Date: 05/08/2014 05:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[dtr_import_dtr]
AS
BEGIN
	declare @branch_code char(3)
	
	if OBJECT_ID('tempdb..##dtr') IS NOT NULL
	begin
		select top 1
			   @branch_code = branch_code
		  from ##dtr
			
		insert 
		  into dtr
				(branch_code,
				remote_dtr_id,
				dtr_date,
				employee_id,
				time_in,
				time_out,
				dtr_snapshot_in,
				dtr_snapshot_out,
				dtr_remarks,
				dtrstatus_code)
		 select dt.branch_code,
				dt.dtr_id,
				dt.dtr_date,
				dt.employee_id,
				dt.time_in,
				dt.time_out,
				dt.dtr_snapshot_in,
				dt.dtr_snapshot_out,
				dt.dtr_remarks,
				'IMP'
		   from ##dtr dt
	  left join dtr d (nolock) on d.remote_dtr_id = dt.dtr_id and d.branch_code = @branch_code
		  where ISNULL(d.dtr_id,0) = 0
     end
END
