USE [HRIS]
GO

/****** Object:  StoredProcedure [dbo].[dtr_get_by_date]    Script Date: 02/17/2014 06:21:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_by_date]
	@dtr_date date
AS
BEGIN
	select *
	  from dtr (nolock)
     where dtr.dtr_date = @dtr_date 
END

GO


