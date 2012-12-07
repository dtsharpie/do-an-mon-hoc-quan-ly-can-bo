using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class ChucVuChinhQuyenPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_cv", "Mã số");
                InsertColumn(1, "cv", "Chức vụ chính quyền");
                InsertColumn(2, "pccv", "Phụ cấp chức vụ");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new ChucVuChinhQuyenTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_cv = txbMaChucVuChinhQuyen.Text;
            string cv = txbChucVuChinhQuyen.Text;
            string pccv =txbPhuCapChucVu.Text;
            DanhMucTable.Insert(new string[] { ma_cv, cv, pccv });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_cv = txbMaChucVuChinhQuyen.Text;
            string cv = txbChucVuChinhQuyen.Text;
            string pccv = txbPhuCapChucVu.Text;
            DanhMucTable.Update(new string[] { ma_cv, cv, pccv });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaChucVuChinhQuyen.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbChucVuChinhQuyen.Text = GetCellContent(dataGridView.SelectedIndex, 1);
            txbPhuCapChucVu.Text = GetCellContent(dataGridView.SelectedIndex, 2);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}