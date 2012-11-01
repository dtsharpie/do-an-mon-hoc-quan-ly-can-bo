using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class SlideSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptDepartment.DataSource = BO.QuanLy.DanhMuc.DonViQuanLy.GetByParent("0", 1);
            rptDepartment.DataBind();
        }

        protected void rptDepartment_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                Repeater rptSub1 = (Repeater)item.FindControl("rptSub1");
                rptSub1.ItemDataBound += new RepeaterItemEventHandler(rptSub1_ItemDataBound);

                DataRowView drv = (DataRowView)item.DataItem;
                rptSub1.DataSource = BO.QuanLy.DanhMuc.DonViQuanLy.GetByParent(drv["ma_dv"].ToString(), 2);
                rptSub1.DataBind();
            }
        }

        protected void rptSub1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                Repeater rptSub2 = (Repeater)item.FindControl("rptSub2");
                DataRowView drv = (DataRowView)item.DataItem;
                rptSub2.DataSource = BO.QuanLy.DanhMuc.DonViQuanLy.GetByParent(drv["ma_dv"].ToString(), 3);
                rptSub2.DataBind();
            }
        }
    }
}