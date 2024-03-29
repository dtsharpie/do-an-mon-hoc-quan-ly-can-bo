USE [hutstaff_9_8]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_UpdateInfo]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_UpdateInfo]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_tdnn_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_tdnn_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkt_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_qtkt_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkl_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_qtkl_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qhgd_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_qhgd_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_nndd_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_nndd_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dmttp_GetAll]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_dmttp_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dbl_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_dbl_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_cvkn_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_cvkn_GetById]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_Authenticate]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_ViewUser_Authenticate]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_SearchCount]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_User_Soyeu_SearchCount]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_Search]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_User_Soyeu_Search]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list_Count]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_User_increment_list_Count]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_User_increment_list]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Authenticate]    Script Date: 10/29/2012 11:40:03 AM ******/
DROP PROCEDURE [dbo].[HutStaff_User_Authenticate]
GO
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Authenticate]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list]    Script Date: 10/29/2012 11:40:03 AM ******/
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
					   qt.tgkt_dbl is NULL
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
				   qt.tgkt_dbl is NULL
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
				   qt.tgkt_dbl  is NULL
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
/****** Object:  StoredProcedure [dbo].[HutStaff_User_increment_list_Count]    Script Date: 10/29/2012 11:40:03 AM ******/
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
					   qt.tgkt_dbl is NULL
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
				   qt.tgkt_dbl is NULL
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
				   qt.tgkt_dbl  is NULL
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
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_Search]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_User_Soyeu_SearchCount]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_Authenticate]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_cvkn_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_cvkn_GetById]
	-- Add the parameters for the stored procedure here
	@shcc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [qtcvkn_tbl].donvi, [qtcvkn_tbl].nbncvkn,[qtcvkn_tbl].nktcvkn,[dm_cv].cv
	FROM [qtcvkn_tbl]
	LEFT JOIN [dm_cv]
	ON [qtcvkn_tbl].ma_cv = [dm_cv].ma_cv
	WHERE [shcc] = @shcc
END


GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dbl_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_dmttp_GetAll]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_nndd_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qhgd_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
	ON [qhgd_tbl].qhgd = [dm_qhgd].qhgd
	WHERE [qhgd_tbl].shcc = @shcc
	
END


GO
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkl_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_qtkt_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]
@shcc INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [soyeu].* , [dm_ttp].ttp , [dm_dv].dv , [noisinh].noisinh,[quequan].quequan , [dm_dt].dt , [dm_tg].tg ,
			[dm_gdcs].gdcs , [dm_tpxt].tpxt , [dm_tb].tb , [dm_tdhv].tdhv, [dm_tdth].tdth , [dm_tdll].tdll,[dm_tdql].tdql,
			[dm_dcb].dcb,[dm_tthn].tthn as [honnhan] , [dm_kcb].kcb as [k_cb] , [hktt].hktt
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_tdnn_GetById]    Script Date: 10/29/2012 11:40:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[HutStaff_ViewUser_UpdateInfo]    Script Date: 10/29/2012 11:40:03 AM ******/
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

DROP FUNCTION [dbo].[fnSplit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 10/29/2012 1:39:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSplit](
    @sInputList VARCHAR(8000) -- List of delimited items
  , @sDelimiter VARCHAR(8000) = ',' -- delimiter that separates items
) RETURNS @List TABLE (item VARCHAR(8000))

BEGIN
DECLARE @sItem VARCHAR(8000)
WHILE CHARINDEX(@sDelimiter,@sInputList,0) <> 0
 BEGIN
 SELECT
  @sItem=RTRIM(LTRIM(SUBSTRING(@sInputList,1,CHARINDEX(@sDelimiter,@sInputList,0)-1))),
  @sInputList=RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter,@sInputList,0)+LEN(@sDelimiter),LEN(@sInputList))))
 
 IF LEN(@sItem) > 0
  INSERT INTO @List SELECT @sItem
 END

IF LEN(@sInputList) > 0
 INSERT INTO @List SELECT @sInputList -- Put the last item in
RETURN
END

GO