using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.BaoCaoBO;
using System.Data;

//  by Nguyen Vuong Quyen

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class KhenThuong : System.Web.UI.Page
    {
        protected DataTable tblData;
        SpreadsheetGear.IWorkbook workbook = SpreadsheetGear.Factory.GetWorkbook();
        SpreadsheetGear.IRange cells = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table_dm_kt = BaoCaoBO.ViewAlldm_kt();
                DataRow dr = table_dm_kt.NewRow();
                dr["ma_kt"] = -1;
                dr["kt"] = "Tất cả";
                table_dm_kt.Rows.InsertAt(dr, 0);
                ddlHinhThucKhenThuong.DataSource = table_dm_kt;
                ddlHinhThucKhenThuong.DataValueField = table_dm_kt.Columns[0].ColumnName;
                ddlHinhThucKhenThuong.DataTextField = table_dm_kt.Columns[1].ColumnName;
                ddlHinhThucKhenThuong.DataBind();

                tbFrom.Text = "2007";

                tbTo.Text = DateTime.Now.Year.ToString();

                //dropdownlist Đơn vị cac cấp ... da làm
                //ddlUnit123: dropdownList cua các đơn vị cấp 1,2,3
                DataTable table_123_dm_dv = BaoCaoBO.ViewAll_123_dm_dv();
                DataRow dr2 = table_123_dm_dv.NewRow();
                dr2[0] = -1;
                dr2[1] = "Tất cả";
                table_123_dm_dv.Rows.InsertAt(dr2, 0);
                ddlUnit123.DataSource = table_123_dm_dv;
                ddlUnit123.DataValueField = table_123_dm_dv.Columns[0].ColumnName;
                ddlUnit123.DataTextField = table_123_dm_dv.Columns[1].ColumnName;
                ddlUnit123.DataBind();

                //ddlUnit4: dropdownList cua cac don vi cap 4
                DataTable table_4_dm_dv = BaoCaoBO.ViewAll_4_dm_dv();
                DataRow dr3 = table_4_dm_dv.NewRow();
                dr3[0] = -1;
                dr3[1] = "Tất cả";
                table_4_dm_dv.Rows.InsertAt(dr3, 0);
                ddlUnit4.DataSource = table_4_dm_dv;
                ddlUnit4.DataValueField = table_4_dm_dv.Columns[0].ColumnName;
                ddlUnit4.DataTextField = table_4_dm_dv.Columns[1].ColumnName;
                ddlUnit4.DataBind();


                //ddlDienCanBo: dropdownList dien can bo
                DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
                DataRow dr4 = table_dm_dcb.NewRow();
                dr4[0] = -1;
                dr4[1] = "Tất cả";
                table_dm_dcb.Rows.InsertAt(dr4, 0);
                ddlDienCanBo.DataSource = table_dm_dcb;
                ddlDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
                ddlDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
                ddlDienCanBo.DataBind();

                //ddlKhoiCanBo: dropdownList Khoi can bo
                DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
                DataRow dr5 = table_dm_kcb.NewRow();
                dr5[0] = -1;
                dr5[1] = "Tất cả";
                table_dm_kcb.Rows.InsertAt(dr5, 0);
                ddlKhoiCb.DataSource = table_dm_kcb;
                ddlKhoiCb.DataValueField = table_dm_kcb.Columns[0].ColumnName;
                ddlKhoiCb.DataTextField = table_dm_kcb.Columns[1].ColumnName;
                ddlKhoiCb.DataBind();

                ViewState["tabledata"] = tblData;
            }





        }

        protected void btnExport_Click(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            tblData = BO.Report.Report.GetRewardList(Convert.ToInt32(ddlHinhThucKhenThuong.SelectedValue), !String.IsNullOrEmpty(tbFrom.Text) ? Convert.ToInt32(tbFrom.Text) : DateTime.MinValue.Year, !String.IsNullOrEmpty(tbTo.Text) ? Convert.ToInt32(tbTo.Text) : DateTime.MaxValue.Year, "0", Convert.ToInt32(ddlDienCanBo.SelectedValue), Convert.ToInt32(ddlKhoiCb.SelectedValue));
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

        protected void btnDownload2_Click(object sender, EventArgs e)
        {
            tblData = (DataTable)(ViewState["tabledata"]);
            cells = FromDataTable(workbook.Worksheets[0], new DataColumn[] { tblData.Columns["hoten"], tblData.Columns["shcc"], tblData.Columns["dv"], tblData.Columns["kt"], tblData.Columns["nkt_qtkt"] }, 2, 1);


            cells["A1"].Formula = "Họ tên";
            cells["A1"].ColumnWidth = 50;

            cells["B1"].Formula = "Số hiệu công chức";
            cells["B1"].ColumnWidth = 25;

            cells["C1"].Formula = "Đơn vị";
            cells["C1"].ColumnWidth = 50;

            cells["D1"].Formula = "Khen thưởng";
            cells["D1"].ColumnWidth = 75;

            cells["E1"].Formula = "Năm khen thưởng";
            cells["E1"].ColumnWidth = 25;

            cells["A1:E1"].HorizontalAlignment = SpreadsheetGear.HAlign.Center;
            cells["A1:E1"].Font.Bold = true;
            workbook.Worksheets[0].Name = "Khen thưởng";

            Response.Clear();
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + "khen_thuong_" + DateTime.Now.ToString("yyyyMMdd") + ".xls");
            workbook.SaveToStream(Response.OutputStream, SpreadsheetGear.FileFormat.XLS97);
            Response.End();
        }

        protected void btnDownload1_Click(object sender, EventArgs e)
        {

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
                       : Convert.ToDateTime(columns[cell.Column - indexColumn + 1].Table.Rows[cell.Row - indexRow + 1][columns[cell.Column - indexColumn + 1].ColumnName]).ToString("yyyy");
                }
            }
            return cells;
        }



    }
}
