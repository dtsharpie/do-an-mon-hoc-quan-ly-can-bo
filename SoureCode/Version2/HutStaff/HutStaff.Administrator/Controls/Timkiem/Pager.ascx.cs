using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;

namespace HutStaff.Administrator.Controls.Timkiem
{
    public partial class Pager : ControlBase
    {
        protected int iPageIndex;
        protected int iPageSize;
        protected int iCount;
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

            iCount = BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all_total(sMa_dv, sTen, iGioitinh, iTuTuoi, iDenTuoi, iDiencb, iKhoicb, iNvtruong, sDeletes);

            iPageIndex = GetInt("pi", 1);
            iPageSize = GetInt("ps", 25);

            if (iCount == 0)
            {
                Pager1.Dispose();
                Pager1.Visible = false;
            }
            else
            {
                if (iCount % iPageSize == 0)
                {
                    Pager1.TotalPage = iCount / iPageSize;
                }
                else
                {
                    Pager1.TotalPage = iCount / iPageSize + 1;
                }

                if (iPageIndex <= 0 || iPageIndex > Pager1.TotalPage)
                {
                    iPageIndex = 1;
                }
                Pager1.CurrentPage = iPageIndex;
            }

        }
    }
}