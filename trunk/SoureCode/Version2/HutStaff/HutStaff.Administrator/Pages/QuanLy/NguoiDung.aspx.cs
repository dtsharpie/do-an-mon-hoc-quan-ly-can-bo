using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class NguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table_user = NguoiDungBO.ViewAllUserWithDM();
            GridView_User.DataSource = table_user;
            GridView_User.DataBind();
        }

        protected void Delete_User(object sender, GridViewDeleteEventArgs e)
        {
            NguoiDungBO.DeleteUser(GridView_User.DataKeys[e.RowIndex].Values[0].ToString());
            //GridView_User.DataBind();
            Response.Redirect("NguoiDung.aspx");
        }
    }
}