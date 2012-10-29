using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;

namespace HutStaff.Administrator.Services
{
    /// <summary>
    /// Summary description for ExportExcel
    /// </summary>
    public class ExportExcel : IHttpHandler, IRequiresSessionState
    {

        DataTable tblData;
        public void ProcessRequest(HttpContext context)
        {
            SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
            SpreadsheetGear.IWorksheet worksheet = workbook.Worksheets[0];
            SpreadsheetGear.IRange cells = null;
            int iType = Convert.ToInt32(context.Request.QueryString["type"]);
            //if (iType == 0 || BO.Security.CurrentUser.GetCurrentUser() == null)
            //    return;
            switch (iType)
            {
                case 1:
                    int iLoaiHanNgach = Convert.ToInt32(context.Request.QueryString["loaihanngach"]);
                    int iLoaiBang = Convert.ToInt32(context.Request.QueryString["loaibang"]);
                    string[] sTime = context.Request.QueryString["thoigian"].Split('/');
                    DateTime dtTime = new DateTime(Convert.ToInt32(sTime[2]), Convert.ToInt32(sTime[1]), Convert.ToInt32(sTime[0]));
                    string sDelete = context.Request.QueryString["delete"];
                    tblData = BO.PagesBO.QuanLy.XetDuyet.ViewSetNangLuong(1, int.MaxValue, iLoaiHanNgach, iLoaiBang, dtTime, sDelete);
                    tblData.Columns.Add("Stt");
                    tblData.Columns.Add("hoten");
                    for (int i = 0; i < tblData.Rows.Count; i++)
                    {
                        tblData.Rows[i]["Stt"] = i +1;
                        tblData.Rows[i]["hoten"] = tblData.Rows[i]["hodem"].ToString() + " " + tblData.Rows[i]["ten"].ToString();
                    }
                    if (iLoaiBang != 3)
                    {
                        cells = FromDataTable(worksheet, new DataColumn[] { tblData.Columns["Stt"], tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["bl_dbl"], tblData.Columns["shcc"], tblData.Columns["hsl"] , tblData.Columns["ma_ngach"] , tblData.Columns["tgbd_dbl"] , tblData.Columns["ttk_qtdbl"] }, 2, 1);
                    }
                    else
                    {
                        cells = FromDataTable(worksheet, new DataColumn[] { tblData.Columns["Stt"], tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["bl_dbl"], tblData.Columns["shcc"], tblData.Columns["hsl"], tblData.Columns["ma_ngach"], tblData.Columns["tgbd_dbl"],tblData.Columns["hspctn"] ,tblData.Columns["ttk_qtdbl"] }, 2, 1);

                    }
                    cells["A1"].Formula = "Số thứ tự";

                    cells["B1"].Formula = "Họ tên";
                    cells["B1"].ColumnWidth = 50;
                    cells["B1:" + "B" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                    cells["C1"].Formula = "Số hiệu";
                    cells["C1"].ColumnWidth = 25;
                    cells["C1:" + "C" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                    cells["D1"].Formula = "Bậc lương";
                    cells["D1"].ColumnWidth = 25;
                    cells["D1:" + "D" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                    cells["E1"].Formula = "Hệ số lương";
                    cells["E1"].ColumnWidth = 25;

                    cells["F1"].Formula = "Mã ngạch";
                    cells["F1"].ColumnWidth = 25;
                    cells["F1:" + "F" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                    cells["G1"].Formula = "Thời gian bắt đầu";
                    cells["G1"].ColumnWidth = 25;
                    cells["G1:" + "G" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                    if (iLoaiBang == 3)
                    {
                        cells["H1"].Formula = "Hệ số phụ cấp thâm niên";
                        cells["H1"].ColumnWidth = 25;
                        cells["H1:" + "H" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                        cells["I1"].Formula = "Thông tin khác";
                        cells["I1"].ColumnWidth = 25;
                        cells["I1:" + "I" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                        cells["A1:I1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
                        cells["A1:I1"].Font.Bold = true;
                    }
                    else
                    {
                        cells["H1"].Formula = "Thông tin khác";
                        cells["H1"].ColumnWidth = 25;
                        cells["H1:" + "I" + tblData.Rows.Count + 2].HorizontalAlignment = SpreadsheetGear.HAlign.Center;

                        cells["A1:H1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
                        cells["A1:H1"].Font.Bold = true;
                    }

                    worksheet.Range.Rows.AutoFit();
                    worksheet.Range.Columns.AutoFit();
                    worksheet.Name = "Danh sách xét tăng lương";

                    break;
            }

            context.Response.Clear();
            context.Response.ContentType = "application/vnd.ms-excel";
            context.Response.AddHeader("Content-Disposition", "attachment; filename=Report" + DateTime.Now.ToString("yyyyMMdd") + ".xls");
            workbook.SaveToStream(context.Response.OutputStream, SpreadsheetGear.FileFormat.XLS97);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private SpreadsheetGear.IRange FromDataTable(SpreadsheetGear.IWorksheet worksheet, DataColumn[] columns, int indexRow, int indexColumn)
        {
            SpreadsheetGear.IRange cells = worksheet.Cells;
            string sStartCell = HutStaff.Common.Utility.ExcelHelper.IndexToColumnName(indexColumn) + indexRow.ToString();
            string sEndCell = HutStaff.Common.Utility.ExcelHelper.IndexToColumnName(indexColumn + columns.Length - 1) + (indexRow + columns[0].Table.Rows.Count - 1).ToString();
            foreach (SpreadsheetGear.IRange cell in cells[sStartCell + ":" + sEndCell])
            {
                cell.Formula = columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName].ToString();
                  //  : Convert.ToDateTime(columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName]).ToString("dd/MM/yyyy");

            }
            return cells;
        }

        public DateTime GetDate(string input)
        {
            try
            {
                if (!string.IsNullOrEmpty(input))
                {
                    string[] pars = input.Split('/');
                    return new DateTime(int.Parse(pars[2]), int.Parse(pars[1]), int.Parse(pars[0]));
                }
                else return DateTime.Now;
            }
            catch { return DateTime.Now; }
        }
    }
}