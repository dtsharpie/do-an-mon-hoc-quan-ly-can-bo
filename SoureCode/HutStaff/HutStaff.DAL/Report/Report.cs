﻿using System;
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
                thoiGian = "00:00:00 0" + thang.ToString() + "/01/" + nam.ToString();
            }
            else
            {
                thoiGian = "00:00:00 " + thang.ToString() + "/01/" + nam.ToString();
            }
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_report_get_salary_increment_list]",
                    new string[] { "@loaiHanNgach", "@loaiBang", "@thoiGian" },
                    new object[] { loaiHanNgach, loaiBang, thoiGian });
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
    }
}
