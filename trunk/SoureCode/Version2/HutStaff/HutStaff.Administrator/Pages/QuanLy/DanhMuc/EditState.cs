namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// Trạng thái của form xem bảng danh mục hiện tại. 
    /// Dùng để xác định hành động của nút 'Lưu lại'.
    /// </summary>
    public enum EditState
    {
        /// <summary>
        /// Không xác định.
        /// </summary>
        None,

        /// <summary>
        /// Thêm bản ghi mới.
        /// </summary>
        Insert,

        /// <summary>
        /// Chỉnh sửa bản ghi có sẵn.
        /// </summary>
        Update
    }
}