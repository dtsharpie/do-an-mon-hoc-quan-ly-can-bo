USE hutstaff_9_8
GO

/* bang 1 : baohiem93 */
CREATE PROCEDURE sp_insert_baohiem93 
		@tgbd_bh93 datetime , 
		@tgkt_bh93 datetime,
		@mota nvarchar(255),
		@hsluong float,
		@phucap float ,
		@sothang int ,
		@tongtien int ,
		@shcc int
AS
	 INSERT INTO baohiem93(tgbd_bh93,tgkt_bh93,mota,hsluong,phucap,sothang,tongtien,shcc) VALUES
	(
		@tgbd_bh93,@tgkt_bh93,@mota,@hsluong,@phucap,@sothang,@tongtien,@shcc
	)
GO

CREATE PROC sp_update_baohiem93
		@id int,
		@tgbd_bh93 datetime,
		@tgkt_bh93 datetime,
		@mota nvarchar(255),
		@hsluong float,
		@phucap float,
		@sothang int,
		@tongtien int
AS
	UPDATE baohiem93 SET
		tgbd_bh93 = @tgbd_bh93,
		tgkt_bh93 = @tgkt_bh93,
		mota = @mota,
		hsluong = @hsluong,
		phucap = @phucap,
		sothang = @sothang,
		tongtien = @tongtien
	WHERE id = @id
GO


CREATE PROC sp_find_by_id_baohiem93
	@id int
AS
	SELECT * FROM baohiem93 WHERE id = @id
GO


CREATE PROC sp_view_all_baohiem93
AS
	SELECT * FROM baohiem93
GO

CREATE PROC sp_view_by_page_baohiem93
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM baohiem93 WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id DESC) AS Row, id
			FROM  baohiem93) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM baohiem93
GO

CREATE PROC sp_delete_baohiem93
	@id INT
AS
	DELETE FROM baohiem93 WHERE id = @id
GO


/* bang 2 : db_log_tbl */
CREATE PROCEDURE sp_insert_db_log_tbl
		@sys_user varchar(20) , 
		@system_time_access datetime ,
		@system_time_release datetime ,
		@system_action nvarchar(255)

AS
	INSERT INTO db_log_tbl(sys_user, system_time_access, system_time_release, system_action) VALUES
	(
		@sys_user, @system_time_access, @system_time_release, @system_action
	) 
GO

CREATE PROC sp_view_all_db_log_tbl
AS
	SELECT * FROM db_log_tbl
GO

CREATE PROC sp_view_by_page_db_log_tbl
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM db_log_tbl WHERE id IN(
	SELECT id FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY id DESC) AS Row, id
			FROM  db_log_tbl) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM db_log_tbl
GO


/* bang 3 : dm_cn */
CREATE PROCEDURE sp_insert_dm_cn 
	@cn nvarchar(255)
AS
 INSERT INTO dm_cn(cn) VALUES
	(
		@cn
	)
GO

CREATE PROC sp_update_dm_cn
		@ma_cn	INT,
		@cn		nvarchar(255)
AS
	UPDATE dm_cn SET
		cn = @cn
	WHERE ma_cn = @ma_cn
GO 


CREATE PROC sp_find_by_id_dm_cn
	@ma_cn INT
AS
	SELECT * FROM dm_cn WHERE ma_cn = @ma_cn
GO

CREATE PROC sp_view_all_dm_cn
AS
	SELECT * FROM dm_cn
GO

CREATE PROC sp_view_by_page_dm_cn
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_cn WHERE ma_cn IN(
	SELECT ma_cn FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_cn DESC) AS Row, ma_cn
			FROM  dm_cn) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_cn
GO


CREATE PROC sp_check_existed_dm_cn
	@cn	NVARCHAR(255)	
AS
	SELECT * FROM dm_cn WHERE cn = @cn
GO

CREATE PROC sp_find_by_name_dm_cn
	@cn	NVARCHAR(255)	
AS
	SELECT * FROM dm_cn WHERE cn LIKE  ( @cn + N'%')
GO


CREATE PROC sp_delete_dm_cn
	@ma_cn INT
AS
	DELETE FROM dm_cn WHERE ma_cn = @ma_cn
GO

/* bang 4 : dm_cu */

CREATE PROC sp_insert_dm_cu
		@cu		nvarchar(60)
AS
	INSERT INTO dm_cu(cu) VALUES
	(
		@cu
	)
GO

CREATE PROC sp_update_dm_cu
		@ma_cu		INT,
		@cu		nvarchar(60)
AS
	UPDATE dm_cu SET
		cu = @cu
	WHERE ma_cu = @ma_cu
GO 

CREATE PROC sp_find_by_id_dm_cu
	@id INT
AS
	SELECT * FROM dm_cu WHERE ma_cu = @id
GO


CREATE PROC sp_view_all_dm_cu
AS
	SELECT * FROM dm_cu
GO

CREATE PROC sp_view_by_page_dm_cu
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_cu WHERE ma_cu IN(
	SELECT ma_cu FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_cu DESC) AS Row, ma_cu
			FROM  dm_cu) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_cu
GO


CREATE PROC sp_check_existed_dm_cu
	@cu	NVARCHAR(60)	
AS
	SELECT * FROM dm_cu WHERE cu = @cu
GO

CREATE PROC sp_find_by_name_dm_cu
	@cu	NVARCHAR(60)	
AS
	SELECT * FROM dm_cu WHERE cu LIKE  (@cu + N'%')
GO


CREATE PROC sp_delete_dm_cu
	@id INT
AS
	DELETE FROM dm_cu WHERE ma_cu = @id
GO

/* bang 5 : dm_cud */

CREATE PROC sp_insert_dm_cud
		@cud	nvarchar(60)
AS
	INSERT INTO dm_cud(cud) VALUES
	(
		@cud
	)
GO

CREATE PROC sp_update_dm_cud
		@ma_cud		INT,
		@cud	nvarchar(60)	
AS
	UPDATE dm_cud SET
		cud = @cud
	WHERE ma_cud = @ma_cud
GO 

CREATE PROC sp_find_by_id_dm_cud
	@id INT
AS
	SELECT * FROM dm_cud WHERE ma_cud = @id
GO

CREATE PROC sp_view_all_dm_cud
AS
	SELECT * FROM dm_cud
GO

CREATE PROC sp_view_by_page_dm_cud
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_cud WHERE ma_cud IN(
	SELECT ma_cud FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_cud DESC) AS Row, ma_cud
			FROM  dm_cud) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_cud
GO


CREATE PROC sp_check_existed_dm_cud
	@cud	NVARCHAR(60)	
AS
	SELECT * FROM dm_cud WHERE cud = @cud
GO

CREATE PROC sp_find_by_name_dm_cud
	@cud	NVARCHAR(60)	
AS
	SELECT * FROM dm_cud WHERE cud LIKE  (@cud + N'%')
GO


CREATE PROC sp_delete_dm_cud
	@ma_cud INT
AS
	DELETE FROM dm_cud WHERE ma_cud = @ma_cud
GO

/* bang 6 : dm_cv */
CREATE PROC sp_insert_dm_cv
		@cv		nvarchar(60),
		@pccv	decimal(4,2)
AS
	INSERT INTO dm_cv(cv, pccv) VALUES
	(
		@cv, @pccv
	)
GO

CREATE PROC sp_update_dm_cv
		@id				INT,
		@cv		nvarchar(60),
		@pccv	decimal(4,2)
AS
	UPDATE dm_cv SET
		cv = @cv,
		pccv = @pccv
	WHERE ma_cv = @id
GO 

CREATE PROC sp_find_by_id_dm_cv
	@id INT
AS
	SELECT * FROM dm_cv WHERE ma_cv = @id
GO

CREATE PROC sp_view_all_dm_cv
AS
	SELECT * FROM dm_cv
GO

CREATE PROC sp_view_by_page_dm_cv
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_cv WHERE ma_cv IN(
	SELECT ma_cv FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_cv DESC) AS Row, ma_cv
			FROM  dm_cv) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_cv
GO


CREATE PROC sp_check_existed_dm_cv
	@cv	NVARCHAR(60)	
AS
	SELECT * FROM dm_cv WHERE cv = @cv
GO

CREATE PROC sp_find_by_name_dm_cv
	@cv	NVARCHAR(60)	
AS
	SELECT * FROM dm_cv WHERE cv LIKE  (@cv + N'%')
GO


CREATE PROC sp_delete_dm_cv
	@id INT
AS
	DELETE FROM dm_cv WHERE ma_cv = @id
GO

/* bang 7 : dm_cvdn */
CREATE PROC sp_insert_dm_cvdn
		@cvdn	nvarchar(200)
AS
	INSERT INTO dm_cvdn(cvdn) VALUES
	(
		@cvdn
	)
GO

CREATE PROC sp_update_dm_cvdn
		@id				INT,
		@cvdn	nvarchar(200)
AS
	UPDATE dm_cvdn SET
		cvdn = @cvdn
	WHERE ma_cvdn = @id
GO 

CREATE PROC sp_find_by_id_dm_cvdn
	@id INT
AS
	SELECT * FROM dm_cvdn WHERE ma_cvdn = @id
GO


CREATE PROC sp_view_all_dm_cvdn
AS
	SELECT * FROM dm_cvdn
GO

CREATE PROC sp_view_by_page_dm_cvdn
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_cvdn WHERE ma_cvdn IN(
	SELECT ma_cvdn FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_cvdn DESC) AS Row, ma_cvdn
			FROM  dm_cvdn) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_cvdn
GO


CREATE PROC sp_check_existed_dm_cvdn
	@cvdn	NVARCHAR(200)	
AS
	SELECT * FROM dm_cvdn WHERE cvdn = @cvdn
GO

CREATE PROC sp_find_by_name_dm_cvdn
	@cvdn	NVARCHAR(200)	
AS
	SELECT * FROM dm_cvdn WHERE cvdn LIKE  (@cvdn + N'%')
GO

CREATE PROC sp_delete_dm_cvdn
	@id INT
AS
	DELETE FROM dm_cvdn WHERE ma_cvdn = @id
GO


