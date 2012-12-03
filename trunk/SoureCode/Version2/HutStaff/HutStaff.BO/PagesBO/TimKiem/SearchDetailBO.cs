using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.TimKiem;
using HutStaff.DAL.Tinhthanhpho;

namespace HutStaff.BO.PagesBO.TimKiem
{
    public class SearchDetailBO
    {
        public static DataTable ThongTinChiTiet(int iShcc)
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.ThongTinChiTiet(iShcc);
            return dt;
        }

        public static DataTable getAllTinhThanhPho()
        {
            DataTable dt = new DataTable();
            dt = Tinhthanpho.GetAllCity();
            return dt;
        }

        public static DataTable getAllTrinhDoHocVan()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTrinhDoHocVan();
            return dt;
        }

        public static DataTable getAllTrinhDoTinHoc()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTrinhDoTinHoc();
            return dt;
        }

        public static DataTable getAllTrinhDoLiLuanChinhTri()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTrinhDoLiLuanChinhTri();
            return dt;
        }

        public static DataTable getAllTrinhDoQuanLiNhaNuoc()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTrinhDoQuanLiNhaNuoc();
            return dt;
        }

        public static DataTable getAllDienCanBo()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllDienCanBo();
            return dt;
        }

        public static DataTable getAllKhoiCanBo()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllKhoiCanBo();
            return dt;
        }

        public static DataTable getAllDonViQuanLi()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllDonViQuanLi();
            return dt;
        }

        public static DataTable getAllThuongBinh()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllThuongBinh();
            return dt;
        }

        public static DataTable getAllGiaDinhChinhSach()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllGiaDinhChinhSach();
            return dt;
        }

        public static DataTable getAllThanhPhanXuatThan()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllThanhPhanXuatThan();
            return dt;
        }

        public static DataTable getAllHuyen()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllHuyen();
            return dt;
        }

        public static DataTable getAllTinhTrangHonNhan()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTinhTrangHonNhan();
            return dt;
        }

        public static DataTable getAllDanToc()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllDanToc();
            return dt;
        }

        public static DataTable getAllTonGiao()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTonGiao();
            return dt;
        }

        public static void Delete(int iShcc)
        {
            throw new NotImplementedException();
        }
    }
}
