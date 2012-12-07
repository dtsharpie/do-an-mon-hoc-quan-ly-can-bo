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
        // Danh sách cán bộ không thuộc ngạch cao cấp và chính đề nghị nâng lương
        string GetHtmlContent_Report_Type_3_3(string madv, string tendonvi, string dcb, string tt);
        // Danh sách cán bộ có hệ lương tột khung
        string GetHtmlContent_Report_Type_3_4(string madv, string tendonvi, string dcb, string tt);

        // Báo cáo chất lượng cán bộ công chức chia theo lĩnh vực
        string GetHtmlContent_Report_Type_4_1(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo chất lượng cán bộ công chức chia theo đơn vị
        string GetHtmlContent_Report_Type_4_2(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo số lượng công chức giữ các chức vụ lãnh đạo do bổ nhiệm
        string GetHtmlContent_Report_Type_4_3(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo danh sách và tiền lương cán bộ công chức
        string GetHtmlContent_Report_Type_4_4(string madv, string tendonvi, string dcb, string tt);
        // Báo cáo tổng hợp ngạch, bậc và phụ cấp công chức
        string GetHtmlContent_Report_Type_4_5(string madv, string tendonvi, string dcb, string tt);

        // Thống kê Thành tích khen thưởng
        string GetHtmlContent_Report_Type_5_1(string madv, string tendonvi, string dcb, string tt, int dkt);
    }
}
