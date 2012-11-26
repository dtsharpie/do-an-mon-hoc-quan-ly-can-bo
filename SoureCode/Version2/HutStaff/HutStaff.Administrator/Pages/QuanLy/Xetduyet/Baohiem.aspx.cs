using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SpreadsheetGear;

namespace HutStaff.Administrator.Pages.QuanLy.Xetduyet
{
    public partial class Baohiem : System.Web.UI.Page
    {
        protected DataTable tblData;
        SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
        SpreadsheetGear.IRange cells = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblData = new DataTable();
                tblData.Columns.Add("shcc");
                tblData.Columns.Add("fullname");
                tblData.Columns.Add("sobh");
                tblData.Columns.Add("ngay");
                grdData.DataSource = tblData;
                grdData.DataBind();
                ViewState["tabledata"] = tblData;
            }
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            workbook = Factory.GetWorkbookSet().Workbooks.OpenFromMemory(fileUpload.FileBytes);
            tblData = ((DataTable)(ViewState["tabledata"])).Clone();
            ToDataTable(tblData, workbook.Worksheets[0], 1, 0, 4);
            ViewState["tabledata"] = tblData;
            grdData.DataSource = tblData;
            grdData.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                tblData = (DataTable)(ViewState["tabledata"]);
                foreach (DataRow dr in tblData.Rows)
                {
                    DateTime dtNdbh;
                    if (String.IsNullOrEmpty(dr["ngay"].ToString()))
                    {
                        dtNdbh = DateTime.MinValue;
                    }
                    else
                    {
                        string[] aNdbh = dr["ngay"].ToString().Split('/');
                        dtNdbh = new DateTime(Convert.ToInt32(aNdbh[2]), Convert.ToInt32(aNdbh[1]), Convert.ToInt32(aNdbh[0]));
                    }
                    BO.PagesBO.QuanLy.XetDuyet.UpdateBhxh(Convert.ToInt32(dr["shcc"]), dr["sbh"].ToString(), dtNdbh);
                }
                tblData = tblData.Clone();
                grdData.DataSource = tblData;
                grdData.DataBind();
                ViewState["tabledata"] = tblData;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Susscess_bh", "alert('Cập nhật thành công');", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Fail_bh", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            tblData = (DataTable)(ViewState["tabledata"]);
            cells = FromDataTable(workbook.Worksheets[0], new DataColumn[] { tblData.Columns["shcc"], tblData.Columns["fullname"], tblData.Columns["sobh"], tblData.Columns["ngay"] }, 2, 1);
            cells["A1"].Formula = "Số hiệu công chức";
            cells["A1"].ColumnWidth = 25;

            cells["B1"].Formula = "Họ tên";
            cells["B1"].ColumnWidth = 50;

            cells["C1"].Formula = "Số bhxh";
            cells["C1"].ColumnWidth = 50;

            cells["D1"].Formula = "Ngày bắt đầu đóng";
            cells["D1"].ColumnWidth = 25;

            cells["A1:D1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
            cells["A1:D1"].Font.Bold = true;
            workbook.Worksheets[0].Name = "BHXH";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + "bao_hiem_" + DateTime.Now.ToString("yyyyMMdd") + ".xls");
            workbook.SaveToStream(Response.OutputStream, SpreadsheetGear.FileFormat.XLS97);
            Response.End();
        }

        private SpreadsheetGear.IRange FromDataTable(SpreadsheetGear.IWorksheet worksheet, DataColumn[] columns, int indexRow, int indexColumn)
        {
            SpreadsheetGear.IRange cells = worksheet.Cells;
            if (columns[0].Table.Rows.Count != 0)
            {
                string sStartCell = HutStaff.Common.Utility.ExcelHelper.IndexToColumnName(indexColumn) + indexRow.ToString();
                string sEndCell = HutStaff.Common.Utility.ExcelHelper.IndexToColumnName(indexColumn + columns.Length - 1) + (indexRow + columns[0].Table.Rows.Count - 1).ToString();
                foreach (SpreadsheetGear.IRange cell in cells[sStartCell + ":" + sEndCell])
                {
                    cell.Formula = columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName].ToString();
                }
            }
            return cells;
        }

        private void ToDataTable(DataTable tblData, SpreadsheetGear.IWorksheet worksheet, int indexRow, int indexColumn, int totalColumn)
        {
            while (!IsEmptyRow(worksheet.Cells[indexRow, indexColumn, indexRow, totalColumn - 1]))
            {
                DataRow dr = tblData.NewRow();
                for (int i = 0; i < totalColumn; i++)
                {
                    dr[i] = worksheet.Cells[indexRow, indexColumn + i].Value != null ? worksheet.Cells[indexRow, indexColumn + i].Value.ToString() : "";
                }
                tblData.Rows.Add(dr);
                indexRow++;
            }
        }

        protected bool IsEmptyRow(SpreadsheetGear.IRange row)
        {
            foreach (SpreadsheetGear.IRange range in row)
            {
                if (range.Value != null && !String.IsNullOrEmpty(range.Value.ToString()))
                {
                    return false;
                }
            }
            return true;
        }
    }
}