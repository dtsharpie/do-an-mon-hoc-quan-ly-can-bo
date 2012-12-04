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
    }
}
