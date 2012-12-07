using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.QuanLy
{
    public class DanhMuc
    {
        public static DataTable InsertHH(string hh)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_insert_dm_hh",
                    new string[] { "@hh"},
                    new object[] { hh });
            }
        }

        public static DataTable GetDSCSDT(int pageIndex, int pageSize, ref int total)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_by_page_qtdtcm_tbl",
                    new string[] { "@PageIndex", "@PageSize", "@Total" },
                    new object[] { pageIndex, pageSize, total });
            }
        }

        public static DataTable CountDSCSDT()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_count_csdtcm", new string[]{}, new object[]{});
            }
        }

        public static void UpdateDSCSDT(string oldCSDTCM, string newCSDTCM)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("sp_update_csdtcm_qtdtcm",
                    new string[] { "@old_csdtcm", "@new_csdtcm" },
                    new object[] { oldCSDTCM, newCSDTCM });
            }
        }
        public static DataTable View_all_cvdn_from_soyeu()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_cvdn_from_soyeu",
                    new string[] { },
                    new object[] { });
            }
        }
        public static DataTable Insert_dm_cvdn(string cvdn)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_insert_dm_cvdn",
                    new string[] { "@cvdn" },
                    new object[] { cvdn });
            }
        }
    }
}
