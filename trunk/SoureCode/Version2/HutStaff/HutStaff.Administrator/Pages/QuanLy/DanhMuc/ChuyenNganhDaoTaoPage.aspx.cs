using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class ChuyenNganhDaoTaoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_cn", "Mã số");
                InsertColumn(1, "cn", "Chuyên ngành đào tạo");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new ChuyenNganhDaoTaoTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_cn = txbMaChuyenNganhDaoTao.Text;
            string cn = txbChuyenNganhDaoTao.Text;
            DanhMucTable.Insert(new string[] { ma_cn, cn });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_cn = txbMaChuyenNganhDaoTao.Text;
            string cn = txbChuyenNganhDaoTao.Text;
            DanhMucTable.Update(new string[] { ma_cn, cn });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaChuyenNganhDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbChuyenNganhDaoTao.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}