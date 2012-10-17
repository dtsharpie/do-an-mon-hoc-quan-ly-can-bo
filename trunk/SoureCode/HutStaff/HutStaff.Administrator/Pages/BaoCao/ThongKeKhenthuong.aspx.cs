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
    public partial class ThongKeKhenthuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonVi.DataSource = table_dm_dv;
            ddlDonVi.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonVi.DataTextField = table_dm_dv.Columns[1].ColumnName;
            ddlDonVi.DataBind();

            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            chkboxDienCanBo.DataSource = table_dm_dcb;
            chkboxDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            chkboxDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            chkboxDienCanBo.DataBind();


        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {

        }

        protected void btnXem_Click(object sender, EventArgs e)
        {

        }
    }
}