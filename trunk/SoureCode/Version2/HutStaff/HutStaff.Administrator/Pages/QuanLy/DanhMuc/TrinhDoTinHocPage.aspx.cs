using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoTinHocPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdth", "Mã số");
                InsertColumn(1, "tdth", "Trình độ tin học");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoTinHocTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tdth = txbMaTrinhDoTinHoc.Text;
            string tdth = txbTrinhDoTinHoc.Text;
            DanhMucTable.Insert(new string[] { ma_tdth, tdth });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tdth = txbMaTrinhDoTinHoc.Text;
            string tdth = txbTrinhDoTinHoc.Text;
            DanhMucTable.Update(new string[] { ma_tdth, tdth });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTrinhDoTinHoc.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTrinhDoTinHoc.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}