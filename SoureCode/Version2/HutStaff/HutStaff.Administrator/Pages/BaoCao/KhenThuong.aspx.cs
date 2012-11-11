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
        private int hinhThuc;
        private int tuNam;
        private int denNam;
        private string donVi;
        private int dienCanBo;
        private int khoiCanBo;

        DataTable rewardListDataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ddlHinhThucKhenThuong: dropdownList Hinh thuc khen thuong
            DataTable table_dm_kt = BaoCaoBO.ViewAlldm_kt();
            ddlHinhThucKhenThuong.DataSource = table_dm_kt;
            ddlHinhThucKhenThuong.DataValueField = table_dm_kt.Columns[0].ColumnName;
            ddlHinhThucKhenThuong.DataTextField = table_dm_kt.Columns[1].ColumnName;
            ddlHinhThucKhenThuong.DataBind();

            //tbFrom
            tbFrom.Text = "2007";

            //tbTo
            tbTo.Text = DateTime.Now.Year.ToString();

            //dropdownlist Đơn vị cac cấp ... da làm
            //ddlUnit123: dropdownList cua các đơn vị cấp 1,2,3
            DataTable table_123_dm_dv = BaoCaoBO.ViewAll_123_dm_dv();
            ddlUnit123.DataSource = table_123_dm_dv;
            ddlUnit123.DataValueField = table_123_dm_dv.Columns[0].ColumnName;
            ddlUnit123.DataTextField = table_123_dm_dv.Columns[1].ColumnName;
            ddlUnit123.DataBind();

            //ddlUnit4: dropdownList cua cac don vi cap 4
            DataTable table_4_dm_dv = BaoCaoBO.ViewAll_4_dm_dv();
            ddlUnit4.DataSource = table_4_dm_dv;
            ddlUnit4.DataValueField = table_4_dm_dv.Columns[0].ColumnName;
            ddlUnit4.DataTextField = table_4_dm_dv.Columns[1].ColumnName;
            ddlUnit4.DataBind();

            //ddlDienCanBo: dropdownList dien can bo
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            ddlDienCanBo.DataSource = table_dm_dcb;
            ddlDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            ddlDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            ddlDienCanBo.DataBind();

            //ddlKhoiCanBo: dropdownList Khoi can bo
            DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
            ddlKhoiCb.DataSource = table_dm_kcb;
            ddlKhoiCb.DataValueField = table_dm_kcb.Columns[0].ColumnName;
            ddlKhoiCb.DataTextField = table_dm_kcb.Columns[1].ColumnName;
            ddlKhoiCb.DataBind();




        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            //rewardListDataTable = this.GetRewardList();
            //btnExport.Visible = true;
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //rewardListDataTable = this.GetRewardList();
            //BO.Report.Exporter.ExporttoExcel(rewardListDataTable, String.Format("KhenThuong_{0}.xls", DateTime.Now.ToString()));
        }

        private DataTable GetRewardList()
        {
            // Get Input
            hinhThuc = int.Parse(ddlHinhThucKhenThuong.SelectedValue);
            tuNam = int.Parse(tbFrom.Text);
            denNam = int.Parse(tbTo.Text);
            donVi = ddlUnit123.SelectedValue;
            dienCanBo = int.Parse(ddlDienCanBo.SelectedValue);
            khoiCanBo = int.Parse(ddlKhoiCb.SelectedValue);

            // Get reward list
            DataTable tempRewardListDataTable = BO.Report.Report.GetRewardList(hinhThuc, tuNam, denNam, donVi, dienCanBo, khoiCanBo);

            // Add order column
            DataColumn orderColumn = tempRewardListDataTable.Columns.Add("STT");
            orderColumn.SetOrdinal(0);
            int order = 0;
            foreach (DataRow row in tempRewardListDataTable.Rows)
            {
                order++;
                row["STT"] = order.ToString();
            }

            // Change column name of reward list table
            tempRewardListDataTable.Columns[1].ColumnName = "So hieu cong chuc";
            tempRewardListDataTable.Columns[2].ColumnName = "Ho dem";
            tempRewardListDataTable.Columns[3].ColumnName = "Ten";
            tempRewardListDataTable.Columns[4].ColumnName = "Don vi";
            tempRewardListDataTable.Columns[5].ColumnName = "Hinh thuc khen thuong";
            tempRewardListDataTable.Columns[6].ColumnName = "Ngay khen thuong";

            return tempRewardListDataTable;
        }
    }
}
