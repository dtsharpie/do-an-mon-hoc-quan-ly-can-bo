using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Data;

namespace HutStaff.BO.Report
{
    public class ExportData: IExportData
    {
        #region Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính
        public string GetHtmlContent_Report_Type_1_1(string madv, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_1.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bieu phan loai can bo cong chuc theo ngach, do tuoi va gioi tinh");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", "Đại Học Bách Khoa Hà Nội");
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "BIỂU PHÂN LOẠI CÁN BỘ CÔNG CHỨC THEO NGẠCH, ĐỘ TUỔI VÀ GIỚI TÍNH");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));

            int stt = 0;
            string maNgachHienTai = "";
            string tenNgachHienTai = "";
            DateTime dateTime;
            int tuoi;
            int nam30 = 0, nu30 = 0, nam31_40 = 0, nu31_40 = 0, nam41_45 = 0, nu41_45 = 0, nam46_50 = 0, nu46_50 = 0, nam51_55 = 0, nu51_55 = 0, nam56_60 = 0, nu56_60 = 0, nam60 = 0, nu60 = 0;


            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_1(madv, int.Parse(dcb), int.Parse(tt));

            foreach (DataRow row in dataTable.Rows)
            {

                if (stt == 0)
                {
                    stt = 1;
                    maNgachHienTai = row["ma_ngach"].ToString();
                }
                if (row["ma_ngach"].ToString() == maNgachHienTai)
                {
                    tenNgachHienTai = row["ngach"].ToString();
                    if (tenNgachHienTai.Length == 0)
                    {
                        tenNgachHienTai = "Không rõ";
                    }
                    dateTime = (DateTime)row["ntns"];
                    tuoi = DateTime.Now.Year - dateTime.Year;
                    if (tuoi <= 30)
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam30 += 1;
                        }
                        else
                        {
                            nu30 += 1;
                        }
                    }
                    if ((tuoi > 30) && (tuoi < 41))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam31_40 += 1;
                        }
                        else
                        {
                            nu31_40 += 1;
                        }
                    }
                    if ((tuoi > 40) && (tuoi < 46))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam41_45 += 1;
                        }
                        else
                        {
                            nu41_45 += 1;
                        }
                    }
                    if ((tuoi > 45) && (tuoi < 51))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam46_50 += 1;
                        }
                        else
                        {
                            nu46_50 += 1;
                        }
                    }
                    if ((tuoi > 50) && (tuoi < 56))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam51_55 += 1;
                        }
                        else
                        {
                            nu51_55 += 1;
                        }
                    }
                    if ((tuoi > 55) && (tuoi < 61))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam56_60 += 1;
                        }
                        else
                        {
                            nu56_60 += 1;
                        }
                    }
                    if (tuoi > 60)
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam60 += 1;
                        }
                        else
                        {
                            nu60 += 1;
                        }
                    }
                }
                else
                {
                    // In dong truoc
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$ngach", tenNgachHienTai);
                    strTempElement = strTempElement.Replace("$nam30", nam30.ToString());
                    strTempElement = strTempElement.Replace("$nu30", nu30.ToString());
                    strTempElement = strTempElement.Replace("$nam31_40", nam31_40.ToString());
                    strTempElement = strTempElement.Replace("$nu31_40", nu31_40.ToString());
                    strTempElement = strTempElement.Replace("$nam41_45", nam41_45.ToString());
                    strTempElement = strTempElement.Replace("$nu41_45", nu41_45.ToString());
                    strTempElement = strTempElement.Replace("$nam46_50", nam46_50.ToString());
                    strTempElement = strTempElement.Replace("$nu46_50", nu46_50.ToString());
                    strTempElement = strTempElement.Replace("$nam51_55", nam51_55.ToString());
                    strTempElement = strTempElement.Replace("$nu51_55", nu51_55.ToString());
                    strTempElement = strTempElement.Replace("$nam56_60", nam56_60.ToString());
                    strTempElement = strTempElement.Replace("$nu56_60", nu56_60.ToString());
                    strTempElement = strTempElement.Replace("$nam60", nam60.ToString());
                    strTempElement = strTempElement.Replace("$nu60", nu60.ToString());
                    strHtmlContent += strTempElement;

                    // Tinh toan tiep
                    stt++;
                    maNgachHienTai = row["ma_ngach"].ToString();
                    dateTime = (DateTime)row["ntns"];
                    tuoi = DateTime.Now.Year - dateTime.Year;
                    tenNgachHienTai = row["ngach"].ToString();
                    nam30 = nu30 = nam31_40 = nu31_40 = nam41_45 = nu41_45 = nam46_50 = nu46_50 = nam51_55 = nu51_55 = nam56_60 = nu56_60 = nam60 = nu60 = 0;
                    if (tuoi <= 30)
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam30 += 1;
                        }
                        else
                        {
                            nu30 += 1;
                        }
                    }
                    if ((tuoi > 30) && (tuoi < 41))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam31_40 += 1;
                        }
                        else
                        {
                            nu31_40 += 1;
                        }
                    }
                    if ((tuoi > 40) && (tuoi < 46))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam41_45 += 1;
                        }
                        else
                        {
                            nu41_45 += 1;
                        }
                    }
                    if ((tuoi > 45) && (tuoi < 51))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam46_50 += 1;
                        }
                        else
                        {
                            nu46_50 += 1;
                        }
                    }
                    if ((tuoi > 50) && (tuoi < 56))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam51_55 += 1;
                        }
                        else
                        {
                            nu51_55 += 1;
                        }
                    }
                    if ((tuoi > 55) && (tuoi < 61))
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam56_60 += 1;
                        }
                        else
                        {
                            nu56_60 += 1;
                        }
                    }
                    if (tuoi > 60)
                    {
                        if (row["gt"].ToString() == "1")
                        {
                            nam60 += 1;
                        }
                        else
                        {
                            nu60 += 1;
                        }
                    }
                }
            }
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$ngach", tenNgachHienTai);
            strTempElement = strTempElement.Replace("$nam30", nam30.ToString());
            strTempElement = strTempElement.Replace("$nu30", nu30.ToString());
            strTempElement = strTempElement.Replace("$nam31_40", nam31_40.ToString());
            strTempElement = strTempElement.Replace("$nu31_40", nu31_40.ToString());
            strTempElement = strTempElement.Replace("$nam41_45", nam41_45.ToString());
            strTempElement = strTempElement.Replace("$nu41_45", nu41_45.ToString());
            strTempElement = strTempElement.Replace("$nam46_50", nam46_50.ToString());
            strTempElement = strTempElement.Replace("$nu46_50", nu46_50.ToString());
            strTempElement = strTempElement.Replace("$nam51_55", nam51_55.ToString());
            strTempElement = strTempElement.Replace("$nu51_55", nu51_55.ToString());
            strTempElement = strTempElement.Replace("$nam56_60", nam56_60.ToString());
            strTempElement = strTempElement.Replace("$nu56_60", nu56_60.ToString());
            strTempElement = strTempElement.Replace("$nam60", nam60.ToString());
            strTempElement = strTempElement.Replace("$nu60", nu60.ToString());
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion
    }
}
