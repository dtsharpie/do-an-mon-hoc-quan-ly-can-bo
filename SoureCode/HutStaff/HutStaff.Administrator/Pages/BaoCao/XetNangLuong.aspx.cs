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
            this.LoadDataToGridView();
            btnDownload.Visible = true;

            string strHeaderText = "<h1>BỘ GIÁO DỤC VÀ ĐÀO TẠO</h1>"
                                   + "<h2>Trường Đại học Bách Khoa Hà Nội</h2>"
                                   + "<p align=\"center\"><h2>BẢNG DANH SÁCH XÉT NÂNG LƯƠNG HÀNG NĂM</h2></p>";
            lblHeader.Text = Server.HtmlDecode(strHeaderText);
            lblHeader.Visible = true;
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            DataTable salaryIncrementListDataTable = this.GetSalaryIncrementList();
            BO.Report.Exporter.ExporttoExcel(salaryIncrementListDataTable, String.Format("XetNangLuong_{0}.xls", DateTime.Now.ToString()));
        }

        private DataTable GetSalaryIncrementList()
        {
            DataTable salaryIncrementListDataTable = new DataTable();

            loaiHanNgach = int.Parse(ddlLoaiHanNgach.SelectedValue);
            loaiBang = int.Parse(ddlLuaChonBang.SelectedValue);
            thang = int.Parse(ddlThoiHan.SelectedValue);
            bool isValidYear = int.TryParse(txtNam.Text, out nam);

            if (isValidYear)
            {
                salaryIncrementListDataTable = BO.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);

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
                salaryIncrementListDataTable.Columns[1].ColumnName = "Họ đệm";
                salaryIncrementListDataTable.Columns[2].ColumnName = "Tên";
                salaryIncrementListDataTable.Columns[3].ColumnName = "Số hiệu công chức";
                salaryIncrementListDataTable.Columns[4].ColumnName = "Mã ngạch";
                salaryIncrementListDataTable.Columns[5].ColumnName = "Bậc lương";
                salaryIncrementListDataTable.Columns[6].ColumnName = "Hệ số lương";
                salaryIncrementListDataTable.Columns[7].ColumnName = "Thời gian bắt đầu";
                salaryIncrementListDataTable.Columns[8].ColumnName = "Thông tin khác";
                if (loaiBang == 3)
                {
                    salaryIncrementListDataTable.Columns[9].ColumnName = "Hệ số phụ cấp thâm niên";
                }
            }

            return salaryIncrementListDataTable;
        }

        private void LoadDataToGridView()
        {
            DataTable salaryIncrementListDataTable = this.GetSalaryIncrementList();
            gvResultSearch.DataSource = salaryIncrementListDataTable;
            gvResultSearch.DataBind();
        }

        protected void gvResultSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int newPage;
            newPage = e.NewPageIndex;
            if (newPage < 0 || newPage >= gvResultSearch.PageCount)
            {
                e.Cancel = true;
            }
            else
            {
                gvResultSearch.PageIndex = newPage;
                this.LoadDataToGridView();
            }
        }

    }
}