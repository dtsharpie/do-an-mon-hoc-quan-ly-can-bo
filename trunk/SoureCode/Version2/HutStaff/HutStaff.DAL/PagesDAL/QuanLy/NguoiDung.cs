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
        public static DataTable ViewAllUserWithDM()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_all_user_with_dv",
                    new string[] { },
                    new object[] { });
            }
        }
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

        public static DataTable DeleteUser(string id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_delete_user",
                    new string[] { "@id" },
                    new object[] { id });
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
        public static DataTable ChuyenDonVi(string ma_dvql_nguon, string ma_dvql_dich)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_chuyen_donvi",
                    new string[] { "@ma_dvql_nguon", "@ma_dvql_dich" },
                    new object[] { ma_dvql_nguon, ma_dvql_dich });
            }
        }
        public static DataTable ViewSoyeuByDVQL(string ma_dvql)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_view_soyeu_by_dvql",
                    new string[] { "@ma_dvql" },
                    new object[] { ma_dvql });
            }
        }
    }
}
