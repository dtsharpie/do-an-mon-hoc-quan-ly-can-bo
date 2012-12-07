USE hutstaff_9_8
GO

CREATE PROC sp_find_by_iShcc_qtdbl_tbl
	@iShcc INT
AS
	SELECT * FROM qtdbl_tbl WHERE shcc = @iShcc
GO