using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.BaoCaoDAL
{
    public class KhenThuongDAL
    {
        public static DataTable ViewAlldm_kt()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_dm_kt", new string[] { }, new object[] { });
            }
        }
    }
}
