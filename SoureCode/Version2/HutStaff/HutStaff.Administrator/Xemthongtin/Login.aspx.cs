﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.IO;

namespace HutStaff.Administrator.Xemthongtin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sUsername = txtUsername.Value;
            string sPass = txtPassword.Value;
            DataTable tblAuthenticate = BO.Security.ViewUser.Authenticate(sUsername, sPass);
            if (tblAuthenticate.Rows.Count > 0)
            {
                int iShcc = Convert.ToInt32(tblAuthenticate.Rows[0]["shcc"]);
                string sFullname = tblAuthenticate.Rows[0]["hodem"].ToString() + " " + tblAuthenticate.Rows[0]["ten"].ToString();
                int iGender = Convert.ToInt32(tblAuthenticate.Rows[0]["gt"]);
                DateTime dtBirthday = Convert.ToDateTime(tblAuthenticate.Rows[0]["ntns"]);

                string sDirectory = HttpContext.Current.Server.MapPath("/Anhcanbo");
                sDirectory = sDirectory.EndsWith("\\") ? sDirectory : sDirectory + "\\";
                string sImage = "";
                if (File.Exists(sDirectory + iShcc.ToString() + ".jpg"))
                {
                    sImage = "/Anhcanbo/" + iShcc.ToString() + ".jpg";
                }
                else if (File.Exists(sDirectory + iShcc.ToString() + ".png"))
                {
                    sImage = "/Anhcanbo/" + iShcc.ToString() + ".png";
                }
                else
                {
                    sImage = "/Images/" + "no_avatar.jpg";
                }

                BO.Security.ViewCurrentUser crUser = new BO.Security.ViewCurrentUser(sUsername, iShcc, sFullname, iGender, dtBirthday, sImage);
                Session[Common.Constants.Session.ViewSessionName] = crUser;
                Response.Redirect("/Xemthongtin");
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