/* bang 8 : dm_dcb */
CREATE PROC sp_insert_dm_dcb
		@dcb	nvarchar(50)
AS
	INSERT INTO dm_dcb(dcb) VALUES
	(
		@dcb
	)
GO

CREATE PROC sp_update_dm_dcb
		@id				INT,
		@dcb	nvarchar(50)
AS
	UPDATE dm_dcb SET
		dcb = @dcb
	WHERE ma_dcb = @id
GO 

CREATE PROC sp_find_by_id_dm_dcb
	@id INT
AS
	SELECT * FROM dm_dcb WHERE ma_dcb = @id
GO
-----------------------------------------------------------------------------------------------------------------------
CREATE PROC sp_view_all_dm_dcb
AS
	SELECT * FROM dm_dcb
GO
-----------------------------------------------------------------------------------------------------------------------
CREATE PROC sp_view_by_page_dm_dcb
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_dcb WHERE ma_dcb IN(
	SELECT ma_dcb FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_dcb DESC) AS Row, ma_dcb
			FROM  dm_dcb) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_dcb
GO


CREATE PROC sp_check_existed_dm_dcb
	@dcb	NVARCHAR(60)	
AS
	SELECT * FROM dm_dcb WHERE dcb = @dcb
GO

CREATE PROC sp_find_by_name_dm_dcb
	@dcb	NVARCHAR(60)	
AS
	SELECT * FROM dm_dcb WHERE dcb LIKE  (@dcb + N'%')
GO

CREATE PROC sp_delete_dm_dcb
	@id INT
AS
	DELETE FROM dm_dcb WHERE ma_dcb = @id
GO

/* bang 9 : dm_dd */
CREATE PROC sp_insert_dm_dd
		@ma_tinh	INT,
		@ten_huyen		nvarchar(40)
AS
	INSERT INTO dm_dd(ma_tinh, ten_huyen) VALUES
	(
		@ma_tinh, @ten_huyen
	)
GO

CREATE PROC sp_update_dm_dd
		@id				INT,
		@ten_huyen		nvarchar(40)
AS
	UPDATE dm_dd SET
		ten_huyen = @ten_huyen
	WHERE ma_huyen = @id
GO 

CREATE PROC sp_find_by_id_dm_dd
	@id INT
AS
	SELECT * FROM dm_dd WHERE ma_huyen = @id
GO

CREATE PROC sp_view_all_dm_dd
AS
	SELECT * FROM dm_dd
GO

CREATE PROC sp_view_by_page_dm_dd
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_dd WHERE ma_huyen IN(
	SELECT ma_huyen FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_huyen DESC) AS Row, ma_huyen
			FROM  dm_dd) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_dd
GO


CREATE PROC sp_check_existed_dm_dd
	@ten_huyen	NVARCHAR(40)	
AS
	SELECT * FROM dm_dd WHERE ten_huyen = @ten_huyen
GO

CREATE PROC sp_find_by_name_dm_dd
	@ten_huyen	NVARCHAR(40)	
AS
	SELECT * FROM dm_dd WHERE ten_huyen LIKE  (@ten_huyen + N'%')
GO

CREATE PROC sp_delete_dm_dd
	@id INT
AS
	DELETE FROM dm_dd WHERE ma_huyen = @id
GO

/* bang 10: dm_dhdp */
CREATE PROC sp_insert_dm_dhdp
		@dhdp	nvarchar(60)
AS
	INSERT INTO dm_dhdp(dhdp) VALUES
	(
		@dhdp
	)
GO

CREATE PROC sp_update_dm_dhdp
		@id				INT,
		@dhdp	nvarchar(60)
AS
	UPDATE dm_dhdp SET
		dhdp = @dhdp
	WHERE ma_dhdp = @id
GO 

CREATE PROC sp_find_by_id_dm_dhdp
	@id INT
AS
	SELECT * FROM dm_dhdp WHERE ma_dhdp = @id
GO

CREATE PROC sp_view_all_dm_dhdp
AS
	SELECT * FROM dm_dhdp
GO

CREATE PROC sp_view_by_page_dm_dhdp
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_dhdp WHERE ma_dhdp IN(
	SELECT ma_dhdp FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_dhdp DESC) AS Row, ma_dhdp
			FROM  dm_dhdp) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_dhdp
GO


CREATE PROC sp_check_existed_dm_dhdp
	@dhdp	NVARCHAR(60)	
AS
	SELECT * FROM dm_dhdp WHERE dhdp = @dhdp
GO

CREATE PROC sp_find_by_name_dm_dhdp
	@dhdp	NVARCHAR(60)	
AS
	SELECT * FROM dm_dhdp WHERE dhdp LIKE  (@dhdp + N'%')
GO


CREATE PROC sp_delete_dm_dhdp
	@id INT
AS
	DELETE FROM dm_dhdp WHERE ma_dhdp = @id
GO

/* bang 11: dm_dt */
CREATE PROC sp_insert_dm_dt
		@dt		nvarchar(40)
AS
	INSERT INTO dm_dt(dt) VALUES
	(
		@dt
	)
GO

CREATE PROC sp_update_dm_dt
		@id				INT,
		@dt		nvarchar(40)
AS
	UPDATE dm_dt SET
		dt = @dt
	WHERE ma_dt = @id
GO 

CREATE PROC sp_find_by_id_dm_dt
	@id INT
AS
	SELECT * FROM dm_dt WHERE ma_dt = @id
GO

CREATE PROC sp_view_all_dm_dt
AS
	SELECT * FROM dm_dt
GO

CREATE PROC sp_view_by_page_dm_dt
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_dt WHERE ma_dt IN(
	SELECT ma_dt FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_dt DESC) AS Row, ma_dt
			FROM  dm_dt) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_dt
GO


CREATE PROC sp_check_existed_dm_dt
	@dt	NVARCHAR(40)	
AS
	SELECT * FROM dm_dt WHERE dt = @dt
GO

CREATE PROC sp_find_by_name_dm_dt
	@dt	NVARCHAR(40)	
AS
	SELECT * FROM dm_dt WHERE dt LIKE  (@dt + N'%')
GO


CREATE PROC sp_delete_dm_dt
	@id INT
AS
	DELETE FROM dm_dt WHERE ma_dt = @id
GO

/* bang 12 : dm_dv */
CREATE PROC sp_insert_dm_dv
		@dv		nvarchar(200),
		@cap	tinyint,
		@cha	int
AS
	INSERT INTO dm_dv(dv, cap, cha) VALUES
	(
		@dv, @cap, @cha
	)
GO

CREATE PROC sp_update_dm_dv
		@id				INT,
		@dv		nvarchar(200),
		@cap	tinyint,
		@cha	int
AS
	UPDATE dm_dv SET
		dv = @dv,
		cap = @cap,
		cha = @cha
	WHERE ma_dv = @id
GO 

CREATE PROC sp_find_by_id_dm_dv
	@id INT
AS
	SELECT * FROM dm_dv WHERE ma_dv = @id
GO
-----------------------------------------------------------Chọn đơn vị lập báo cáo------------------------------------------------------------------------------
CREATE PROC sp_view_all_dm_dv
AS
	SELECT * FROM dm_dv
GO
-----------------------------------------------------------------------------------------------------------------------------------------
CREATE PROC sp_view_by_page_dm_dv
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_dv WHERE ma_dv IN(
	SELECT ma_dv FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_dv DESC) AS Row, ma_dv
			FROM  dm_dv) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_dv
GO


CREATE PROC sp_check_existed_dm_dv
	@dv	NVARCHAR(200)	
AS
	SELECT * FROM dm_dv WHERE dv = @dv
GO

CREATE PROC sp_find_by_name_dm_dv
	@dv	NVARCHAR(200)	
AS
	SELECT * FROM dm_dv WHERE dv LIKE  (@dv + N'%')
GO


CREATE PROC sp_delete_dm_dv
	@id INT
AS
	DELETE FROM dm_dv WHERE ma_dv = @id
GO

/* bang 13 : dm_gdcs */
CREATE PROC sp_insert_dm_gdcs
		@gdcs	nvarchar(60)
AS
	INSERT INTO dm_gdcs(gdcs) VALUES
	(
		@gdcs
	)
GO

CREATE PROC sp_update_dm_gdcs
		@id				INT,
		@gdcs	nvarchar(60)
AS
	UPDATE dm_gdcs SET
		gdcs = @gdcs
	WHERE ma_gdcs = @id
GO 

CREATE PROC sp_find_by_id_dm_gdcs
	@id INT
AS
	SELECT * FROM dm_gdcs WHERE ma_gdcs = @id
GO

CREATE PROC sp_view_all_dm_gdcs
AS
	SELECT * FROM dm_gdcs
GO

CREATE PROC sp_view_by_page_dm_gdcs
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_gdcs WHERE ma_gdcs IN(
	SELECT ma_gdcs FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_gdcs DESC) AS Row, ma_gdcs
			FROM  dm_gdcs) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_gdcs
GO


CREATE PROC sp_check_existed_dm_gdcs
		@gdcs	NVARCHAR(60)	
AS
	SELECT * FROM dm_gdcs WHERE gdcs = @gdcs
GO

CREATE PROC sp_find_by_name_dm_gdcs
	@gdcs	NVARCHAR(60)	
AS
	SELECT * FROM dm_gdcs WHERE gdcs LIKE  (@gdcs + N'%')
GO


CREATE PROC sp_delete_dm_gdcs
	@id INT
AS
	DELETE FROM dm_gdcs WHERE ma_gdcs = @id
GO

/* bang 14: dm_hh */
CREATE PROC sp_insert_dm_hh
		@hh		nvarchar(60)
AS
	INSERT INTO dm_hh(hh) VALUES
	(
		@hh
	)
GO

CREATE PROC sp_update_dm_hh
		@id				int,
		@hh		nvarchar(60)
AS
	UPDATE dm_hh SET
		hh = @hh
	WHERE ma_hh = @id
GO 

CREATE PROC sp_find_by_id_dm_hh
	@id INT
AS
	SELECT * FROM dm_hh WHERE ma_hh = @id
GO

