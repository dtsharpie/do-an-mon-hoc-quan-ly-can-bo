using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            string sUsername = txtUsername.Value;
            string sPass = txtPassword.Value;
            DataTable tblAuthenticate = BO.Security.User.Authenticate(sUsername, sPass);
            if (tblAuthenticate.Rows.Count > 0)
            {
                BO.Security.CurrentUser crUser = new BO.Security.CurrentUser(sUsername, Convert.ToInt32(tblAuthenticate.Rows[0]["Id"]), Convert.ToInt32(tblAuthenticate.Rows[0]["quyen"]));
                Session[Common.Constants.Session.AdminSessionName] = crUser;
                Response.Redirect("/Default.aspx");
            }
            else
            {
                string sScript = "alert('Thông tin không hợp lệ. Xin thử lại.');";
                txtUsername.Focus();
                ClientScript.RegisterStartupScript(this.GetType(), "HutStaff_View_LoginFail", sScript, true);
            }
        }
    }
}