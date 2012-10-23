using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.QuanLy
{
    public class BoSungCanBoDAL
    {
        public static DataTable getDienCanBo()
        {
            DataTable dt = new DataTable();
            try
            {
                using (MainDB db = new MainDB())
                {
                    dt = db.Execute("sp_view_all_dm_dcb");
                }
            }
            catch (Exception e)
            {
            }
            return dt;
        }


        public static DataTable getDonVi()
        {
            DataTable dt = new DataTable();
            try
            {
                using (MainDB db = new MainDB())
                {
                    dt = db.Execute("sp_view_all_dm_dv");
                }
            }
            catch (Exception e)
            {
            }
            return dt;
        }

        public static Dictionary<string, int> getTinh()
        {
            Dictionary<string, int> province = new Dictionary<string, int>();
            DataTable dt = new DataTable();
            try
            {
                using (MainDB db = new MainDB()) {
                    dt = db.Execute("sp_view_all_dm_ttp");
                }
            }
            catch (Exception e)
            {
            }
            finally { }
            foreach (DataRow r in dt.Rows)
            {
                string key = r["ttp"].ToString();
                int value = Int16.Parse(r["ma_ttp"].ToString());
                province.Add(key, value);
            }
            return province;
        }

        public static DataTable getHuyen(int provinceID)
        {
            DataTable dt = new DataTable();
            try
            {
                using (MainDB db = new MainDB())
                {
                    string sqlCmd = "SELECT ma_huyen, ten_huyen FROM [dm_dd] WHERE [dm_dd].ma_tinh='" + provinceID + "'";
                    dt = db.Execute(sqlCmd);
                }
            }
            catch (Exception e) { 
            }
            return dt;
        }
    }
}
