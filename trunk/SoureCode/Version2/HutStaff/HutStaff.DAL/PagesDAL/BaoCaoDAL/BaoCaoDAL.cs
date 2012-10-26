using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.BaoCaoDAL
{
    public class BaoCaoDAL
    {
        public static DataTable ViewAlldm_dv()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_dv", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewAlldm_dcb()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_dcb", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewAlldm_kt()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_kt", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewAlldm_kcb()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_kcb", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewSetNangLuong(int loaiHanNgach, int loaiBang, DateTime thoiGian)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_get_salary_increment_list]",
                    new string[] { "@loaiHanNgach", "@loaiBang", "@thoiGian" },
                    new object[] { loaiHanNgach, loaiBang, thoiGian });
            }
        }
    }
}
