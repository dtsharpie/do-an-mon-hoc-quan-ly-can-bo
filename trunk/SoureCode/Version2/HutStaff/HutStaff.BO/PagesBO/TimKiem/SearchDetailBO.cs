using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.TimKiem;
using HutStaff.DAL.Tinhthanhpho;
using HutStaff.DAL.Thongtinchung;

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


        public static DataTable getAllNgoaiNgu()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllNgoaiNgu();
            return dt;
        }

        public static DataTable getAllTrinhDoNgoaiNgu()
        {
            DataTable dt = new DataTable();
            dt = SearchDetailDAL.getAllTrinhDoNgoaiNgu();
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

        //delete database
        public static void Delete(int iShcc)
        {
            SearchDetailDAL.Delete(iShcc);
        }

        //update database
        public static void updateTrinhDoNgoaiNgu(int id, int ma_tnn, int ma_tdnn, string p)
        {
            SearchDetailDAL.updateTrinhDoNgoaiNgu(id,ma_tnn, ma_tdnn, p);
        }

        public static void Update(int iShcc, string hovatendem, string ten, DateTime? ngaysinh, int gioitinh, string scmnd, DateTime? ngaycap, int? noicap, string email, string dienthoai, int? tdhv, int? tdll, int? tdql, int? tdth, string sotruong, DateTime? ngayvecq, DateTime? ngayvaobienche, int? khoicanbo, int? diencanbo, int? dvql, string viecphancong, string viecdamnhan, DateTime? ngaybatdau, DateTime? mocthamnien, DateTime? ngaykthd, string lidokthd, int thanggd, DateTime? ngaythamgiacm, DateTime? ngayvaodang, DateTime? ngaychinhthuc, DateTime? ngaynhapngu, DateTime? ngayxuatngu, string quanham, int? thuongbinh, int? giadinhchinhsach, int? thanhphanxuatthan, string tenthuongdung, int? noisinh, int? quequan, string chitietquequan, string diachithuongtru, int? hokhauthuongtru, string chitiethktt, string sobaohiem, DateTime? ngaydongbh, DateTime? ngaybhchinhthuc, string ttsk, string nm, int? tthn, string lsbt, int? dt, int? tg, string thongtinkhac)
        {
            SearchDetailDAL.Update(iShcc, hovatendem, ten, ngaysinh, gioitinh, scmnd, ngaycap, noicap, email, dienthoai, tdhv, tdll, tdql,
                tdth, sotruong, ngayvecq, ngayvaobienche, khoicanbo, diencanbo, dvql, viecphancong, viecdamnhan, ngaybatdau, mocthamnien,
                ngaykthd, lidokthd, thanggd, ngaythamgiacm, ngayvaodang, ngaychinhthuc, ngaynhapngu, ngayxuatngu, quanham, thuongbinh,
                giadinhchinhsach, thanhphanxuatthan, tenthuongdung, noisinh, quequan, chitietquequan, diachithuongtru, hokhauthuongtru,
                chitiethktt, sobaohiem, ngaydongbh, ngaybhchinhthuc, ttsk, nm, tthn, lsbt, dt, tg, thongtinkhac);
        }
    }
}
