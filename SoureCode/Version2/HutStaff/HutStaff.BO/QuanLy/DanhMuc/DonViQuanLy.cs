using System;
using System.Linq;
using System.Data;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class DonViQuanLy
    {
        public static DataTable GetAll()
        {
            return HutStaff.DAL.Quanly.Repository.GetAll("sp_view_all_dm_dv");
        }

        public static DataTable GetByParent(string parentCode, int level)
        {
            return HutStaff.DAL.Quanly.Repository.Execute("sp_view_by_parent_dm_dv", new string[] { "@parentCode", "@level" }, new object[] { parentCode, level });
        }
    }
}
