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
            Response.Redirect("./DanhSachNangLuong.aspx");
        }
    }
}