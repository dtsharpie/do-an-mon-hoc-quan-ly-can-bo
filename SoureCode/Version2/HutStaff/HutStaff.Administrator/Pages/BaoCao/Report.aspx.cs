using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;
using HutStaff.BO.Report;
using System.IO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class Report : System.Web.UI.Page
    {
        private int typeOfPage = 0;

        private IExportData _exporter;
        private static string strHtmlContent = "";
        private static bool isNotGottenHtmlContent = true;

        private static string donvi = "";
        private static string tendonvi = "";
        private static string dcb = "";
        private static string tt = "";

        public Report() : this(new ExportData()) { }

        public Report(IExportData exporter)
        {
            _exporter = exporter;
        }

#region Set Up View
        protected void Page_Load(object sender, EventArgs e)
        {
            isNotGottenHtmlContent = true;
            if (IsPostBack)
                return;

            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonViLapBaoCao.DataSource = table_dm_dv;
            ddlDonViLapBaoCao.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonViLapBaoCao.DataTextField = table_dm_dv.Columns[1].ColumnName;
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

            //title
            String titleMenu = "";
            switch (typeOfPage)
            {
                case 1:
                    {
                        titleMenu = "Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính";
                        break;
                    }
                case 13:
                    {
                        titleMenu = "Danh sách cán bộ đến tuổi nghỉ hưu";
                        break;
                    }
                case 2:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức 1";
                        break;
                    }
                case 6:
                    {
                        titleMenu = "Báo cáo ngạch, bậc công chức, viên chức";
                        break;
                    }
                case 3:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức 2";
                        break;
                    }
                case 15:
                    {
                        titleMenu = "Báo cáo kỷ luật";
                        break;
                    }
                case 4:
                    {
                        titleMenu = "Danh sách cán bộ hưởng lương chức vụ";
                        break;
                    }
                case 5:
                    {
                        titleMenu = "Thống kê đội ngũ cán bộ khoa học nghiệp vụ";
                        break;
                    }
                case 8:
                    {
                        titleMenu = "Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương";
                        break;
                    }
                case 21:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức chia theo lĩnh vực";
                        break;
                    }
                case 10:
                    {
                        titleMenu = "Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương";
                        break;
                    }
                case 22:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức chia theo đơn vị";
                        break;
                    }
                case 9:
                    {
                        titleMenu = "Danh sách cán bộ không thuộc ngạch cao cấp và chính đề nghị nâng lương";
                        break;
                    }
                case 23:
                    {
                        titleMenu = "Báo cáo số lượng công chức giữ các chức vụ lãnh đạo do bổ nhiệm";
                        break;
                    }
                case 14:
                    {
                        titleMenu = "Danh sách cán bộ có hệ lương tột khung";
                        break;
                    }
                case 24:
                    {
                        titleMenu = "Báo cáo danh sách và tiền lương cán bộ công chức";
                        break;
                    }
                case 7:
                    {
                        titleMenu = "In quyết định đề nghị nâng lương";
                        break;
                    }
                case 25:
                    {
                        titleMenu = "Báo cáo tổng hợp ngạch, bậc và phụ cấp công chức";
                        break;
                    }
            }
            lblTitle.Text = titleMenu;
        }
#endregion
        protected void btnXuat_Click(object sender, EventArgs e)
        {
            this.GetHtmlContent();
            BO.Report.Exporter.ExportToDoc(strHtmlContent, String.Format("b0{0}_{1}.doc", typeOfPage, DateTime.Now.ToString()));       
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

            try
            {
                typeOfPage = Convert.ToInt32(Request.QueryString["type"]);
            }
            catch (FormatException ex)
            {
                typeOfPage = 1;
            }

            switch (typeOfPage)
            {
                case 1:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_1(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }  
                    break;
                case 2:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_2(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 3:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_3(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 4:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_4(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 5:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_5(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 13:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_2_1(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 6:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_2_2(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 15:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_2_3(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 8:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_3_1(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 10:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_3_2(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 9:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_3_3(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 14:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_3_4(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 21:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_4_1(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 22:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_4_2(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
                case 23:
                    if (isNotGottenHtmlContent)
                    {
                        strHtmlContent = _exporter.GetHtmlContent_Report_Type_4_3(donvi, tendonvi, dcb, tt);
                        isNotGottenHtmlContent = false;
                    }
                    break;
            }
                    
        }

    }
}