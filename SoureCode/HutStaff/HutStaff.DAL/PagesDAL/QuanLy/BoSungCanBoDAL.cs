﻿using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.QuanLy
{
    class BoSungCanBoDAL
    {
        public static DataTable getDienCanBo()
        {
            DataTable dt = new DataTable();
            try
            {
                using (MainDB db = new MainDB())
                {
                    dt = db.Execute("sp_view_all_dm_dcb");
                }
            }
            catch (Exception e)
            {
            }
            return dt;
        }

    }
}
