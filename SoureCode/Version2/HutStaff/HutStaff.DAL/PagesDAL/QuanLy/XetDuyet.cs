using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.QuanLy
{
    public class XetDuyet
    {
        public static DataTable ViewSetNangLuong(int pageIndex, int pageSize, int loaiHanNgach, int loaiBang, DateTime thoiGian,string delete)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_User_increment_list]",
                    new string[] { "@pageIndex", "@pageSize", "@loaiHanNgach", "@loaiBang", "@thoiGian", "@delete" },
                    new object[] { pageIndex, pageSize, loaiHanNgach, loaiBang, thoiGian,delete });
            }
        }

        public static int ViewSetNangLuongCount(int loaiHanNgach, int loaiBang, DateTime thoiGian,string delete)
        {
            using (MainDB db = new MainDB())
            {
                return Convert.ToInt32(db.Execute("[HutStaff_User_increment_list_Count]",
                    new string[] { "@loaiHanNgach", "@loaiBang", "@thoiGian", "@delete" },
                    new object[] { loaiHanNgach, loaiBang, thoiGian ,delete}).Rows[0][0]);
            }
        }
    }
}
