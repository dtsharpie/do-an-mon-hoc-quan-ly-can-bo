using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.QuanLy;

namespace HutStaff.BO.PagesBO.QuanLy
{
    public class NguoiDungBO
    {
        public static DataTable InsertUser(int ma_dv, string user, string passwordMD5, bool quyen, bool isLock)
        {
            return DAL.PagesDAL.QuanLy.NguoiDung.InsertUser(ma_dv, user, passwordMD5, quyen, isLock);
        }
        public static DataTable UpdateUser(int id, int ma_dv, string user, string passwordMD5, bool quyen, bool isLock)
        {
            return DAL.PagesDAL.QuanLy.NguoiDung.UpdateUser(id, ma_dv, user, passwordMD5, quyen, isLock);
        }
        public static bool GetUserInfo(string user, out int id, out int ma_dv, out string passwordMD5, out bool quyen, out bool isLock)
        {
            return DAL.PagesDAL.QuanLy.NguoiDung.GetUserInfo(user, out id, out ma_dv, out passwordMD5, out quyen, out isLock);
        }
        public static int GetUserID(string user)
        {
            return DAL.PagesDAL.QuanLy.NguoiDung.GetUserID(user);
        }
    }
}
