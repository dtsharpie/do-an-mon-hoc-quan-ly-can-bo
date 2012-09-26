using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.Security
{
    public class User
    {
        public static DataTable Search(int pageIndex, int pageSize, int currentUserId, int filter, string keyword, int status)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[QLCB_User_Search]",
                    new string[] { "@pageIndex", "@pageSize", "@currentUserId", "@filter", "@keyword", "@status" },
                    new object[] { pageIndex, pageSize, currentUserId, filter, keyword, status });
            }
        }

        public static int SearchCount(int currentUserId, int filter, string keyword, int status)
        {
            using (MainDB db = new MainDB())
            {
                return (int)db.Execute("[QLCB_User_SearchCount]",
                    new string[] { "@currentUserId", "@filter", "@keyword", "@status" },
                    new object[] { currentUserId, filter, keyword, status }).Rows[0][0];
            }
        }

        public static DataTable GetById(int Id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("QLCB_User_GetById",
                          new string[] { "@Id" },
                          new object[] { Id });
            }
        }

        public static void ChangeStatus(int id, int status)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_ChangeStatus",
                          new string[] { "@Id", "@Status" },
                          new object[] { id, status });
            }
        }

        public static void Insert(string Username, string Password, int Status, string FullName, string Email, string Description, int Role)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_Insert",
                    new string[] { "@Username", "@Password", "@Status", "@FullName", "@Email", "@Description", "@Role" },
                    new object[] { Username, Password, Status, FullName, Email, Description, Role });
            }
        }

        public static void Update(int Id, int Status, string FullName, string Email, string Description, int Role)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_Update",
                    new string[] { "@Id", "@Status", "@FullName", "@Email", "@Description", "@Role" },
                    new object[] { Id, Status, FullName, Email, Description, Role });
            }
        }

        public static void Delete(int Id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_Delete",
                  new string[] { "@Id" },
                  new object[] { Id });
            }
        }

        public static DataTable Authenticate(string username, string password)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("QLCB_User_Authenticate",
                    new string[] { "@username", "@password" },
                    new object[] { username, password });
            }
        }

        public static DataTable GetByUserName(string username)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("QLCB_User_GetByUserName",
                          new string[] { "@username" },
                          new object[] { username });
            }
        }

        public static void ChangePass(int userId, string password)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_ChangePass",
                          new string[] { "@Id", "@Password" },
                          new object[] { userId, password });
            }
        }

        public static void ChangeRole(int userId, int role)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("QLCB_User_ChangeRole",
                          new string[] { "@Id", "@Role" },
                          new object[] { userId, role });
            }
        }

        public static List<string> GetAllEmail()
        {
            List<string> lstEmail = new List<string>();
            DataTable tblListEmail = new DataTable();
            using (MainDB db = new MainDB())
            {
                tblListEmail = SearchEmail(1, SearchCount(1, -1, "", -1), "");
            }
            foreach (DataRow dr in tblListEmail.Rows)
            {
                if(!String.IsNullOrEmpty(dr[0].ToString()));
                lstEmail.Add(dr[0].ToString());
            }
            return lstEmail;
        }

        public static DataTable SearchEmail(int pageIndex, int pageSize, string keyword)
        {
            using (MainDB db = new MainDB())
            {
                return  db.Execute("[QLCB_User_SearchEmail]",
                               new string[] { "@pageIndex", "@pageSize", "@keyword" },
                               new object[] { pageIndex, pageSize, keyword });


            }
        }

        public static int SearchEmailCount(string keyword)
        {
            using (MainDB db = new MainDB())
            {
                return Convert.ToInt32(db.Execute("[QLCB_User_SearchEmailCount]",
                               new string[] { "@keyword" },
                               new object[] { keyword }).Rows[0][0]);


            }
        }
    }
}
