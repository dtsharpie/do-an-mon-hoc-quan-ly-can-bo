using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Data;

namespace HutStaff.BO.Report
{
    public class ExportData : IExportData
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
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_1.xml");
            strHtmlContent += File.ReadAllText(path);

            int stt = 0;
            string maNgachHienTai = "";
            string tenNgachHienTai = "";
            DateTime dateTime;
            int tuoi;
            int nam30 = 0, nu30 = 0, nam31_40 = 0, nu31_40 = 0, nam41_45 = 0, nu41_45 = 0, nam46_50 = 0, nu46_50 = 0, nam51_55 = 0, nu51_55 = 0, nam56_60 = 0, nu56_60 = 0, nam60 = 0, nu60 = 0;


            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_1(madv, dcb, tt);

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
                    strTempElement = strTempElement.Replace("$nam30", nam30 > 0 ? nam30.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu30", nu30 > 0 ? nu30.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam31_40", nam31_40 > 0 ? nam31_40.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu31_40", nu31_40 > 0 ? nu31_40.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam41_45", nam41_45 > 0 ? nam41_45.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu41_45", nu41_45 > 0 ? nu41_45.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam46_50", nam46_50 > 0 ? nam46_50.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu46_50", nu46_50 > 0 ? nu46_50.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam51_55", nam51_55 > 0 ? nam51_55.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu51_55", nu51_55 > 0 ? nu51_55.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam56_60", nam56_60 > 0 ? nam56_60.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu56_60", nu56_60 > 0 ? nu56_60.ToString() : "");
                    strTempElement = strTempElement.Replace("$nam60", nam60 > 0 ? nam60.ToString() : "");
                    strTempElement = strTempElement.Replace("$nu60", nu60 > 0 ? nu60.ToString() : "");
                    strHtmlContent += strTempElement;

                    // Neu co du 15 dong thi sang trang moi
                    if (stt % 15 == 0)
                    {
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                        strHtmlContent += File.ReadAllText(path);
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_1.xml");
                        strHtmlContent += File.ReadAllText(path);
                    }

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
            strTempElement = strTempElement.Replace("$nam30", nam30 > 0 ? nam30.ToString() : "");
            strTempElement = strTempElement.Replace("$nu30", nu30 > 0 ? nu30.ToString() : "");
            strTempElement = strTempElement.Replace("$nam31_40", nam31_40 > 0 ? nam31_40.ToString() : "");
            strTempElement = strTempElement.Replace("$nu31_40", nu31_40 > 0 ? nu31_40.ToString() : "");
            strTempElement = strTempElement.Replace("$nam41_45", nam41_45 > 0 ? nam41_45.ToString() : "");
            strTempElement = strTempElement.Replace("$nu41_45", nu41_45 > 0 ? nu41_45.ToString() : "");
            strTempElement = strTempElement.Replace("$nam46_50", nam46_50 > 0 ? nam46_50.ToString() : "");
            strTempElement = strTempElement.Replace("$nu46_50", nu46_50 > 0 ? nu46_50.ToString() : "");
            strTempElement = strTempElement.Replace("$nam51_55", nam51_55 > 0 ? nam51_55.ToString() : "");
            strTempElement = strTempElement.Replace("$nu51_55", nu51_55 > 0 ? nu51_55.ToString() : "");
            strTempElement = strTempElement.Replace("$nam56_60", nam56_60 > 0 ? nam56_60.ToString() : "");
            strTempElement = strTempElement.Replace("$nu56_60", nu56_60 > 0 ? nu56_60.ToString() : "");
            strTempElement = strTempElement.Replace("$nam60", nam60 > 0 ? nam60.ToString() : "");
            strTempElement = strTempElement.Replace("$nu60", nu60 > 0 ? nu60.ToString() : "");
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Báo cáo chất lượng cán bộ công chức 1
        public string GetHtmlContent_Report_Type_1_2(string madv, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_2.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bao cao chat luong can bo cong chuc 1");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", "Đại Học Bách Khoa Hà Nội");
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "BÁO CÁO CHẤT LƯỢNG CÁN BỘ CÔNG CHỨC 1");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_2.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_2(madv, dcb, tt);

            string ma_dvql = "";
            string tendonvi1 = "";
            int stt = 0;
            int tongso = 0, qlnn = 0, gd = 0, k = 0, cvcc = 0, cvch = 0, cv = 0, gvcc = 0, gvch = 0, gv = 0, csu = 0, kscc = 0, ksch = 0, ks = 0, conlai = 0, td30 = 0, t30_50 = 0, tt50 = 0;
            int tong_tongso = 0, tong_qlnn = 0, tong_gd = 0, tong_k = 0, tong_cvcc = 0, tong_cvch = 0, tong_cv = 0, tong_gvcc = 0, tong_gvch = 0, tong_gv = 0, tong_csu = 0, tong_kscc = 0, tong_ksch = 0, tong_ks = 0, tong_conlai = 0, tong_td30 = 0, tong_t30_50 = 0, tong_tt50 = 0;
            int i = 0;
            int pagenum = 1;
            int tuoi = 0;

