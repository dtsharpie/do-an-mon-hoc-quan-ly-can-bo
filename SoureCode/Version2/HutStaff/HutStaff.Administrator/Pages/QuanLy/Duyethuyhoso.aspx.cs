using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class Duyethuyhoso : System.Web.UI.Page
    {
        protected DataTable tblData;
        SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
        SpreadsheetGear.IRange cells = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblData = BO.PagesBO.QuanLy.Huyhoso.Search(txtTen.Text, Convert.ToInt32(ddlTrangthai.SelectedValue), 1, Convert.ToInt32(ddPs.Value));
                hdDeletes.Value = "";
                int iCount = tblData.Rows.Count;
                if (iCount == 0)
                {
                    Pager1.Visible = false;
                    Pager2.Visible = false;
                    spInfo1.Visible = false;
                    spInfo2.Visible = false;
                    grdData.Visible = false;
                    divEmpty.Visible = true;
                }
                else
                {
                    Pager1.Visible = true;
                    Pager2.Visible = true;
                    spInfo1.Visible = true;
                    spInfo2.Visible = true;
                    grdData.Visible = true;
                    divEmpty.Visible = false;

                    Pager1.PageSize = Convert.ToInt32(ddPs.Value);
                    if (iCount % Pager1.PageSize == 0)
                    {
                        Pager1.TotalPage = iCount / Pager1.PageSize;
                    }
                    else
                    {
                        Pager1.TotalPage = iCount / Pager1.PageSize + 1;
                    }
                    Pager1.CurrentPage = 1;

                    grdData.DataSource = tblData;
                    grdData.DataBind();

                    spInfo1.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
                    spInfo2.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
                }

                ViewState["tabledata"] = tblData;

            }
            DataTable table_dm_dcb = BO.PagesBO.QuanLy.Huyhoso.Search(txtTen.Text, Convert.ToInt32(ddlTrangthai.SelectedValue), 1, Convert.ToInt32(ddPs.Value));

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            tblData = BO.PagesBO.QuanLy.Huyhoso.Search(txtTen.Text, Convert.ToInt32(ddlTrangthai.SelectedValue), 1, Convert.ToInt32(ddPs.Value));
            hdDeletes.Value = "";
            ViewState["tabledata"] = tblData;
            int iCount = tblData.Rows.Count;
            if (iCount == 0)
            {
                Pager1.Visible = false;
                Pager2.Visible = false;
                spInfo1.Visible = false;
                spInfo2.Visible = false;
                grdData.Visible = false;
                divEmpty.Visible = true;
            }
            else
            {
                Pager1.Visible = true;
                Pager2.Visible = true;
                spInfo1.Visible = true;
                spInfo2.Visible = true;
                grdData.Visible = true;
                divEmpty.Visible = false;

                Pager1.PageSize = Convert.ToInt32(ddPs.Value);
                if (iCount % Pager1.PageSize == 0)
                {
                    Pager1.TotalPage = iCount / Pager1.PageSize;
                }
                else
                {
                    Pager1.TotalPage = iCount / Pager1.PageSize + 1;
                }
                Pager1.CurrentPage = 1;

                grdData.DataSource = tblData;
                grdData.DataBind();

                spInfo1.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
                spInfo2.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
            }

        }


        protected void btnDownload1_Click(object sender, EventArgs e)
        {
            tblData = (DataTable)(ViewState["tabledata"]);
            cells = FromDataTable(workbook.Worksheets[0], new DataColumn[] { tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["dv"], tblData.Columns["tel"], tblData.Columns["email"] }, 2, 1);


            cells["A1"].Formula = "Họ tên";
            cells["A1"].ColumnWidth = 50;

            cells["B1"].Formula = "Số hiệu công chức";
            cells["B1"].ColumnWidth = 25;

            cells["C1"].Formula = "Đơn vị";
            cells["C1"].ColumnWidth = 50;

            cells["D1"].Formula = "Điện thoại";
            cells["D1"].ColumnWidth = 25;

            cells["E1"].Formula = "Email";
            cells["E1"].ColumnWidth = 25;

            cells["A1:E1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
            cells["A1:E1"].Font.Bold = true;
            workbook.Worksheets[0].Name = ddlTrangthai.SelectedValue == "0" ? "Hồ sơ đợi hủy" : "Hồ sơ đã hủy";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + ( ddlTrangthai.SelectedValue == "0" ? "ho_so_doi_huy" : "ho_so_da_huy" ) + DateTime.Now.ToString("yyyyMMdd") + ".xls");
            workbook.SaveToStream(Response.OutputStream, SpreadsheetGear.FileFormat.XLS97);
            Response.End();
        }

        protected void btnDownload2_Click(object sender, EventArgs e)
        {
            tblData = (DataTable)(ViewState["tabledata"]);
            cells = FromDataTable(workbook.Worksheets[0], new DataColumn[] { tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["dv"], tblData.Columns["tel"], tblData.Columns["email"] }, 2, 1);


            cells["A1"].Formula = "Họ tên";
            cells["A1"].ColumnWidth = 50;

            cells["B1"].Formula = "Số hiệu công chức";
            cells["B1"].ColumnWidth = 25;

            cells["C1"].Formula = "Đơn vị";
            cells["C1"].ColumnWidth = 50;

            cells["D1"].Formula = "Điện thoại";
            cells["D1"].ColumnWidth = 25;

            cells["E1"].Formula = "Email";
            cells["E1"].ColumnWidth = 25;

            cells["A1:E1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
            cells["A1:E1"].Font.Bold = true;
            workbook.Worksheets[0].Name = ddlTrangthai.SelectedValue == "0" ? "Hồ sơ đợi hủy" : "Hồ sơ đã hủy";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + (ddlTrangthai.SelectedValue == "0" ? "ho_so_doi_huy" : "ho_so_da_huy") + DateTime.Now.ToString("yyyyMMdd") + ".xls");
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

    }
}