using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class MucDichDiNuocNgoai : DanhMucPageBase
    {
        #region //--------- Event Handlers --------------//

        /// <summary>
        /// Thêm cột và đổ dữ liệu cho GridView.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_mdnndd", "Mã mục đích");
                InsertColumn(1, "mdnndd", "Mục đích");

                FillData();
            }
        }

        #endregion

        #region //--------- Abstract Class Members ------//

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaMucDichDiNuocNgoai.Enabled = false;
                txbMaMucDichDiNuocNgoai.Text = "Auto";

                txbMucDichDiNuocNgoai.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbMucDichDiNuocNgoai.Text });
                txbMucDichDiNuocNgoai.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaMucDichDiNuocNgoai.Text;
                string hh = txbMucDichDiNuocNgoai.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaMucDichDiNuocNgoai.ReadOnly = true;
            txbMaMucDichDiNuocNgoai.Enabled = true;
            txbMaMucDichDiNuocNgoai.Text = GetCellContent(selectedIndex, 0);

            txbMucDichDiNuocNgoai.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaMucDichDiNuocNgoai.Enabled = true;
            txbMaMucDichDiNuocNgoai.ReadOnly = true;
            txbMucDichDiNuocNgoai.Text = "";
            txbMaMucDichDiNuocNgoai.Text = "";
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
                    danhMucTable = new MucDichDiNuocNgoaiTable();
                }

                return danhMucTable;
            }
        }

        #endregion
    }
}