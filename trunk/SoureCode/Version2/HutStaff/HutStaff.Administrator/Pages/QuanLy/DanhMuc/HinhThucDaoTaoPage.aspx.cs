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
            string ma_htdt = txbMaHinhThucDaoTao.Text;
            string htdt = txbHinhThucDaoTao.Text;
            DanhMucTable.Insert(new string[] { ma_htdt, htdt });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_htdt = txbMaHinhThucDaoTao.Text;
            string htdt = txbHinhThucDaoTao.Text;
            DanhMucTable.Update(new string[] { ma_htdt, htdt });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaHinhThucDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbHinhThucDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}