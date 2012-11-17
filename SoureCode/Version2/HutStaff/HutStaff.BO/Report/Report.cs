﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Report
{
    public class Report
    {
        public static DataTable GetSalaryIncrementList(int loaiHanNgach, int loaiBang, int thang, int nam)
        {
            return DAL.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);
        }

        public static DataTable GetRewardList(int hinhThuc, int tuNam, int denNam, string donVi, int dienCanBo, int khoiCanBo)
        {
            return DAL.Report.Report.GetRewardList(hinhThuc, tuNam, denNam, donVi, dienCanBo, khoiCanBo);
        }

        public static DataTable GetDataTableToReport_Type_1_1(string ma_dv, int diencb, int tt)
        {
            return DAL.Report.Report.GetDataTableToReport_Type_1_1(ma_dv, diencb, tt);
        }
    }
}
