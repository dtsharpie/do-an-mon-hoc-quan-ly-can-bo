using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class QuocGiaPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_qg", "Mã số");
                InsertColumn(1, "qg", "Tên quốc gia");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new QuocGiaTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_qg = txbMaQuocGia.Text;
            string qg = txbTenQuocGia.Text;
            DanhMucTable.Insert(new string[] { ma_qg, qg });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_qg = txbMaQuocGia.Text;
            string qg = txbTenQuocGia.Text;
            DanhMucTable.Update(new string[] { ma_qg, qg });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaQuocGia.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbTenQuocGia.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}