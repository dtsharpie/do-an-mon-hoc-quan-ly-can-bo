using System;
using System.Data;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class TinhTrangCongTac
    {
        public static DataTable GetAll()
        {
            //
            return HutStaff.DAL.Quanly.Repository.GetAll("sp_view_all_dm_tt");
        }
    }
}