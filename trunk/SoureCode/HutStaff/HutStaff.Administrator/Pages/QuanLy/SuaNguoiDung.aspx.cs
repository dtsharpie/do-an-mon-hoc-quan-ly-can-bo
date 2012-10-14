using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class SuaNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["task"] == "add")
            {
                lblMessage.Text = "Thêm người dùng mới";
                lblMessage.ForeColor = System.Drawing.Color.Black;
                cmdSubmit.Text = "Thêm";
                hfAddEdit.Value = "add";

                //ddlDonVi.SelectedValue = 1;
                chkQuyen.Checked = true;
                chkIsLock.Checked = false;
            }
            else if (Request.QueryString["task"] == "edit")
            {
                int id = 0, ma_dv = 0;
                string password;
                bool quyen, isLock;

                txtUsername.Text = Request.QueryString["user"];

                lblMessage.Text = "Chỉnh sửa thông tin người dùng " + txtUsername.Text;
                lblMessage.ForeColor = System.Drawing.Color.Black;
                cmdSubmit.Text = "Sửa";
                hfAddEdit.Value = "edit";
                if (NguoiDungBO.GetUserInfo(txtUsername.Text, out id, out ma_dv, out password, out quyen, out isLock))
                {
                    hfUserID.Value = id.ToString();
                    ddlDonVi.SelectedValue = ma_dv.ToString();
                    chkQuyen.Checked = quyen;
                    chkIsLock.Checked = isLock;
                }
                txtPassword.Focus();
            }

            string title;
            if (hfAddEdit.Value == "add")
                title = "Thêm người dùng mới";
            else
                title = "Chỉnh sửa thông tin người dùng " + txtUsername.Text;
            Response.Write("<title>" + title + "</title>");

            if (Request.Form["txtUsername"] != null)
            {
                string passwordMD5 = Common.LibCrypto.StringToMD5(txtPassword.Text);

                try
                {
                    if (hfAddEdit.Value == "add")
                        NguoiDungBO.InsertUser(Int32.Parse(ddlDonVi.SelectedValue), txtUsername.Text, passwordMD5, chkQuyen.Checked, chkIsLock.Checked);
                    else if (hfAddEdit.Value == "edit")
                    {
                        NguoiDungBO.UpdateUser(Int32.Parse(hfUserID.Value), Int32.Parse(ddlDonVi.SelectedValue), txtUsername.Text, passwordMD5, chkQuyen.Checked, chkIsLock.Checked);
                    }
                    lblMessage.Text = "Thêm người dùng thành công";
                    lblMessage.ForeColor = System.Drawing.Color.Blue;

                    txtUsername.Text = "";
                    txtPassword.Text = "";
                    txtRePassword.Text = "";
                    chkQuyen.Checked = true;
                    chkIsLock.Checked = false;
                }
                catch (Exception myException)
                {
                    lblMessage.Text = "Xảy ra lỗi. Chi tiết: " + myException.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    //throw (new Exception(myException.Message));
                }
            }

        }
    }
}