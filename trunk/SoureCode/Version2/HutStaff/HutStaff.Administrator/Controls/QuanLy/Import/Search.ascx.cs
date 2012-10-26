using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Controls.QuanLy.Import
{
    public partial class Search : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sKeyword = GetString("keyword");
            int iXoaHs = GetInt("xoahs", 0);

            DataTable tblData = BO.Security.User.Search(PageIndex, PageSize, sKeyword, iXoaHs);
            grdData.DataSource = tblData;
            grdData.DataBind();
        }
    }
}