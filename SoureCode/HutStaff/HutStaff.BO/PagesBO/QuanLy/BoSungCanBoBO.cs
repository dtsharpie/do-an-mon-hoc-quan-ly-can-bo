using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.QuanLy;

namespace HutStaff.BO.PagesBO.QuanLy
{
    class BoSungCanBoBO
    {
        public static DataTable getDienCanBo()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = BoSungCanBoDAL.getDienCanBo();
            }
            catch (Exception e)
            {
            }
            finally
            {
            }
            return dt;
        }
    }
}
