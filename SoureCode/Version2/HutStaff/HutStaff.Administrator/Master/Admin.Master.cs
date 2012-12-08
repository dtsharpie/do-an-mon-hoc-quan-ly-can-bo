using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Master
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BO.Security.CurrentUser.GetCurrentUser() == null)
            {
                //Response.Redirect("/Login.aspx?returnUrl=" + Request.RawUrl);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            BO.Security.CurrentUser.Logout();
            Response.Redirect("/Login.aspx");
        }
    }
}