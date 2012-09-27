USE hutstaff_9_8
GO


/* Bang 30: dm_tdql danh mục trình độ quản lý */
CREATE PROC sp_insert_dm_tdql
	@tdql	NVARCHAR(40)
AS
	INSERT INTO dm_tdql (tdql) VALUES
	(
		@tdql
	)
GO

CREATE PROC sp_update_dm_tdql
	@ma_tdql	INT,
	@tdql		NVARCHAR(40)
AS
	UPDATE dm_tdql SET
		tdql = @tdql
	WHERE ma_tdql= @ma_tdql
GO 

CREATE PROC sp_find_by_id_dm_tdql
	@ma_tdql INT
AS
	SELECT * FROM dm_tdql WHERE ma_tdql = @ma_tdql
GO

CREATE PROC sp_view_all_dm_tdql
AS
	SELECT * FROM dm_tdql
GO

CREATE PROC sp_view_by_page_dm_tdql
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdql WHERE ma_tdql IN(
	SELECT ma_tdql FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdql DESC) AS Row, ma_tdql
			FROM  dm_tdql) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdql
GO


CREATE PROC sp_check_existed_dm_tdql
	@tdql	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdql WHERE tdql = @tdql
GO


/* Bang 31: dm_tg danh mục trình độ tin học */
CREATE PROC sp_insert_dm_tdth
	@tdth	NVARCHAR(40)
AS
	INSERT INTO dm_tdth (tdth) VALUES
	(
		@tdth
	)
GO

CREATE PROC sp_update_dm_tdth
	@ma_tdth	INT,
	@tdth		NVARCHAR(40)
AS
	UPDATE dm_tg SET
		tg = @tdth
	WHERE ma_tg= @ma_tdth
GO 

CREATE PROC sp_find_by_id_dm_tdth
	@ma_tdth INT
AS
	SELECT * FROM dm_tdth WHERE ma_tdth = @ma_tdth
GO

CREATE PROC sp_view_all_dm_tdth
AS
	SELECT * FROM dm_tdth
GO

CREATE PROC sp_view_by_page_dm_tdth
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdth WHERE ma_tdth IN(
	SELECT ma_tdth FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdth DESC) AS Row, ma_tdth
			FROM  dm_tdth) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdth
GO


CREATE PROC sp_check_existed_dm_tdth
	@tdth	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdth WHERE tdth = @tdth
GO


/* Bang 32: dm_tg danh mục tôn giáo */
CREATE PROC sp_insert_dm_tg
	@tg	NVARCHAR(40)
AS
	INSERT INTO dm_tg (tg) VALUES
	(
		@tg
	)
GO

CREATE PROC sp_update_dm_tg
	@ma_tg	INT,
	@tg	NVARCHAR(40)
AS
	UPDATE dm_tg SET
		tg = @tg
	WHERE ma_tg= @ma_tg
GO 

CREATE PROC sp_find_by_id_dm_tg
	@ma_tg INT
AS
	SELECT * FROM dm_tg WHERE ma_tg = @ma_tg
GO

CREATE PROC sp_view_all_dm_tg
AS
	SELECT * FROM dm_tg
GO

CREATE PROC sp_view_by_page_dm_tg
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tg WHERE ma_tg IN(
	SELECT ma_tg FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tg DESC) AS Row, ma_tg
			FROM  dm_tg) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tnn
GO


CREATE PROC sp_check_existed_dm_tg
	@tg	NVARCHAR(40)	
AS
	SELECT * FROM dm_tg WHERE tg = @tg
GO


/* Bang 33: dm_tnn danh mục các loại ngoại ngữ */
CREATE PROC sp_insert_dm_tnn
	@tnn	NVARCHAR(40)
AS
	INSERT INTO dm_tnn (tnn) VALUES
	(
		@tnn
	)
GO

CREATE PROC sp_update_dm_tnn
	@ma_tnn	INT,
	@tnn	NVARCHAR(40)
AS
	UPDATE dm_tnn SET
		tnn = @tnn
	WHERE ma_tnn= @ma_tnn
GO 

CREATE PROC sp_find_by_id_dm_tnn
	@ma_tnn INT
AS
	SELECT * FROM dm_tnn WHERE ma_tnn = @ma_tnn
GO

