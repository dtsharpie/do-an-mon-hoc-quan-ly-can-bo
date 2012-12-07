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
                InsertColumn(1, "dcb", "Diện cán bộ");
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
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaDienCanBo.Enabled = false;
                txbMaDienCanBo.Text = "Auto";

                txbDienCanBo.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbDienCanBo.Text });
                txbDienCanBo.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_dcb = txbMaDienCanBo.Text;
                string dcb = txbDienCanBo.Text;
                DanhMucTable.Update(new string[] { ma_dcb, dcb });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaDienCanBo.ReadOnly = true;
            txbMaDienCanBo.Enabled = true;
            txbMaDienCanBo.Text = GetCellContent(selectedIndex, 0);

            txbDienCanBo.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaDienCanBo.Enabled = true;
            txbMaDienCanBo.ReadOnly = true;
            txbDienCanBo.Text = "";
            txbMaDienCanBo.Text = "";
        }
    }
}