            foreach (DataRow row in dataTable.Rows)
            {
                if (row["ma_dvql"].ToString().Length < 1)
                {
                    continue;
                }
                if (stt == 0)
                {
                    tendonvi1 = row["dv"].ToString();
                    ma_dvql = row["ma_dvql"].ToString();
                    stt = 1;
                }
                if (row["ma_dvql"].ToString().CompareTo(ma_dvql) != 0)
                {
                    if (i == 15)
                    {
                        i = 0;
                        pagenum++;
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                        strHtmlContent += File.ReadAllText(path);
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_2.xml");
                        strHtmlContent += File.ReadAllText(path);
                    }

                    gd = gvcc + gvch + gv;
                    qlnn = cvcc + cvch + cv;
                    k = tongso - gd - qlnn;

                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$tendonvi1", tendonvi1.ToString());
                    strTempElement = strTempElement.Replace("$tongso", tongso.ToString());
                    strTempElement = strTempElement.Replace("$qlnn", qlnn.ToString());
                    strTempElement = strTempElement.Replace("$gd", gd.ToString());
                    strTempElement = strTempElement.Replace("$k_k", k.ToString());
                    strTempElement = strTempElement.Replace("$cvcc", cvcc.ToString());
                    strTempElement = strTempElement.Replace("$cvch", cvch.ToString());
                    strTempElement = strTempElement.Replace("$cv_cv", cv.ToString());
                    strTempElement = strTempElement.Replace("$gvcc", gvcc.ToString());
                    strTempElement = strTempElement.Replace("$gvch", gvch.ToString());
                    strTempElement = strTempElement.Replace("$gv_gv", gv.ToString());
                    strTempElement = strTempElement.Replace("$csu", csu.ToString());
                    strTempElement = strTempElement.Replace("$kscc", kscc.ToString());
                    strTempElement = strTempElement.Replace("$ksch", ksch.ToString());
                    strTempElement = strTempElement.Replace("$ks_ks", ks.ToString());
                    strTempElement = strTempElement.Replace("$conlai", conlai.ToString());
                    strTempElement = strTempElement.Replace("$td30", td30.ToString());
                    strTempElement = strTempElement.Replace("$t30_50", t30_50.ToString());
                    strTempElement = strTempElement.Replace("$tt50", tt50.ToString());

                    strHtmlContent += strTempElement;

                    //Tinh tong cong
                    tong_tongso += tongso;
                    tong_qlnn += qlnn;
                    tong_gd += gd;
                    tong_k += k;
                    tong_cvcc += cvcc;
                    tong_cvch += cvch;
                    tong_cv += cv;
                    tong_gvcc += gvcc;
                    tong_gvch += gvch;
                    tong_gv += gv;
                    tong_csu += csu;
                    tong_kscc += kscc;
                    tong_ksch += ksch;
                    tong_ks += ks;
                    tong_conlai += conlai;
                    tong_td30 += td30;
                    tong_t30_50 += t30_50;
                    tong_tt50 += tt50;

                    //Nhap gia tri ban dau
                    tongso = 0;
                    qlnn = 0;
                    gd = 0;
                    k = 0;
                    cvcc = 0;
                    cvch = 0;
                    cv = 0;
                    gvcc = 0;
                    gvch = 0;
                    gv = 0;
                    csu = 0;
                    kscc = 0;
                    ksch = 0;
                    ks = 0;
                    conlai = 0;
                    td30 = 0;
                    t30_50 = 0;
                    tt50 = 0;

                    //Nhap ma_dvql va tendonvi moi
                    ma_dvql = row["ma_dvql"].ToString();
                    tendonvi1 = row["dv"].ToString();
                    stt++;
                    i++;
                }
                //Nhap gia tri cho cac bien
                tongso +=1;        
                if (row["ma_ngach"].ToString().CompareTo("01001") == 0)
                    cvcc +=1;
                else if (row["ma_ngach"].ToString().CompareTo("01002") == 0)
                    cvch +=1;
                else if (row["ma_ngach"].ToString().CompareTo("01003") == 0)
                    cv +=1;
                else if (row["ma_ngach"].ToString().CompareTo("15109") == 0)
                    gvcc +=1;
                else if (row["ma_ngach"].ToString().CompareTo("15110") == 0)
                    gvch +=1;
                else if (row["ma_ngach"].ToString().CompareTo("15111") == 0)
                    gv +=1;
                else if (row["ma_ngach"].ToString().CompareTo("01004") == 0)
                    csu +=1;
                else if (row["ma_ngach"].ToString().CompareTo("13093") == 0)
                    kscc +=1;
                else if (row["ma_ngach"].ToString().CompareTo("13094") == 0)
                    ksch +=1;
                else if (row["ma_ngach"].ToString().CompareTo("13095") == 0)
                    ks +=1;
                else
                    conlai +=1;
                
                DateTime dateTime = (DateTime)row["ntns"];
                tuoi = DateTime.Now.Year - dateTime.Year;
                if ( tuoi <30 )
                    td30 +=1;
                else if ( tuoi <=50 )
                    t30_50 +=1;
                else
                    tt50 +=1;
            }

