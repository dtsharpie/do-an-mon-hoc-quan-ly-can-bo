using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Xemthongtin.Controls
{
    public partial class Thongtinchung : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iShcc = BO.Security.ViewCurrentUser.GetViewCurrentUser().Shcc;
            if (iShcc > 0)
            {
                DataTable tblData = BO.Soyeu.Soyeu.GetById(iShcc);
                rptData.DataSource = tblData;
                rptData.DataBind();
            }
        }
    }
}