CREATE PROC sp_view_all_dm_tnn
AS
	SELECT * FROM dm_tnn
GO

CREATE PROC sp_view_by_page_dm_tnn
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tnn WHERE ma_tnn IN(
	SELECT ma_tnn FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tnn DESC) AS Row, ma_tnn
			FROM  dm_tnn) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tnn
GO


CREATE PROC sp_check_existed_dm_tnn
	@tnn	NVARCHAR(40)	
AS
	SELECT * FROM dm_tnn WHERE tnn = @tnn
GO


/* Bang 34: dm_tpxt danh mục thành phần xuất thân */
CREATE PROC sp_insert_dm_tpxt
	@tpxt	NVARCHAR(40)
AS
	INSERT INTO dm_tpxt (tpxt) VALUES
	(
		@tpxt
	)
GO

CREATE PROC sp_update_dm_tpxt
	@ma_tpxt	INT,
	@tpxt		NVARCHAR(40)
AS
	UPDATE dm_tpxt SET
		tpxt = @tpxt
	WHERE ma_tpxt= @ma_tpxt
GO 

CREATE PROC sp_find_by_id_dm_tpxt
	@ma_tpxt INT
AS
	SELECT * FROM dm_tpxt WHERE ma_tpxt = @ma_tpxt
GO

CREATE PROC sp_view_all_dm_tpxt
AS
	SELECT * FROM dm_tpxt
GO

CREATE PROC sp_view_by_page_dm_tpxt
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tpxt WHERE ma_tpxt IN(
	SELECT ma_tpxt FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tpxt DESC) AS Row, ma_tpxt
			FROM  dm_tpxt) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tpxt
GO


CREATE PROC sp_check_existed_dm_tpxt
	@tpxt	NVARCHAR(40)	
AS
	SELECT * FROM dm_tpxt WHERE tpxt = @tpxt
GO



/* Bang 35: dm_tthn danh mục tình trạng hôn nhân*/
CREATE PROC sp_insert_dm_tthn
	@tthn	NVARCHAR(60)
AS
	INSERT INTO dm_tthn (tthn) VALUES
	(
		@tthn
	)
GO

CREATE PROC sp_update_dm_tthn
	@ma_tthn	INT,
	@tthn		NVARCHAR(60)
AS
	UPDATE dm_tthn SET
		tthn = @tthn
	WHERE ma_tthn = @ma_tthn
GO 

CREATE PROC sp_find_by_id_dm_tthn
	@ma_tthn INT
AS
	SELECT * FROM dm_tthn WHERE ma_tthn = @ma_tthn
GO

CREATE PROC sp_view_all_dm_tthn
AS
	SELECT * FROM dm_tthn
GO

CREATE PROC sp_view_by_page_dm_tthn
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tthn WHERE ma_tthn IN(
	SELECT ma_tthn FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tthn DESC) AS Row, ma_tthn 
			FROM  dm_tthn) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_ttp
GO


CREATE PROC sp_check_existed_dm_tthn
	@tthn	NVARCHAR(60)	
AS
	SELECT * FROM dm_tthn WHERE tthn = @tthn
GO



/* Bang 36: dm_ttp danh mục thành phố */
CREATE PROC sp_insert_dm_ttp
	@ttp	NVARCHAR(40)
AS
	INSERT INTO dm_ttp (ttp) VALUES
	(
		@ttp
	)
GO

CREATE PROC sp_update_dm_ttp
	@ma_ttp	INT,
	@ttp	NVARCHAR(40)
AS
	UPDATE dm_ttp SET
		ttp = @ttp
	WHERE ma_ttp = @ma_ttp
GO 

CREATE PROC sp_find_by_id_dm_ttp
	@ma_ttp INT
AS
	SELECT * FROM dm_ttp WHERE ma_ttp = @ma_ttp
GO

CREATE PROC sp_view_all_dm_ttp
AS
	SELECT * FROM dm_ttp
GO

CREATE PROC sp_view_by_page_dm_ttp
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_ttp WHERE ma_ttp IN(
	SELECT ma_ttp FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_ttp DESC) AS Row, ma_ttp 
			FROM  dm_ttp) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_ttp
GO

CREATE PROC sp_check_existed_dm_ttp
	@ttp	NVARCHAR(40)
