﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.Tinhthanhpho
{
    public class Tinhthanpho
    {
        public static DataTable GetAll()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_dmttp_GetAll]",
                     new string[] { },
                     new object[] { });
            }
        }

        public static DataTable GetAllCity()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_view_all_dm_ttp]",
                     new string[] { },
                     new object[] { });
            }
        }
    }
}
