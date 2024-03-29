USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[hris_get_paf]    Script Date: 10/07/2013 06:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[hris_get_paf]
	@paf_id int
AS
BEGIN
	select p.paf_id,
		   p.effective_date,
		   p.effective_until,
		   p.employee_id,
		   p.salary,
		   p.position_code,
		   p.empstatus_code,
		   p.posstatus_code,
		   p.branch_code,
		   p.paf_remarks,
		   (case p.is_cancelled when 0 then p.rank_movement else -2 end) rank_movement,
		   p.is_cancelled
	  from paf p (nolock)
	 where paf_id = @paf_id
END
