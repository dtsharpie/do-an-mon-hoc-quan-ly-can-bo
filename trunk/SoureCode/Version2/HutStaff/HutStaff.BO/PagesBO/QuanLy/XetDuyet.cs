using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.QuanLy
{
    public class XetDuyet
    {
        public static DataTable ViewSetNangLuong(int pageIndex, int pageSize, int loaiHanNgach, int loaiBang, DateTime thoiGian, string delete)
        {
            return DAL.PagesDAL.QuanLy.XetDuyet.ViewSetNangLuong(pageIndex, pageSize, loaiHanNgach, loaiBang, thoiGian, delete);
        }

        public static int ViewSetNangLuongCount(int loaiHanNgach, int loaiBang, DateTime thoiGian,string delete)
        {
            return DAL.PagesDAL.QuanLy.XetDuyet.ViewSetNangLuongCount(loaiHanNgach, loaiBang, thoiGian, delete);
        }
    }
}
