
CREATE FUNCTION dbo.fn_get_next_leave_id
(
	
)
RETURNS integer
AS
BEGIN
	-- Declare the return variable here
	declare @leave_id integer

	set @leave_id = (select max(leave_id)
					  from leave 
					 where location_code = 'SVR')

   return @leave_id + 1  
END
GO

