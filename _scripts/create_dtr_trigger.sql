GO

/****** Object:  Trigger [dbo].[tr_set_location_code]    Script Date: 03/27/2015 12:13:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_set_location_code] 
   ON  [dbo].[dtr]
   AFTER INSERT
AS 
BEGIN
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


