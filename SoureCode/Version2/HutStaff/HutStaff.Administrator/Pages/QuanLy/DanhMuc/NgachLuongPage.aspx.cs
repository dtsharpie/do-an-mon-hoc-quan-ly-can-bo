using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class NgachLuongPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "ma_ngach", "Mã số");
                InsertColumn(1, "ten_ngach", "Tên ngoại ngữ");
                InsertColumn(2, "bac1", "Bậc 1");
                InsertColumn(3, "bac2", "Bậc 2");
                InsertColumn(4, "bac3", "Bậc 3");
                InsertColumn(5, "bac4", "Bậc 4");
                InsertColumn(6, "bac5", "Bậc 5");
                InsertColumn(7, "bac6", "Bậc 6");
                InsertColumn(8, "bac7", "Bậc 7");
                InsertColumn(9, "bac8", "Bậc 8");
                InsertColumn(10, "bac9", "Bậc 9");
                InsertColumn(11, "bac10", "Bậc 10");
                InsertColumn(12, "bac11", "Bậc 11");
                InsertColumn(13, "bac12", "Bậc 12");
                InsertColumn(14, "bac13", "Bậc 13");
                InsertColumn(15, "bac14", "Bậc 14");
                InsertColumn(16, "bac15", "Bậc 15");
                InsertColumn(17, "bac16", "Bậc 16");
                InsertColumn(18, "totkhung", "Tột khung");
                InsertColumn(19, "lvuc", "Lĩnh vực");
                InsertColumn(20, "tluong", "Tiền lương");
                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new NgachLuongTable();
                }
                return danhMucTable;
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            string ma_ngach = txbMaNgachLuong.Text;
            string ten_ngach = txbNgachLuong.Text;
            string bac1 = txbBac1.Text;
            string bac2 = txbBac2.Text;
            string bac3 = txbBac3.Text;
            string bac4 = txbBac4.Text;
            string bac5 = txbBac5.Text;
            string bac6 = txbBac6.Text;
            string bac7 = txbBac7.Text;
            string bac8 = txbBac8.Text;
            string bac9 = txbBac9.Text;
            string bac10 = txbBac10.Text;
            string bac11 = txbBac11.Text;
            string bac12 = txbBac12.Text;
            string bac13 = txbBac13.Text;
            string bac14 = txbBac14.Text;
            string bac15 = txbBac15.Text;
            string bac16 = txbBac16.Text;
            string totkhung = txbTotKhung.Text;
            string lvuc = txbLinhVuc.Text;
            string tluong = txbTienLuong.Text;
            DanhMucTable.Insert(new string[] { ma_ngach, ten_ngach, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11, bac12, bac13, bac14, bac15, bac16, totkhung, lvuc, tluong });
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_ngach = txbMaNgachLuong.Text;
            string ten_ngach = txbNgachLuong.Text;
            string bac1 = txbBac1.Text;
            string bac2 = txbBac2.Text;
            string bac3 = txbBac3.Text;
            string bac4 = txbBac4.Text;
            string bac5 = txbBac5.Text;
            string bac6 = txbBac6.Text;
            string bac7 = txbBac7.Text;
            string bac8 = txbBac8.Text;
            string bac9 = txbBac9.Text;
            string bac10 = txbBac10.Text;
            string bac11 = txbBac11.Text;
            string bac12 = txbBac12.Text;
            string bac13 = txbBac13.Text;
            string bac14 = txbBac14.Text;
            string bac15 = txbBac15.Text;
            string bac16 = txbBac16.Text;
            string totkhung = txbTotKhung.Text;
            string lvuc = txbLinhVuc.Text;
            string tluong = txbTienLuong.Text;
            DanhMucTable.Update(new string[] { ma_ngach, ten_ngach, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11, bac12, bac13, bac14, bac15, bac16, totkhung, lvuc, tluong });
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            txbMaNgachLuong.Text = GetCellContent(dataGridView.SelectedIndex, 0);
            txbNgachLuong.Text = GetCellContent(dataGridView.SelectedIndex, 1);
            txbBac1.Text = GetCellContent(dataGridView.SelectedIndex, 2);
            txbBac2.Text = GetCellContent(dataGridView.SelectedIndex, 3);
            txbBac3.Text = GetCellContent(dataGridView.SelectedIndex, 4);
            txbBac4.Text = GetCellContent(dataGridView.SelectedIndex, 5);
            txbBac5.Text = GetCellContent(dataGridView.SelectedIndex, 6);
            txbBac6.Text = GetCellContent(dataGridView.SelectedIndex, 7);
            txbBac7.Text = GetCellContent(dataGridView.SelectedIndex, 8);
            txbBac8.Text = GetCellContent(dataGridView.SelectedIndex, 9);
            txbBac9.Text = GetCellContent(dataGridView.SelectedIndex, 10);
            txbBac10.Text = GetCellContent(dataGridView.SelectedIndex, 11);
            txbBac11.Text = GetCellContent(dataGridView.SelectedIndex, 12);
            txbBac12.Text = GetCellContent(dataGridView.SelectedIndex, 13);
            txbBac13.Text = GetCellContent(dataGridView.SelectedIndex, 14);
            txbBac14.Text = GetCellContent(dataGridView.SelectedIndex, 15);
            txbBac15.Text = GetCellContent(dataGridView.SelectedIndex, 16);
            txbBac16.Text = GetCellContent(dataGridView.SelectedIndex, 17);
            txbTotKhung.Text = GetCellContent(dataGridView.SelectedIndex, 18);
            txbLinhVuc.Text = GetCellContent(dataGridView.SelectedIndex, 19);
            txbTienLuong.Text = GetCellContent(dataGridView.SelectedIndex, 20);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));
        }
    }
}