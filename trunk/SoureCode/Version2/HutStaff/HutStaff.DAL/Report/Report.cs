using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HutStaff.Common;
using System.Data;

namespace HutStaff.DAL.Report
{
    public class Report
    {
        // Method get salary increment list
        public static DataTable GetSalaryIncrementList(int loaiHanNgach, int loaiBang, int thang, int nam)
        {
            string thoiGian;
            if (thang < 10)
            {
                //thoiGian = "00:00:00 0" + thang.ToString() + "/01/" + nam.ToString();
                thoiGian = "01/0" + thang.ToString() + "/" + nam.ToString();
            }
            else
            {
                //thoiGian = "00:00:00 " + thang.ToString() + "/01/" + nam.ToString();
                thoiGian = "01/" + thang.ToString() + "/" + nam.ToString();
            }
            DateTime dt = new DateTime();
            dt = Convert.ToDateTime(thoiGian);
            thoiGian = dt.ToString();
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_get_salary_increment_list]",
                    new string[] { "@loaiHanNgach", "@loaiBang", "@thoiGian" },
                    new object[] { loaiHanNgach, loaiBang, dt });
            }
        }

        // Method get reward list
        public static DataTable GetRewardList(int hinhThuc, int tuNam, int denNam, string donVi, int dienCanBo, int khoiCanBo)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_search_rewards]",
                    new string[] { "@hinhthuc", "@tuNam", "@denNam", "@donvi", "@dcb", "@kcb" },
                    new object[] { hinhThuc, tuNam, denNam, donVi, dienCanBo, khoiCanBo });
            }
        }

        // Lay du lieu de lam bao cao loai 1.1: Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính.
        public static DataTable GetDataTableToReport_Type_1_1(string ma_dv, int diencb)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_1]",
                    new string[] { "@ma_dv", "@diencb" },
                    new object[] { ma_dv, diencb });
            }
        }
    }
}
