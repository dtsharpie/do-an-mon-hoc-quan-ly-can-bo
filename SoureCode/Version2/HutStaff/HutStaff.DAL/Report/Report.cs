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
        public static DataTable GetDataTableToReport_Type_1_1(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_1]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 1.2: Báo cáo chất lượng cán bộ công chức 1
        public static DataTable GetDataTableToReport_Type_1_2(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_2]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 1.3: Báo cáo chất lượng cán bộ công chức 2
        public static DataTable GetDataTableToReport_Type_1_3(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_3]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 1.4: Danh sách cán bộ hưởng lương chức vụ
        public static DataTable GetDataTableToReport_Type_1_4(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_4]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 1.5: Thống kê đội ngũ cán bộ khoa học nghiệp vụ
        public static DataTable GetDataTableToReport_Type_1_5(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_1_5]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 2.1: Danh sách cán bộ đến tuổi nghỉ hưu
        public static DataTable GetDataTableToReport_Type_2_1(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_2_1]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 2.2: Báo cáo ngạch, bậc công chức, viên chức
        public static DataTable GetDataTableToReport_Type_2_2(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_2_2]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 2.3: Báo cáo kỷ luật
        public static DataTable GetDataTableToReport_Type_2_3(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_2_3]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 3.1: Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương
        public static DataTable GetDataTableToReport_Type_3_1(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_3_1]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 3.2: Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương
        public static DataTable GetDataTableToReport_Type_3_2(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_3_2]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 3.3: Danh sách cán bộ không thuộc ngạch cao cấp và chính đề nghị nâng lương
        public static DataTable GetDataTableToReport_Type_3_3(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_3_3]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }

        // Lay du lieu de lam bao cao loai 3.4: Danh sách cán bộ có hệ lương tột khung
        public static DataTable GetDataTableToReport_Type_3_4(string ma_dv, string diencb, string tt)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_type_3_4]",
                    new string[] { "@ma_dv", "@dcb", "@tt" },
                    new object[] { ma_dv, diencb, tt });
            }
        }
    }
}