CREATE PROC sp_view_all_dm_hh
AS
	SELECT * FROM dm_hh
GO

CREATE PROC sp_view_by_page_dm_hh
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_hh WHERE ma_hh IN(
	SELECT ma_hh FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_hh DESC) AS Row, ma_hh
			FROM  dm_hh) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_hh
GO


CREATE PROC sp_check_existed_dm_hh
		@hh	NVARCHAR(60)	
AS
	SELECT * FROM dm_hh WHERE hh = @hh
GO

CREATE PROC sp_find_by_name_dm_hh
	@hh	NVARCHAR(60)	
AS
	SELECT * FROM dm_hh WHERE hh LIKE  (@hh + N'%')
GO


CREATE PROC sp_delete_dm_hh
	@id INT
AS
	DELETE FROM dm_hh WHERE ma_hh = @id
GO

/* bang 15: dm_htdt */
CREATE PROC sp_insert_dm_htdt
		@htdt	nvarchar(60)
AS
	INSERT INTO dm_htdt(htdt) VALUES
	(
		@htdt
	)
GO

CREATE PROC sp_update_dm_htdt
		@id				int,
		@htdt	nvarchar(60)
AS
	UPDATE dm_htdt SET
		htdt = @htdt
	WHERE	ma_htdt = @id
GO 

CREATE PROC sp_find_by_id_dm_htdt
	@id INT
AS
	SELECT * FROM dm_htdt WHERE ma_htdt = @id
GO

CREATE PROC sp_view_all_dm_htdt
AS
	SELECT * FROM dm_htdt
GO

CREATE PROC sp_view_by_page_dm_htdt
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_htdt WHERE ma_htdt IN(
	SELECT ma_htdt FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_htdt DESC) AS Row, ma_htdt
			FROM  dm_htdt) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_htdt
GO


CREATE PROC sp_check_existed_dm_htdt
		@htdt	NVARCHAR(60)	
AS
	SELECT * FROM dm_htdt WHERE htdt = @htdt
GO

CREATE PROC sp_find_by_name_dm_htdt
	@htdt	NVARCHAR(60)	
AS
	SELECT * FROM dm_htdt WHERE htdt LIKE  (@htdt + N'%')
GO


CREATE PROC sp_delete_dm_htdt
	@id INT
AS
	DELETE FROM dm_htdt WHERE ma_htdt = @id
GO

/* bang 16: dm_kcb */
CREATE PROC sp_insert_dm_kcb
		@kcb	nvarchar(50)
AS
	INSERT INTO dm_kcb(kcb) VALUES
	(
		@kcb
	)
GO

CREATE PROC sp_update_dm_kcb
		@id				tinyint,
		@kcb	nvarchar(50)
AS
	UPDATE dm_kcb SET
		kcb = @kcb
	WHERE ma_kcb = @id
GO 

CREATE PROC sp_find_by_id_dm_kcb
	@id tinyint
AS
	SELECT * FROM dm_kcb WHERE ma_kcb = @id
GO


CREATE PROC sp_view_all_dm_kcb
AS
	SELECT * FROM dm_kcb
GO

CREATE PROC sp_view_by_page_dm_kcb
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_kcb WHERE ma_kcb IN(
	SELECT ma_kcb FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_kcb DESC) AS Row, ma_kcb
			FROM  dm_kcb) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_kcb
GO


CREATE PROC sp_check_existed_dm_kcb
		@kcb	NVARCHAR(50)	
AS
	SELECT * FROM dm_kcb WHERE kcb = @kcb
GO

CREATE PROC sp_find_by_name_dm_kcb
	@kcb	NVARCHAR(50)	
AS
	SELECT * FROM dm_kcb WHERE kcb LIKE  (@kcb + N'%')
GO

CREATE PROC sp_delete_dm_kcb
	@id tinyint
AS
	DELETE FROM dm_kcb WHERE ma_kcb = @id
GO

/* bang 17: dm_kl */
CREATE PROC sp_insert_dm_kl
		@kl		nvarchar(40)
AS
	INSERT INTO dm_kl(kl) VALUES
	(
		@kl
	)
GO

CREATE PROC sp_update_dm_kl
		@id				INT,
		@kl		nvarchar(40)
AS
	UPDATE dm_kl SET
		kl = @kl
	WHERE ma_kl = @id
GO 

CREATE PROC sp_find_by_id_dm_kl
	@id INT
AS
	SELECT * FROM dm_kl WHERE ma_kl = @id
GO

CREATE PROC sp_view_all_dm_kl
AS
	SELECT * FROM dm_kl
GO

CREATE PROC sp_view_by_page_dm_kl
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_kl WHERE ma_kl IN(
	SELECT ma_kl FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_kl DESC) AS Row, ma_kl
			FROM  dm_kl) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_kl
GO


CREATE PROC sp_check_existed_dm_kl
		@kl	NVARCHAR(40)	
AS
	SELECT * FROM dm_kl WHERE kl = @kl
GO

CREATE PROC sp_find_by_name_dm_kl
	@kl	NVARCHAR(40)	
AS
	SELECT * FROM dm_kl WHERE kl LIKE  (@kl + N'%')
GO


CREATE PROC sp_delete_dm_kl
	@id INT
AS
	DELETE FROM dm_kl WHERE ma_kl = @id
GO


/* Bang 18: dm_kt */

CREATE PROC sp_insert_dm_kt
		@kt		nvarchar(100)
AS
	INSERT INTO dm_kt(kt) VALUES
	(
		@kt
	)
GO

CREATE PROC sp_update_dm_kt
		@id				INT,
		@kt		nvarchar(100)
AS
	UPDATE dm_kt SET
		kt = @kt
	WHERE ma_kt = @id
GO 

CREATE PROC sp_find_by_id_dm_kt
	@id INT
AS
	SELECT * FROM dm_kt WHERE ma_kt = @id
GO

CREATE PROC sp_view_all_dm_kt
AS
	SELECT * FROM dm_kt
GO

CREATE PROC sp_view_by_page_dm_kt
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_kt WHERE ma_kt IN(
	SELECT ma_kt FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_kt DESC) AS Row, ma_kt
			FROM  dm_kt) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_kt
GO


CREATE PROC sp_check_existed_dm_kt
		@kt	NVARCHAR(100)	
AS
	SELECT * FROM dm_kt WHERE kt = @kt
GO

CREATE PROC sp_find_by_name_dm_kt
	@kt	NVARCHAR(100)	
AS
	SELECT * FROM dm_kt WHERE kt LIKE  (@kt + N'%')
GO


CREATE PROC sp_delete_dm_kt
	@id INT
AS
	DELETE FROM dm_kt WHERE ma_kt = @id
GO


/* Bang 19: dm_mdnndd */

CREATE PROC sp_insert_dm_mdnndd
		@mdnndd		nvarchar(100)
AS
	INSERT INTO dm_mdnndd(mdnndd) VALUES
	(
		@mdnndd
	)
GO

CREATE PROC sp_update_dm_mdnndd
		@id				INT,
		@mdnndd		nvarchar(100)
AS
	UPDATE dm_mdnndd SET
		mdnndd = @mdnndd
	WHERE ma_mdnndd = @id
GO 

CREATE PROC sp_find_by_id_dm_mdnndd
	@id INT
AS
	SELECT * FROM dm_mdnndd WHERE ma_mdnndd = @id
GO

CREATE PROC sp_view_all_dm_mdnndd
AS
	SELECT * FROM dm_mdnndd
GO

CREATE PROC sp_view_by_page_dm_mdnndd
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_mdnndd WHERE ma_mdnndd IN(
	SELECT ma_mdnndd FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_mdnndd DESC) AS Row, ma_mdnndd
			FROM  dm_mdnndd) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_mdnndd
GO


CREATE PROC sp_check_existed_dm_mdnndd
		@mdnndd	NVARCHAR(100)	
AS
	SELECT * FROM dm_mdnndd WHERE mdnndd = @mdnndd
GO

CREATE PROC sp_find_by_name_dm_mdnndd
	@mdnndd	NVARCHAR(100)	
AS
	SELECT * FROM dm_mdnndd WHERE mdnndd LIKE  (@mdnndd + N'%')
GO


CREATE PROC sp_delete_dm_mdnndd
	@id INT
AS
	DELETE FROM dm_mdnndd WHERE ma_mdnndd = @id
GO


/* Bảng 20 :dm_mlcb */
CREATE PROC sp_insert_dm_mlcb
		@ma_mlcb	char(3),
		@mlcb	nvarchar(15),
		@tgad	datetime,
		@ttk_mlcb	nvarchar(200)
AS
	INSERT INTO dm_mlcb(ma_mlcb, mlcb, tgad, ttk_mlcb) VALUES
	(
		@ma_mlcb, @mlcb, @tgad, @ttk_mlcb
	)
GO

CREATE PROC sp_update_dm_mlcb
		@id				char(3),
		@mlcb		nvarchar(15),
		@tgad datetime,
		@ttk_mlcb	nvarchar(200)
AS
	UPDATE dm_mlcb SET
		mlcb = @mlcb,
		tgad = @tgad,
		ttk_mlcb = @ttk_mlcb
	WHERE ma_mlcb = @id
GO 

CREATE PROC sp_find_by_id_dm_mlcb
	@id char(3)
AS
	SELECT * FROM dm_mlcb WHERE ma_mlcb = @id
GO

CREATE PROC sp_view_all_dm_mlcb
AS
	SELECT * FROM dm_mlcb
GO

CREATE PROC sp_view_by_page_dm_mlcb
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_mlcb WHERE ma_mlcb IN(
	SELECT ma_mlcb FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_mlcb DESC) AS Row, ma_mlcb
			FROM  dm_mlcb) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_mlcb
GO



CREATE PROC sp_check_existed_dm_mlcb
		@mlcb	NVARCHAR(15)	
AS
	SELECT * FROM dm_mlcb WHERE mlcb = @mlcb
GO

CREATE PROC sp_find_by_name_dm_mlcb
	@mlcb	NVARCHAR(15)	
AS
	SELECT * FROM dm_mlcb WHERE mlcb LIKE  (@mlcb + N'%')
GO


