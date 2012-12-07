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

        public static DataTable GetDSCSDT(int pageIndex, int pageSize, ref int total)
        {
            return DAL.PagesDAL.QuanLy.DanhMuc.GetDSCSDT(pageIndex, pageSize, ref total);
        }

        public static int? CountDSCSDT() 
        {
            DataTable table = DAL.PagesDAL.QuanLy.DanhMuc.CountDSCSDT();
            try
            {
                return Int32.Parse(table.Rows[0][0].ToString());
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static void UpdateDSCSDT(string oldCSDTCM, string newCSDTCM)
        {
            DAL.PagesDAL.QuanLy.DanhMuc.UpdateDSCSDT(oldCSDTCM, newCSDTCM);
        }
        public static DataTable View_all_cvdn_from_soyeu()
        {
            return DAL.PagesDAL.QuanLy.DanhMuc.View_all_cvdn_from_soyeu();
        }
        public static DataTable Insert_dm_cvdn(string cvdn)
        {
            return DAL.PagesDAL.QuanLy.DanhMuc.Insert_dm_cvdn(cvdn);
        }
    }
}
