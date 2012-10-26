using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Xml;

namespace HutStaff.BO.Security
{
    public class User
    {
        public static DataTable Authenticate(string UserName, string Password)
        {
            string hashPass = Common.LibCrypto.StringToMD5(Password);
            return DAL.Security.User.Authenticate(UserName, hashPass);
        }

        public static DataTable Search(int pageIndex, int pageSize, string keyword, int xoahs)
        {
            return DAL.Security.User.Search(pageIndex, pageSize, keyword.ToLower(), xoahs);
        }

        public static int SearchCount(string keyword, int xoahs)
        {
            return DAL.Security.User.SearchCount(keyword, xoahs);
        }
    }
}
