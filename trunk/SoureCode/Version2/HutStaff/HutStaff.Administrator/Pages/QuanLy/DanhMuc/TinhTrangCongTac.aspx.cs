using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// Bảng dm_tt.
    /// </summary>
    public partial class TinhTrangCongTac : DanhMucBase
    {
        
        #region //--------- Event Handlers --------------//
        
        /// <summary>
        /// Thêm cột và đổ dữ liệu cho GridView.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_tt", "Mã tình trạng", false);
                InsertColumn(1, "tt", "Tình trạng công tác", true);
            
                FillData(HutStaff.BO.QuanLy.DanhMuc.TinhTrangCongTac.GetAll());
            }
        }
        
        #endregion
        
        #region //--------- Overridden Methods ----------//
        
        /// <summary>
        /// Thêm vào bảng dm_tt.
        /// </summary>
        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Nếu đang trong trạng thái chỉnh sửa thì tạo mới
            
            // Còn không thì thêm dữ liệu
        }
        
        /// <summary>
        /// Chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected override void OnEditButtonClick(object sender, EventArgs args)
        {
        }
        
        /// <summary>
        /// Chỉnh sửa 1 dòng.
        /// </summary>
        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            // Ẩn không cho chỉnh khóa chính.
            GridViewRow selectedRow = dataGridView.Rows[dataGridView.SelectedIndex];
            
            txbMaTinhTrang.ReadOnly = true;
            txbMaTinhTrang.Text = selectedRow.Cells[0].Text;
        
            txbTinhTrangCongTac.Text = HttpUtility.HtmlDecode(selectedRow.Cells[1].Text);
        }
        
        /// <summary>
        /// Xử lý sắp sửa xóa 1 dòng.
        /// </summary>
        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        #endregion

    }
}