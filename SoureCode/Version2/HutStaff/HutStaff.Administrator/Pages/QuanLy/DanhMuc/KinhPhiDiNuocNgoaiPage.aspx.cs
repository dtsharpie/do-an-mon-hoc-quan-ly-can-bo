using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class KinhPhiDiNuocNgoaiPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "dm_nkpnndd", "Mã số");
                InsertColumn(1, "nkpnndd", "Nguồn kinh phí");
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                return new KinhPhiDiNuocNgoaiTable();
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaKinhPhiDiNuocNgoai.Enabled = false;
                txbMaKinhPhiDiNuocNgoai.Text = "Auto";

                txbKinhPhiDiNuocNgoai.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbKinhPhiDiNuocNgoai.Text });
                txbKinhPhiDiNuocNgoai.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaKinhPhiDiNuocNgoai.Text;
                string hh = txbKinhPhiDiNuocNgoai.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaKinhPhiDiNuocNgoai.ReadOnly = true;
            txbMaKinhPhiDiNuocNgoai.Enabled = true;
            txbMaKinhPhiDiNuocNgoai.Text = GetCellContent(selectedIndex, 0);

            txbKinhPhiDiNuocNgoai.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaKinhPhiDiNuocNgoai.Enabled = true;
            txbMaKinhPhiDiNuocNgoai.ReadOnly = true;
            txbKinhPhiDiNuocNgoai.Text = "";
            txbMaKinhPhiDiNuocNgoai.Text = "";
        }
    }
}