USE hutstaff_9_8
GO
/* Bang 40: nndd_tbl nước ngoài đã đi*/

CREATE PROC sp_insert_nndd
		@shcc			INT,
		@nd_nndd		DATETIME,
		@nv_nndd		DATETIME,
		@ndd			INT,
		@dc_nndd		NVARCHAR(100),
		@md_nndd		INT,
		@dg_nndd		NVARCHAR(100),
		@ttk_nndd		NVARCHAR(255),
		@nkp_nndd		INT,
		@tt_nndd		Nvarchar(50)
AS
	INSERT INTO nndd_tbl(shcc, nd_nndd, nv_nndd, ndd, dc_nndd, md_nndd, dg_nndd, ttk_nndd, nkp_nndd, tt_nndd) VALUES
	(
		@shcc, @nd_nndd, @nv_nndd, @ndd, @dc_nndd, @md_nndd, @dg_nndd, @ttk_nndd, @nkp_nndd, @tt_nndd
	)
GO

CREATE PROC sp_update_nndd
		@id				INT,
		@nd_nndd		DATETIME,
		@nv_nndd		DATETIME,
		@ndd			INT,
		@dc_nndd		NVARCHAR(100),
		@md_nndd		INT,
		@dg_nndd		NVARCHAR(100),
		@ttk_nndd		NVARCHAR(255),
		@nkp_nndd		INT,
		@tt_nndd		Nvarchar(50)
AS
	UPDATE nndd_tbl SET
		nd_nndd = @nd_nndd,
		nv_nndd = @nv_nndd,
		ndd = @ndd,
		dc_nndd = @dc_nndd,
		md_nndd = @md_nndd,
		dg_nndd = @dg_nndd,
		ttk_nndd = @ttk_nndd,
		nkp_nndd = @nkp_nndd,
		tt_nndd = @tt_nndd
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_nndd
	@id INT
AS
	SELECT * FROM nndd_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_nndd
AS
	SELECT * FROM nndd_tbl
GO

CREATE PROC sp_view_by_page_nndd
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM nndd_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY nd_nndd ASC) AS Row, id 
			FROM  nndd_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM nndd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_nndd
	@shcc INT
AS
	SELECT * FROM nndd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_nndd
	@id INT
AS
	DELETE FROM nndd_tbl WHERE id = @id
GO

/* Bang 41: qhgd_tbl Bảng quan hệ gia đình của cán bộ */

CREATE PROC sp_insert_qhgd
		@shcc			INT,
		@qhgd			INT,
		@ht_qhgd		NVARCHAR(50),
		@ns_qhgd		DATETIME,
		@nn_qhgd		NVARCHAR(100),
		@cv_qhgd		NVARCHAR(70),
		@no_qhgd		NVARCHAR(100),
		@nct_qhgd		NVARCHAR(100),
		@qt_qhgd		INT,
		@ndc_qhgd		INT,
		@ttk_qhgd		Nvarchar(255)
AS
	INSERT INTO qhgd_tbl(shcc, qhgd, ht_qhgd, ns_qhgd, nn_qhgd, cv_qhgd, no_qhgd, nct_qhgd, qt_qhgd, ndc_qhgd, ttk_qhgd) VALUES
	(
		@shcc, @qhgd, @ht_qhgd, @ns_qhgd, @nn_qhgd, @cv_qhgd, @no_qhgd, @nct_qhgd, @qt_qhgd, @ndc_qhgd, @ttk_qhgd
	)
GO

CREATE PROC sp_update_qhgd
		@id				INT,
		@qhgd			INT,
		@ht_qhgd		NVARCHAR(50),
		@ns_qhgd		DATETIME,
		@nn_qhgd		NVARCHAR(100),
		@cv_qhgd		NVARCHAR(70),
		@no_qhgd		NVARCHAR(100),
		@nct_qhgd		NVARCHAR(100),
		@qt_qhgd		INT,
		@ndc_qhgd		INT,
		@ttk_qhgd		Nvarchar(255)
