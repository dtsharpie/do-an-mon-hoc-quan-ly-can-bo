using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class DoiDonVi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();

                ddlDonViNguon.DataSource = table_dm_dv;
                ddlDonViNguon.DataValueField = table_dm_dv.Columns[0].ColumnName;
                ddlDonViNguon.DataTextField = table_dm_dv.Columns[1].ColumnName;
                ddlDonViNguon.DataBind();

                ddlDonViDich.DataSource = table_dm_dv;
                ddlDonViDich.DataValueField = table_dm_dv.Columns[0].ColumnName;
                ddlDonViDich.DataTextField = table_dm_dv.Columns[1].ColumnName;
                ddlDonViDich.DataBind();
            }
        }

        protected void btnChuyen_Click(object sender, EventArgs e)
        {
            NguoiDungBO.ChuyenDonVi(ddlDonViNguon.SelectedValue, ddlDonViDich.SelectedValue);
            lblMessage.Text = "Đã chuyển xong.";
            gvCanBoChuyen.Visible = false;
        }

        protected void ddlDonViNguon_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table = NguoiDungBO.ViewSoyeuByDVQL(ddlDonViNguon.SelectedValue);
            gvCanBoChuyen.DataSource = table;
            gvCanBoChuyen.DataBind();

            if (gvCanBoChuyen.Rows.Count == 0)
                lblMessage.Text = "Đơn vị này hiện không có cán bộ nào!";
            else
                lblMessage.Text = "Danh sách cán bộ sẽ chuyển:";
            gvCanBoChuyen.Visible = true;
        }
    }
}