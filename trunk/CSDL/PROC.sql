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

CREATE PROC sp_view_all_dm_dcb
AS
	SELECT * FROM dm_dcb
GO

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

CREATE PROC sp_view_all_dm_dv
AS
	SELECT * FROM dm_dv
GO

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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_Authenticate]    Script Date: 09/28/2012 00:48:51 ******/
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