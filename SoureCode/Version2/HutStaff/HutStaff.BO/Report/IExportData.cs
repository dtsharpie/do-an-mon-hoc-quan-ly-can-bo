﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.Report
{
    public interface IExportData
    {
        // Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính
        string GetHtmlContent_Report_Type_1_1(string madv, string dcb, string tt);
        // Báo cáo chất lượng cán bộ công chức 1
        string GetHtmlContent_Report_Type_1_2(string madv, string dcb, string tt);
    }
}
