using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class ChucVuDoanThePage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_cu", "Mã số");
                InsertColumn(1, "cu", "Chức vụ Đoàn thể");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new ChucVuDoanTheTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_cu = txbMaChucVuDoanThe.Text;
            string cu = txbChucVuDoanThe.Text;
            DanhMucTable.Insert(new string[] { ma_cu, cu });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_cu = txbMaChucVuDoanThe.Text;
            string cu = txbChucVuDoanThe.Text;
            DanhMucTable.Update(new string[] { ma_cu, cu });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaChucVuDoanThe.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbChucVuDoanThe.Text = GetCellContent(dataGridView.SelectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}