using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Controls.Timkiem
{
    public partial class Search : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sMa_dv = GetInt("ma_dv", 0).ToString();
            string sTen = GetString("ten");
            int iGioitinh = GetInt("gioitinh", -1);
            int iTuTuoi = GetInt("tutuoi", -1);
            int iDenTuoi = GetInt("dentuoi", -1);
            int iDiencb = GetInt("diencb", -1);
            int iKhoicb = GetInt("khoicanbo", -1);
            int iNvtruong = GetInt("nvtruong", -1);
            string sDeletes = GetString("deletes");

            DataTable tblData = BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all(sMa_dv, sTen, iGioitinh, iTuTuoi, iDenTuoi, iDiencb, iKhoicb, iNvtruong ,sDeletes,PageIndex,PageSize);
            grdData.DataSource = tblData;
            grdData.DataBind();
        }
    }
}