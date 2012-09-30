using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using QLCB_BK.Common;

namespace QLCB_BK.DAL.Report
{
    public class Report
    {
        private static string connectionString = @"Data Source=TINVUKHACPC\TINVUKHACSQL;Initial Catalog=hutstaff_9_8;Integrated Security=True";

        // Method get salary increment list
        public static DataTable GetSalaryIncrementList(int loaiHanNgach, int loaiBang, int thang, int nam)
        {
            string thoiGian;
            if (thang < 10)
            {
                thoiGian = "0" + thang.ToString() + "/01/" + nam.ToString();
            }
            else
            {
                thoiGian = thang.ToString() + "/01/" + nam.ToString();
            }
            using (MainDB db = new MainDB(connectionString))
            {
                return db.Execute("[sp_report_get_salary_increment_list]",
                    new string[] { "@loaiHanNgach", "@loaiBang", "@thoiGian" },
                    new object[] { loaiHanNgach, loaiBang, thoiGian });
            }
        }
    }
}
