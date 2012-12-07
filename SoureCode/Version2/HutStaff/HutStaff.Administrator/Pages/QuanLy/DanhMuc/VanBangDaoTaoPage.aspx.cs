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
            string ma_vbdt = txbMaVanBangDaoTao.Text;
            string vbdt = txbVanBangDaoTao.Text;
            DanhMucTable.Insert(new string[] { ma_vbdt, vbdt });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_vbdt = txbMaVanBangDaoTao.Text;
            string vbdt = txbVanBangDaoTao.Text;
            DanhMucTable.Update(new string[] { ma_vbdt, vbdt });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaVanBangDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbVanBangDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}