AS
	UPDATE qhgd_tbl SET
		qhgd = @qhgd,
		ht_qhgd = @ht_qhgd,
		ns_qhgd = @ns_qhgd,
		nn_qhgd = @nn_qhgd,
		cv_qhgd = @cv_qhgd,
		no_qhgd = @no_qhgd,
		nct_qhgd = @nct_qhgd,
		qt_qhgd = @qt_qhgd,
		ndc_qhgd = @ndc_qhgd,
		ttk_qhgd = @ttk_qhgd
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qhgd
	@id INT
AS
	SELECT * FROM qhgd_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qhgd
AS
	SELECT * FROM qhgd_tbl
GO

CREATE PROC sp_view_by_page_qhgd
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qhgd_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id ASC) AS Row, id 
			FROM  qhgd_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qhgd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qhgd
	@shcc INT
AS
	SELECT * FROM qhgd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qhgd
	@id INT
AS
	DELETE FROM qhgd_tbl WHERE id = @id
GO

/* Bang 42: qtbd_tbl  Bảng quy trình bồi dưỡng của cán bộ */

CREATE PROC sp_insert_qtbd
		@shcc			INT,
		@tgbd_bd		DATETIME,
		@tgkt_bd		DATETIME,
		@ndbd			NVARCHAR(250),
		@htbd			INT,
		@nbd_qtbd		NVARCHAR(100),
		@vbbd			NVARCHAR(20),
		@dg_qtbd		NVARCHAR(100),
		@ttk_qtbd		Nvarchar(255)
AS
	INSERT INTO qtbd_tbl (shcc, tgbd_bd, tgkt_bd, ndbd, htbd, nbd_qtbd, vbbd, dg_qtbd, ttk_qtbd) VALUES
	(
		@shcc, @tgbd_bd, @tgkt_bd, @ndbd, @htbd, @nbd_qtbd, @vbbd, @dg_qtbd, @ttk_qtbd
	)
GO

CREATE PROC sp_update_qtbd
		@id				INT,
		@tgbd_bd		DATETIME,
		@tgkt_bd		DATETIME,
		@ndbd			NVARCHAR(250),
		@htbd			INT,
		@nbd_qtbd		NVARCHAR(100),
		@vbbd			NVARCHAR(20),
		@dg_qtbd		NVARCHAR(100),
		@ttk_qtbd		Nvarchar(255)
AS
	UPDATE qtbd_tbl SET
		tgbd_bd = @tgbd_bd,
		tgkt_bd = @tgkt_bd,
		ndbd = @ndbd,
		htbd = @htbd,
		nbd_qtbd = @nbd_qtbd,
		vbbd = @vbbd,
		dg_qtbd = @dg_qtbd,
		ttk_qtbd = @ttk_qtbd
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtbd
	@id INT
AS
	SELECT * FROM qtbd_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtbd
AS
	SELECT * FROM qtbd_tbl
GO

CREATE PROC sp_view_by_page_qtbd
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qhgd_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY tgbd_bd ASC) AS Row, id 
			FROM  qtbd_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtbd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtbd
	@shcc INT
AS
	SELECT * FROM qtbd_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtbd
	@id INT
AS
	DELETE FROM qtbd_tbl WHERE id = @id
GO

/* Bang 44: qtct_tbl  Bảng quá trình công tác của cán bộ */

CREATE PROC sp_insert_qtct
		@shcc			INT,
		@tgbd_qtct		DATETIME,
		@tgkt_qtct		DATETIME,
		@dvct			NVARCHAR(255),
		@cvct			INT,
		@cvdn			INT,
		@dgqtct			NVARCHAR(20),
		@dg_qtbd		NVARCHAR(100),
		@ttk_qtct		Nvarchar(255),
		@bctdv			NVARCHAR(255),
		@nlv			NVARCHAR(255),
		@ma_dcb			INT
AS
	INSERT INTO qtct_tbl (shcc, tgbd_qtct, tgkt_qtct, dvct, cvct, cvdn, dgqtct, dg_qtbd, ttk_qtct, bctdv, nlv, ma_dcb) VALUES
	(
		@shcc, @tgbd_qtct, @tgkt_qtct, @dvct, @cvct, @cvdn, @dgqtct, @dg_qtbd, @ttk_qtct, @bctdv, @nlv, @ma_dcb
	)
