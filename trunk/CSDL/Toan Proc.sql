USE hutstaff_9_8
GO

/* bang 9: Tinh trang can bo */
CREATE PROC sp_check_existed_dm_tt
	@tt NVARCHAR(50)
AS
	SELECT * FROM dm_tt WHERE tt = @tt
GO

CREATE PROC sp_delete_dm_tt
	@ma_tt INT
AS
	DELETE FROM dm_tt WHERE ma_tt = @ma_tt
GO

CREATE PROC sp_find_by_id_dm_tt
	@id INT
AS 
	SELECT * FROM dm_tt WHERE ma_tt = @id
GO

CREATE PROC sp_find_by_name_dm_tt
	@tt NVARCHAR(50)
AS
	SELECT * FROM dm_tt WHERE tt LIKE (@tt + N'%')
GO

CREATE PROC sp_insert_dm_tt
	@tt NVARCHAR(50)
AS
	INSERT INTO dm_tt(tt) VALUES
	(
		@tt
	)
GO

CREATE PROC sp_update_dm_tt
	@ma_tt INT,
	@tt NVARCHAR(50)
AS
	UPDATE dm_tt SET
		tt = @tt
	WHERE ma_tt = @ma_tt
GO