CREATE PROC sp_delete_dm_mlcb
	@id char(3)
AS
	DELETE FROM dm_mlcb WHERE ma_mlcb = @id
GO

/* Bang 21: dm_ngach */
CREATE PROC sp_insert_dm_ngach
		@ma_ngach	varchar(20),
		@ten_ngach		nvarchar(70),
		@bac1	decimal(4,2),
		@bac2	decimal(4,2),
		@bac3	decimal(4,2),
		@bac4	decimal(4,2),
		@bac5	decimal(4,2),
		@bac6	decimal(4,2),
		@bac7	decimal(4,2),
		@bac8	decimal(4,2),
		@bac9	decimal(4,2),
		@bac10	decimal(4,2),
		@bac11	decimal(4,2),
		@bac12	decimal(4,2),
		@bac13	decimal(4,2),
		@bac14	decimal(4,2),
		@bac15	decimal(4,2),
		@bac16	decimal(4,2),
		@totkhung	tinyint,
		@lvuc	nvarchar(100),
		@tluong	varchar(10)
AS
	INSERT INTO dm_ngach(ma_ngach, ten_ngach, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11, bac12, bac13, bac14, bac15, bac16, totkhung, lvuc, tluong) VALUES
	(
		@ma_ngach, @ten_ngach, @bac1, @bac2, @bac3, @bac4, @bac5, @bac6, @bac7, @bac8, @bac9, @bac10, @bac11, @bac12, @bac13, @bac14, @bac15, @bac16, @totkhung, @lvuc, @tluong
	)
GO

CREATE PROC sp_update_dm_ngach
		@id	varchar(20),
		@ten_ngach		nvarchar(70),
		@bac1	decimal(4,2),
		@bac2	decimal(4,2),
		@bac3	decimal(4,2),
		@bac4	decimal(4,2),
		@bac5	decimal(4,2),
		@bac6	decimal(4,2),
		@bac7	decimal(4,2),
		@bac8	decimal(4,2),
		@bac9	decimal(4,2),
		@bac10	decimal(4,2),
		@bac11	decimal(4,2),
		@bac12	decimal(4,2),
		@bac13	decimal(4,2),
		@bac14	decimal(4,2),
		@bac15	decimal(4,2),
		@bac16	decimal(4,2),
		@totkhung	tinyint,
		@lvuc	nvarchar(100),
		@tluong	varchar(10)
AS
	UPDATE dm_ngach SET
			ten_ngach = @ten_ngach,
			bac1 = @bac1,
			bac2 = @bac2,
			bac3 = @bac3,
			bac4 = @bac4,
			bac5 = @bac5,
			bac6 = @bac6,
			bac7 = @bac7,
			bac8 = @bac8,
			bac9 = @bac9,
			bac10 = @bac10,
			bac11 = @bac11,
			bac12 = @bac12,
			bac13 = @bac13,
			bac14 = @bac14,
			bac15 = @bac15,
			bac16 = @bac16,
			totkhung = @totkhung,
			lvuc = @lvuc,
			tluong = @tluong
	WHERE ma_ngach = @id
GO 

CREATE PROC sp_find_by_id_dm_ngach
	@id varchar(20)
AS
	SELECT * FROM dm_ngach WHERE ma_ngach = @id
GO

CREATE PROC sp_view_all_dm_ngach
AS
	SELECT * FROM dm_ngach
GO

CREATE PROC sp_view_by_page_dm_ngach
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_ngach WHERE ma_ngach IN(
	SELECT ma_ngach FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_ngach DESC) AS Row, ma_ngach
			FROM  dm_ngach) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_ngach
GO


CREATE PROC sp_check_existed_dm_ngach
		@ten_ngach	NVARCHAR(70)	
AS
	SELECT * FROM dm_ngach WHERE ten_ngach = @ten_ngach
GO

CREATE PROC sp_find_by_name_dm_ngach
	@ten_ngach	NVARCHAR(70)	
AS
	SELECT * FROM dm_ngach WHERE ten_ngach LIKE  (@ten_ngach + N'%')
GO


CREATE PROC sp_delete_dm_ngach
	@id INT
AS
	DELETE FROM dm_ngach WHERE ma_ngach = @id
GO

/* Bang 22: dm_nkpnndd */
CREATE PROCEDURE sp_insert_dm_nkpnndd 
	@nkpnndd nvarchar(30)
AS
 INSERT INTO dm_nkpnndd(nkpnndd) VALUES
	(
		@nkpnndd
	)
GO

CREATE PROC sp_update_dm_nkpnndd
		@ma_nkpnndd	INT,
		@nkpnndd	nvarchar(30)
AS
	UPDATE dm_nkpnndd SET
		nkpnndd = @nkpnndd
	WHERE ma_nkpnndd = @ma_nkpnndd
GO 


CREATE PROC sp_find_by_id_dm_nkpnndd
	@id INT
AS
	SELECT * FROM dm_nkpnndd WHERE ma_nkpnndd = @id
GO

CREATE PROC sp_view_all_dm_nkpnndd
AS
	SELECT * FROM dm_nkpnndd
GO

CREATE PROC sp_view_by_page_dm_nkpnndd
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_nkpnndd WHERE ma_nkpnndd IN(
	SELECT ma_nkpnndd FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_nkpnndd DESC) AS Row, ma_nkpnndd
			FROM  dm_nkpnndd) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_nkpnndd
GO


CREATE PROC sp_check_existed_dm_nkpnndd
	@nkpnndd	NVARCHAR(30)	
AS
	SELECT * FROM dm_nkpnndd WHERE nkpnndd = @nkpnndd
GO

CREATE PROC sp_find_by_name_dm_nkpnndd
	@nkpnndd	NVARCHAR(30)	
AS
	SELECT * FROM dm_nkpnndd WHERE nkpnndd LIKE  ( @nkpnndd + N'%')
GO


CREATE PROC sp_delete_dm_nkpnndd
	@id INT
AS
	DELETE FROM dm_nkpnndd WHERE ma_nkpnndd = @id
GO

/* bang 23: dm_qg */
CREATE PROC sp_insert_dm_qg
		@qg nvarchar(40)
AS
	INSERT INTO dm_qg(qg) VALUES
	(
		@qg
	)
GO

CREATE PROC sp_update_dm_qg
		@id				INT,
		@qg		nvarchar(40)
AS
	UPDATE dm_qg SET
		qg = @qg
	WHERE ma_qg = @id
GO 

CREATE PROC sp_find_by_id_dm_qg
	@id INT
AS
	SELECT * FROM dm_qg WHERE ma_qg = @id
GO

CREATE PROC sp_view_all_dm_qg
AS
	SELECT * FROM dm_qg
GO

CREATE PROC sp_view_by_page_dm_qg
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_qg WHERE ma_qg IN(
	SELECT ma_qg FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_qg DESC) AS Row, ma_qg
			FROM  dm_qg) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_qg
GO


CREATE PROC sp_check_existed_dm_qg
	@qg	NVARCHAR(40)	
AS
	SELECT * FROM dm_qg WHERE qg = @qg
GO

CREATE PROC sp_find_by_name_dm_qg
	@qg	NVARCHAR(40)	
AS
	SELECT * FROM dm_qg WHERE qg LIKE  (@qg + N'%')
GO


CREATE PROC sp_delete_dm_qg
	@id INT
AS
	DELETE FROM dm_qg WHERE ma_qg = @id
GO

/* Bang 24: dm_qhgd */
CREATE PROC sp_insert_dm_qhgd
		@qhgd		nvarchar(60)
AS
	INSERT INTO dm_qhgd(qhgd) VALUES
	(
		@qhgd
	)
GO

CREATE PROC sp_update_dm_qhgd
		@id				INT,
		@qhgd		nvarchar(60)
AS
	UPDATE dm_qhgd SET
		qhgd = @qhgd
	WHERE ma_qhgd = @id
GO 

CREATE PROC sp_find_by_id_dm_qhgd
	@id INT
AS
	SELECT * FROM dm_qhgd WHERE ma_qhgd = @id
GO

CREATE PROC sp_view_all_dm_qhgd
AS
	SELECT * FROM dm_qhgd
GO

CREATE PROC sp_view_by_page_dm_qhgd
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_qhgd WHERE ma_qhgd IN(
	SELECT ma_qhgd FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_qhgd DESC) AS Row, ma_qhgd
			FROM  dm_qhgd) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_qhgd
GO


CREATE PROC sp_check_existed_dm_qhgd
	@qhgd	NVARCHAR(60)	
AS
	SELECT * FROM dm_qhgd WHERE qhgd = @qhgd
GO

CREATE PROC sp_find_by_name_dm_qhgd
	@qhgd	NVARCHAR(60)	
AS
	SELECT * FROM dm_qhgd WHERE qhgd LIKE  (@qhgd + N'%')
GO


CREATE PROC sp_delete_dm_qhgd
	@id INT
AS
	DELETE FROM dm_qhgd WHERE ma_qhgd = @id
GO

/* Bang 25: dm_tb */
CREATE PROC sp_insert_dm_tb
		@tb		nvarchar(20)
AS
	INSERT INTO dm_tb(tb) VALUES
	(
		@tb
	)
GO

CREATE PROC sp_update_dm_tb
		@id				INT,
		@tb		nvarchar(20)
AS
	UPDATE dm_tb SET
		tb = @tb
	WHERE ma_tb = @id
GO 

CREATE PROC sp_find_by_id_dm_tb
	@id INT
AS
	SELECT * FROM dm_tb WHERE ma_tb = @id
GO

CREATE PROC sp_view_all_dm_tb
AS
	SELECT * FROM dm_tb
GO

CREATE PROC sp_view_by_page_dm_tb
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tb WHERE ma_tb IN(
	SELECT ma_tb FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tb DESC) AS Row, ma_tb
			FROM  dm_tb) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tb
GO


CREATE PROC sp_check_existed_dm_tb
	@tb	NVARCHAR(20)	
AS
	SELECT * FROM dm_tb WHERE tb = @tb
GO

CREATE PROC sp_find_by_name_dm_tb
	@tb	NVARCHAR(20)	
