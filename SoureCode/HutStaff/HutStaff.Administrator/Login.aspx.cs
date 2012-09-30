using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
namespace HutStaff.Administrator
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
            DataTable tblAuthenticate = BO.Security.User.Authenticate(sUsername, sPass);
            if (tblAuthenticate.Rows.Count > 0)
            {
                BO.Security.CurrentUser crUser = new BO.Security.CurrentUser(sUsername, Convert.ToInt32(tblAuthenticate.Rows[0]["Id"]), Convert.ToInt32(tblAuthenticate.Rows[0]["quyen"]), Convert.ToInt32(tblAuthenticate.Rows[0]["ma_dv"]));
                Session[Common.Constants.Session.AdminSessionName] = crUser;
                Response.Redirect("/Default.aspx");
            }
        }
    }
}