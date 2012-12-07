using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoLyLuanPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdll", "Mã số");
                InsertColumn(1, "tdll", "Trình độ lý luận");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoLyLuanTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tdll = txbMaTrinhDoLyLuan.Text;
            string tdll = txbTrinhDoLyLuan.Text;
            DanhMucTable.Insert(new string[] { ma_tdll, tdll });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tdll = txbMaTrinhDoLyLuan.Text;
            string tdll = txbTrinhDoLyLuan.Text;
            DanhMucTable.Update(new string[] { ma_tdll, tdll });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTrinhDoLyLuan.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTrinhDoLyLuan.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}