AS
	SELECT * FROM dm_ttp WHERE ttp = @ttp
GO


/* Bang 37: dm_vbdt */
CREATE PROC sp_insert_dm_vbdt
	@vbdt		NVARCHAR(60)
AS
	INSERT INTO dm_vbdt (vbdt) VALUES
	(
		@vbdt
	)
GO

CREATE PROC sp_update_dm_vbdt
		@ma_vbdt	INT,
		@vbdt		NVARCHAR(60)
AS
	UPDATE dm_vbdt SET
		vbdt = @vbdt
	WHERE ma_vbdt = @ma_vbdt
GO 

CREATE PROC sp_find_by_id_dm_vbdt
	@ma_vbdt INT
AS
	SELECT * FROM dm_vbdt WHERE ma_vbdt = @ma_vbdt
GO

CREATE PROC sp_view_all_dm_vbdt
AS
	SELECT * FROM dm_vbdt
GO

CREATE PROC sp_view_by_page_dm_vbdt
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_vbdt WHERE ma_vbdt IN(
	SELECT ma_vbdt FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_vbdt DESC) AS Row, ma_vbdt 
			FROM  dm_vbdt) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_vbdt
GO


CREATE PROC sp_check_existed_dm_vbdt
	@vbdt		NVARCHAR(60)
AS
	SELECT * FROM dm_vbdt WHERE vbdt = @vbdt
GO


/* Bang 38: huyhoso  Bảng yêu cầu hủy hồ sơ*/


/* Bang 39: mbbh_tbl  Bảng danh mục mặt bằng bảo hiểm y tế*/
CREATE PROC sp_insert_mbbh
		@tinhtu			DATETIME,
		@bhxh			FLOAT,
		@bhyt			FLOAT,
		@bhtn			FLOAT
AS
	INSERT INTO mbbh_tbl (tinhtu, bhxh, bhyt, bhtn) VALUES
	(
		@tinhtu, @bhxh, @bhyt, @bhtn
	)
GO

CREATE PROC sp_update_mbbh
		@ma_mbbh		INT,
		@tinhtu			DATETIME,
		@bhxh			FLOAT,
		@bhyt			FLOAT,
		@bhtn			FLOAT
AS
	UPDATE mbbh_tbl SET
		tinhtu = @tinhtu,
		bhxh = @bhxh,
		bhyt = @bhyt,
		bhtn = @bhtn
	WHERE ma_mbbh = @ma_mbbh
GO 

CREATE PROC sp_find_by_id_mbbh
	@ma_mbbh INT
AS
	SELECT * FROM mbbh_tbl WHERE ma_mbbh = @ma_mbbh
GO

CREATE PROC sp_view_all_mbbh
AS
	SELECT * FROM mbbh_tbl
GO

CREATE PROC sp_view_by_page_mbbh
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM mbbh_tbl WHERE ma_mbbh IN(
	SELECT ma_mbbh FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY tinhtu DESC) AS Row, ma_mbbh 
			FROM  mbbh_tbl) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM mbbh_tbl
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
CREATE PROC sp_insert_soyeu
		@pass			VARCHAR(50),
		@nvcqhn			DATETIME,
		@scmnd			VARCHAR(10),
		@nc				INT,
		@ngay_cap		DATETIME,
		@ma_dvql		INT,
		@hodem			NVARCHAR(30),
		@ten			NVARCHAR(20),  
		@gt				DECIMAL(1,0),
		@ttd			NVARCHAR(50),
		@ntns			DATETIME,
		@ma_ns			INT,
		@ma_qq			INT,
		@ctqq			NVARCHAR(100),
		@dctt			NVARCHAR(200),
		@ma_dt			INT,
		@ma_tg			INT,
		@ma_gdtdcs		INT,
		@ma_tpxt		INT,
		@ntgcm			DATETIME,
		@ttc			NVARCHAR(100),
		@vdpc			NVARCHAR(100),
		@nvbc			DATETIME,
		@cvdn			NVARCHAR(70),
		@nvd			DATETIME,
		@nct			DATETIME,
		@nnn			DATETIME,
		@nxn			DATETIME,
		@qh				NVARCHAR(20),
		@ma_tb			INT,
		@ma_tdhv		INT,
		@ma_tdth		INT,
		@kn_tht			Nvarchar(100),
		@ma_tdllct		INT,
		@ma_tdqlnn		INT,
		@nlstnk			Nvarchar(100),
		@ma_ttsk		NVARCHAR(30),
		@ma_nm			NVARCHAR(10),
		@ddlsbt			NVARCHAR(255),
		@ttk			NVARCHAR(255),
		@dcb			INT,
		@sbh			VARCHAR(20),
		@ndbh			DATETIME,
		@tthn			INT,
		@email			VARCHAR(100),
		@tel			VARCHAR(100),
		@kcb			INT,
		@ma_hktt		INT,
		@ngay_kthd		DATETIME,
		@ld_kthd		NVARCHAR(255),
		@ngaybh			DATETIME,
		@thanggd		INT,
		@ngaybhct		DATETIME,
		@mochuongtn		DATETIME
