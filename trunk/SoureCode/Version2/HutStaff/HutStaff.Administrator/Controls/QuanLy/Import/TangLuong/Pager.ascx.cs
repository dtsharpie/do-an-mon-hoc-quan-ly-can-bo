using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;

namespace HutStaff.Administrator.Controls.QuanLy.Import.TangLuong
{
    public partial class Pager : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iLoaiHanNgach = GetInt("loaiHanNgach");
            int iloaiBang = GetInt("loaiBang");
            DateTime dtthoiGian = GetDate("thoiGian", DateTime.Now);
            string sDelete = GetString("delete");

            int iCount = BO.PagesBO.QuanLy.XetDuyet.ViewSetNangLuongCount(iLoaiHanNgach, iloaiBang, dtthoiGian, sDelete);

            int iPageIndex = GetInt("pageindex",1);
            int iPageSize = GetInt("pagesize",20);

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