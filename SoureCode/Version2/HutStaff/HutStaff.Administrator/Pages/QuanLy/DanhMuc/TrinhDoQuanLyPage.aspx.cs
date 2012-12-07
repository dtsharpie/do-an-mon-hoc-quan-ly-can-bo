using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoQuanLyPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdql", "Mã số");
                InsertColumn(1, "tdql", "Trình độ quản lý");
                FillData();
            }
        }
        
        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoQuanLyTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_tdql = txbMaTrinhDoQuanLy.Text;
            string tdql = txbTrinhDoQuanLy.Text;
            DanhMucTable.Insert(new string[] { ma_tdql, tdql });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_tdql = txbMaTrinhDoQuanLy.Text;
            string tdql = txbTrinhDoQuanLy.Text;
            DanhMucTable.Insert(new string[] { ma_tdql, tdql });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaTrinhDoQuanLy.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTrinhDoQuanLy.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}