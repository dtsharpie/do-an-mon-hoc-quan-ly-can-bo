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
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaChucVuDoanThe.Enabled = false;
                txbMaChucVuDoanThe.Text = "Auto";

                txbChucVuDoanThe.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbChucVuDoanThe.Text });
                txbChucVuDoanThe.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaChucVuDoanThe.Text;
                string hh = txbChucVuDoanThe.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaChucVuDoanThe.ReadOnly = true;
            txbMaChucVuDoanThe.Enabled = true;
            txbMaChucVuDoanThe.Text = GetCellContent(selectedIndex, 0);

            txbChucVuDoanThe.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaChucVuDoanThe.Enabled = true;
            txbMaChucVuDoanThe.ReadOnly = true;
            txbChucVuDoanThe.Text = "";
            txbMaChucVuDoanThe.Text = "";
        }
    }
}