            if(ma_dvql.Length > 0)
            {
                stt++;
                gd=gvcc+gvch+gv;
                qlnn=cvcc+cvch+cv;
                k=tongso-gd-qlnn;

                strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$tendonvi1", tendonvi1.ToString());
                    strTempElement = strTempElement.Replace("$tongso", tongso.ToString());
                    strTempElement = strTempElement.Replace("$qlnn", qlnn.ToString());
                    strTempElement = strTempElement.Replace("$gd", gd.ToString());
                    strTempElement = strTempElement.Replace("$k_k", k.ToString());
                    strTempElement = strTempElement.Replace("$cvcc", cvcc.ToString());
                    strTempElement = strTempElement.Replace("$cvch", cvch.ToString());
                    strTempElement = strTempElement.Replace("$cv_cv", cv.ToString());
                    strTempElement = strTempElement.Replace("$gvcc", gvcc.ToString());
                    strTempElement = strTempElement.Replace("$gvch", gvch.ToString());
                    strTempElement = strTempElement.Replace("$gv_gv", gv.ToString());
                    strTempElement = strTempElement.Replace("$csu", csu.ToString());
                    strTempElement = strTempElement.Replace("$kscc", kscc.ToString());
                    strTempElement = strTempElement.Replace("$ksch", ksch.ToString());
                    strTempElement = strTempElement.Replace("$ks_ks", ks.ToString());
                    strTempElement = strTempElement.Replace("$conlai", conlai.ToString());
                    strTempElement = strTempElement.Replace("$td30", td30.ToString());
                    strTempElement = strTempElement.Replace("$t30_50", t30_50.ToString());
                    strTempElement = strTempElement.Replace("$tt50", tt50.ToString());

                    strHtmlContent += strTempElement;

                stt++;
                i++;

                //Tinh tong cong
                    tong_tongso += tongso;
                    tong_qlnn += qlnn;
                    tong_gd += gd;
                    tong_k += k;
                    tong_cvcc += cvcc;
                    tong_cvch += cvch;
                    tong_cv += cv;
                    tong_gvcc += gvcc;
                    tong_gvch += gvch;
                    tong_gv += gv;
                    tong_csu += csu;
                    tong_kscc += kscc;
                    tong_ksch += ksch;
                    tong_ks += ks;
                    tong_conlai += conlai;
                    tong_td30 += td30;
                    tong_t30_50 += t30_50;
                    tong_tt50 += tt50;

                strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$tendonvi1", "Tổng số");
                    strTempElement = strTempElement.Replace("$tongso", tong_tongso.ToString());
                    strTempElement = strTempElement.Replace("$qlnn", tong_qlnn.ToString());
                    strTempElement = strTempElement.Replace("$gd", tong_gd.ToString());
                    strTempElement = strTempElement.Replace("$k_k", tong_k.ToString());
                    strTempElement = strTempElement.Replace("$cvcc", tong_cvcc.ToString());
                    strTempElement = strTempElement.Replace("$cvch", tong_cvch.ToString());
                    strTempElement = strTempElement.Replace("$cv_cv", tong_cv.ToString());
                    strTempElement = strTempElement.Replace("$gvcc", tong_gvcc.ToString());
                    strTempElement = strTempElement.Replace("$gvch", tong_gvch.ToString());
                    strTempElement = strTempElement.Replace("$gv_gv", tong_gv.ToString());
                    strTempElement = strTempElement.Replace("$csu", tong_csu.ToString());
                    strTempElement = strTempElement.Replace("$kscc", tong_kscc.ToString());
                    strTempElement = strTempElement.Replace("$ksch", tong_ksch.ToString());
                    strTempElement = strTempElement.Replace("$ks_ks", tong_ks.ToString());
                    strTempElement = strTempElement.Replace("$conlai", tong_conlai.ToString());
                    strTempElement = strTempElement.Replace("$td30", tong_td30.ToString());
                    strTempElement = strTempElement.Replace("$t30_50", tong_t30_50.ToString());
                    strTempElement = strTempElement.Replace("$tt50", tong_tt50.ToString());

                    strHtmlContent += strTempElement;
            }
            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion
    }
}