GO

CREATE PROC sp_update_qtct
		@id				INT,
		@tgbd_qtct		DATETIME,
		@tgkt_qtct		DATETIME,
		@dvct			NVARCHAR(255),
		@cvct			INT,
		@cvdn			INT,
		@dgqtct			NVARCHAR(20),
		@dg_qtbd		NVARCHAR(100),
		@ttk_qtct		Nvarchar(255),
		@bctdv			NVARCHAR(255),
		@nlv			NVARCHAR(255),
		@ma_dcb			INT
AS
	UPDATE qtct_tbl SET
		tgbd_qtct = @tgbd_qtct,
		tgkt_qtct = @tgkt_qtct,
		dvct = @dvct,
		cvct = @cvct,
		cvdn = @cvdn,
		dgqtct = @dgqtct,
		dg_qtbd = @dg_qtbd,
		ttk_qtct = @ttk_qtct,
		bctdv = @bctdv,
		nlv = @nlv,
		ma_dcb = @ma_dcb
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtct
	@id INT
AS
	SELECT * FROM qtct_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtct
AS
	SELECT * FROM qtct_tbl
GO

CREATE PROC sp_view_by_page_qtct
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtct_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY tgbd_qtct ASC) AS Row, id 
			FROM  qtct_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtct_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtct
	@shcc INT
AS
	SELECT * FROM qtct_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtct
	@id INT
AS
	DELETE FROM qtct_tbl WHERE id = @id
GO


/* Bang 45: qtctdt_tbl  Bảng quá trình công tác đoàn thể của cán bộ */

CREATE PROC sp_insert_qtctdt
		@shcc			INT,
		@ma_cv			INT,
		@nbncvdt		DATETIME,
		@nktcvdt		DATETIME,
		@ttk_qtct		NVARCHAR(255),
		@lcd			TINYINT
AS
	INSERT INTO qtctdt_tbl (shcc, ma_cv, nbncvdt, nktcvdt, ttk_qtct, lcd) VALUES
	(
		@shcc, @ma_cv, @nbncvdt, @nktcvdt, @ttk_qtct, @lcd
	)
GO

CREATE PROC sp_update_qtctdt
		@id				INT,
		@ma_cv			INT,
		@nbncvdt		DATETIME,
		@nktcvdt		DATETIME,
		@ttk_qtct		NVARCHAR(255),
		@lcd			TINYINT
AS
	UPDATE qtctdt_tbl SET
		ma_cv = @ma_cv,
		nbncvdt = @nbncvdt,
		nktcvdt = @nktcvdt,
		ttk_qtct = @ttk_qtct,
		lcd = @lcd
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtctdt
	@id INT
AS
	SELECT * FROM qtctdt_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtctdt
AS
	SELECT * FROM qtctdt_tbl
GO

CREATE PROC sp_view_by_page_qtctdt
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtctdt_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY nbncvdt ASC) AS Row, id 
			FROM  qtctdt_tbl WHERE shcc = @shcc ) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtctdt_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtctdt
	@shcc INT
AS
	SELECT * FROM qtctdt_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtctdt
	@id INT
AS
	DELETE FROM qtctdt_tbl WHERE id = @id
GO

/* Bang 46: qtcvkn_tbl  Bảng công việc kiêm nhiệm quản lý */

CREATE PROC sp_insert_qtcvkn
		@shcc			INT,
		@ma_cv			INT,
		@nbncvkn		DATETIME,
		@nktcvkn		DATETIME,
		@ttk_qtct		NVARCHAR(255),
		@donvi			NVARCHAR(255)
AS
	INSERT INTO qtcvkn_tbl (shcc, ma_cv, nbncvkn, nktcvkn, ttk_qtct, donvi) VALUES
	(
		@shcc, @ma_cv, @nbncvkn, @nktcvkn, @ttk_qtct, @donvi
	)
