using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.Report
{
    public interface IExportData
    {
        string GetHtmlContent_Report_Type_1_1(string madv, string dcb, string tt);
    }
}
