using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// Bảng dm_tt.
    /// </summary>
    public partial class TinhTrangCongTacPage : DanhMucPageBase
    {
        
        #region //--------- Event Handlers --------------//
        
        /// <summary>
        /// Thêm cột và đổ dữ liệu cho GridView.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_tt", "Mã tình trạng");
                InsertColumn(1, "tt", "Tình trạng công tác");
            
                FillData();
            }
        }
        
        #endregion
        
        #region //--------- Abstract Class Members ------//
        
        /// <summary>
        /// Thêm vào bảng dm_tt. Disable textbox mã tình trạng.
        /// </summary>
        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;
                
                txbMaTinhTrang.Enabled = false;
                txbMaTinhTrang.Text = "Auto";
            
                txbTinhTrangCongTac.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbTinhTrangCongTac.Text });
                txbTinhTrangCongTac.Text = "";
            }
        }
        
        /// <summary>
        /// Chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_tt = txbMaTinhTrang.Text;
                string tt = txbTinhTrangCongTac.Text;
                DanhMucTable.Update(new string[] { ma_tt, tt });
            }
        }
        
        /// <summary>
        /// Chỉnh sửa 1 dòng. TextBox mã tình trạng được enable và cho readonly.
        /// </summary>
        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;
            
            txbMaTinhTrang.ReadOnly = true;
            txbMaTinhTrang.Enabled = true;
            txbMaTinhTrang.Text = GetCellContent(selectedIndex, 0);
        
            txbTinhTrangCongTac.Text = GetCellContent(selectedIndex, 1);
        }
        
        /// <summary>
        /// Xử lý sắp sửa xóa 1 dòng.
        /// </summary>
        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
            
            txbMaTinhTrang.Enabled = true;
            txbMaTinhTrang.ReadOnly = true;
            txbTinhTrangCongTac.Text = "";
            txbMaTinhTrang.Text = "";
        }
        
        /// <summary>
        /// Lấy BO TinhTrangCongTac.
        /// </summary>
        protected override DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TinhTrangCongTacTable();
                }
            
                return danhMucTable;
            }
        }

        #endregion

    }
}