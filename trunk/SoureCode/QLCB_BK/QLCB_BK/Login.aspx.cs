using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace QLCB_BK
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            string sUsername = txtUsername.Text;
            string sPass = txtPassword.Text;
            if (BO.Security.User.Authenticate(sUsername, sPass).Rows.Count > 0)
            {
                FormsAuthentication.SetAuthCookie(sUsername, false);
                Response.Redirect("/Default.aspx");
            }
        }
    }
}