using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Master
{
    public partial class View : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BO.Security.ViewCurrentUser.GetViewCurrentUser() == null)
            {
                Response.Redirect("/Xemthongtin/Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            BO.Security.ViewCurrentUser.Logout();
            Response.Redirect("/Xemthongtin/Login.aspx");
        }
    }
}