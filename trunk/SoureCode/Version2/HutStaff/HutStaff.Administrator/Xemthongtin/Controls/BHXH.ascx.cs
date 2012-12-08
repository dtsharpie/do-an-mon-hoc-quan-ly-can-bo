using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;

namespace HutStaff.Administrator.Xemthongtin.Controls
{
    public partial class BHXH : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = SearchDetailBO.getDienBienLuong(BO.Security.ViewCurrentUser.GetViewCurrentUser().Shcc);// Thông tin về quá trình đóng bảo hiểm được tính từ bảng diễn biến lương
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}