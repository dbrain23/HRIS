USE [HRIS]
GO

/****** Object:  UserDefinedFunction [dbo].[dtr_fn_get_total_hours]    Script Date: 05/08/2014 05:13:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[dtr_fn_get_total_hours]
(
	@time_in time,
	@time_out time
)
RETURNS decimal(4,2)
AS
BEGIN
	declare @total_hours decimal(4,2)

	-- morning
	if (@time_in < '12:00:00')
	begin
		if (@time_in < '08:11:00')
			set @time_in = '08:00:00'
		
		if (isnull(@time_out,@time_in) > '12:00:00')
			set @time_out = '12:00:00'
		else if (isnull(@time_out,@time_in) < '08:11:00')
			set @time_out = @time_in
	end	
	else
	-- afternoon
	begin 
		if (@time_in < '13:11:00')
			set @time_in = '13:00:00'
		else if (@time_in > '17:00:00')
			set @time_in = '17:00:00'	
			
		if (isnull(@time_out,@time_in) > '17:00:00')
			set @time_out = '17:00:00'
		else if (isnull(@time_out,@time_in) < '13:11:00')
			set @time_out = @time_in
	end
	
	set @total_hours = DATEDIFF(minute,@time_in,isnull(@time_out,@time_in)) / 60.0

	return isnull(@total_hours,0)
END

GO


