﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.DanhMuc
{
    public class DienCanBo
    {
        public static DataTable GetAll()
        {
            return HutStaff.DAL.Repository.GetAll("sp_view_all_dm_dcb");
        }
    }
}
