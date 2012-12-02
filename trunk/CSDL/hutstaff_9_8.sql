USE master
GO


IF EXISTS ( SELECT * 
			FROM dbo.sysdatabases 
			WHERE name = 'hutstaff_9_8'
		   )
	DROP DATABASE hutstaff_9_8
GO

CREATE DATABASE hutstaff_9_8
GO

USE hutstaff_9_8
GO

	
	CREATE TABLE baohiem93 (
	  id int  NOT NULL identity(1,1),
	  tgbd_bh93 datetime DEFAULT NULL,
	  tgkt_bh93 datetime DEFAULT NULL,
	  mota nvarchar(255) DEFAULT NULL,
	  hsluong float DEFAULT NULL,
	  phucap float DEFAULT NULL,
	  sothang int DEFAULT 0,
	  tongtien int  DEFAULT NULL,
	  shcc int  DEFAULT NULL,
	  PRIMARY KEY (id)
	);
	GO
	
	CREATE TABLE db_log_tbl (
	  id bigint identity(1,1) NOT NULL ,
	  sys_user nvarchar(20) DEFAULT NULL,
	  system_time_access datetime DEFAULT NULL,
	  system_time_release datetime DEFAULT NULL,
	  system_action NTEXT,
	  PRIMARY KEY (id),
	);
	GO

	CREATE TABLE dm_cn (
	  ma_cn int identity(1,1) NOT NULL,
	  cn nvarchar(255) DEFAULT NULL,
	  PRIMARY KEY (ma_cn)
	);
	GO


	CREATE TABLE dm_cu (
	  ma_cu int identity(1,1) NOT NULL,
	  cu nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_cu)
	) ;
	GO


	CREATE TABLE dm_cud (
	  ma_cud int identity(1,1) NOT NULL,
	  cud nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_cud)
	);
	GO

	CREATE TABLE dm_cv (
	  ma_cv int identity(1,1) NOT NULL,
	  cv nvarchar(60) DEFAULT NULL,
	  pccv decimal(4,2) DEFAULT NULL,
	  PRIMARY KEY (ma_cv)
	);
	GO

	CREATE TABLE dm_cvdn (
	  ma_cvdn int identity(1,1) NOT NULL ,
	  cvdn nvarchar(200) NOT NULL,
	  PRIMARY KEY (ma_cvdn),
	) ;
	GO

	
	CREATE TABLE dm_dcb (
	  ma_dcb INT IDENTITY(1,1),
	  dcb nvarchar(50) DEFAULT NULL,
	  PRIMARY KEY (ma_dcb)
	);
	
	CREATE TABLE dm_tt (
	  ma_tt INT IDENTITY(1,1),
	  tt nvarchar(50) DEFAULT NULL,
	  PRIMARY KEY (ma_tt)
	);
	
	
	CREATE TABLE dm_ttp
	(
		ma_ttp	INT IDENTITY(1,1),
		ttp		NVARCHAR(40),
		CONSTRAINT PK_dm_ttp PRIMARY KEY (ma_ttp)
	)
	GO
	
	CREATE TABLE dm_dd(
	  ma_huyen int identity(1,1) NOT NULL,
	  ma_tinh int references dm_ttp(ma_ttp),
	  ten_huyen nvarchar(40) DEFAULT NULL,
	  primary key (ma_huyen)
	);
	GO

	CREATE TABLE dm_dhdp (
	  ma_dhdp int identity(1,1) NOT NULL,
	  dhdp nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_dhdp)
	);
	GO
	
	CREATE TABLE dm_dt (
	  ma_dt int identity(1,1) NOT NULL,
	  dt nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_dt)
	);
	GO

	CREATE TABLE dm_dv(
	  ma_dv VARCHAR(6) NOT NULL,
	  dv nvarchar(200) DEFAULT NULL,
	  PRIMARY KEY (ma_dv),
	);
	GO


	CREATE TABLE dm_gdcs (
	  ma_gdcs int identity(1,1) NOT NULL,
	  gdcs nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_gdcs)
	);
	GO

	CREATE TABLE dm_hh (
	  ma_hh int identity(1,1) NOT NULL,
	  hh nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_hh)
	);
	GO


	CREATE TABLE dm_htdt (
	  ma_htdt int identity(1,1) NOT NULL,
	  htdt nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_htdt)
	);
	GO

	CREATE TABLE dm_kcb (
	  ma_kcb int identity(1,1) NOT NULL ,
	  kcb nvarchar(50) DEFAULT '0',
	  PRIMARY KEY (ma_kcb),
	 );
	GO

	CREATE TABLE dm_kl (
	  ma_kl int identity(1,1) NOT NULL,
	  kl nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_kl)
	);
	GO


	CREATE TABLE dm_kt (
	ma_kt int IDENTITY(1,1),
	kt nvarchar(100),
	PRIMARY KEY (ma_kt)
	);
	GO

	CREATE TABLE dm_mdnndd (
	  ma_mdnndd int IDENTITY(1,1),
	  mdnndd nvarchar(100) NOT NULL,
	  PRIMARY KEY (ma_mdnndd)
	);
	GO

	CREATE TABLE dm_mlcb (
	  ma_mlcb char(3) NOT NULL,
	  mlcb nvarchar(15) NOT NULL,
	  tgad DATETIME DEFAULT NULL,
	  ttk_mlcb nvarchar(200) DEFAULT NULL,
	  PRIMARY KEY (ma_mlcb),
	)
	GO

	CREATE TABLE dm_ngach (
	  ma_ngach varchar(20) NOT NULL,
	  ten_ngach nvarchar(70) DEFAULT NULL,
	  bac1 decimal(4,2) DEFAULT NULL,
	  bac2 decimal(4,2) DEFAULT NULL,
	  bac3 decimal(4,2) DEFAULT NULL,
	  bac4 decimal(4,2) DEFAULT NULL,
	  bac5 decimal(4,2) DEFAULT NULL,
	  bac6 decimal(4,2) DEFAULT NULL,
	  bac7 decimal(4,2) DEFAULT NULL,
	  bac8 decimal(4,2) DEFAULT NULL,
	  bac9 decimal(4,2) DEFAULT NULL,
	  bac10 decimal(4,2) DEFAULT NULL,
	  bac11 decimal(4,2) DEFAULT NULL,
	  bac12 decimal(4,2) DEFAULT NULL,
	  bac13 decimal(4,2) DEFAULT NULL,
	  bac14 decimal(4,2) DEFAULT NULL,
	  bac15 decimal(4,2) DEFAULT NULL,
	  bac16 decimal(4,2) DEFAULT NULL,
	  totkhung tinyint DEFAULT NULL,
	  lvuc nvarchar(100) DEFAULT NULL,
	  tluong varchar(10) DEFAULT NULL,
	  PRIMARY KEY (ma_ngach)
	);
	GO


	CREATE TABLE dm_nkpnndd (
	  ma_nkpnndd int IDENTITY(1,1),
	  nkpnndd nvarchar(30) NOT NULL,
	  PRIMARY KEY (ma_nkpnndd),
	);
	GO

	CREATE TABLE dm_qg (
	  ma_qg int IDENTITY(1,1),
	  qg nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_qg)
	);
	GO

	CREATE TABLE dm_qhgd (
	  ma_qhgd int IDENTITY(1,1),
	  qhgd nvarchar(60) DEFAULT NULL,
	  PRIMARY KEY (ma_qhgd)
	);
	GO



	CREATE TABLE dm_tb (
	  ma_tb int IDENTITY(1,1),
	  tb nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tb)
	);
	GO

	CREATE TABLE dm_tdcm (
	  ma_tdcm int IDENTITY(1,1),
	  tdcm nvarchar(50) DEFAULT NULL,
	  PRIMARY KEY (ma_tdcm)
	);
	GO

	CREATE TABLE dm_tdhv (
	  ma_tdhv int IDENTITY(1,1),
	  tdhv nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tdhv)
	);
	GO

	CREATE TABLE dm_tdll (
	  ma_tdll int IDENTITY(1,1),
	  tdll nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tdll)
	);
	GO

	CREATE TABLE dm_tdnn (
	  ma_tdnn int IDENTITY(1,1),
	  tdnn nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tdnn)
	);
	GO

	CREATE TABLE dm_tdql (
	  ma_tdql int IDENTITY(1,1),
	  tdql nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tdql)
	);
	GO

	CREATE TABLE dm_tdth (
	  ma_tdth int IDENTITY(1,1),
	  tdth nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tdth)
	);
	GO

	CREATE TABLE dm_tg (
	  ma_tg int IDENTITY(1,1),
	  tg nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tg)
	);
	GO

	CREATE TABLE dm_tnn (
	  ma_tnn int IDENTITY(1,1),
	  tnn nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tnn)
	);
	GO


	CREATE TABLE dm_tpxt (
	  ma_tpxt int IDENTITY(1,1),
	  tpxt nvarchar(40) DEFAULT NULL,
	  PRIMARY KEY (ma_tpxt)
	);
	GO
	

	CREATE TABLE dm_tthn
	(
		ma_tthn INT IDENTITY(1,1),
		tthn	NVARCHAR(60) NOT NULL,
		CONSTRAINT PK_dm_tthn PRIMARY KEY (ma_tthn),
	)
	GO
	
	
	
	CREATE TABLE dm_vbdt 
	(
		ma_vbdt		INT IDENTITY(1,1),
		vbdt		NVARCHAR(60),
		CONSTRAINT PK_dm_vbdt PRIMARY KEY (ma_vbdt)
	)
	GO
	
	CREATE TABLE mbbh_tbl  
	(
		ma_mbbh			INT IDENTITY(1,1),
		tinhtu			DATETIME,
		bhxh			FLOAT,
		bhyt			FLOAT,
		bhtn			FLOAT,
		CONSTRAINT PK_mbbh_tbl PRIMARY KEY (ma_mbbh)
	)
	GO
	
	CREATE TABLE Users
	(
		id INT IDENTITY(1,1) ,
		ma_dv VARCHAR(6) REFERENCES dm_dv(ma_dv),	
		[user] VARCHAR(50) NOT NULL UNIQUE,
		pass   VARCHAR(50)	NOT NULL,
		quyen BIT NOT NULL,
		isLock BIT DEFAULT 0,
		PRIMARY KEY (id)
	)
	GO
	
	CREATE TABLE soyeu   
	(
		shcc			INT IDENTITY(1,1),
		[user]			VARCHAR(50) NOT NULL,
		pass			VARCHAR(50) NOT NULL,
		nvcqhn			DATETIME,
		scmnd			VARCHAR(10),
		nc				INT REFERENCES dm_ttp(ma_ttp),
		ngay_cap		DATETIME,
		ma_dvql			VARCHAR(6) REFERENCES dm_dv(ma_dv),
		hodem			NVARCHAR(30),
		ten				NVARCHAR(20),  
		gt				DECIMAL(1,0),
		ttd				NVARCHAR(50),
		ntns			DATETIME,
		ma_ns			INT REFERENCES dm_dd (ma_huyen),
		ma_qq			INT REFERENCES dm_dd (ma_huyen),
		ctqq			NVARCHAR(100),
		dctt			NVARCHAR(200),
		ma_dt			INT REFERENCES dm_dt(ma_dt),
		ma_tg			INT REFERENCES dm_tg(ma_tg),
		ma_gdtdcs		INT REFERENCES dm_gdcs(ma_gdcs),
		ma_tpxt			INT REFERENCES dm_tpxt(ma_tpxt),
		ntgcm			DATETIME,
		vdpc			NVARCHAR(100),
		nvbc			DATETIME,
		cvdn			NVARCHAR(100),
		nvd				DATETIME,
		nct				DATETIME,
		nnn				DATETIME,
		nxn				DATETIME,
		qh				NVARCHAR(20),
		ma_tb			INT REFERENCES dm_tb(ma_tb),
		ma_tdhv			INT REFERENCES dm_tdhv(ma_tdhv),
		ma_tdth			INT REFERENCES dm_tdth(ma_tdth),
		kn_tht			Nvarchar(100),
		ma_tdllct		INT REFERENCES dm_tdll(ma_tdll),
		ma_tdqlnn		INT REFERENCES dm_tdql(ma_tdql),
		nlstnk			Nvarchar(255),
		ma_ttsk			NVARCHAR(30),
		ma_nm			NVARCHAR(10),
		ddlsbt			NVARCHAR(255),
		ttk				NVARCHAR(255),
		dcb				INT REFERENCES dm_dcb(ma_dcb),
		tt				INT REFERENCES dm_tt(ma_tt),
		sbh				VARCHAR(20),
		ndbh			DATETIME,
		tthn			INT REFERENCES dm_tthn(ma_tthn),
		email			VARCHAR(100),
		tel				VARCHAR(100),
		cthktt			NVARCHAR(255),
		kcb				INT REFERENCES dm_kcb(ma_kcb),
		ma_hktt			INT REFERENCES dm_dd(ma_huyen),
		ngay_kthd		DATETIME,
		ld_kthd			NVARCHAR(255),
		ngaybh			DATETIME,
		thanggd			INT,
		ngaybhct		DATETIME,
		mochuongtn		DATETIME,
		xoahs			BIT DEFAULT 0,	
		CONSTRAINT PK_soyeu PRIMARY KEY (shcc)
	) 
	GO
	
	
	CREATE TABLE huyhoso 
	(
		ma_huyhoso		INT IDENTITY(1,1),
		user_id			INT REFERENCES Users(id),
		hoten			NVARCHAR(50),
		ngayyeucau		DATETIME,
		Nguoiduyet		INT REFERENCES Users(id),
		ngayduyet		DATETIME,
		yeucau			NVARCHAR(255),
		duyet			NVARCHAR(255),
		trangthai		BIT DEFAULT 0,
		CONSTRAINT PK_huyhoso PRIMARY KEY (Ma_huyhoso)
	)
	GO
	
	
	
	CREATE TABLE nndd_tbl   
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		nd_nndd			DATETIME,
		nv_nndd			DATETIME,
		ndd				INT REFERENCES dm_qg(ma_qg),
		dc_nndd			NVARCHAR(100),
		md_nndd			INT REFERENCES dm_mdnndd(ma_mdnndd),
		dg_nndd			NVARCHAR(100),
		ttk_nndd		NVARCHAR(255),
		nkp_nndd		INT REFERENCES dm_nkpnndd(ma_nkpnndd),
		tt_nndd			Nvarchar(50),
		CONSTRAINT PK_nndd_tbl PRIMARY KEY (id)
	)
	GO
	
	CREATE TABLE qhgd_tbl    
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		qhgd			INT REFERENCES dm_qhgd(ma_qhgd),
		ht_qhgd			NVARCHAR(50),
		ns_qhgd			DATETIME,
		nn_qhgd			NVARCHAR(100),
		cv_qhgd			NVARCHAR(70),
		no_qhgd			NVARCHAR(100),
		nct_qhgd		NVARCHAR(100),
		qt_qhgd			INT REFERENCES dm_qg(ma_qg),
		ndc_qhgd		INT REFERENCES dm_qg(ma_qg),
		ttk_qhgd		Nvarchar(255),
		CONSTRAINT PK_qhgd_tbl PRIMARY KEY (id)
	)
	GO
	
	CREATE TABLE qtbd_tbl     
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		tgbd_bd			DATETIME,
		tgkt_bd			DATETIME,
		ndbd			NVARCHAR(250),
		htbd			INT REFERENCES dm_htdt(ma_htdt),
		nbd_qtbd		NVARCHAR(100),
		vbbd			NVARCHAR(20),
		dg_qtbd			NVARCHAR(100),
		ttk_qtbd		Nvarchar(255),
		CONSTRAINT PK_qtbd_tbl PRIMARY KEY (id)
	)
	GO
	
	CREATE TABLE qtct_tbl
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		tgbd_qtct		DATETIME,
		tgkt_qtct		DATETIME,
		dvct			NVARCHAR(255),
		cvct			INT REFERENCES dm_cv(ma_cv),
		cvdn			INT REFERENCES dm_cvdn(ma_cvdn),
		dgqtct			NVARCHAR(20),
		ttk_qtct		Nvarchar(255),
		bctdv			NVARCHAR(255),
		nlv				NVARCHAR(255),
		ma_dcb			INT REFERENCES dm_dcb(ma_dcb),
		CONSTRAINT PK_qtct_tbl PRIMARY KEY (id)
	) 
	GO
	
	
	CREATE TABLE qtctdt_tbl
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_cv			INT REFERENCES dm_cv(ma_cv),
		nbncvdt			DATETIME,
		nktcvdt			DATETIME,
		ttk_qtct		NVARCHAR(255),
		lcd				TINYINT,
		CONSTRAINT PK_qtctdt_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE qtcvkn_tbl 
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_cv			INT REFERENCES dm_cv(ma_cv),
		nbncvkn			DATETIME,
		nktcvkn			DATETIME,
		dn				BIT, -- hien nay
		ttk_qtct		NVARCHAR(255),
		donvi			NVARCHAR(255),
		CONSTRAINT PK_qtcvkn_tbl PRIMARY KEY (id)
	) 
	GO
	
		 
	
	CREATE TABLE qtdbl_tbl 
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		tgbd_dbl		DATETIME,
		tgkt_dbl		DATETIME,
		ma_ngach		Varchar(20) REFERENCES dm_ngach(ma_ngach),
		bl_dbl			DECIMAL(2,0),
		hsl				DECIMAL(4,2),
		hspccv			DECIMAL(4,2),
		ttk_qtdbl		NVARCHAR(255),
		hspctn			DECIMAL(4,2),
		hspckv			DECIMAL(4,2),
		ts				Decimal(1,0),
		hnay			BIT default 0,
		CONSTRAINT PK_qtdbl_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE qtdtcm_tbl 
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_cv			INT REFERENCES dm_cv(ma_cv),
		tgbd_dtcm		DATETIME,
		tgkt_dtcm		DATETIME,
		csdtcm			NVARCHAR(100),
		ndtcm			INT REFERENCES dm_qg(ma_qg),
		ma_cndt			INT REFERENCES dm_cn(ma_cn),
		htdtcm			INT REFERENCES dm_htdt(ma_htdt),
		vbdtcm			INT REFERENCES dm_vbdt(ma_vbdt),
		xl_dtcm			NVARCHAR(40),
		cmpcp_cndt		BIT,
		hvcn_cndt		BIT,
		ttk_qtdt		NVARCHAR(255),
		CONSTRAINT PK_qtdtcm_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE qtkl_tbl 
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_htkl			INT REFERENCES dm_kl(ma_kl),
		nkl				DATETIME,
		nxkl			DATETIME,
		ldkl			NVARCHAR(100),
		ttk_qtkl		NVARCHAR(255),
		CONSTRAINT PK_qtkl_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE qtkt_tbl 
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_htkt			INT REFERENCES dm_kt(ma_kt),
		nkt_qtkt		DATETIME,
		soqd_qtkt		NVARCHAR(255),
		ttk_qtkt		NVARCHAR(255),
		CONSTRAINT PK_qtkt_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE tdnn_tbl  
	(
		id				INT IDENTITY(1,1),
		shcc			INT REFERENCES soyeu(shcc),
		ma_nn			INT REFERENCES dm_tnn(ma_tnn),
		ma_td			INT REFERENCES dm_tdnn(ma_tdnn),
		ttk_tdnn		NVARCHAR(255),
		CONSTRAINT PK_tdnn_tbl PRIMARY KEY (id)
	) 
	GO
	
	CREATE TABLE qtcd_tbl(
	  id INT NOT NULL IDENTITY(1,1),
	  shcc INT REFERENCES soyeu(shcc),
	  ma_dh INT REFERENCES dm_dhdp(ma_dhdp),
	  npdh INT,
	  lcd BIT DEFAULT 0,
	  cdcn BIT DEFAULT 0,
	  ttk_qtcd NVARCHAR(255) DEFAULT NULL,
	  ntnpdh DATETIME DEFAULT NULL,
	  PRIMARY KEY (id)
	)
	GO