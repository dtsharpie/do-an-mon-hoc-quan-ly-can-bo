using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.TimKiem;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;

namespace HutStaff.Administrator
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            DataRow dr = table_dm_dcb.NewRow();
            dr[0] = -1;
            dr[1] = "Tất cả";
            table_dm_dcb.Rows.InsertAt(dr, 0);
            ddlDcb.DataSource = table_dm_dcb;
            ddlDcb.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            ddlDcb.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            ddlDcb.DataBind();

            DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
            DataRow dr2 = table_dm_kcb.NewRow();
            dr2[0] = -1;
            dr2[1] = "Tất cả";
            table_dm_kcb.Rows.InsertAt(dr2, 0);
            khoicanbo.DataSource = table_dm_kcb;
            khoicanbo.DataValueField = table_dm_kcb.Columns[0].ColumnName;
            khoicanbo.DataTextField = table_dm_kcb.Columns[1].ColumnName;
            khoicanbo.DataBind();
        }
    }
}