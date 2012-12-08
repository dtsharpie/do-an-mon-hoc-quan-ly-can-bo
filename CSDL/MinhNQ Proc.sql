USE hutstaff_9_8
GO

CREATE PROC sp_view_all_cvdn_from_soyeu
AS
	SELECT distinct cvdn from soyeu
GO

CREATE PROC sp_view_all_user_with_dv
AS
	SELECT [id], [user], [quyen], [isLock], dv FROM [Users], [dm_dv] 
	WHERE [Users].ma_dv = [dm_dv].ma_dv
GO

CREATE PROC sp_delete_user
	@id INT
AS
	DELETE FROM Users
	WHERE id = @id
GO

CREATE PROC sp_view_soyeu_by_dvql
	@ma_dvql VARCHAR(6)
AS
	SELECT [shcc], [hodem], [ten] FROM [soyeu] WHERE ma_dvql = @ma_dvql
GO
	
CREATE PROC sp_chuyen_donvi
	@ma_dvql_nguon VARCHAR(6),
	@ma_dvql_dich VARCHAR(6)
AS
	UPDATE soyeu SET ma_dvql = @ma_dvql_dich WHERE ma_dvql = @ma_dvql_nguon
GO

