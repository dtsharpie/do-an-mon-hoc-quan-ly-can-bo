using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class SuaNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["task"] == "add")
            {
                Response.Write("<h1>Thêm người dùng mới</h1>");
                Title = "Thêm người dùng mới";
            }
            else if (Request.QueryString["task"] == "edit")
            {
                username.Text = Request.QueryString["user"];
                Title = "Chỉnh sửa thông tin người dùng " + username.Text;
                Response.Write("<h1>" + Title + "</h1>");
                    //donvi.SelectedValue = "";
                quyen.Checked = true;
                submit.Text = "Sửa";
            }

        }
    }
}