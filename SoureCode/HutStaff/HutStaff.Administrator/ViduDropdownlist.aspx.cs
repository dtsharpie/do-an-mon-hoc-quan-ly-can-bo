using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator
{
    public partial class ViduDropdownlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dropdownlist1.DisplayMember = "display";
            Dropdownlist1.ValueMember = "value";
            Dropdownlist1.Datasource = BO.Tinhthanhpho.Tinhthanhpho.GetAll();
        }

        protected void abc(object sender, EventArgs e)
        {
            Response.Write(Dropdownlist1.Value);
        }
    }
}