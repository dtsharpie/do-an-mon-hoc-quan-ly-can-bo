using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TenNgoaiNguPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tnn", "Mã số");
                InsertColumn(1, "tnn", "Tên ngoại ngữ");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TenNgoaiNguTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tnn = txbMaTenNgoaiNgu.Text;
            string tnn = txbTenNgoaiNgu.Text;
            DanhMucTable.Insert(new string[] { ma_tnn, tnn });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tnn = txbMaTenNgoaiNgu.Text;
            string tnn = txbTenNgoaiNgu.Text;
            DanhMucTable.Update(new string[] { ma_tnn, tnn });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTenNgoaiNgu.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTenNgoaiNgu.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}