AS
	SELECT * FROM dm_tb WHERE tb LIKE  (@tb + N'%')
GO


CREATE PROC sp_delete_dm_tb
	@id INT
AS
	DELETE FROM dm_tb WHERE ma_tb = @id
GO


/* bang 26: dm_tdcm */
CREATE PROC sp_insert_dm_tdcm
		@tdcm		nvarchar(50)
AS
	INSERT INTO dm_tdcm(tdcm) VALUES
	(
		@tdcm
	)
GO

CREATE PROC sp_update_dm_tdcm
		@id				INT,
		@tdcm		nvarchar(50)
AS
	UPDATE dm_tdcm SET
		tdcm = @tdcm
	WHERE ma_tdcm = @id
GO 

CREATE PROC sp_find_by_id_dm_tdcm
	@id INT
AS
	SELECT * FROM dm_tdcm WHERE ma_tdcm = @id
GO

CREATE PROC sp_view_all_dm_tdcm
AS
	SELECT * FROM dm_tdcm
GO

CREATE PROC sp_view_by_page_dm_tdcm
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdcm WHERE ma_tdcm IN(
	SELECT ma_tdcm FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdcm DESC) AS Row, ma_tdcm
			FROM  dm_tdcm) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdcm
GO


CREATE PROC sp_check_existed_dm_tdcm
	@tdcm	NVARCHAR(50)	
AS
	SELECT * FROM dm_tdcm WHERE tdcm = @tdcm
GO

CREATE PROC sp_find_by_name_dm_tdcm
	@tdcm	NVARCHAR(50)	
AS
	SELECT * FROM dm_tdcm WHERE tdcm LIKE  (@tdcm + N'%')
GO


CREATE PROC sp_delete_dm_tdcm
	@id INT
AS
	DELETE FROM dm_tdcm WHERE ma_tdcm = @id
GO

/* Bang 27: dm_tdhv */
CREATE PROC sp_insert_dm_tdhv
		@tdhv		nvarchar(40)
AS
	INSERT INTO dm_tdhv(tdhv) VALUES
	(
		@tdhv
	)
GO

CREATE PROC sp_update_dm_tdhv
		@id				INT,
		@tdhv		nvarchar(40)
AS
	UPDATE dm_tdhv SET
		tdhv = @tdhv
	WHERE ma_tdhv = @id
GO 

CREATE PROC sp_find_by_id_dm_tdhv
	@id INT
AS
	SELECT * FROM dm_tdhv WHERE ma_tdhv = @id
GO

CREATE PROC sp_view_all_dm_tdhv
AS
	SELECT * FROM dm_tdhv
GO

CREATE PROC sp_view_by_page_dm_tdhv
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdhv WHERE ma_tdhv IN(
	SELECT ma_tdhv FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdhv DESC) AS Row, ma_tdhv
			FROM  dm_tdhv) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdhv
GO


CREATE PROC sp_check_existed_dm_tdhv
	@tdhv	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdhv WHERE tdhv = @tdhv
GO

CREATE PROC sp_find_by_name_dm_tdhv
	@tdhv	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdhv WHERE tdhv LIKE  (@tdhv + N'%')
GO


CREATE PROC sp_delete_dm_tdhv
	@id INT
AS
	DELETE FROM dm_tdhv WHERE ma_tdhv = @id
GO

/* Bang 28: dm_tdll */
CREATE PROC sp_insert_dm_tdll
		@tdll		nvarchar(40)
AS
	INSERT INTO dm_tdll(tdll) VALUES
	(
		@tdll
	)
GO

CREATE PROC sp_update_dm_tdll
		@id				INT,
		@tdll		nvarchar(40)
AS
	UPDATE dm_tdll SET
		tdll = @tdll
	WHERE ma_tdll = @id
GO 

CREATE PROC sp_find_by_id_dm_tdll
	@id INT
AS
	SELECT * FROM dm_tdll WHERE ma_tdll = @id
GO

CREATE PROC sp_view_all_dm_tdll
AS
	SELECT * FROM dm_tdll
GO

CREATE PROC sp_view_by_page_dm_tdll
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdll WHERE ma_tdll IN(
	SELECT ma_tdll FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdll DESC) AS Row, ma_tdll
			FROM  dm_tdll) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdll
GO


CREATE PROC sp_check_existed_dm_tdll
	@tdll	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdll WHERE tdll = @tdll
GO

CREATE PROC sp_find_by_name_dm_tdll
	@tdll	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdll WHERE tdll LIKE  (@tdll + N'%')
GO


CREATE PROC sp_delete_dm_tdll
	@id INT
AS
	DELETE FROM dm_tdll WHERE ma_tdll = @id
GO

/* Bang 29: dm_tdnn */

CREATE PROC sp_insert_dm_tdnn
		@tdnn		nvarchar(40)
AS
	INSERT INTO dm_tdnn(tdnn) VALUES
	(
		@tdnn
	)
GO

CREATE PROC sp_update_dm_tdnn
		@id				INT,
		@tdnn		nvarchar(40)
AS
	UPDATE dm_tdnn SET
		tdnn = @tdnn
	WHERE ma_tdnn = @id
GO 

CREATE PROC sp_find_by_id_dm_tdnn
	@id INT
AS
	SELECT * FROM dm_tdnn WHERE ma_tdnn = @id
GO

CREATE PROC sp_view_all_dm_tdnn
AS
	SELECT * FROM dm_tdnn
GO

CREATE PROC sp_view_by_page_dm_tdnn
	@PageIndex INT,
	@PageSize INT,
	@Total INT OUTPUT
AS
	SELECT * FROM dm_tdnn WHERE ma_tdnn IN(
	SELECT ma_tdnn FROM  ( SELECT ROW_NUMBER() OVER(ORDER BY ma_tdnn DESC) AS Row, ma_tdnn
			FROM  dm_tdnn) AS TempTable WHERE ( Row > (@PageIndex) *@PageSize) AND (Row <= (@PageIndex + 1 )* @PageSize)
	)
	SELECT @Total = COUNT(*) FROM dm_tdnn
GO


CREATE PROC sp_check_existed_dm_tdnn
	@tdnn	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdnn WHERE tdnn = @tdnn
GO

CREATE PROC sp_find_by_name_dm_tdnn
	@tdnn	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdnn WHERE tdnn LIKE  (@tdnn + N'%')
GO


CREATE PROC sp_delete_dm_tdnn
	@id INT
AS
	DELETE FROM dm_tdnn WHERE ma_tdnn = @id
GO


CREATE PROC sp_delete_dm_tdql
	@id INT
AS
	DELETE FROM dm_tdql WHERE ma_tdql = @id
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

CREATE PROC sp_find_by_name_dm_tdql
	@tdql	NVARCHAR(40)	
AS
	SELECT * FROM dm_tdql WHERE tdql LIKE  (@tdql + N'%')
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
		@vdpc			NVARCHAR(100),
		@nvbc			DATETIME,
		@cvdn			NVARCHAR(100),
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
		@cthktt			NVARCHAR(255),
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
		cthktt			,
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
		@cthktt,
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
		@vdpc			NVARCHAR(100),
		@nvbc			DATETIME,
		@cvdn			NVARCHAR(100),
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
		@cthktt			NVARCHAR(255),
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
		cthktt			=@cthktt,
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



CREATE PROCEDURE [dbo].[HutStaff_huyhoso_insert]
	-- Add the parameters for the stored procedure here
	@userId int,
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DEClARE @hoten nvarchar(50)
	DECLARE @check int
	SET @check = (  SELECT COUNT(*) FROM [huyhoso] WHERE [shcc] = @shcc )
	IF(@check = 0 )
	BEGIN
		SET @hoten = ( SELECT [hodem] + ' ' + [ten] FROM [soyeu] WHERE [shcc] = @shcc )
		INSERT INTO [dbo].[huyhoso]
			   ([user_id]
			   ,[hoten]
			   ,[ngayyeucau]
			   ,[Nguoiduyet]
			   ,[ngayduyet]
			   ,[yeucau]
			   ,[duyet]
			   ,[trangthai],
			   [shcc])
		 VALUES
			   (@userId,
			   @hoten,
			   GETDATE(),
			   NULL,
			   NULL,
			   NULL,
			   NULL,
			   0,
			   @shcc)
	END
	ELSE 
	BEGIN
		UPDATE [huyhoso]
		SET [trangthai] = 0,
		[user_id] = @userId,
		ngayyeucau = GETDATE(),
		[Nguoiduyet] = NULL,
		[ngayduyet] = NULL
		WHERE [shcc] = @shcc
	END
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_KhoiPhuc]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_huyhoso_KhoiPhuc] 
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE [huyhoso]
	WHERE [shcc] = @shcc
	UPDATE [soyeu]
	SET [xoahs] = 0
	WHERE [shcc] = @shcc

END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_KhongXoa]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_huyhoso_KhongXoa] 
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE [huyhoso]
	WHERE [shcc] = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_KhongXoas]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_huyhoso_KhongXoas] 
	-- Add the parameters for the stored procedure here
	@shcc nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE [huyhoso]
	WHERE [shcc] IN ( SELECT * FROM dbo.fnSplit(@shcc,','))

END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_Search]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------
CREATE PROC [dbo].[HutStaff_huyhoso_Search]
	@ten nvarchar(50),
	@trangthai int,
	@PageSize int,
	@PageIndex int
AS	
SET @ten = dbo.fLocDauTiengViet(@ten)
	SELECT * FROM (
		SELECT [huyhoso].shcc, [huyhoso].ngayduyet , u2.[user] as [nguoiduyetname] , u2.id as [nguoiduyetid] , [huyhoso].ngayyeucau  , hodem + ' '  + ten AS hoten, dv, tel, email, u1.id as [userId] ,u1.[user] as [userName] , ROW_NUMBER() OVER(ORDER BY ma_dvql, [huyhoso].shcc ASC) AS Row 
		FROM [huyhoso]
		LEFT JOIN soyeu  a
		ON [huyhoso].shcc = a.shcc
	    LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		LEFT JOIN [Users] as u1 ON u1.id = [huyhoso].user_id
		LEFT JOIN [Users] as u2 ON u2.id = [huyhoso].Nguoiduyet
		WHERE  (@ten='' or dbo.fLocDauTiengViet( hodem+' '+ten) like '%'+ @ten+ '%')
		AND [huyhoso].trangthai = @trangthai
) r WHERE Row >  (@PageIndex-1) * @PageSize AND Row <= @PageIndex * @PageSize


GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_Xoa]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_huyhoso_Xoa] 
	-- Add the parameters for the stored procedure here
	@shcc int,
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [huyhoso]
	SET [trangthai] = 1,
	[Nguoiduyet] = @userId,
	[ngayduyet] = GETDATE()
	WHERE [shcc] = @shcc
	UPDATE [soyeu]
	SET [xoahs] = 1
	WHERE [shcc] = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_huyhoso_Xoas]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_huyhoso_Xoas] 
	-- Add the parameters for the stored procedure here
	@shcc nvarchar(max),
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [huyhoso]
	SET [trangthai] = 1,
	[Nguoiduyet] = @userId,
	[ngayduyet] = GETDATE()
	WHERE [shcc] IN ( SELECT * FROM dbo.fnSplit(@shcc,','))
	UPDATE [soyeu]
	SET [xoahs] = 1
	WHERE [shcc] IN ( SELECT * FROM dbo.fnSplit(@shcc,','))

END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_Insert_Qtkt]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HutStaff_Insert_Qtkt]
		@shcc			INT,
		@htkt		nvarchar(max),
		@nkt_qtkt		DATETIME,
		@soqd_qtkt		NVARCHAR(255),
		@ttk_qtkt		NVARCHAR(255)
AS
	BEGIN
	
	DECLARE @ma_htkt int
	SET @ma_htkt = ( SELECT ma_kt FROM [dm_kt] WHERE  LOWER(@htkt) LIKE '%' + LOWER([kt]) + '%'  )
	INSERT INTO qtkt_tbl (shcc, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt) 
	VALUES
	(
		@shcc, @ma_htkt, @nkt_qtkt, @soqd_qtkt, @ttk_qtkt
	)

END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_search_soyeu]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------
CREATE PROC [dbo].[HutStaff_search_soyeu]
@ma_dv VARCHAR(6),
	@ten NVARCHAR(50),
	@gioitinh DECIMAL(1,0),
	@tutuoi INT,
	@dentuoi INT,
	@diencb INT,
	@khoicanbo INT,
	@nvtruong INT,
	@PageIndex int,
	@PageSize int
AS	
SET @ten = dbo.fLocDauTiengViet(@ten)
if(@tutuoi = -1 and @dentuoi = -1)
	SELECT shcc, hoten, dv, tel, email FROM (
		SELECT shcc, hodem + ' '  + ten AS hoten, dv, tel, email, ROW_NUMBER() OVER(ORDER BY ma_dvql,shcc ASC) AS Row 
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE   (@gioitinh = -1 or gt =@gioitinh)
		 and left(ma_dvql,len(@ma_dv))=@ma_dv 
		 and (@ten='' or dbo.fLocDauTiengViet( hodem+' '+ten) like '%'+ @ten+ '%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong)
) r WHERE Row >  (@PageIndex-1) * @PageSize AND Row <= @PageIndex * @PageSize
else 
if(@tutuoi>0 and @dentuoi = -1)
	SELECT shcc, hoten, dv, tel, email FROM (
		SELECT shcc, hodem + ' '  + ten AS hoten, dv, tel, email, ROW_NUMBER() OVER(ORDER BY ma_dvql,shcc ASC) AS Row 
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (  @ten='' or dbo.fLocDauTiengViet( hodem+' '+ten) like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)>=@tutuoi
	) r WHERE Row >  (@PageIndex-1) * @PageSize AND Row <= @PageIndex * @PageSize
else
if(@tutuoi = -1 and @dentuoi>0)
	SELECT shcc, hoten, dv, tel, email FROM (
		SELECT shcc, hodem + ' '  + ten AS hoten, dv, tel, email, ROW_NUMBER() OVER(ORDER BY ma_dvql,shcc ASC) AS Row 
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or dbo.fLocDauTiengViet( hodem+' '+ten ) like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)<=@dentuoi
) r WHERE Row >  (@PageIndex-1) * @PageSize AND Row <= @PageIndex * @PageSize
else
	SELECT shcc, hoten, dv, tel, email FROM (
	SELECT shcc, hodem + ' '  + ten AS hoten, dv, tel, email, ROW_NUMBER() OVER(ORDER BY ma_dvql,shcc ASC) AS Row 
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or dbo.fLocDauTiengViet( hodem+' '+ten) like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)>=@tutuoi and year(ntns) <=@dentuoi
) r WHERE Row >  (@PageIndex-1) * @PageSize AND Row <= @PageIndex * @PageSize


GO
/****** Object:  StoredProcedure [dbo].[HutStaff_search_soyeu_count]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HutStaff_search_soyeu_count]
	@ma_dv VARCHAR(6),
	@ten NVARCHAR(50),
	@gioitinh DECIMAL(1,0),
	@tutuoi INT,
	@dentuoi INT,
	@diencb INT,
	@khoicanbo INT,
	@nvtruong INT,
	@deletes nvarchar(max)
AS	
if(@tutuoi = -1 and @dentuoi = -1)
		SELECT COUNT(*)
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE   (@gioitinh = -1 or gt =@gioitinh) and left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or hodem+' '+ten like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong)
		and [shcc] NOT IN ( SELECT * FROM fnSplit(@deletes,',') )
else 
if(@tutuoi>0 and @dentuoi = -1)
	SELECT COUNT(*)
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or hodem+' '+ten like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)>=@tutuoi
		and [shcc] NOT IN ( SELECT * FROM fnSplit(@deletes,',') )
else
if(@tutuoi = -1 and @dentuoi>0)
	SELECT COUNT(*)
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or hodem+' '+ten like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)<=@dentuoi
		and [shcc] NOT IN ( SELECT * FROM fnSplit(@deletes,',') )
else
	SELECT COUNT(*)
		FROM soyeu  a LEFT JOIN  dm_dv b ON a.ma_dvql = b.ma_dv 
		WHERE    (@gioitinh = -1 or gt =@gioitinh) and  left(ma_dvql,len(@ma_dv))=@ma_dv and (@ten='' or hodem+' '+ten like '%'+@ten+'%')
        and ((@diencb = -1)	or dcb=@diencb) and ((@khoicanbo = -1) or kcb=@khoicanbo)
		and ((@nvtruong = -1) or year(ntgcm)=@nvtruong) and year(ntns)>=@tutuoi and year(ntns) <=@dentuoi
		and [shcc] NOT IN ( SELECT * FROM fnSplit(@deletes,',') )

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_Update_Bhxh]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[HutStaff_Update_Bhxh]
		@shcc			INT,
		@shb			NVARCHAR(20),
		@ndbh			datetime
AS
	BEGIN
	
	UPDATE [soyeu]
	SET [sbh] = @shb,
		[ndbh] = @ndbh
	WHERE [shcc] = @shcc

END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Authenticate]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HutStaff_User_Authenticate]
	@username nvarchar(500),
	@password nvarchar(500)
AS
BEGIN
    SELECT *
    FROM [Users]
    WHERE [user] = @username 
    AND [pass] = @password
    AND [isLock] = 0 
    AND ([quyen] = 0 OR [quyen] = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Store hiển thị danh sách nâng lương 
 * loaiHanNgach: loại hạn ngạch :
 *			Value = 2: loại 2 năm
 *				  = 3: loại 3 năm
 * loaibang: Loại bảng
 *			Value = 1: Bảng danh sách đến hạn nâng lương
 *				  = 2: Bảng danh sách xét duyệt 5%
 *				  =	3: Bảng danh sách vượt khung
 * thoigian: tính đến thời gian nào (tháng/năm) nhập vào 00:00:00 1/thang/nam
 */
 

CREATE PROC [dbo].[HutStaff_User_increment_list]
	@pageIndex INT,
	@pageSize INT,
	@loaiHanNgach INT, 
	@loaiBang INT,
	@thoiGian DATETIME,
	@delete nvarchar(max)
AS

DECLARE @hanNgach INT, @tLuong VARCHAR(1)
		
SET NOCOUNT ON
IF (@loaiBang = 1)
BEGIN
    IF (@loaiHanNgach = 2)
	BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '2'
	END
	ELSE 
	BEGIN
		SET @hanNgach = 1095
		SET @tLuong = '3'
	 
	END
	SELECT *
	FROM
	(
			SELECT sy.hodem,
				   sy.ten,
				   sy.shcc,
				   qt.ma_ngach,
				   qt.bl_dbl,
				   qt.hsl,
				   qt.tgbd_dbl,
				   ttk_qtdbl,
				   hspctn,
				   ROW_NUMBER() OVER (ORDER BY  sy.ten ASC) Row
			FROM   qtdbl_tbl AS qt
				   LEFT JOIN soyeu AS sy
						ON  qt.shcc = sy.shcc
				   LEFT JOIN dm_ngach AS c
						ON  qt.ma_ngach = c.ma_ngach
			WHERE  (
					   qt.hnay = 1
					   AND c.ma_ngach NOT LIKE '%old'
					   AND c.tluong LIKE (@tLuong +  '%')
					   AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
					   AND qt.bl_dbl < c.totkhung
					   AND (sy.dcb IN (1,2,3,4))
					   AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
				   )
    ) [Temp]
	WHERE Row >  (@pageIndex-1) * @pageSize AND Row <= @pageIndex * @pageSize
END

