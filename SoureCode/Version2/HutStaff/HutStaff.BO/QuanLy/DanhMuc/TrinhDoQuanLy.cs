﻿using System;
using System.Linq;
using System.Data;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class TrinhDoQuanLy
    {
        public static DataTable GetAll()
        {
            return HutStaff.DAL.Quanly.Repository.GetAll("sp_view_all_dm_tdql");
        }
    }
}
