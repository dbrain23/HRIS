USE [HRIS]
GO
/****** Object:  Trigger [dbo].[tr_rank_movement]    Script Date: 10/07/2013 06:32:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[tr_rank_movement] 
   ON  [dbo].[paf] 
   AFTER INSERT
AS 
BEGIN
    declare @paf_id int,
            @employee_id int,
            @old_position char(3),
	        @new_position char(3),
	        @old_rank int,
	        @new_rank int,
	        @rank_movement int,
	        @initial int
	
	-- get details of inserted PAF        
	select @paf_id = paf_id,
		   @employee_id = employee_id,
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
     where pf.employee_id = @employee_id
       and isnull(pf.is_cancelled,0) = 0
     
    if @initial = 1 set @old_rank = @new_rank
    else
    begin 
		-- get previous position
		select top 1 @old_position = pf.position_code 
		  from paf pf (nolock)
		 where pf.employee_id = @employee_id
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
