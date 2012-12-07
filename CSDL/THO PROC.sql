--------
CREATE PROC sp_view_by_page_qtdtcm_tbl
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * 
	FROM (
		SELECT csdtcm, COUNT(csdtcm) AS num
		FROM qtdtcm_tbl
		GROUP BY csdtcm
	) AS temp
	WHERE csdtcm IN (
		SELECT csdtcm
		FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY csdtcm ASC) AS Row, csdtcm
			FROM (
				SELECT csdtcm, COUNT(csdtcm) AS num
				FROM qtdtcm_tbl
				GROUP BY csdtcm
			) AS _temp) AS tempTable
		WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	
	SELECT @Total = COUNT(*) FROM qtdtcm_tbl
GO

CREATE PROC sp_update_csdtcm_qtdtcm
	@old_csdtcm			NVARCHAR(100),
	@new_csdtcm			NVARCHAR(100)
AS
	UPDATE qtdtcm_tbl SET
		csdtcm = @new_csdtcm
	WHERE csdtcm = @old_csdtcm
GO

CREATE PROC sp_count_csdtcm
AS
	SELECT COUNT(*) AS num 
	FROM (
		SELECT csdtcm, COUNT(csdtcm) AS num
		FROM qtdtcm_tbl
		GROUP BY csdtcm
	) AS temp
GO

-----