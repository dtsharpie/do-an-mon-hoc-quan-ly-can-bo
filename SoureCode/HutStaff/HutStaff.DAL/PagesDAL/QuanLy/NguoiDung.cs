using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.QuanLy
{
    public class NguoiDung
    {
        public static DataTable InsertUser(int ma_dv, string user, string passwordMD5, bool quyen, bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_insert_user",
                    new string[] { "@ma_dv", "@user", "@pass", "@quyen", "@isLock" },
                    new object[] { ma_dv, user, passwordMD5, quyen, isLock });
            }
        }
        public static DataTable UpdateUser(int id, int ma_dv, string user, string passwordMD5, bool quyen, bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_update_user",
                    new string[] { "@id", "@ma_dv", "@user", "@pass", "@quyen", "@isLock" },
                    new object[] { id, ma_dv, user, passwordMD5, quyen, isLock });
            }
        }

        public static bool GetUserInfo(string user, out int id, out int ma_dv, out string passwordMD5, out bool quyen, out bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                string sqlCmd = "SELECT id, ma_dv, pass, quyen, isLock FROM Users WHERE [user]='" + user + "'";
                DataTable dt = db.Execute(sqlCmd);

                if (dt.Rows.Count == 0)
                {
                    id = 0;
                    ma_dv = 0;
                    passwordMD5 = null;
                    quyen = false;
                    isLock = false;

                    return false;
                }
                else
                {
                    id = Int32.Parse(dt.Rows[0]["id"].ToString());
                    ma_dv = Int32.Parse(dt.Rows[0]["ma_dv"].ToString());
                    passwordMD5 = dt.Rows[0]["ma_dv"].ToString();
                    quyen = Boolean.Parse(dt.Rows[0]["quyen"].ToString());
                    isLock = Boolean.Parse(dt.Rows[0]["isLock"].ToString());

                    return true;
                }
            }

        }

        public static int GetUserID(string user)
        {
            using (MainDB db = new MainDB())
            {
                string sqlCmd = "SELECT id FROM Users WHERE [user]='" + user + "'";
                DataTable dt = db.Execute(sqlCmd);

                if (dt.Rows.Count == 0)
                    return -1;
                else
                    return Int32.Parse(dt.Rows[0]["id"].ToString());
            }
        }
    }
}
