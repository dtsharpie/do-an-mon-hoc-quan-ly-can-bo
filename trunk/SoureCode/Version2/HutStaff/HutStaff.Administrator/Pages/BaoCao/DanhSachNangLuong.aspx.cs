using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using HutStaff.BO.Report;
using System.Data;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class DanhSachNangLuong : System.Web.UI.Page
    {
        private DataTable dt1;
        private DataTable dt2;
        private DataTable dt3;

        private static string donvi = "";
        private static string dcb = "";
        private static string tt = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            donvi = Request.QueryString["donvi"];
            dcb = Request.QueryString["dcb"];
            tt = Request.QueryString["tt"];
            dt1 = BO.Report.Report.GetDataTableToReport_Type_3_1(donvi, dcb, tt);
            dt2 = BO.Report.Report.GetDataTableToReport_Type_3_2(donvi, dcb, tt);
            dt3 = BO.Report.Report.GetDataTableToReport_Type_3_3(donvi, dcb, tt);

            DataColumn orderColumn = dt1.Columns.Add("STT");
            orderColumn.SetOrdinal(0);
            int order = 0;
            foreach (DataRow row in dt1.Rows)
            {
                order++;
                row["STT"] = order.ToString();
            }

            DataColumn orderColumn2 = dt2.Columns.Add("STT");
            orderColumn2.SetOrdinal(0);
            int order2 = order;
            foreach (DataRow row in dt2.Rows)
            {
                order2++;
                row["STT"] = order2.ToString();
            }

            DataColumn orderColumn3 = dt3.Columns.Add("STT");
            orderColumn3.SetOrdinal(0);
            int order3 = order2;
            foreach (DataRow row in dt3.Rows)
            {
                order3++;
                row["STT"] = order3.ToString();
            }

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
            Repeater3.DataSource = dt3;
            Repeater3.DataBind();
        }
    }
}