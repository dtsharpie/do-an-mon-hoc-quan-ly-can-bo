USE [hutstaff_9_8]
GO
/****** Object:  StoredProcedure [dbo].[sp_view_by_parent_dm_dv]    Script Date: 11/1/2012 8:29:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_view_by_parent_dm_dv]
	@parentCode nvarchar(6) = '0',
	@level int = 1
AS
	SELECT * 
	FROM dm_dv
	WHERE ma_dv like @parentCode + '%'
	AND LEN(ma_dv) = 2 * @level
