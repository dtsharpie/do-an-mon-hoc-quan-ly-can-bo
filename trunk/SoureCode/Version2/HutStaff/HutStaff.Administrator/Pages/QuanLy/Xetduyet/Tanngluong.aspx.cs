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
    public partial class Tanngluong : System.Web.UI.Page
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
                tblData.Columns.Add("ngach");
                tblData.Columns.Add("hsl");
                tblData.Columns.Add("hspctn");
                tblData.Columns.Add("huongtu");
                tblData.Columns.Add("moctinhlansau");
                tblData.Columns.Add("ttk");
                grdData.DataSource = tblData;
                grdData.DataBind();
                ViewState["tabledata"] = tblData;
            }
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            workbook = Factory.GetWorkbookSet().Workbooks.OpenFromMemory(fileUpload.FileBytes);
            tblData = ((DataTable)(ViewState["tabledata"])).Clone();
            ToDataTable(tblData, workbook.Worksheets[0], 1, 0, 9);
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
                    BO.PagesBO.QuanLy.XetDuyet.UpdateKhenthuong(Convert.ToInt32(dr["shcc"]), dr["htkt"].ToString(), new DateTime(Convert.ToInt32(dr["nam"]), 1, 1), dr["so"].ToString(), dr["lydo"].ToString());
                }
                tblData = tblData.Clone();
                grdData.DataSource = tblData;
                grdData.DataBind();
                ViewState["tabledata"] = tblData;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Susscess_kt", "alert('Cập nhật thành công');", true);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Fail_kt", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            tblData = (DataTable)(ViewState["tabledata"]);
            cells = FromDataTable(workbook.Worksheets[0], new DataColumn[] { tblData.Columns["shcc"], tblData.Columns["fullname"], tblData.Columns["ngach"], tblData.Columns["bac"], tblData.Columns["hsl"], tblData.Columns["hspctn"], tblData.Columns["huongtu"], tblData.Columns["moctinhlansau"], tblData.Columns["ttk"] }, 2, 1);
            cells["A1"].Formula = "Số hiệu công chức";
            cells["A1"].ColumnWidth = 25;

            cells["B1"].Formula = "Họ tên";
            cells["B1"].ColumnWidth = 50;

            cells["C1"].Formula = "Ngạch";
            cells["C1"].ColumnWidth = 25;

            cells["D1"].Formula = "Bậc lương";
            cells["D1"].ColumnWidth = 25;

            cells["E1"].Formula = "Hệ số lương";
            cells["E1"].ColumnWidth = 25;

            cells["F1"].Formula = "Hệ số phụ cấp TVNK";
            cells["F1"].ColumnWidth = 25;

            cells["G1"].Formula = "Hưởng từ";
            cells["G1"].ColumnWidth = 30;

            cells["H1"].Formula = "Mốc tính lần sau";
            cells["H1"].ColumnWidth = 30;

            cells["I1"].Formula = "Thông tin khác";
            cells["I1"].ColumnWidth = 50;

            cells["A1:I1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
            cells["A1:I1"].Font.Bold = true;
            workbook.Worksheets[0].Name = "Tăng lương";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + "tang_luong_" + DateTime.Now.ToString("yyyyMMdd") + ".xls");
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
                    cell.Formula = columns[cell.Column - indexColumn + 1].DataType != typeof(DateTime) ? columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName].ToString()
                   : Convert.ToDateTime(columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName]).ToString("dd/MM/yyyy");
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
                    dr[i] = worksheet.Cells[indexRow, indexColumn + i].Text != null ? worksheet.Cells[indexRow, indexColumn + i].Text.ToString() : "";
                }
                tblData.Rows.Add(dr);
                indexRow++;
            }
        }

        protected bool IsEmptyRow(SpreadsheetGear.IRange row)
        {
            foreach (SpreadsheetGear.IRange range in row)
            {
                if (range.Text != null && !String.IsNullOrEmpty(range.Text.ToString()))
                {
                    return false;
                }
            }
            return true;
        }
    }
}