CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtctdt_Dang_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtctdt_tbl].* , [dm_cud].cud 
    FROM [qtctdt_tbl]
    LEFT JOIN [dm_cud] 
    ON [dm_cud].ma_cud = [qtctdt_tbl].ma_cv
    WHERE [qtctdt_tbl].shcc = @shcc AND qtctdt_tbl.lcd =2
END
GO

CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtctdt_Doan_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtctdt_tbl].* , [dm_cu].cu 
    FROM [qtctdt_tbl]
    LEFT JOIN [dm_cu] 
    ON [dm_cu].ma_cu = [qtctdt_tbl].ma_cv
    WHERE [qtctdt_tbl].shcc = @shcc AND qtctdt_tbl.lcd =1
END

GO

CREATE PROCEDURE [dbo].[sp_view_by_shcc_baohiem93]
@shcc int
AS
BEGIN
SET NOCOUNT ON;
SELECT baohiem93.*
FROM baohiem93
WHERE baohiem93.shcc = @shcc
END

