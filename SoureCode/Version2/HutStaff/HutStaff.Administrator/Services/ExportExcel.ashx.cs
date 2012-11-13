using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.SessionState;
using System.Text;

namespace HutStaff.Administrator.Services
{
    /// <summary>
    /// Summary description for ExportExcel
    /// </summary>
    public class ExportExcel : IHttpHandler, IRequiresSessionState
    {
        string sExcelname = "";
        DataTable tblData;
        public void ProcessRequest(HttpContext context)
        {
            SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
            SpreadsheetGear.IWorksheet worksheet = workbook.Worksheets[0];
            SpreadsheetGear.IRange cells = null;
            int iType = Convert.ToInt32(context.Request.QueryString["type"]);
            if (iType == 0 || BO.Security.CurrentUser.GetCurrentUser() == null)
                return;
            switch (iType)
            {
                case 1:
                    int iLoaiHanNgach = Convert.ToInt32(context.Request.QueryString["loaihanngach"]);
                    int iLoaiBang = Convert.ToInt32(context.Request.QueryString["loaibang"]);
                    string sTime = context.Request.QueryString["thoigian"];
                    DateTime dtTime = GetDate(sTime);
                    string sDelete = context.Request.QueryString["delete"];
                    tblData = BO.PagesBO.QuanLy.XetDuyet.ViewSetNangLuong(1, int.MaxValue, iLoaiHanNgach, iLoaiBang, dtTime, sDelete);
                    tblData.Columns.Add("Stt");
                    for (int i = 0; i < tblData.Rows.Count; i++)
                    {
                        tblData.Rows[i]["Stt"] = i + 1;
                    }
                    if (iLoaiBang != 3)
                    {
                        cells = FromDataTable(worksheet, new DataColumn[] { tblData.Columns["Stt"], tblData.Columns["hodem"], tblData.Columns["ten"], tblData.Columns["shcc"], tblData.Columns["bl_dbl"], tblData.Columns["hsl"], tblData.Columns["ma_ngach"], tblData.Columns["tgbd_dbl"], tblData.Columns["ttk_qtdbl"] }, 2, 1);
                    }
                    else
                    {
                        cells = FromDataTable(worksheet, new DataColumn[] { tblData.Columns["Stt"], tblData.Columns["hodem"], tblData.Columns["ten"], tblData.Columns["shcc"], tblData.Columns["bl_dbl"], tblData.Columns["hsl"], tblData.Columns["ma_ngach"], tblData.Columns["tgbd_dbl"], tblData.Columns["hspctn"], tblData.Columns["ttk_qtdbl"] }, 2, 1);

                    }
                    cells["A1"].Formula = "Số thứ tự";

                    cells["B1"].Formula = "Họ đệm";
                    cells["B1"].ColumnWidth = 50;

                    cells["C1"].Formula = "Tên";
                    cells["C1"].ColumnWidth = 25;

                    cells["D1"].Formula = "Số hiệu";
                    cells["D1"].ColumnWidth = 25;

                    cells["E1"].Formula = "Bậc lương";
                    cells["E1"].ColumnWidth = 25;

                    cells["F1"].Formula = "Hệ số lương";
                    cells["F1"].ColumnWidth = 25;

                    cells["G1"].Formula = "Mã ngạch";
                    cells["G1"].ColumnWidth = 25;

                    cells["H1"].Formula = "Thời gian bắt đầu";
                    cells["H1"].ColumnWidth = 25;

                    if (iLoaiBang == 3)
                    {
                        cells["I1"].Formula = "Hệ số phụ cấp thâm niên";
                        cells["I1"].ColumnWidth = 25;

                        cells["J1"].Formula = "Thông tin khác";
                        cells["J1"].ColumnWidth = 25;

                        cells["A1:J1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
                        cells["A1:J1"].Font.Bold = true;
                    }
                    else
                    {
                        cells["I1"].Formula = "Thông tin khác";
                        cells["I1"].ColumnWidth = 50;

                        cells["A1:I1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
                        cells["A1:I1"].Font.Bold = true;
                    }

                    worksheet.Range.Rows.AutoFit();
                    worksheet.Range.Columns.AutoFit();
                    worksheet.Name = "Danh sách xét tăng lương";

                    sExcelname = "danh_sach_tang_luong_";
                    break;
                case 2:
                    string sMadv = context.Request.QueryString["ma_dv"];
                    string sTen = context.Request.QueryString["ten"];
                    int iGioitinh = Convert.ToInt32(context.Request.QueryString["gioitinh"]);
                    int iTutuoi = Convert.ToInt32(context.Request.QueryString["tutuoi"]);
                    int iDentuoi = Convert.ToInt32(context.Request.QueryString["dentuoi"]);
                    int iDiencb = Convert.ToInt32(context.Request.QueryString["diencb"]);
                    int iKhoicb = Convert.ToInt32(context.Request.QueryString["khoicb"]);
                    int iNvtruong = Convert.ToInt32(context.Request.QueryString["nvtruong"]);
                    string sDeletes = context.Request.QueryString["delete"];
                    tblData = null;
                    tblData.Columns.Add("Stt");
                    for (int i = 0; i < tblData.Rows.Count; i++)
                    {
                        tblData.Rows[i]["Stt"] = i + 1;
                    }

                    cells = FromDataTable(worksheet, new DataColumn[] { tblData.Columns["Stt"], tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["dv"], tblData.Columns["tel"], tblData.Columns["email"] }, 2, 1);
                    cells["A1"].Formula = "Số thứ tự";

                    cells["B1"].Formula = "Họ tên";
                    cells["B1"].ColumnWidth = 50;

                    cells["C1"].Formula = "Số hiệu";
                    cells["C1"].ColumnWidth = 25;

                    cells["D1"].Formula = "Đơn vị";
                    cells["D1"].ColumnWidth = 50;

                    cells["E1"].Formula = "Điện thoại";
                    cells["E1"].ColumnWidth = 50;

                    cells["F1"].Formula = "Email";
                    cells["F1"].ColumnWidth = 50;

                    cells["A1:F1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
                    cells["A1:F1"].Font.Bold = true;

                    worksheet.Range.Rows.AutoFit();
                    worksheet.Range.Columns.AutoFit();
                    worksheet.Name = "Danh sách xét tìm kiếm";

                    sExcelname = "danh_sach_tim_kiem_";
                    break;
            }

            context.Response.Clear();
            context.Response.ContentType = "application/vnd.ms-excel";
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + sExcelname + DateTime.Now.ToString("yyyyMMdd") + ".xls");
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
                cell.Formula = columns[cell.Column - indexColumn + 1].DataType != typeof(DateTime) ? columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName].ToString()
                   : Convert.ToDateTime(columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName]).ToString("dd/MM/yyyy");
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