IF (@loaiBang = 2)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 365
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '3'
    END
	SELECT *
	FROM
	(
		SELECT sy.hodem,
			   sy.ten,
			   sy.shcc,
			   qt.ma_ngach,
			   qt.bl_dbl,
			   qt.hsl,
			 qt.tgbd_dbl,
			   ttk_qtdbl,
			   hspctn,
			    ROW_NUMBER() OVER (ORDER BY  sy.ten ASC) Row
		FROM   qtdbl_tbl AS qt
			   LEFT JOIN soyeu AS sy
					ON  qt.shcc = sy.shcc
			   LEFT JOIN dm_ngach AS c
					ON  qt.ma_ngach = c.ma_ngach
		WHERE  (
				   qt.hnay = 1
				   AND c.ma_ngach NOT LIKE '%old'
				   AND c.tluong LIKE (@tLuong + '%')
				   AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
				   AND qt.bl_dbl < c.totkhung
				   AND (sy.dcb IN (1,2,3,4))
				AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
			   )
	) [Temp]
	WHERE Row >  (@pageIndex-1) * @pageSize AND Row <= @pageIndex * @pageSize
END


IF (@loaiBang = 3)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 730
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 1095
		SET @tLuong = '3'
    END
    
    SELECT *
	FROM
	(
		SELECT sy.hodem,
			   sy.ten,
			   sy.shcc,
			   qt.ma_ngach,
			   qt.bl_dbl,
			   qt.tgbd_dbl,
			   qt.hsl,
			   ttk_qtdbl,
			   qt.hspctn,
			    ROW_NUMBER() OVER (ORDER BY  sy.ten ASC) Row
		FROM   qtdbl_tbl AS qt
			   LEFT JOIN soyeu AS sy
					ON  qt.shcc = sy.shcc
			   LEFT JOIN dm_ngach AS c
					ON  qt.ma_ngach = c.ma_ngach
		WHERE  (
				   qt.hnay = 1
				   AND c.ma_ngach NOT LIKE '%old'
				   AND c.tluong LIKE  (@tLuong + '%')
				   AND (
							(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= 365 AND qt.hspctn > 0.00) 
							OR 
							(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach
									AND qt.hspctn = 0.00
									AND qt.bl_dbl = c.totkhung
							 )
						)
					
					AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
				   AND (sy.dcb IN (1,2,3,4))
			   )
    ) [Temp]
	WHERE Row >  (@pageIndex-1) * @pageSize AND Row <= @pageIndex * @pageSize
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list_Count]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Store hiển thị danh sách nâng lương 
 * loaiHanNgach: loại hạn ngạch :
 *			Value = 2: loại 2 năm
 *				  = 3: loại 3 năm
 * loaibang: Loại bảng
 *			Value = 1: Bảng danh sách đến hạn nâng lương
 *				  = 2: Bảng danh sách xét duyệt 5%
 *				  =	3: Bảng danh sách vượt khung
 * thoigian: tính đến thời gian nào (tháng/năm) nhập vào 00:00:00 1/thang/nam
 */
 

CREATE PROC [dbo].[HutStaff_User_increment_list_Count]
	@loaiHanNgach INT, 
	@loaiBang INT,
	@thoiGian DATETIME,
	@delete nvarchar(max)
AS

DECLARE @hanNgach INT, @tLuong VARCHAR(1)
		
SET NOCOUNT ON
IF (@loaiBang = 1)
BEGIN
    IF (@loaiHanNgach = 2)
	BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '2'
	END
	ELSE 
	BEGIN
		SET @hanNgach = 1095
		SET @tLuong = '3'
	 
	END

			SELECT COUNT(*)
			FROM   qtdbl_tbl AS qt
				   LEFT JOIN soyeu AS sy
						ON  qt.shcc = sy.shcc
				   LEFT JOIN dm_ngach AS c
						ON  qt.ma_ngach = c.ma_ngach
			WHERE  (
					   qt.hnay = 1
					   AND c.ma_ngach NOT LIKE '%old'
					   AND c.tluong LIKE (@tLuong +  '%')
					   AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
					   AND qt.bl_dbl < c.totkhung
					   AND (sy.dcb IN (1,2,3,4))
					   AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
				   )
END

IF (@loaiBang = 2)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 365
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '3'
    END
		SELECT COUNT(*)
		FROM   qtdbl_tbl AS qt
			   LEFT JOIN soyeu AS sy
					ON  qt.shcc = sy.shcc
			   LEFT JOIN dm_ngach AS c
					ON  qt.ma_ngach = c.ma_ngach
		WHERE  (
				   qt.hnay = 1
				   AND c.ma_ngach NOT LIKE '%old'
				   AND c.tluong LIKE (@tLuong + '%')
				   AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
				   AND qt.bl_dbl < c.totkhung
				   AND (sy.dcb IN (1,2,3,4))
					   AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
			   )
END


IF (@loaiBang = 3)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 730
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 1095
		SET @tLuong = '3'
    END
    
		SELECT COUNT(*)
		FROM   qtdbl_tbl AS qt
			   LEFT JOIN soyeu AS sy
					ON  qt.shcc = sy.shcc
			   LEFT JOIN dm_ngach AS c
					ON  qt.ma_ngach = c.ma_ngach
		WHERE  (
				   qt.hnay = 1
				   AND c.ma_ngach NOT LIKE '%old'
				   AND c.tluong LIKE  (@tLuong + '%')
				   AND (
							(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= 365 AND qt.hspctn > 0.00) 
							OR 
							(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach
									AND qt.hspctn = 0.00
									AND qt.bl_dbl = c.totkhung
							 )
						)
					
				   AND (sy.dcb IN (1,2,3,4))
					   AND [qt].shcc NOT IN ( SELECT * FROM fnSplit(@delete,',') )
			   )
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_Search]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_User_Soyeu_Search]
	-- Add the parameters for the stored procedure here
	@pageIndex int,
	@pageSize int,
	@keyword nvarchar(200),
	@xoahs int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM (
			SELECT [soyeu].* , [dm_dv].dv as [dvql] , ROW_NUMBER() OVER (ORDER BY [shcc] DESC) Row
			FROM   [soyeu]
			LEFT JOIN [dm_dv]
			ON [soyeu].ma_dvql = [dm_dv].ma_dv
			WHERE (@keyword = '' OR LOWER([hodem] + ' ' + [ten]) LIKE '%' + @keyword + '%' )
			AND (@xoahs = -1 OR [xoahs] = @xoahs)
			) [Temp]
	WHERE Row >  (@pageIndex-1) * @pageSize AND Row <= @pageIndex * @pageSize
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_SearchCount]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_User_Soyeu_SearchCount]
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(200),
	@xoahs int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
			SELECT COUNT(*)
			FROM   [soyeu]
			WHERE (@keyword = '' OR LOWER([hodem] + ' ' + [ten]) LIKE '%' + @keyword + '%' )
			AND (@xoahs = -1 OR [xoahs] = @xoahs)
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_Authenticate]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_Authenticate]
	@username nvarchar(500),
	@password nvarchar(500)
