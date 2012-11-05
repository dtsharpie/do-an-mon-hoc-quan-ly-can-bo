using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.QuanLy;
using HutStaff.BO.PagesBO.BaoCaoBO;
using System.Data;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class SuaNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Form["txtUsername"] != null)
            if (IsPostBack)
            {
                string passwordMD5 = Common.LibCrypto.StringToMD5(txtPassword.Text);

                try
                {
                    if (hfAddEdit.Value == "add")
                        NguoiDungBO.InsertUser(ddlDonVi.SelectedValue, txtUsername.Text, passwordMD5, chkQuyen.Checked, chkIsLock.Checked);
                    else if (hfAddEdit.Value == "edit")
                    {
                        NguoiDungBO.UpdateUser(hfUserID.Value, Int32.Parse(ddlDonVi.SelectedValue), txtUsername.Text, chkQuyen.Checked, chkIsLock.Checked);
                    }
                    else if (hfAddEdit.Value == "edit_password")
                    {
                        NguoiDungBO.UpdatePassword(hfUserID.Value, passwordMD5);
                    }
                    if (hfAddEdit.Value == "add")
                        lblMessage.Text = "Thêm người dùng thành công";
                    else //if (hfAddEdit.Value == "edit")
                        //lblMessage.Text = "Chỉnh sửa người dùng thành công";
                        Response.Redirect("NguoiDung.aspx");

                    lblMessage.ForeColor = System.Drawing.Color.Blue;
                   
                    txtUsername.Text = "";
                    txtPassword.Text = "";
                    txtRePassword.Text = "";
                    chkQuyen.Checked = true;
                    chkIsLock.Checked = false;

                    txtUsername.Focus();
                }
                catch (Exception myException)
                {
                    lblMessage.Text = "Xảy ra lỗi. Chi tiết: " + myException.Message;
                    lblMessage.Font.Size = lblPassword.Font.Size;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    //throw (new Exception(myException.Message));
                }
            }

            lblMessage.Font.Size = 30;

            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonVi.DataSource = table_dm_dv;
            ddlDonVi.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonVi.DataTextField = table_dm_dv.Columns[1].ColumnName;
            ddlDonVi.DataBind();

            if (Request.QueryString["task"] == "add")
            {
                lblMessage.Text = "Thêm người dùng mới";
                lblMessage.ForeColor = System.Drawing.Color.Black;
                cmdSubmit.Text = "Thêm";
                hfAddEdit.Value = "add";

                chkQuyen.Checked = true;
                chkIsLock.Checked = false;

                txtUsername.Focus();
            }
            else
            {
                int id = 0;
                string ma_dv = "";
                string password;
                bool quyen, isLock;

                txtUsername.Text = Request.QueryString["user"];
                lblMessage.ForeColor = System.Drawing.Color.Black;

                if (NguoiDungBO.GetUserInfo(txtUsername.Text, out id, out ma_dv, out password, out quyen, out isLock))
                {
                    hfUserID.Value = id.ToString();
                    ddlDonVi.SelectedValue = ma_dv.ToString();
                    chkQuyen.Checked = quyen;
                    chkIsLock.Checked = isLock;
                }

                if (Request.QueryString["task"] == "edit")
                {
                    lblPassword.Visible = false;
                    txtPassword.Visible = false;
                    lblRePassword.Visible = false;
                    txtRePassword.Visible = false;

                    lblMessage.Text = "Chỉnh sửa thông tin người dùng " + txtUsername.Text;
                    cmdSubmit.Text = "Sửa";
                    hfAddEdit.Value = "edit";
                    lnkChangePass.HRef = "SuaNguoiDung.aspx?task=edit_password&user=" + txtUsername.Text;
                }
                else if (Request.QueryString["task"] == "edit_password")
                {
                    lblDonVi.Visible = false;
                    ddlDonVi.Visible = false;
                    lblQuyen.Visible = false;
                    chkQuyen.Visible = false;
                    lblIsLock.Visible = false;
                    chkIsLock.Visible = false;
                    lnkChangePass.Visible = false;
                    txtUsername.ReadOnly = true;

                    lblMessage.Text = "Đổi mật khẩu người dùng " + txtUsername.Text;
                    cmdSubmit.Text = "Đổi mật khẩu";
                    hfAddEdit.Value = "edit_password";
                }
                txtPassword.Focus();
            }

            string title;
            if (hfAddEdit.Value == "add")
                title = "Thêm người dùng mới";
            else
                title = "Chỉnh sửa thông tin người dùng " + txtUsername.Text;
            Response.Write("<title>" + title + "</title>");
        }
    }
}