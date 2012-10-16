using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class Report : System.Web.UI.Page
    {

        private int typeOfPage = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    typeOfPage = Convert.ToInt32(Request.QueryString["type"]);
                }
                catch (FormatException ex)
                {
                    typeOfPage = 1;
                }
            }
        }
    }
}