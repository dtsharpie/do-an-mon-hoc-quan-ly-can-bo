using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoNgoaiNguPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdnn", "Mã số");
                InsertColumn(1, "tdnn", "Trình độ ngoại ngữ");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoNgoaiNguTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tdnn = txbMaTrinhDoNgoaiNgu.Text;
            string tdnn = txbTrinhDoNgoaiNgu.Text;
            DanhMucTable.Insert(new string[] { ma_tdnn, tdnn }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tdnn = txbMaTrinhDoNgoaiNgu.Text;
            string tdnn = txbTrinhDoNgoaiNgu.Text;
            DanhMucTable.Update(new string[] { ma_tdnn, tdnn }); 
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTrinhDoNgoaiNgu.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTrinhDoNgoaiNgu.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}