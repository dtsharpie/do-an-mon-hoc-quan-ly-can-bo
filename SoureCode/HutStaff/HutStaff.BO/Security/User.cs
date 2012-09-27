using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.Security;
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
    }
}
