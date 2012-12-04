using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class DanhSachNangLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Server.MapPath(@"Template\DanhSachNangLuongHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            lblHtmlContent.Text = strHtmlContent;
        }
    }
}