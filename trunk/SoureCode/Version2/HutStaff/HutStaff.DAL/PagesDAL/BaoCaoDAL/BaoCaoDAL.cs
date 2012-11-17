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

        public static DataTable ViewAll_4_dm_dv()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_4_dm_dv", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewAll_123_dm_dv()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_123_dm_dv", new string[] { }, new object[] { });
            }
        }

        public static DataTable ViewAlldm_tt()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_tt", new string[] { }, new object[] { });
            }
        }

    }
}
