using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;

namespace HutStaff.Administrator.Controls.QuanLy.Import
{
    public partial class Pager : ControlBase
    {
        int TotalItem = 0;
        string sKeyword;
        int iStatus = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            sKeyword = GetString("keyword");
            iStatus = GetInt("status", -1);
            TotalItem = HutStaff.BO.Security.User.SearchCount(sKeyword, iStatus);
            if (TotalItem > 0)
            {
                //Pager
                Pager1.HtmlId = ".main-table";
                Pager1.PageIndex = PageIndex;
                Pager1.PageSize = PageSize;
                Pager1.TotalItem = TotalItem;
                Pager1.ControlParams = "{\"alias\":\"" + "danh-sach-can-bo" + "\"" +
                                   ",\"keyword\":\"" + sKeyword + "\"" +
                                   ",\"status\":\"" + iStatus + "\"" +
                                  "}";
                Pager1.Visible = true;
            }
            else
            {
                Pager1.Visible = false;
            }
        }
    }
}