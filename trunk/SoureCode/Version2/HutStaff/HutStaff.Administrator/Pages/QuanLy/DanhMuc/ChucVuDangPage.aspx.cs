using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class ChucVuDangPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_cud", "Mã số");
                InsertColumn(1, "cud", "Chức vụ Đảng");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new ChucVuDangTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_cud = txbMaChucVuDang.Text;
            string cud = txbChucVuDang.Text;
            DanhMucTable.Insert(new string[] { ma_cud, cud });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_cud = txbMaChucVuDang.Text;
            string cud = txbChucVuDang.Text;
            DanhMucTable.Update(new string[] { ma_cud, cud });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaChucVuDang.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbChucVuDang.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}