AS
	DECLARE @countUser INT, @username VARCHAR(50)
	SELECT @username = REPLACE(dbo.fLocDauTiengViet(@hodem + ' ' + @ten),' ','')
	SELECT @countUser =  dbo.checkUserCanBo(@username)
	
	IF @countUser != 0
	BEGIN 
		SELECT @username = @username + CONVERT(VARCHAR(5),@countUser)
	END
	
	
	INSERT INTO soyeu (
		[user]			,
		pass			,
		nvcqhn			,
		scmnd			,
		nc				,
		ngay_cap		,
		ma_dvql			,
		hodem			,
		ten				,  
		gt				,
		ttd				,
		ntns			,
		ma_ns			,
		ma_qq			,
		ctqq			,
		dctt			,
		ma_dt			,
		ma_tg			,
		ma_gdtdcs		,
		ma_tpxt			,
		ntgcm			,
		ttc				,
		vdpc			,
		nvbc			,
		cvdn			,
		nvd				,
		nct				,
		nnn				,
		nxn				,
		qh				,
		ma_tb			,
		ma_tdhv			,
		ma_tdth			,
		kn_tht			,
		ma_tdllct		,
		ma_tdqlnn		,
		nlstnk			,
		ma_ttsk			,
		ma_nm			,
		ddlsbt			,
		ttk				,
		dcb				,
		sbh				,
		ndbh			,
		tthn			,
		email			,
		tel				,
		kcb				,
		ma_hktt		    ,
		ngay_kthd		,
		ld_kthd			,
		ngaybh			,
		thanggd			,
		ngaybhct		,
		mochuongtn		
	) 
	VALUES
	(
		@username,
		@pass,
		@nvcqhn,
		@scmnd,
		@nc,
		@ngay_cap,
		@ma_dvql,
		@hodem,
		@ten,  
		@gt,
		@ttd,
		@ntns,
		@ma_ns,
		@ma_qq,
		@ctqq,
		@dctt,
		@ma_dt,
		@ma_tg,
		@ma_gdtdcs,
		@ma_tpxt,
		@ntgcm,
		@ttc,
		@vdpc,
		@nvbc,
		@cvdn,
		@nvd,
		@nct,
		@nnn,
		@nxn,
		@qh,
		@ma_tb,
		@ma_tdhv,
		@ma_tdth,
		@kn_tht,
		@ma_tdllct,
		@ma_tdqlnn,
		@nlstnk,
		@ma_ttsk,
		@ma_nm,
		@ddlsbt,
		@ttk,
		@dcb,
		@sbh,
		@ndbh,
		@tthn,
		@email,
		@tel,
		@kcb,
		@ma_hktt,
		@ngay_kthd,
		@ld_kthd,
		@ngaybh,
		@thanggd,
		@ngaybhct,
		@mochuongtn
	)
GO

