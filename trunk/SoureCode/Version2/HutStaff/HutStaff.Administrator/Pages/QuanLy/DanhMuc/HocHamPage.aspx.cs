using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class HocHamPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_hh", "Mã học hàm");
                InsertColumn(1, "hh", "Học hàm");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new HocHamTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_hh = txbMaHocHam.Text;
            string hh = txbHocHam.Text;
            DanhMucTable.Insert(new string[] { ma_hh, hh }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_hh = txbMaHocHam.Text;
            string hh = txbHocHam.Text;
            DanhMucTable.Update(new string[] { ma_hh, hh }); 
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbHocHam.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbHocHam.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}