using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QLCB_BK.Pages.BaoCao
{
    public partial class XetNangLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            int loaiHanNgach = int.Parse(ddlLoaiHanNgach.SelectedValue);
            int loaiBang = int.Parse(ddlLuaChonBang.SelectedValue);
            int thang = int.Parse(ddlThoiHan.SelectedValue);
            int nam;
            bool isValidYear = int.TryParse(txtNam.Text, out nam);

            if (isValidYear)
            {
                DataTable salaryIncrementListDataTable = BO.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);
                //salaryIncrementListDataGridView.Columns[0].ColumnName = @"0000";
                DataSet ds = new DataSet();
                ds.Tables.Add(salaryIncrementListDataTable);
                salaryIncrementListDataGridView.DataSource = ds;
                salaryIncrementListDataGridView.DataBind();

                BO.Report.ExcelExport.ExportDataSetToExcel(ds, String.Format("NangLuong_{0}.xls", DateTime.Now.ToString()));
            }
            else
            {

            }
        }
    }
}