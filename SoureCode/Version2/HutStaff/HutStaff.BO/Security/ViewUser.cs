using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Security
{
    public class ViewUser
    {
        public static DataTable Authenticate(string UserName, string Password)
        {
            string hashPass = Common.LibCrypto.StringToMD5(Password);
            return DAL.Security.ViewUser.Authenticate(UserName, hashPass);
        }

    }
}