AS
BEGIN
    SELECT *
    FROM [soyeu]
    WHERE [user] = @username AND [pass] = @password AND [xoahs] = 0
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_cvcq_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_cvcq_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [qtcvkn_tbl].* , [dm_cv].cv
	FROM [qtcvkn_tbl]
	LEFT JOIN [dm_cv]
	ON [qtcvkn_tbl].ma_cv = [dm_cv].ma_cv
	WHERE [qtcvkn_tbl].shcc = @shcc
	order by nbncvkn asc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dbl_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_dbl_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtdbl_tbl].*,[dm_ngach].ten_ngach
	FROM [qtdbl_tbl]
	LEFT JOIN [dm_ngach]
	ON [qtdbl_tbl].ma_ngach = [dm_ngach].ma_ngach
	WHERE [qtdbl_tbl].shcc = @shcc
	
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dhdp_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_dhdp_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   SELECT [qtcd_tbl].* , [dm_dhdp].dhdp
   FROM [qtcd_tbl]
   LEFT JOIN [dm_dhdp]
   ON [qtcd_tbl].ma_dh = [dm_dhdp].ma_dhdp
   WHERE [qtcd_tbl].shcc = @shcc
   ORDER BY ntnpdh
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dmttp_GetAll]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HutStaff_ViewUser_dmttp_GetAll]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [dm_ttp].*,[dm_dd].ma_huyen,[dm_dd].ten_huyen , convert(nvarchar(50),[ma_ttp]) + '-' + convert(nvarchar(50),[ma_huyen]) as [value] , [ttp] + ' - ' + [ten_huyen] as [display]
	FROM [dm_ttp]
	INNER JOIN [dm_dd]
	ON [dm_ttp].ma_ttp = [dm_dd].ma_tinh
    -- Insert statements for procedure here
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_nndd_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[HutStaff_ViewUser_nndd_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [nndd_tbl].* , [dm_qg].qg , [dm_mdnndd].mdnndd
    FROM [nndd_tbl]
    LEFT JOIN [dm_qg]
    ON [nndd_tbl].ndd = [dm_qg].ma_qg
	LEFT JOIN [dm_mdnndd]
	ON [nndd_tbl].md_nndd = [dm_mdnndd].ma_mdnndd
	WHERE [nndd_tbl].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qhgd_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qhgd_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qhgd_tbl].* , [dm_qhgd].qhgd as [quanhegd]
	FROM [qhgd_tbl]
	LEFT JOIN [dm_qhgd]
	ON [qhgd_tbl].qhgd = [dm_qhgd].ma_qhgd
	WHERE [qhgd_tbl].shcc = @shcc
	
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtbd_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtbd_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtbd_tbl].*
    FROM [qtbd_tbl]
    WHERE [qtbd_tbl].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtct_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtct_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtct_tbl].* , [dm_cv].cv , [dm_dcb].dcb
    FROM [qtct_tbl]
    LEFT JOIN [dm_cv] 
    ON [dm_cv].ma_cv = [qtct_tbl].cvct
    LEFT JOIN [dm_dcb]
    ON [dm_dcb].ma_dcb = [qtct_tbl].ma_dcb
    WHERE [qtct_tbl].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtdt_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtdt_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtdtcm_tbl].* , [dm_vbdt].vbdt , [dm_cn].cn
    FROM [qtdtcm_tbl]
    LEFT JOIN [dm_vbdt]
    ON [dm_vbdt].ma_vbdt = [qtdtcm_tbl].vbdtcm
	LEFT JOIN [dm_cn]
	ON [dm_cn].ma_cn = [qtdtcm_tbl].ma_cndt
	WHERE [qtdtcm_tbl].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkl_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtkl_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtkl_tbl].* , [dm_kl].kl
	FROM [qtkl_tbl]
	LEFT JOIN [dm_kl]
	ON [dm_kl].ma_kl = [qtkl_tbl].ma_htkl
	WHERE [qtkl_tbl].shcc = @shcc
	
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkt_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_qtkt_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [qtkt_tbl].* , [dm_kt].kt
	FROM [qtkt_tbl]
	LEFT JOIN [dm_kt]
	ON [dm_kt].ma_kt = [qtkt_tbl].ma_htkt
	WHERE [qtkt_tbl].shcc = @shcc
	
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]
@shcc INT	
AS
BEGIN
	DECLARE @hocham nvarchar(max)
	SET @hocham = ( SELECT vbdt FROM dm_vbdt WHERE ma_vbdt = (select vbdtcm from qtdtcm_tbl where shcc=@shcc  AND hvcn_cndt = 1) )
	
	SET NOCOUNT ON;
	SELECT [soyeu].* , [dm_ttp].ttp , [dm_dv].dv , [noisinh].noisinh,[quequan].quequan , [dm_dt].dt , [dm_tg].tg ,
			[dm_gdcs].gdcs , [dm_tpxt].tpxt , [dm_tb].tb , [dm_tdhv].tdhv, [dm_tdth].tdth , [dm_tdll].tdll,[dm_tdql].tdql,
			[dm_dcb].dcb as [diencanbo],[dm_tthn].tthn as [honnhan] , [dm_kcb].kcb as [k_cb] , [hktt].hktt , @hocham as hocham
	FROM [dbo].[soyeu]
	LEFT JOIN [dm_ttp]
	ON [soyeu].nc = [dm_ttp].ma_ttp
	LEFT JOIN [dm_dv]
	ON [soyeu].ma_dvql = [dm_dv].ma_dv
	LEFT JOIN 
	(
		SELECT [dm_dd].ma_huyen,[ttp] + ' - ' + [ten_huyen] as [noisinh]
		FROM [dm_ttp]
		INNER JOIN [dm_dd]
		ON [dm_ttp].ma_ttp = [dm_dd].ma_tinh
	) as [noisinh]
	ON [noisinh].ma_huyen = [soyeu].ma_ns
	LEFT JOIN 
	(
		SELECT [dm_dd].ma_huyen,[ttp] + ' - ' + [ten_huyen] as [quequan]
		FROM [dm_ttp]
		INNER JOIN [dm_dd]
		ON [dm_ttp].ma_ttp = [dm_dd].ma_tinh
	) as [quequan]
	ON [quequan].ma_huyen = [soyeu].ma_qq
	LEFT JOIN [dm_dt]
	ON [soyeu].ma_dt = [dm_dt].ma_dt
	LEFT JOIN [dm_tg]
	ON [soyeu].ma_tg = [dm_tg].ma_tg
	LEFT JOIN [dm_gdcs]
	ON [soyeu].ma_gdtdcs = [dm_gdcs].ma_gdcs
	LEFT JOIN [dm_tpxt]
	ON [soyeu].ma_tpxt = [dm_tpxt].ma_tpxt
	LEFT JOIN [dm_tb]
	ON [soyeu].ma_tb = [dm_tb].ma_tb
	LEFT JOIN [dm_tdhv]
	ON [soyeu].ma_tdhv = [dm_tdhv].ma_tdhv
	LEFT JOIN [dm_tdth]
	ON [soyeu].ma_tdth = [dm_tdth].ma_tdth
	LEFT JOIN [dm_tdll] 
	ON [soyeu].ma_tdllct = [dm_tdll].ma_tdll
	LEFT JOIN [dm_tdql]
	ON [soyeu].ma_tdqlnn = [dm_tdql].ma_tdql
	LEFT JOIN [dm_dcb]
	ON [soyeu].dcb = [dm_dcb].ma_dcb
	LEFT JOIN [dm_tthn]
	ON [soyeu].tthn = [dm_tthn].ma_tthn
	LEFT JOIN [dm_kcb]
	ON [soyeu].kcb = [dm_kcb].ma_kcb
	LEFT JOIN 
	(
		SELECT [dm_dd].ma_huyen,[ttp] + ' - ' + [ten_huyen] as [hktt]
		FROM [dm_ttp]
		INNER JOIN [dm_dd]
		ON [dm_ttp].ma_ttp = [dm_dd].ma_tinh
	) as [hktt]
	ON [hktt].ma_huyen = [soyeu].ma_hktt
	WHERE [soyeu].xoahs = 0
	AND [soyeu].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_tdnn_GetById]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_tdnn_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [tdnn_tbl].ttk_tdnn , [dm_tdnn].tdnn , [dm_tnn].tnn
	FROM [tdnn_tbl]
	LEFT JOIN [dm_tnn]
	ON [tdnn_tbl].ma_nn = [dm_tnn].ma_tnn
	LEFT JOIN [dm_tdnn]
	ON [tdnn_tbl].ma_td = [dm_tdnn].ma_tdnn
	WHERE [tdnn_tbl].shcc = @shcc
END

GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_UpdateInfo]    Script Date: 12/8/2012 3:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_UpdateInfo]
	-- Add the parameters for the stored procedure here
	@shcc int,
	@ma_hktt int,
	@cthktt nvarchar(255),
	@dctt nvarchar(200),
	@tel  nvarchar(100),
	@email nvarchar(100),
	@scmnd nvarchar(20),
	@nc int,
	@ngay_cap datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [soyeu]
	SET [ma_hktt] = @ma_hktt,
		[cthktt] = @cthktt,
		[dctt] = @dctt,
		[tel] = @tel,
		[email] = @email,
		[scmnd] = @scmnd,
		[nc] =  @nc,
		[ngay_cap] = @ngay_cap
	WHERE [shcc] = @shcc
END

GO




/* Store hiển thị danh sách nâng lương 
 * loaiHanNgach: loại hạn ngạch :
 *			Value = 2: loại 2 năm
 *				  = 3: loại 2 năm
 * loaibang: Loại bảng
 *			Value = 1: Bảng danh sách đến hạn nâng lương
 *				  = 2: Bảng danh sách xét duyệt 5%
 *				  =	3: Bảng danh sách vượt khung
 * thoigian: tính đến thời gian nào (tháng/năm) nhập vào 00:00:00 1/thang/nam
 */
 

CREATE PROC sp_report_get_salary_increment_list
	@loaiHanNgach INT, 
	@loaiBang INT,
	@thoiGian DATETIME
AS

DECLARE @hanNgach INT, @tLuong VARCHAR(1)
		
SET NOCOUNT ON
IF (@loaiBang = 1)
BEGIN
    IF (@loaiHanNgach = 2)
	BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '2'
	END
	ELSE 
	BEGIN
		SET @hanNgach = 1095
		SET @tLuong = '3'
	 
	END
	
    SELECT sy.hodem,
           sy.ten,
           sy.shcc,
           qt.ma_ngach,
           qt.bl_dbl,
           qt.hsl,
           CONVERT(VARCHAR, qt.tgbd_dbl, 101) AS tgbd_dbl,
           ttk_qtdbl
    FROM   qtdbl_tbl AS qt
           LEFT JOIN soyeu AS sy
                ON  qt.shcc = sy.shcc
           LEFT JOIN dm_ngach AS c
                ON  qt.ma_ngach = c.ma_ngach
    WHERE  (
               qt.tgkt_dbl = NULL
               AND c.ma_ngach NOT LIKE '%old'
               AND c.tluong LIKE (@tLuong +  '%')
               AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
               AND qt.bl_dbl < c.totkhung
               AND (sy.dcb IN (1,2,3,4))
           )
    ORDER BY
           sy.ten
    
END

IF (@loaiBang = 2)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 365
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 730
		SET @tLuong = '3'
    END
    SELECT sy.hodem,
           sy.ten,
           sy.shcc,
           qt.ma_ngach,
           qt.bl_dbl,
           qt.hsl,
           CONVERT(VARCHAR, qt.tgbd_dbl, 101) AS tgbd_dbl,
           ttk_qtdbl
    FROM   qtdbl_tbl AS qt
           LEFT JOIN soyeu AS sy
                ON  qt.shcc = sy.shcc
           LEFT JOIN dm_ngach AS c
                ON  qt.ma_ngach = c.ma_ngach
    WHERE  (
               qt.tgkt_dbl = NULL
               AND c.ma_ngach NOT LIKE '%old'
               AND c.tluong LIKE (@tLuong + '%')
               AND (DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach)
               AND qt.bl_dbl < c.totkhung
               AND (sy.dcb IN (1,2,3,4))
           )
    ORDER BY
           sy.ten ASC
END


IF (@loaiBang = 3)
BEGIN
    IF (@loaiHanNgach = 2)
    BEGIN
		SET @hanNgach = 730
		SET @tLuong = '2'
    END
    ELSE 
    BEGIN 
		SET @hanNgach = 1095
		SET @tLuong = '3'
    END
    
    
    SELECT sy.hodem,
           sy.ten,
           sy.shcc,
           qt.ma_ngach,
           qt.bl_dbl,
           CONVERT(VARCHAR, qt.tgbd_dbl, 101) AS tgbd_dbl,
           qt.hsl,
           ttk_qtdbl,
           qt.hspctn
    FROM   qtdbl_tbl AS qt
           LEFT JOIN soyeu AS sy
                ON  qt.shcc = sy.shcc
           LEFT JOIN dm_ngach AS c
                ON  qt.ma_ngach = c.ma_ngach
    WHERE  (
               qt.tgkt_dbl  = NULL
               AND c.ma_ngach NOT LIKE '%old'
               AND c.tluong LIKE  (@tLuong + '%')
               AND (
						(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= 365 AND qt.hspctn > 0.00) 
						OR 
						(DATEDIFF(dd, qt.tgbd_dbl, @thoiGian) >= @hanNgach
								AND qt.hspctn = 0.00
								AND qt.bl_dbl = c.totkhung
						 )
					)
					
               AND (sy.dcb IN (1,2,3,4))
           )
    ORDER BY
           sy.ten ASC
END
GO