GO

CREATE PROC sp_update_qtcvkn
		@id				INT,
		@ma_cv			INT,
		@nbncvkn		DATETIME,
		@nktcvkn		DATETIME,
		@ttk_qtct		NVARCHAR(255),
		@donvi			NVARCHAR(255)
AS
	UPDATE qtcvkn_tbl SET
		ma_cv = @ma_cv,
		nbncvkn = @nbncvkn,
		nktcvkn = @nktcvkn,
		ttk_qtct = @ttk_qtct,
		donvi = @donvi
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtcvkn
	@id INT
AS
	SELECT * FROM qtcvkn_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtcvkn
AS
	SELECT * FROM qtcvkn_tbl
GO

CREATE PROC sp_view_by_page_qtcvkn
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtcvkn_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY nbncvkn ASC) AS Row, id 
			FROM  qtcvkn_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtcvkn_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtcvkn
	@shcc INT
AS
	SELECT * FROM qtcvkn_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtcvkn
	@id INT
AS
	DELETE FROM qtcvkn_tbl WHERE id = @id
GO


/* Bang 47: qtdbl_tbl   Bảng diễn biến lương */

CREATE PROC sp_insert_qtdbl
		@shcc			INT,
		@tgbd_dbl		DATETIME,
		@tgkt_dbl		DATETIME,
		@ma_ngach		Varchar(20),
		@bl_dbl			DECIMAL(2,0),
		@hsl			DECIMAL(4,2),
		@hspccv			DECIMAL(4,2),
		@ttk_qtdbl		NVARCHAR(255),
		@hspctn			DECIMAL(4,2),
		@hspckv			DECIMAL(4,2),
		@ts				Decimal(1,0)
AS
	INSERT INTO qtdbl_tbl (shcc, tgbd_dbl, tgkt_dbl, ma_ngach, bl_dbl, hsl, hspccv, ttk_qtdbl, hspctn, hspckv) VALUES
	(
		@shcc, @tgbd_dbl, @tgkt_dbl, @ma_ngach, @bl_dbl, @hsl, @hspccv, @ttk_qtdbl, @hspctn, @hspckv
	)
GO

CREATE PROC sp_update_qtdbl
		@id				INT,
		@tgbd_dbl		DATETIME,
		@tgkt_dbl		DATETIME,
		@ma_ngach		Varchar(20),
		@bl_dbl			DECIMAL(2,0),
		@hsl			DECIMAL(4,2),
		@hspccv			DECIMAL(4,2),
		@ttk_qtdbl		NVARCHAR(255),
		@hspctn			DECIMAL(4,2),
		@hspckv			DECIMAL(4,2),
		@ts				Decimal(1,0)
AS
	UPDATE qtdbl_tbl SET
		tgbd_dbl = @tgbd_dbl,
		tgkt_dbl = @tgkt_dbl,
		ma_ngach = @ma_ngach,
		bl_dbl = @bl_dbl,
		hsl = @hsl,
		hspccv = @hspccv,
		ttk_qtdbl = @ttk_qtdbl,
		hspctn = @hspctn,
		hspckv = @hspckv,
		ts = @ts
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtdbl
	@id INT
AS
	SELECT * FROM qtdbl_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtdbl
AS
	SELECT * FROM qtdbl_tbl
GO

CREATE PROC sp_view_by_page_qtdbl
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtdbl_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY tgbd_dbl ASC) AS Row, id 
			FROM  qtdbl_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtdbl_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtdbl
	@shcc INT
AS
	SELECT * FROM qtdbl_tbl WHERE shcc = @shcc
GO


CREATE PROC sp_delete_qtdbl
	@id INT
AS
	DELETE FROM qtdbl_tbl WHERE id = @id
GO


/* Bang 48: qtdtcm_tbl   Bảng quá trình đào tạo */

