using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.QuanLy
{
    public class DanhMucBO
    {
        public static DataTable InsertHH(string hh)
        {
            return DAL.PagesDAL.QuanLy.DanhMuc.InsertHH(hh);
        }
    }
}
