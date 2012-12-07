using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class Report2 : System.Web.UI.Page
    {
        private static string donvi = "";
        private static string dcb = "";
        private static string tt = "";

        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        protected void btnBuildList_Click(object sender, EventArgs e)
        {
            donvi = ddlDonViLapBaoCao.SelectedItem.Value;

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

            Response.Redirect(String.Format("./DanhSachNangLuong.aspx?donvi={0}&dcb={1}&tt={2}", donvi, dcb, tt));
        }
    }
}