CREATE PROC sp_insert_qtdtcm
		@shcc			INT,
		@tgbd_dtcm		DATETIME,
		@tgkt_dtcm		DATETIME,
		@csdtcm			NVARCHAR(100),
		@ndtcm			INT,
		@ma_cndt		INT,
		@htdtcm			INT,
		@vbdtcm			INT,
		@xl_dtcm		NVARCHAR(40),
		@cmpcp_cndt		BIT,
		@hvcn_cndt		BIT,
		@ttk_qtdt		NVARCHAR(255)
AS
	INSERT INTO qtdtcm_tbl (shcc, tgbd_dtcm, tgkt_dtcm, csdtcm, ndtcm, ma_cndt, htdtcm, vbdtcm, xl_dtcm, cmpcp_cndt, hvcn_cndt, ttk_qtdt) VALUES
	(
		@shcc, @tgbd_dtcm, @tgkt_dtcm, @csdtcm, @ndtcm, @ma_cndt, @htdtcm, @vbdtcm, @xl_dtcm, @cmpcp_cndt, @hvcn_cndt, @ttk_qtdt
	)
GO

CREATE PROC sp_update_qtdtcm
		@id				INT,
		@tgbd_dtcm		DATETIME,
		@tgkt_dtcm		DATETIME,
		@csdtcm			NVARCHAR(100),
		@ndtcm			INT,
		@ma_cndt		INT,
		@htdtcm			INT,
		@vbdtcm			INT,
		@xl_dtcm		NVARCHAR(40),
		@cmpcp_cndt		BIT,
		@hvcn_cndt		BIT,
		@ttk_qtdt		NVARCHAR(255)
AS
	UPDATE qtdtcm_tbl SET
		tgbd_dtcm = @tgbd_dtcm,
		tgkt_dtcm = @tgkt_dtcm,
		csdtcm = @csdtcm,
		ndtcm = @ndtcm,
		ma_cndt = @ma_cndt,
		htdtcm = @htdtcm,
		vbdtcm = @vbdtcm,
		xl_dtcm = @xl_dtcm,
		cmpcp_cndt = @cmpcp_cndt,
		hvcn_cndt = @hvcn_cndt,
		ttk_qtdt = @ttk_qtdt
		
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtdtcm
	@id INT
AS
	SELECT * FROM qtdtcm_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtdtcm
AS
	SELECT * FROM qtdtcm_tbl
GO

CREATE PROC sp_view_by_page_qtdtcm
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtdtcm_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY tgbd_dtcm ASC) AS Row, id 
			FROM  qtdtcm_tbl WHERE shcc = @shcc ) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtdtcm_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtdtcm
	@shcc INT
AS
	SELECT * FROM qtdtcm_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtdtcm
	@id INT
AS
	DELETE FROM qtdtcm_tbl WHERE id = @id
GO



/* Bang 49: qtkl_tbl  Bảng thông tin kỷ luật của cán bộ */

CREATE PROC sp_insert_qtkl
	@shcc			INT,
	@ma_htkl		INT,
	@nkl			DATETIME,
	@nxkl			DATETIME,
	@ldkl			NVARCHAR(100),
	@ttk_qtkl		NVARCHAR(255)
AS
	INSERT INTO qtkl_tbl (shcc, ma_htkl, nxkl, ldkl, ttk_qtkl) VALUES
	(
		@shcc, @ma_htkl, @nkl, @ldkl, @ttk_qtkl
	)
GO

CREATE PROC sp_update_qtkl
		@id				INT,
		@ma_htkl		INT,
		@nkl			DATETIME,
		@nxkl			DATETIME,
		@ldkl			NVARCHAR(100),
		@ttk_qtkl		NVARCHAR(255)
AS
	UPDATE qtkl_tbl SET
		ma_htkl = @ma_htkl,
		nkl = @nkl,
		nxkl = @nxkl,
		ldkl = @ldkl,
		ttk_qtkl = @ttk_qtkl
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtkl
	@id INT
AS
	SELECT * FROM qtkl_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtkl
AS
	SELECT * FROM qtkl_tbl
GO

CREATE PROC sp_view_by_page_qtkl
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtkl_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY nkl ASC) AS Row, id 
			FROM  qtkl_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtkl_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtkl
	@shcc INT
