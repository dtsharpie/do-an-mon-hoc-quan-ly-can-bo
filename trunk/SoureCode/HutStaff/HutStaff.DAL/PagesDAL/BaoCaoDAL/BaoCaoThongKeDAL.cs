using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.BaoCaoDAL
{
    public class BaoCaoThongKeDAL
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

        
    }
}
