using System;
using System.Linq;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TrinhDoNgoaiNguPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_tdnn", "Mã số");
                InsertColumn(1, "tdnn", "Trình độ ngoại ngữ");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new TrinhDoNgoaiNguTable();
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

                txbMaTrinhDoNgoaiNgu.Enabled = false;
                txbMaTrinhDoNgoaiNgu.Text = "Auto";

                txbTrinhDoNgoaiNgu.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbTrinhDoNgoaiNgu.Text });
                txbTrinhDoNgoaiNgu.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_tdnn = txbMaTrinhDoNgoaiNgu.Text;
                string tdnn = txbTrinhDoNgoaiNgu.Text;
                DanhMucTable.Update(new string[] { ma_tdnn, tdnn });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaTrinhDoNgoaiNgu.ReadOnly = true;
            txbMaTrinhDoNgoaiNgu.Enabled = true;
            txbMaTrinhDoNgoaiNgu.Text = GetCellContent(selectedIndex, 0);

            txbTrinhDoNgoaiNgu.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaTrinhDoNgoaiNgu.Enabled = true;
            txbMaTrinhDoNgoaiNgu.ReadOnly = true;
            txbTrinhDoNgoaiNgu.Text = "";
            txbMaTrinhDoNgoaiNgu.Text = "";
        }
    }
}