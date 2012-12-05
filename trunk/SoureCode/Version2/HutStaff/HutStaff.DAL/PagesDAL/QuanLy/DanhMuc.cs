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
    }
}
