using System;
using System.Linq;
using System.Data;

namespace HutStaff.BO.DanhMuc
{
    public class TinhThanhPho
    {
        public static DataTable GetAll()
        {
            return HutStaff.DAL.Repository.GetAll("sp_view_all_dm_ttp");
        }
    }
}
