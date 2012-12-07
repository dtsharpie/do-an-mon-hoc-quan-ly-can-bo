using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class DienCanBoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_dcb", "Mã diện cán bộ");
                InsertColumn(1, "dv", "Diện cán bộ");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new DienCanBoTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_dcb = txbMaDienCanBo.Text;
            string dcb = txbDienCanBo.Text;
            DanhMucTable.Insert(new string[] { ma_dcb, dcb }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_dcb = txbMaDienCanBo.Text;
            string dcb = txbDienCanBo.Text;
            DanhMucTable.Update(new string[] { ma_dcb, dcb });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaDienCanBo.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbDienCanBo.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}