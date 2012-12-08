using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class HinhThucDaoTaoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_htdt", "Mã số");
                InsertColumn(1, "htdt", "Hình thức đào tạo");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new HinhThucDaoTaoTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaHinhThucDaoTao.Enabled = false;
                txbMaHinhThucDaoTao.Text = "Auto";

                txbHinhThucDaoTao.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbHinhThucDaoTao.Text });
                txbHinhThucDaoTao.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaHinhThucDaoTao.Text;
                string hh = txbHinhThucDaoTao.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaHinhThucDaoTao.ReadOnly = true;
            txbMaHinhThucDaoTao.Enabled = true;
            txbMaHinhThucDaoTao.Text = GetCellContent(selectedIndex, 0);

            txbHinhThucDaoTao.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaHinhThucDaoTao.Enabled = true;
            txbMaHinhThucDaoTao.ReadOnly = true;
            txbHinhThucDaoTao.Text = "";
            txbMaHinhThucDaoTao.Text = "";
        }
    }
}