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
SELECT dbo.fLocDauTiengViet(N'Trần văn bích')


USE hutstaff_9_8
GO
/* ================================ SEARCH Sơ yếu ================================ */


/* Search don vi */
CREATE FUNCTION dbo.searchDonvi(@ma_dv INT)
RETURNS	@tableTemp table (
	id INT
)
AS
BEGIN	
	DECLARE @cap INT
	SELECT @cap = cha FROM dm_dv
	
	IF @cap = 2
	BEGIN
		INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE ma_dvql IN (SELECT ma_dv FROM dm_dv WHERE cha = @ma_dv)	
	END
	
	IF @cap = 3 
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
	SELECT @ten = REPLACE(@ten,' ','%')
	INSERT @tableTemp(id) SELECT shcc FROM soyeu WHERE dbo.fLocDauTiengViet(hodem + ' ' + ten) LIKE '%'+ dbo.fLocDauTiengViet(@ten) + '%'	
	RETURN
END
GO
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
