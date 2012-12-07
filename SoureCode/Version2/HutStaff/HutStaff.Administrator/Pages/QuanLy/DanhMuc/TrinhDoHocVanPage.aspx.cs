using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoHocVanPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdhv", "Mã số");
                InsertColumn(1, "tdhv", "Trình độ học vấn");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoHocVanTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tdhv = txbMaTrinhDoHocVan.Text;
            string tdhv = txbTrinhDoHocVan.Text;
            DanhMucTable.Insert(new string[] { ma_tdhv, tdhv });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tdhv = txbMaTrinhDoHocVan.Text;
            string tdhv = txbTrinhDoHocVan.Text;
            DanhMucTable.Update(new string[] { ma_tdhv, tdhv });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTrinhDoHocVan.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTrinhDoHocVan.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}