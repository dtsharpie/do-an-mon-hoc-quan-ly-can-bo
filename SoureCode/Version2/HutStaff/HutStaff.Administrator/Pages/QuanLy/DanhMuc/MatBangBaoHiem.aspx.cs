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
    public partial class MatBangBaoHiem : DanhMucPageBase
    {

        #region //--------- Event Handlers --------------//

        /// <summary>
        /// Thêm cột và đổ dữ liệu cho GridView.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_mbbh", "Mã");
                InsertColumn(1, "tinhtu", "Năm thay đổi");
                InsertColumn(2, "bhxh", "%BHXH");
                InsertColumn(3, "bhyt", "%BHYT");
                InsertColumn(4, "bhtn", "%BHTN");

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
            txbMa.Enabled = false;
            txbMa.Text = "Auto";

            txbTinhTu.Text = "";
        }

        /// <summary>
        /// Chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            if (EditState == EditState.Insert)
            {
                if (!String.IsNullOrEmpty(txbTinhTu.Text))
                {
                    DanhMucTable.Insert(new string[] { txbTinhTu.Text, txbBHXH.Text, txbBHYT.Text, txbBHTN.Text });
                }
            }
            else if (EditState == EditState.Update)
            {
                if (!String.IsNullOrEmpty(txbTinhTu.Text))
                {
                    DanhMucTable.Update(new string[] { txbMa.Text, txbBHXH.Text, txbBHYT.Text, txbBHTN.Text });
                }
            }
        }

        /// <summary>
        /// Chỉnh sửa 1 dòng. TextBox mã tình trạng được enable và cho readonly.
        /// </summary>
        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMa.ReadOnly = true;
            txbMa.Enabled = true;
            txbMa.Text = GetCellContent(selectedIndex, 0);
            txbTinhTu.Text = GetCellContent(selectedIndex, 1);
            txbBHXH.Text = GetCellContent(selectedIndex, 2);
            txbBHYT.Text = GetCellContent(selectedIndex, 3);
            txbBHTN.Text = GetCellContent(selectedIndex, 4);
        }

        /// <summary>
        /// Xử lý sắp sửa xóa 1 dòng.
        /// </summary>
        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            string ma_tt = GetCellContent(args.RowIndex, 0);
            DanhMucTable.Delete(ma_tt);

            txbMa.Enabled = true;
            txbMa.ReadOnly = true;
            txbTinhTu.Text = "";
            txbMa.Text = "";
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
                    danhMucTable = new MatBangBaoHiemTable();
                }

                return danhMucTable;
            }
        }

        #endregion

    }
}