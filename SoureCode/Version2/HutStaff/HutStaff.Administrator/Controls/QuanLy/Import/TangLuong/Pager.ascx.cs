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
        int TotalItem = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            int iLoaiHanNgach = GetInt("loaiHanNgach");
            int iloaiBang = GetInt("loaiBang");
            DateTime dtthoiGian = GetDate("thoiGian", DateTime.Now);

            TotalItem = BO.PagesBO.QuanLy.XetDuyet.ViewSetNangLuongCount( iLoaiHanNgach, iloaiBang, dtthoiGian);
            if (TotalItem > 0)
            {
                //Pager
                Pager1.HtmlId = ".main-table";
                Pager1.PageIndex = PageIndex;
                Pager1.PageSize = PageSize;
                Pager1.TotalItem = TotalItem;
                Pager1.ControlParams = "{\"alias\":\"" + "danh-sach-tang-luong" + "\"" +
                                   ",\"loaiHanNgach\":\"" + iLoaiHanNgach + "\"" +
                                   ",\"loaiBang\":\"" + iloaiBang + "\"" +
                                   ",\"thoiGian\":\"" + dtthoiGian.ToString("dd/MM/yyyy") + "\"" +
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