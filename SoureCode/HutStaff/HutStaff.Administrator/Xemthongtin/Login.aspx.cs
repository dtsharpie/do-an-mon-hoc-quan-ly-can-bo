using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace HutStaff.Administrator.Xemthongtin
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
            DataTable tblAuthenticate = BO.Security.ViewUser.Authenticate(sUsername, sPass);
            if (tblAuthenticate.Rows.Count > 0)
            {
                int iShcc = Convert.ToInt32(tblAuthenticate.Rows[0]["shcc"]);
                string sFullname = tblAuthenticate.Rows[0]["hodem"].ToString() + " " + tblAuthenticate.Rows[0]["ten"].ToString();
                int iGender = Convert.ToInt32(tblAuthenticate.Rows[0]["gt"]);
                DateTime dtBirthday = Convert.ToDateTime(tblAuthenticate.Rows[0]["ntns"]);
                string sImage = "";
                BO.Security.ViewCurrentUser crUser = new BO.Security.ViewCurrentUser(sUsername, iShcc, sFullname, iGender, dtBirthday, sImage);
                Session[Common.Constants.Session.ViewSessionName] = crUser;
                Response.Redirect("/Xemthongtin/Default.aspx");
            }
            else
            {
                divAlert.Style["display"] = "block";
            }
        }
    }
}