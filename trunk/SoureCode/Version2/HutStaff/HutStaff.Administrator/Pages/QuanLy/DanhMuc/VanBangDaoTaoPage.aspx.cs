using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class VanBangDaoTaoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_vbdt", "Mã số");
                InsertColumn(1, "vbdt", "Văn bằng đạo tạo");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new VanBangDaoTaoTable();
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

                txbMaVanBangDaoTao.Enabled = false;
                txbMaVanBangDaoTao.Text = "Auto";

                txbVanBangDaoTao.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbVanBangDaoTao.Text });
                txbVanBangDaoTao.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaVanBangDaoTao.Text;
                string hh = txbVanBangDaoTao.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaVanBangDaoTao.ReadOnly = true;
            txbMaVanBangDaoTao.Enabled = true;
            txbMaVanBangDaoTao.Text = GetCellContent(selectedIndex, 0);

            txbVanBangDaoTao.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaVanBangDaoTao.Enabled = true;
            txbMaVanBangDaoTao.ReadOnly = true;
            txbVanBangDaoTao.Text = "";
            txbMaVanBangDaoTao.Text = "";
        }
    }
}