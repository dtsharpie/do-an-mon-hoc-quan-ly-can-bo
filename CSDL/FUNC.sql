USE hutstaff_9_8
GO
/* Loại bỏ dấu tiếng việt cho NVARCHAR */
CREATE FUNCTION [dbo].[fLocDauTiengViet]
(
      @strInput NVARCHAR(4000)
) 
RETURNS NVARCHAR(4000)
AS
Begin
	Set @strInput=rtrim(ltrim(lower(@strInput)))
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    Declare @text nvarchar(50), @i int
    Set @text='-''`~!@#$%^&*()?><:|}{,./\"''='';–'
    Select @i= PATINDEX('%['+@text+']%',@strInput ) 
    while @i > 0
        begin
	        set @strInput = replace(@strInput, substring(@strInput, @i, 1), '')
	        set @i = patindex('%['+@text+']%', @strInput)
        End
        Set @strInput =replace(@strInput,'  ',' ')
        
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế
                  ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý'
                  +NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee
                  iiiiiooooooooooooooouuuuuuuuuuyyyyy'
    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
    SET @COUNTER = 1
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN   
      SET @COUNTER1 = 1
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) 
            = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN           
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) 
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                   
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) 
              +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) 
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)
              BREAK
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
       SET @COUNTER = @COUNTER +1
    End
 SET @strInput = replace(@strInput,' ',' ')
    RETURN lower(@strInput)
End

GO
SELECT REPLACE(dbo.fLocDauTiengViet(N'Trần văn bích'),' ','')


USE hutstaff_9_8
GO
/* ================================ SEARCH Sơ yếu ================================ */


/* Search don vi */
CREATE FUNCTION dbo.searchDonvi(@ma_dv VARCHAR(6))
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	DECLARE @cap INT
	SELECT @cap = LEN(ma_dv) FROM dm_dv
	
	IF @cap = 4
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE ma_dvql IN (SELECT ma_dv FROM dm_dv WHERE ma_dv LIKE (@ma_dv + '%'))	
	END
	
	IF @cap = 6 
	BEGIN 
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE ma_dvql = @ma_dv
	END
	
	IF @cap = 1 
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	
	RETURN 
END
GO
/* Search theo ma shcc */
CREATE FUNCTION dbo.searchShcc(@shcc INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	IF @shcc = 0
	BEGIN 
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	ELSE 
	BEGIN 
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE shcc = @shcc
	END
	RETURN
END
GO
/* Search theo ten */
CREATE FUNCTION dbo.searchTen(@ten NVARCHAR(50)) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN
	INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE dbo.fLocDauTiengViet(hodem + N' ' + ten) LIKE (N'%' + REPLACE(dbo.fLocDauTiengViet(@ten),N' ',N'%') + N'%') 
	RETURN
END
GO

/*SELECT * FROM soyeu WHERE ma_dvql = '020902'
SELECT LEN(hodem + ' '+ ten) AS [length], (hodem + N' '+ ten) AS hoten FROM soyeu WHERE (hodem +N' '+ ten) LIKE N'%Vũ%Đức%Vượng%'

IF (N'vu duc vuong' LIKE dbo.fLocDauTiengViet(N'%Vũ%Đức%Vượng%'))
PRINT 'Yes'

PRINT dbo.fLocDauTiengViet(N'%Vũ%Đức%Vượng%')

SELECT LEN(hodem + ' '+ ten) AS [length], (hodem + N' '+ ten) AS hoten FROM soyeu WHERE dbo.fLocDauTiengViet(hodem +N' '+ ten) LIKE
SELECT * FROM dbo.searchTen(N'Vũ đức vượng') 
*/
/* Search theo tuoi */
CREATE FUNCTION dbo.searchTuoi(@tutuoi INT,@dentuoi INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	IF @tutuoi = 0
	BEGIN 
		IF @dentuoi != 0
		BEGIN 
			INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE DATEDIFF(YY, ntns, GETDATE()) <= @dentuoi
		END
		ELSE 
		BEGIN 
			INSERT @tableTemp(id) SELECT shcc FROM soyeu
		END 
	END
	ELSE 
	BEGIN 	
		IF @dentuoi != 0
		BEGIN 
			INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE DATEDIFF(YY, ntns, GETDATE()) BETWEEN  @tutuoi AND @dentuoi
		END
		ELSE 
		BEGIN 
			INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE DATEDIFF(YY, ntns, GETDATE()) >= @tutuoi
		END	
	END
	RETURN
END
GO

/* tim theo gioi tinh */
CREATE FUNCTION dbo.searchGioiTinh(@gioitinh DECIMAL(1,0)) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN
	IF @gioitinh = 2
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	ELSE
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE gt = @gioitinh
	END
	RETURN
END
GO
/* tim theo dien can bo */
CREATE FUNCTION dbo.searchDienCanBo(@diencb INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN
	IF @diencb = 0
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	ELSE
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE dcb = @diencb
	END
	RETURN
END
GO
/* tim theo khoi can bo */
CREATE FUNCTION dbo.searchKhoiCanBo(@khoicanbo INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN
	IF @khoicanbo = 0
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	ELSE
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE kcb = @khoicanbo
	END
	RETURN
END
GO
/* tim theo nam vao truong */

CREATE FUNCTION dbo.searchNamVaoTruong(@nvtruong INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN
	IF @nvtruong = 0
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu
	END
	ELSE
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE DATEPART(YY,nvcqhn) = @nvtruong
	END
	RETURN
END
GO



/** check username cua can bo da co hay chua 
	truong hop 2 can bo trung ten thi se them so 1,2,... vao cuoi username
  */

CREATE FUNCTION dbo.checkUserCanBo(@username VARCHAR(50)) 
RETURNS	INT 
AS
BEGIN
	DECLARE @count INT
	SELECT @count = COUNT(*) FROM soyeu WHERE [user] LIKE (@username +  '%')
	RETURN @count
END
GO


/**
	Tìm kiếm khen thưởng
 */
 
CREATE FUNCTION dbo.searchNamKhenThuong(@tuNam INT,@denNam INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	IF @tuNam = 0
	BEGIN 
		IF @denNam != 0
		BEGIN 
			INSERT @tableTemp(id) SELECT id FROM qtkt_tbl WHERE DATENAME(yyyy, qtkt_tbl.nkt_qtkt) <= @denNam
		END
		ELSE 
		BEGIN 
			INSERT @tableTemp(id) SELECT id FROM qtkt_tbl
		END 
	END
	ELSE 
	BEGIN 	
		IF @denNam != 0
		BEGIN 
			INSERT @tableTemp(id) SELECT id FROM qtkt_tbl WHERE DATENAME(yyyy, qtkt_tbl.nkt_qtkt) BETWEEN  @tuNam AND @denNam
		END
		ELSE 
		BEGIN 
			INSERT @tableTemp(id) SELECT id FROM qtkt_tbl WHERE DATENAME(yyyy, qtkt_tbl.nkt_qtkt) >= @tuNam
		END	
	END
	RETURN
END
GO

CREATE FUNCTION dbo.searchHinhThucKhenThuong(@hinhthuc INT) 
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	 
	IF @hinhthuc != 0
	BEGIN 
		INSERT @tableTemp(id) SELECT id FROM qtkt_tbl WHERE ma_htkt = @hinhthuc
	END
	ELSE 
	BEGIN 
		INSERT @tableTemp(id) SELECT id FROM qtkt_tbl
	END 

	RETURN
END
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





