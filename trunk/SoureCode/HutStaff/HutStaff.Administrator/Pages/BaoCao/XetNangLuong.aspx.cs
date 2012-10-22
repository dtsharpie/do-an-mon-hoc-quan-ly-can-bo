using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class XetNangLuong : System.Web.UI.Page
    {
        private int loaiHanNgach;
        private int loaiBang;
        private int thang;
        private int nam;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            loaiHanNgach = int.Parse(ddlLoaiHanNgach.SelectedValue);
            loaiBang = int.Parse(ddlLuaChonBang.SelectedValue);
            thang = int.Parse(ddlThoiHan.SelectedValue);
            bool isValidYear = int.TryParse(txtNam.Text, out nam);

            if (isValidYear)
            {
                DataTable salaryIncrementListDataTable = BO.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);

                // Add order column
                DataColumn orderColumn = salaryIncrementListDataTable.Columns.Add("STT");
                orderColumn.SetOrdinal(0);
                int order = 0;
                foreach (DataRow row in salaryIncrementListDataTable.Rows)
                {
                    order++;
                    row["STT"] = order.ToString();
                }

                // Change column name of salary increment list table
                salaryIncrementListDataTable.Columns[1].ColumnName = "Ho dem";
                salaryIncrementListDataTable.Columns[2].ColumnName = "Ten";
                salaryIncrementListDataTable.Columns[3].ColumnName = "So hieu cong chuc";
                salaryIncrementListDataTable.Columns[4].ColumnName = "Ma ngach";
                salaryIncrementListDataTable.Columns[5].ColumnName = "Bac luong";
                salaryIncrementListDataTable.Columns[6].ColumnName = "He so luong";
                salaryIncrementListDataTable.Columns[7].ColumnName = "Thoi gian bat dau";
                salaryIncrementListDataTable.Columns[8].ColumnName = "Thong tin khac";

                BO.Report.Exporter.ExporttoExcel(salaryIncrementListDataTable, String.Format("XetNangLuong_{0}.xls", DateTime.Now.ToString()));
            }
        }
    }
}