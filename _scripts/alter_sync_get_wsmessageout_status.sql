USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[sync_get_wsmessageout_status]    Script Date: 03/25/2015 17:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sync_get_wsmessageout_status] 
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
