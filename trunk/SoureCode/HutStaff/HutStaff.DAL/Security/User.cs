﻿using System;
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
    }
}
