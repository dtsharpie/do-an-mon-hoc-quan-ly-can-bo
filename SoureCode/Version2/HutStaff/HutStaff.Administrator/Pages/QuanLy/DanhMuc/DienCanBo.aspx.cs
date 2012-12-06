using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class DienCanBo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        private void FillGridView()
        {
            grvDienCanBo.DataSource = HutStaff.BO.QuanLy.DanhMuc.DienCanBo.GetAll();
            grvDienCanBo.DataBind();
        }
    }
}