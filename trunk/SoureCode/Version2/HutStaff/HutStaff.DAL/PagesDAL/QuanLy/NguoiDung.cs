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
        public static DataTable InsertUser(string ma_dv, string user, string passwordMD5, bool quyen, bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_insert_user",
                    new string[] { "@ma_dv", "@user", "@pass", "@quyen", "@isLock" },
                    new object[] { ma_dv, user, passwordMD5, quyen, isLock });
            }
        }
        public static DataTable UpdateUser(string id, int ma_dv, string user, bool quyen, bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_update_user",
                    new string[] { "@id", "@ma_dv", "@user", "@quyen", "@isLock" },
                    new object[] { id, ma_dv, user, quyen, isLock });
            }
        }

        public static DataTable UpdatePassword(string id, string pass)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_update_user_password",
                    new string[] { "@id", "@pass" },
                    new object[] { id, pass });
            }
        }

        public static bool GetUserInfo(string user, out int id, out string ma_dv, out string passwordMD5, out bool quyen, out bool isLock)
        {
            using (MainDB db = new MainDB())
            {
                string sqlCmd = "SELECT id, ma_dv, pass, quyen, isLock FROM Users WHERE [user]='" + user + "'";
                DataTable dt = db.Execute(sqlCmd);

                if (dt.Rows.Count == 0)
                {
                    id = 0;
                    ma_dv = "";
                    passwordMD5 = null;
                    quyen = false;
                    isLock = false;

                    return false;
                }
                else
                {
                    id = Int32.Parse(dt.Rows[0]["id"].ToString());
                    ma_dv = dt.Rows[0]["ma_dv"].ToString();
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
        public static int ChuyenDonVi(string ma_dvqlNguon, string ma_dvqlDich)
        {
            using (MainDB db = new MainDB())
            {
                string sqlCmd = "UPDATE soyeu SET ma_dvql = '" + ma_dvqlDich + "' WHERE ma_dvql = '" + ma_dvqlNguon + "'";

                return db.Execute(sqlCmd).Rows.Count;
            }
        }
    }
}