CREATE PROC sp_update_soyeu
		@shcc			INT,
		@nvcqhn			DATETIME,
		@scmnd			VARCHAR(10),
		@nc				INT,
		@ngay_cap		DATETIME,
		@ma_dvql		INT,
		@hodem			NVARCHAR(30),
		@ten			NVARCHAR(20),  
		@gt				DECIMAL(1,0),
		@ttd			NVARCHAR(50),
		@ntns			DATETIME,
		@ma_ns			INT,
		@ma_qq			INT,
		@ctqq			NVARCHAR(100),
		@dctt			NVARCHAR(200),
		@ma_dt			INT,
		@ma_tg			INT,
		@ma_gdtdcs		INT,
		@ma_tpxt		INT,
		@ntgcm			DATETIME,
		@ttc			NVARCHAR(100),
		@vdpc			NVARCHAR(100),
		@nvbc			DATETIME,
		@cvdn			NVARCHAR(70),
		@nvd			DATETIME,
		@nct			DATETIME,
		@nnn			DATETIME,
		@nxn			DATETIME,
		@qh				NVARCHAR(20),
		@ma_tb			INT,
		@ma_tdhv		INT,
		@ma_tdth		INT,
		@kn_tht			Nvarchar(100),
		@ma_tdllct		INT,
		@ma_tdqlnn		INT,
		@nlstnk			Nvarchar(100),
		@ma_ttsk		NVARCHAR(30),
		@ma_nm			NVARCHAR(10),
		@ddlsbt			NVARCHAR(255),
		@ttk			NVARCHAR(255),
		@dcb			INT,
		@sbh			VARCHAR(20),
		@ndbh			DATETIME,
		@tthn			INT,
		@email			VARCHAR(100),
		@tel			VARCHAR(100),
		@kcb			INT,
		@ma_hktt		INT,
		@ngay_kthd		DATETIME,
		@ld_kthd		NVARCHAR(255),
		@ngaybh			DATETIME,
		@thanggd		INT,
		@ngaybhct		DATETIME,
		@mochuongtn		DATETIME
AS
	UPDATE soyeu SET
		nvcqhn		= @nvcqhn,
		scmnd		= @scmnd,
		nc				=@nc,
		ngay_cap		=@ngay_cap,
		ma_dvql			=@ma_dvql,
		hodem			=@hodem,
		ten				=@ten,  
		gt				=@gt,
		ttd				=@ttd,
		ntns			=@ntns,
		ma_ns			=@ma_ns,
		ma_qq			=@ma_qq,
		ctqq			=@ctqq,
		dctt			=@dctt,
		ma_dt			=@ma_dt,
		ma_tg			=@ma_tg,
		ma_gdtdcs		=@ma_gdtdcs,
		ma_tpxt			=@ma_tpxt,
		ntgcm			=@ntgcm,
		ttc				=@ttc,
		vdpc			=@vdpc,
		nvbc			=@nvbc,
		cvdn			=@cvdn,
		nvd				=@nvd,
		nct				=@nct,
		nnn				=@nnn,
		nxn				=@nxn,
		qh				=@qh,
		ma_tb			=@ma_tb,
		ma_tdhv			=@ma_tdhv,
		ma_tdth			=@ma_tdth,
		kn_tht			=@kn_tht,
		ma_tdllct		=@ma_tdllct,
		ma_tdqlnn		=@ma_tdqlnn,
		nlstnk			=@nlstnk,
		ma_ttsk			=@ma_ttsk,
		ma_nm			=@ma_nm,
		ddlsbt			=@ddlsbt,
		ttk				=@ttk,
		dcb				=@dcb,
		sbh				=@sbh,
		ndbh			=@ndbh,
		tthn			=@tthn,
		email			=@email,
		tel				=@tel,
		kcb				=@kcb,
		ma_hktt		    =@ma_hktt,
		ngay_kthd		=@ngay_kthd,
		ld_kthd			=@ld_kthd,
		ngaybh			=@ngaybh,
		thanggd			=@thanggd,
		ngaybhct		=@ngaybhct,
		mochuongtn		=@mochuongtn
	WHERE shcc = @shcc
GO 

CREATE PROC sp_find_by_id_soyeu
	@shcc INT
AS
	SELECT * FROM soyeu WHERE shcc = @shcc
GO

CREATE PROC sp_view_all_soyeu
AS
	SELECT * FROM soyeu
GO

CREATE PROC sp_view_by_page_soyeu
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM soyeu WHERE shcc IN(
	SELECT shcc FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY shcc ASC) AS Row, shcc 
			FROM  soyeu ) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM soyeu
GO


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

CREATE PROC sp_change_pass_soyeu
	@shcc INT,
	@newPass VARCHAR(50)
AS
	UPDATE soyeu SET pass = @newPass WHERE shcc = @shcc
GO





