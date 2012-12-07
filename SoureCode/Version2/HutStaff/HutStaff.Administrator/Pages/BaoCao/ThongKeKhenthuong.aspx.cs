using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;
using HutStaff.BO.Report;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class ThongKeKhenthuong : System.Web.UI.Page
    {
        private IExportData _exporter;
        public ThongKeKhenthuong() : this(new ExportData()) { }

        public ThongKeKhenthuong(IExportData exporter)
        {
            _exporter = exporter;
        }

        private static string strHtmlContent = "";
        private static bool isNotGottenHtmlContent = true;

        private static string donvi = "";
        private static string tendonvi = "";
        private static string dcb = "";
        private static string tt = "";
        private static int dkt = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            isNotGottenHtmlContent = true;
            if (IsPostBack)
                return;

            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonViLapBaoCao.DataSource = table_dm_dv;
            ddlDonViLapBaoCao.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonViLapBaoCao.DataTextField = table_dm_dv.Columns[1].ColumnName;
            foreach (DataRow row in table_dm_dv.Rows)
            {
                int x = row.ItemArray[0].ToString().Length / 2;
                for (int i = 0; i < x; i++)
                {
                    row.SetField(table_dm_dv.Columns[1], "| - - - " + row.ItemArray[1].ToString());
                }
            }
            ddlDonViLapBaoCao.DataBind();

            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            chkboxDienCanBo.DataSource = table_dm_dcb;
            chkboxDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            chkboxDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            chkboxDienCanBo.DataBind();

            DataTable table_dm_tt = BaoCaoBO.ViewAlldm_tt();
            chkboxTinhTrangHienTai.DataSource = table_dm_tt;
            chkboxTinhTrangHienTai.DataValueField = table_dm_tt.Columns[0].ColumnName;
            chkboxTinhTrangHienTai.DataTextField = table_dm_tt.Columns[1].ColumnName;
            chkboxTinhTrangHienTai.DataBind();
        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            this.GetHtmlContent();
            BO.Report.Exporter.ExportToExcelFile(strHtmlContent, String.Format("b26_{0}.xls", DateTime.Now.ToString())); 
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            this.GetHtmlContent();
            lblResult.Text = Server.HtmlDecode(strHtmlContent);
        }
        private void GetHtmlContent()
        {
            donvi = ddlDonViLapBaoCao.SelectedItem.Value;
            tendonvi = ddlDonViLapBaoCao.SelectedItem.Text;

            dcb = "";
            foreach (ListItem li in chkboxDienCanBo.Items)
            {
                if (li.Selected == true)
                {
                    dcb += li.Value + ",";
                }
            }
            if (dcb.Length > 0)
                dcb = dcb.Substring(0, dcb.Length - 1);

            tt = "";
            foreach (ListItem li in chkboxTinhTrangHienTai.Items)
            {
                if (li.Selected == true)
                {
                    tt += li.Value + ",";
                }
            }
            if (tt.Length > 0)
                tt = tt.Substring(0, tt.Length - 1);

            if (rdoDuocKhen.Checked)
                dkt = 1;
            else
                dkt = 0;

            if (isNotGottenHtmlContent)
            {
                strHtmlContent = _exporter.GetHtmlContent_Report_Type_5_1(donvi, tendonvi, dcb, tt, dkt);
                isNotGottenHtmlContent = false;
            }
        }
    }
}