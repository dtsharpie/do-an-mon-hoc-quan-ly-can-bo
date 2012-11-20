using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class ThongTinChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iShcc = Convert.ToInt32(Request.QueryString["shcc"]);
        }

        protected void OnSubmitButtonClick(object sender, EventArgs e)
        {

        }

        protected void OnResetLinkButtonClick(object sender, EventArgs e)
        {

        }
    }
}