USE [HRIS]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_get_sysconfig_value]    Script Date: 05/08/2014 05:00:27 ******/
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

insert into sysconfig values ('BRANCH_CODE', 'Branch code', 'Branch code', 'CO ')

GO


