﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Xemthongtin.Controls
{
    public partial class Chucvuchinhquyen : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable tblData = BO.Thongtinchung.Thongtinchung.Getchucvuchinhquyen(BO.Security.ViewCurrentUser.GetViewCurrentUser().Shcc);
            if (tblData.Rows.Count > 0)
            {
                rptData.DataSource = tblData;
                rptData.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }
        }
    }
}