AS
	SELECT * FROM qtkl_tbl WHERE shcc = @shcc
GO


CREATE PROC sp_delete_qtkl
	@id INT
AS
	DELETE FROM qtkl_tbl WHERE id = @id
GO


/* Bang 50: qtkt_tbl  Bảng thông tin khen thưởng của cán bộ */

CREATE PROC sp_insert_qtkt
		@shcc			INT,
		@ma_htkt		INT,
		@nkt_qtkt		DATETIME,
		@soqd_qtkt		NVARCHAR(255),
		@ttk_qtkt		NVARCHAR(255)
AS
	INSERT INTO qtkt_tbl (shcc, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt) VALUES
	(
		@shcc, @ma_htkt, @nkt_qtkt, @soqd_qtkt, @ttk_qtkt
	)
GO

CREATE PROC sp_update_qtkt
		@id				INT,
		@ma_htkt		INT,
		@nkt_qtkt		DATETIME,
		@soqd_qtkt		NVARCHAR(255),
		@ttk_qtkt		NVARCHAR(255)
AS
	UPDATE qtkt_tbl SET
		ma_htkt = @ma_htkt,
		nkt_qtkt = @nkt_qtkt,
		soqd_qtkt = @soqd_qtkt,
		ttk_qtkt = @ttk_qtkt
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_qtkt
	@id INT
AS
	SELECT * FROM qtkt_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_qtkt
AS
	SELECT * FROM qtkt_tbl
GO

CREATE PROC sp_view_by_page_qtkt
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM qtkt_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY nkt_qtkt ASC) AS Row, id 
			FROM  qtkt_tbl WHERE shcc = @shcc) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM qtkt_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_qtkt
	@shcc INT
AS
	SELECT * FROM qtkt_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_qtkt
	@id INT
AS
	DELETE FROM qtkt_tbl WHERE id = @id
GO


/* Bang 52: tdnn_tbl  Bảng trình độ ngoại ngữ của cán bộ */

CREATE PROC sp_insert_tdnn
		@shcc			INT,
		@ma_nn			INT,
		@ma_td			INT,
		@ttk_tdnn		NVARCHAR(255)
AS
	INSERT INTO tdnn_tbl (shcc, ma_nn, ma_td, ttk_tdnn) VALUES
	(
		@shcc, @ma_nn, @ma_td, @ttk_tdnn
	)
GO

CREATE PROC sp_update_tdnn
		@id				INT,
		@ma_nn			INT,
		@ma_td			INT,
		@ttk_tdnn		NVARCHAR(255)
AS
	UPDATE tdnn_tbl SET
		ma_nn = @ma_nn,
		ma_td = @ma_td,
		ttk_tdnn = @ttk_tdnn
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_tdnn
	@id INT
AS
	SELECT * FROM tdnn_tbl WHERE id = @id
GO

CREATE PROC sp_view_all_tdnn
AS
	SELECT * FROM tdnn_tbl
GO

CREATE PROC sp_view_by_page_tdnn
	@shcc INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM tdnn_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id ASC) AS Row, id 
			FROM  tdnn_tbl WHERE shcc = @shcc ) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM tdnn_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_view_by_shcc_tdnn
	@shcc INT
AS
	SELECT * FROM tdnn_tbl WHERE shcc = @shcc
GO

CREATE PROC sp_delete_tdnn
	@id INT
AS
	DELETE FROM tdnn_tbl WHERE id = @id
GO


/* Bang 53: Users  Quản lý user hệ thống */

CREATE PROC sp_insert_user
		@ma_dv	INT,	
		@user	VARCHAR(50),
		@pass	VARCHAR(50),
		@quyen	BIT,
		@isLock BIT
AS
	INSERT INTO Users (ma_dv, [user], pass, quyen, isLock) VALUES
	(
		@ma_dv, @user, @pass, @quyen, @isLock
	)
GO

CREATE PROC sp_update_user
		@id		INT,
		@ma_dv	INT,	
		@user	VARCHAR(50),
		@pass	VARCHAR(50),
		@quyen	BIT,
		@isLock BIT
