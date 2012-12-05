using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.TimKiem
{
    public class SearchDetailDAL
    {
        public static DataTable ThongTinChiTiet(int iShcc)
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_find_by_id_soyeu",
                    new string[] { "@shcc" },
                    new object[]{iShcc});                
            }
            
            return dt;
        }

        public static DataTable getAllTrinhDoHocVan()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tdhv",
                    new string[] {},
                    new object[] {});
            }
            return dt;
        }

        public static DataTable getAllTrinhDoTinHoc()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tdth",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllTrinhDoLiLuanChinhTri()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tdll",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllTrinhDoQuanLiNhaNuoc()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tdql",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllTrinhDoNgoaiNgu()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt =db.Execute("sp_view_all_dm_tdnn",
                new string[]{},
                new object[] {});
            }
            return dt;
        }

        public static DataTable getAllNgoaiNgu()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tnn",
                new string[] { },
                new object[] { });
            }
            return dt;
        }

        public static DataTable getAllKhoiCanBo()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_kcb",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllDienCanBo()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_dcb",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllDonViQuanLi()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_dv",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllThuongBinh()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tb",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllGiaDinhChinhSach()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_gdcs",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllThanhPhanXuatThan()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tpxt",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllHuyen()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_dd",
                    new string[] { },
                    new object[] { });
                foreach (DataRow r in dt.Rows)
                {
                    int ma_ttp = int.Parse(r["ma_tinh"].ToString());
                    string ten_ttp = db.Execute("sp_find_by_id_dm_ttp",
                                                new string[]{"@ma_ttp"},
                                                new object[]{ma_ttp}).Rows[0]["ttp"].ToString();
                    if ("".Equals(r["ten_huyen"]))
                    {
                        r["ten_huyen"] = ten_ttp;
                    }
                    else
                    {
                        r["ten_huyen"] = r["ten_huyen"] + " - " + ten_ttp;
                    }
                }
            }
            return dt;
        }

        public static DataTable getAllTinhTrangHonNhan()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tthn",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllDanToc()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_dt",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static DataTable getAllTonGiao()
        {
            DataTable dt = new DataTable();
            using (MainDB db = new MainDB())
            {
                dt = db.Execute("sp_view_all_dm_tg",
                    new string[] { },
                    new object[] { });
            }
            return dt;
        }

        public static void updateTrinhDoNgoaiNgu(int id, int ma_tnn, int ma_tdnn, string p)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("sp_update_tdnn",
                    new string[] { "@id", "@ma_nn", "@ma_td", "@ttk_tdnn" },
                    new object[] { id, ma_tnn, ma_tdnn, p});
            }
        }

        public static void Delete(int iShcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("");
            }
        }

        public static void Update(int iShcc, string hovatendem, string ten, DateTime? ngaysinh, int gioitinh, string scmnd, DateTime? ngaycap, int? noicap, string email, string dienthoai, int? tdhv, int? tdll, int? tdql, int? tdth, string sotruong, DateTime? ngayvecq, DateTime? ngayvaobienche, int? khoicanbo, int? diencanbo, int? dvql, string viecphancong, string viecdamnhan, DateTime? ngaybatdau, DateTime? mocthamnien, DateTime? ngaykthd, string lidokthd, int thanggd, DateTime? ngaythamgiacm, DateTime? ngayvaodang, DateTime? ngaychinhthuc, DateTime? ngaynhapngu, DateTime? ngayxuatngu, string quanham, int? thuongbinh, int? giadinhchinhsach, int? thanhphanxuatthan, string tenthuongdung, int? noisinh, int? quequan, string chitietquequan, string diachithuongtru, int? hokhauthuongtru, string chitiethktt, string sobaohiem, DateTime? ngaydongbh, DateTime? ngaybhchinhthuc, string ttsk, string nm, int? tthn, string lsbt, int? dt, int? tg, string thongtinkhac)
        {
            using (MainDB db = new MainDB())
            {
                // Không hiểu @kn_tht là gì, nhập vào là ""
                // Trong thiết kế giao diện không có trường Tình trạng, nên không có dữ liệu cho @tt
                db.Execute("sp_update_soyeu",
                    new string[] { "@shcc", "@nvcqhn", "@scmnd", "@nc", "@ngay_cap", "@ma_dvql", "@hodem", "@ten", "@gt", "@ttd", "@ntns", "@ma_ns", "@ma_qq", "@ctqq", 
                        "@dctt", "@ma_dt", "@ma_tg", "@ma_gdtdcs", "@ma_tpxt", "@ntgcm", "@vdpc", "@nvbc", "@cvdn", "@nvd", "@nct", "@nnn", "@nxn", "@qh", "@ma_tb", 
                        "@ma_tdhv", "@ma_tdth", "@kn_tht", "@ma_tdllct", "@ma_tdqlnn", "@nlstnk", "@ma_ttsk", "@ma_nm", "@ddlsbt", "@ttk", "@dcb", "@tt", "@sbh", "@ndbh",
                        "@tthn", "@email", "@tel", "@cthktt", "@kcb", "@ma_hktt", "@ngay_kthd", "@ld_kthd", "@ngaybh", "@thanggd", "@ngaybhct", "@mochuongtn"},
                    new object[] {iShcc, ngayvecq, scmnd, noicap, ngaycap, dvql, hovatendem, ten, gioitinh, tenthuongdung, ngaysinh, noisinh, quequan, chitietquequan, 
                        diachithuongtru, dt, tg, giadinhchinhsach, thanhphanxuatthan, ngaythamgiacm, viecphancong, ngayvaobienche, viecdamnhan, ngayvaodang, ngaychinhthuc, ngaynhapngu, ngayxuatngu, quanham, thuongbinh,
                        tdhv, tdth, "", tdll, tdql, sotruong, ttsk, nm, lsbt, thongtinkhac, diencanbo, 0, sobaohiem, ngaydongbh,
                        tthn, email, dienthoai, chitiethktt, khoicanbo, hokhauthuongtru, ngaykthd, lidokthd, ngaydongbh, thanggd, ngaybhchinhthuc, mocthamnien});
            }
        }
    }
}
