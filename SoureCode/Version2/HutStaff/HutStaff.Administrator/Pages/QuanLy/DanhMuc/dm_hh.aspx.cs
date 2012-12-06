using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class dm_hh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGhiLai_Click(object sender, EventArgs e)
        {
            DanhMucBO.InsertHH(txtTenHocHam.Text);

            gv.DataBind();
        }
    }
}