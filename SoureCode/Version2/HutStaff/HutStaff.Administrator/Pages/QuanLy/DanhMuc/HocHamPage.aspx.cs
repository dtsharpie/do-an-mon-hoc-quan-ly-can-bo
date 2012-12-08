using System;
using System.Linq;
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
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaHocHam.Enabled = false;
                txbMaHocHam.Text = "Auto";

                txbHocHam.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbHocHam.Text });
                txbHocHam.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaHocHam.Text;
                string hh = txbHocHam.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaHocHam.ReadOnly = true;
            txbMaHocHam.Enabled = true;
            txbMaHocHam.Text = GetCellContent(selectedIndex, 0);

            txbHocHam.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaHocHam.Enabled = true;
            txbMaHocHam.ReadOnly = true;
            txbHocHam.Text = "";
            txbMaHocHam.Text = "";
        }
    }
}