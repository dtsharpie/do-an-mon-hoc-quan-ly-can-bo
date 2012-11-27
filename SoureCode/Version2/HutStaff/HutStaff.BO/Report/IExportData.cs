using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.Report
{
    public interface IExportData
    {
        // Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính
        string GetHtmlContent_Report_Type_1_1(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo chất lượng cán bộ công chức 1
        string GetHtmlContent_Report_Type_1_2(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo chất lượng cán bộ công chức 2
        string GetHtmlContent_Report_Type_1_3(string madv, string tendonvi, string dcb, string tt);
        // Danh sách cán bộ hưởng lương chức vụ
        string GetHtmlContent_Report_Type_1_4(string madv, string tendonvi, string dcb, string tt);
        // Thống kê đội ngũ cán bộ khoa học nghiệp vụ
        string GetHtmlContent_Report_Type_1_5(string madv, string tendonvi, string dcb, string tt);

        // Danh sách cán bộ đến tuổi nghỉ hưu
        string GetHtmlContent_Report_Type_2_1(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo ngạch, bậc công chức, viên chức
        string GetHtmlContent_Report_Type_2_2(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo kỷ luật
        string GetHtmlContent_Report_Type_2_3(string madv, string tendonvi, string dcb, string tt);

        // Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương
        string GetHtmlContent_Report_Type_3_1(string madv, string tendonvi, string dcb, string tt);
        // Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương
        string GetHtmlContent_Report_Type_3_2(string madv, string tendonvi, string dcb, string tt);
    }
}
