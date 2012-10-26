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
        public static DataTable Authenticate(string username, string password)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_User_Authenticate]",
                    new string[] { "@username", "@password" },
                    new object[] { username, password });
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyword">"" search all </param>
        /// <param name="xoahs">-1 search all</param>
        /// <returns></returns>
        public static DataTable Search(int pageIndex, int pageSize, string keyword, int xoahs)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_User_Soyeu_Search]",
                    new string[] { "@pageIndex", "@pageSize", "@keyword", "@xoahs" },
                    new object[] { pageIndex, pageSize, keyword, xoahs });
            }
        }

        public static int SearchCount(string keyword, int xoahs)
        {
            using (MainDB db = new MainDB())
            {
                return Convert.ToInt32(db.Execute("[HutStaff_User_Soyeu_SearchCount]",
                    new string[] { "@keyword", "@xoahs" },
                    new object[] { keyword, xoahs }).Rows[0][0]);
            }
        }
    }
}
