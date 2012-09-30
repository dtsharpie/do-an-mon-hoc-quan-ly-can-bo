using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace QLCB_BK.BO.Report
{
    public class Report
    {
        public static DataTable GetSalaryIncrementList(int loaiHanNgach, int loaiBang, int thang, int nam)
        {
            return DAL.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);
        }
    }
}
