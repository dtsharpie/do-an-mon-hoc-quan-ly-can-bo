using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class HinhThucKhenThuongPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_kt", "Mã khen thưởng");
                InsertColumn(1, "kt", "Hình thức khen thưởng");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new HinhThucKhenThuongTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_kt = txbMaKhenThuong.Text;
            string kt = txbKhenThuong.Text;
            DanhMucTable.Insert(new string[] { ma_kt, kt }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_kt = txbMaKhenThuong.Text;
            string kt = txbKhenThuong.Text;
            DanhMucTable.Update(new string[] { ma_kt, kt }); 
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaKhenThuong.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbKhenThuong.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}