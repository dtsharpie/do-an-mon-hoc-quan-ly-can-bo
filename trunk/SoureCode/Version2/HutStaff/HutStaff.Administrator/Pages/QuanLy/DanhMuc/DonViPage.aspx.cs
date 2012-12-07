using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class DonViPage : DanhMucPageBase
    {
        /// <summary>
        /// Lay du lieu cho vao gridview neu khogn phai la post back
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_dv", "Mã đơn vị");
                InsertColumn(1, "dv", "Đơn vị");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new DonViTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_dv = txbMaDonVi.Text;
            string dv = txbDonVi.Text;
            DanhMucTable.Insert(new string[] { ma_dv, dv }); 
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_dv = txbMaDonVi.Text;
            string dv = txbDonVi.Text;
            DanhMucTable.Update(new string[] { ma_dv, dv });
        }

        /// <summary>
        /// Bam vao nut select
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaDonVi.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbDonVi.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}