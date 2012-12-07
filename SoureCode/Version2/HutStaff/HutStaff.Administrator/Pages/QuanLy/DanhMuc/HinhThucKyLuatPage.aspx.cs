using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class HinhThucKyLuatPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_kl", "Mã kỷ luật");
                InsertColumn(1, "kl", "Hình thức kỷ luật");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new HinhThucKyLuatTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_kl = txbMaKyLuat.Text;
            string kl = txbKyLuat.Text;
            DanhMucTable.Insert(new string[] { ma_kl, kl }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_kl = txbMaKyLuat.Text;
            string kl = txbKyLuat.Text;
            DanhMucTable.Update(new string[] { ma_kl, kl }); 
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaKyLuat.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbKyLuat.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}