AS
	UPDATE Users SET
		ma_dv = @ma_dv,
		[user] = @user,
		pass = @pass,
		quyen = @pass,
		isLock = @isLock
	WHERE id = @id
GO 

CREATE PROC sp_find_by_id_user
	@id INT
AS
	SELECT * FROM Users WHERE id = @id
GO

CREATE PROC sp_check_exist_user
	@user VARCHAR(50)
AS
	SELECT * FROM Users WHERE user = @user
GO

CREATE PROC sp_find_by_username_user
	@user VARCHAR(50),
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM Users WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id ASC) AS Row, id 
			FROM  Users WHERE user LIKE '%' + @user + '%') AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM Users WHERE user LIKE '%' + @user + '%'
GO

CREATE PROC sp_view_all_user
AS
	SELECT * FROM Users
GO

CREATE PROC sp_view_by_page_user
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM Users WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id ASC) AS Row, id 
			FROM  Users) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM Users
GO

CREATE PROC sp_lock_user
	@id INT
AS
	UPDATE Users SET isLock = 1 WHERE id = @id
GO

CREATE PROC sp_unlock_user
	@id INT
AS
	UPDATE Users SET isLock = 0 WHERE id = @id
GO

CREATE PROC sp_change_pass_user
	@id INT,
	@newPass VARCHAR(50)
AS
	UPDATE Users SET pass = @newPass
GO

/* Bang 51 so yeu */

CREATE PROC sp_search_soyeu
	@ma_dv INT, 
	@shcc INT,
	@ten NVARCHAR(50),
	@gioitinh DECIMAL(1,0),
	@tutuoi INT,
	@dentuoi INT,
	@diencb INT,
	@khoicanbo INT,
	@nvtruong INT,
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	
	SELECT shcc, hodem + ' '  + ten AS hoten, dv, tel, email FROM soyeu LEFT JOIN  dm_dv  ON soyeu.ma_dvql = dm_dv.ma_dv WHERE  shcc IN(
	SELECT shcc 
	FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY shcc ASC) AS Row, shcc 
			FROM  soyeu WHERE  (shcc IN (SELECT * FROM dbo.searchDonvi(@ma_dv))) 
								AND (shcc IN (SELECT * FROM dbo.searchShcc(@shcc)))
							    AND (shcc IN (SELECT * FROM dbo.searchTen(@ten))) 
							    AND (shcc IN (SELECT * FROM dbo.searchTuoi(@tutuoi,@dentuoi)))
							    AND (shcc IN (SELECT * FROM dbo.searchGioiTinh(@gioitinh)))
							    AND (shcc IN (SELECT * FROM dbo.searchDienCanBo(@diencb)))
							    AND (shcc IN (SELECT * FROM dbo.searchKhoiCanBo(@khoicanbo)))
							    AND (shcc IN (SELECT * FROM dbo.searchNamVaoTruong(@nvtruong)))
			  )
		 AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM soyeu WHERE  (shcc IN (SELECT * FROM dbo.searchDonvi(@ma_dv))) -- tim theo don vi quan ly
												AND (shcc IN (SELECT * FROM dbo.searchShcc(@shcc))) -- tim theo ma shcc
												AND (shcc IN (SELECT * FROM dbo.searchTen(@ten))) -- tim theo ten
												AND (shcc IN (SELECT * FROM dbo.searchTuoi(@tutuoi,@dentuoi)))-- tim theo tuoi 
												AND (shcc IN (SELECT * FROM dbo.searchGioiTinh(@gioitinh)))  -- tim theo gioi tinh
												AND (shcc IN (SELECT * FROM dbo.searchDienCanBo(@diencb))) -- tim theo dien can bo
												AND (shcc IN (SELECT * FROM dbo.searchKhoiCanBo(@khoicanbo))) -- tim theo khoi can bo
												AND (shcc IN (SELECT * FROM dbo.searchNamVaoTruong(@nvtruong))) -- tim theo nam vao truong
	
GO





