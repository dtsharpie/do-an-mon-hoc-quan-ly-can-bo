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
        // ------------------------------------------------------------------
        #region Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính
        public string GetHtmlContent_Report_Type_1_1(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_1.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bieu phan loai can bo cong chuc theo ngach, do tuoi va gioi tinh");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
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
        public string GetHtmlContent_Report_Type_1_2(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_2.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bao cao chat luong can bo cong chuc 1");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
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
                tongso += 1;
                if (row["ma_ngach"].ToString().CompareTo("01001") == 0)
                    cvcc += 1;
                else if (row["ma_ngach"].ToString().CompareTo("01002") == 0)
                    cvch += 1;
                else if (row["ma_ngach"].ToString().CompareTo("01003") == 0)
                    cv += 1;
                else if (row["ma_ngach"].ToString().CompareTo("15109") == 0)
                    gvcc += 1;
                else if (row["ma_ngach"].ToString().CompareTo("15110") == 0)
                    gvch += 1;
                else if (row["ma_ngach"].ToString().CompareTo("15111") == 0)
                    gv += 1;
                else if (row["ma_ngach"].ToString().CompareTo("01004") == 0)
                    csu += 1;
                else if (row["ma_ngach"].ToString().CompareTo("13093") == 0)
                    kscc += 1;
                else if (row["ma_ngach"].ToString().CompareTo("13094") == 0)
                    ksch += 1;
                else if (row["ma_ngach"].ToString().CompareTo("13095") == 0)
                    ks += 1;
                else
                    conlai += 1;

                DateTime dateTime = (DateTime)row["ntns"];
                tuoi = DateTime.Now.Year - dateTime.Year;
                if (tuoi < 30)
                    td30 += 1;
                else if (tuoi <= 50)
                    t30_50 += 1;
                else
                    tt50 += 1;
            }

            if (ma_dvql.Length > 0)
            {
                stt++;
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

        #region Báo cáo chất lượng cán bộ công chức 2
        public string GetHtmlContent_Report_Type_1_3(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_3.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bao cao chat luong can bo cong chuc 2");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "BÁO CÁO CHẤT LƯỢNG CÁN BỘ CÔNG CHỨC 2");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_3.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_3(madv, dcb, tt);

            string shcc = "";
            string tendonvi1 = "";
            string ma_dvql = "";

            int dv = 0;
            int pn = 0;
            int dt = 0;
            int hh_gs = 0;
            int hh_pgs = 0;
            int cmnv_ts = 0;
            int cmnv_tskh = 0;
            int cmnv_ths = 0;
            int cmnv_dhcd = 0;
            int ct_cc = 0;
            int ct_tc = 0;
            int nn_av_cn = 0;
            int nn_av_cs = 0;
            int nn_nnk_cn = 0;
            int nn_nnk_cs = 0;

            int stt = 0;
            int i = 0;
            int pagenum = 1;

            int cmnv_tskh_start = 0, cmnv_ts_start = 0,
                cmnv_ths_start = 0, cmnv_dhcd_start = 0,
                nn_av_cn_start = 0, nn_av_cs_start = 0,
                nn_nnk_start = 0;
            int tong_dv = 0;
            int tong_pn = 0;
            int tong_dt = 0;
            int tong_hh_gs = 0;
            int tong_hh_pgs = 0;
            int tong_cmnv_ts = 0;
            int tong_cmnv_tskh = 0;
            int tong_cmnv_ths = 0;
            int tong_cmnv_dhcd = 0;
            int tong_ct_cc = 0;
            int tong_ct_tc = 0;
            int tong_nn_av_cn = 0;
            int tong_nn_av_cs = 0;
            int tong_nn_nnk_cn = 0;
            int tong_nn_nnk_cs = 0;

            foreach (DataRow row in dataTable.Rows)
            {
                if (row["shcc"].ToString().CompareTo(shcc) != 0)
                {
                    if (cmnv_tskh_start == 1)
                    {
                        if (cmnv_ts_start == 1)
                            cmnv_ts--;
                        if (cmnv_ths_start == 1)
                            cmnv_ths--;
                        if (cmnv_dhcd_start == 1)
                            cmnv_dhcd--;
                    }
                    else if (cmnv_ts_start == 1)
                    {
                        if (cmnv_ths_start == 1)
                            cmnv_ths--;
                        if (cmnv_dhcd_start == 1)
                            cmnv_dhcd--;
                    }
                    else if (cmnv_ths_start == 1)
                        if (cmnv_dhcd_start == 1)
                            cmnv_dhcd--;

                    if ((nn_av_cn_start == 1) && (nn_av_cs_start == 1))
                        nn_av_cs--;

                    nn_av_cs_start = nn_av_cn_start = nn_nnk_start = 0;
                    cmnv_ts_start = 0;
                    cmnv_tskh_start = 0;
                    cmnv_ths_start = 0;
                    cmnv_dhcd_start = 0;
                }

                if (row["ma_dvql"].ToString().Length < 1)
                    continue;

                //Gan gia tri ban dau
                if (stt == 0)
                {
                    ma_dvql = row["ma_dvql"].ToString();
                    tendonvi1 = row["dv"].ToString();
                    stt = 1;
                }

                //Neu sang dv moi thi in dong va khoi tao gia tri
                if (row["ma_dvql"].ToString().CompareTo(ma_dvql) != 0)
                {
                    // Sang trang
                    if (i == 15)
                    {
                        i = 0;
                        pagenum++;
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                        strHtmlContent += File.ReadAllText(path);
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_3.xml");
                        strHtmlContent += File.ReadAllText(path);
                    }

                    //In dong 
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$tendonvi1", tendonvi1);
                    strTempElement = strTempElement.Replace("$dv", dv.ToString());
                    strTempElement = strTempElement.Replace("$pn", pn.ToString());
                    strTempElement = strTempElement.Replace("$dt", dt.ToString());
                    strTempElement = strTempElement.Replace("$hh_gs", hh_gs.ToString());
                    strTempElement = strTempElement.Replace("$hh_pgs", hh_pgs.ToString());
                    strTempElement = strTempElement.Replace("$cmnv_tskh", cmnv_tskh.ToString());
                    strTempElement = strTempElement.Replace("$cmnv_ts", cmnv_ts.ToString());
                    strTempElement = strTempElement.Replace("$cmnv_ths", cmnv_ths.ToString());
                    strTempElement = strTempElement.Replace("$cmnv_dhcd", cmnv_dhcd.ToString());
                    strTempElement = strTempElement.Replace("$ct_cc", ct_cc.ToString());
                    strTempElement = strTempElement.Replace("$ct_tc", ct_tc.ToString());
                    strTempElement = strTempElement.Replace("$nn_av_cn", nn_av_cn.ToString());
                    strTempElement = strTempElement.Replace("$nn_av_cs", nn_av_cs.ToString());
                    strTempElement = strTempElement.Replace("$nn_nnk_cn", nn_nnk_cn.ToString());
                    strTempElement = strTempElement.Replace("$nn_nnk_cs", nn_nnk_cs.ToString());
                    strHtmlContent += strTempElement;

                    //Tinh toan gia tri tong cong
                    tong_dv += dv;
                    tong_pn += pn;
                    tong_dt += dt;
                    tong_hh_gs += hh_gs;
                    tong_hh_pgs += hh_pgs;
                    tong_cmnv_ts += cmnv_ts;
                    tong_cmnv_tskh += cmnv_tskh;
                    tong_cmnv_ths += cmnv_ths;
                    tong_cmnv_dhcd += cmnv_dhcd;
                    tong_ct_cc += ct_cc;
                    tong_ct_tc += ct_tc;
                    tong_nn_av_cn += nn_av_cn;
                    tong_nn_av_cs += nn_av_cs;
                    tong_nn_nnk_cn += nn_nnk_cn;
                    tong_nn_nnk_cs += nn_nnk_cs;

                    //Nhap gia tri ban dau
                    dv = 0;
                    pn = 0;
                    dt = 0;
                    hh_gs = 0;
                    hh_pgs = 0;
                    cmnv_ts = 0;
                    cmnv_tskh = 0;
                    cmnv_ths = 0;
                    cmnv_dhcd = 0;
                    ct_cc = 0;
                    ct_tc = 0;
                    nn_av_cn = 0;
                    nn_av_cs = 0;
                    nn_nnk_cn = 0;
                    nn_nnk_cs = 0;

                    //Nhap ma_dvql va tendonvi moi
                    ma_dvql = row["ma_dvql"].ToString();
                    tendonvi1 = row["dv"].ToString();
                    stt++;
                    i++;
                }

                //Nhap gia tri co cac bien
                if ((row["nct"].ToString().Length != 0) && (row["shcc"].ToString().CompareTo(shcc) != 0))  	//Kiem tra la Dang vien hay chua
                    dv += 1;

                if ((row["gt"].ToString().CompareTo("0") == 0) && (row["shcc"].ToString().CompareTo(shcc) != 0)) 	//Kiem tra la phu nu hay khong
                    pn += 1;

                if ((int.Parse(row["ma_dt"].ToString()) > 1) && (row["shcc"].ToString().CompareTo(shcc) != 0))	//Kiem tra la dan toc it nguoi hay khong
                    dt += 1;

                if ((row["ma_hhcn"].ToString().CompareTo("2") == 0) && (row["shcc"].ToString().CompareTo(shcc) != 0))	//Kiem tra hoc ham la giao su hay khong
                    hh_gs += 1;

                if ((row["ma_hhcn"].ToString().CompareTo("1") == 0) && (row["shcc"].ToString().CompareTo(shcc) != 0))	//Kiem tra hoc ham la pho giao su hay khong
                    hh_pgs += 1;

                if ((row["ma_hvcn"].ToString().CompareTo("61") == 0) && (cmnv_tskh_start == 0)) 	//La tien sy KH hay khong
                { cmnv_tskh += 1; cmnv_tskh_start = 1; }

                if ((row["ma_hvcn"].ToString().CompareTo("60") == 0) && (cmnv_ts_start == 0)) 	//La tien sy hay khong
                { cmnv_ts += 1; cmnv_ts_start = 1; }

                if ((row["ma_hvcn"].ToString().CompareTo("50") == 0) && (cmnv_ths_start == 0)) 	//La thac sy hay khong
                { cmnv_ths += 1; cmnv_ths_start = 1; }

                if (((row["ma_hvcn"].ToString().CompareTo("32") == 0) || (row["ma_hvcn"].ToString().CompareTo("42") == 0)) && (cmnv_dhcd_start == 0))	//La cu nhan, cao dang hay khong
                { cmnv_dhcd += 1; cmnv_dhcd_start = 1; }

                if ((row["ma_tdll"].ToString().CompareTo("01") == 0) && (row["shcc"].ToString().CompareTo(shcc) != 0))
                    ct_cc += 1;

                if ((row["ma_tdll"].ToString().CompareTo("02") == 0) && (row["shcc"].ToString().CompareTo(shcc) != 0))
                    ct_tc += 1;

                if (row["ma_td"] != null)
                {
                    if (row["ma_nn"].ToString().CompareTo("01") == 0 && ConvertStringToInt(row["ma_td"].ToString()) > 10 && nn_av_cn_start == 0)
                    { nn_av_cn += 1; nn_av_cn_start = 1; }
                    else if (row["ma_nn"].ToString().CompareTo("01") == 0 && ConvertStringToInt(row["ma_td"].ToString()) <= 10 && nn_av_cs_start == 0)
                    { nn_av_cs += 1; nn_av_cs_start = 1; }
                    else if (row["ma_nn"].ToString().CompareTo("01") != 0 && ConvertStringToInt(row["ma_td"].ToString()) > 10 && nn_nnk_start == 0)
                    { nn_nnk_cn += 1; nn_nnk_start = 1; }
                    else if (row["ma_nn"].ToString().CompareTo("01") != 0 && ConvertStringToInt(row["ma_td"].ToString()) < 10 && nn_nnk_start == 0)
                    { nn_nnk_cs += 1; nn_nnk_start = 1; }
                }

                shcc = row["shcc"].ToString();
            }

            if (cmnv_tskh_start == 1)
            {
                if (cmnv_ts_start == 1)
                    cmnv_ts--;
                if (cmnv_ths_start == 1)
                    cmnv_ths--;
                if (cmnv_dhcd_start == 1)
                    cmnv_dhcd--;
            }
            else if (cmnv_ts_start == 1)
            {
                if (cmnv_ths_start == 1)
                    cmnv_ths--;
                if (cmnv_dhcd_start == 1)
                    cmnv_dhcd--;
            }
            else if (cmnv_ths_start == 1)
                if (cmnv_dhcd_start == 1)
                    cmnv_dhcd--;

            // In dong cuoi
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$tendonvi1", tendonvi1);
            strTempElement = strTempElement.Replace("$dv", dv.ToString());
            strTempElement = strTempElement.Replace("$pn", pn.ToString());
            strTempElement = strTempElement.Replace("$dt", dt.ToString());
            strTempElement = strTempElement.Replace("$hh_gs", hh_gs.ToString());
            strTempElement = strTempElement.Replace("$hh_pgs", hh_pgs.ToString());
            strTempElement = strTempElement.Replace("$cmnv_tskh", cmnv_tskh.ToString());
            strTempElement = strTempElement.Replace("$cmnv_ts", cmnv_ts.ToString());
            strTempElement = strTempElement.Replace("$cmnv_ths", cmnv_ths.ToString());
            strTempElement = strTempElement.Replace("$cmnv_dhcd", cmnv_dhcd.ToString());
            strTempElement = strTempElement.Replace("$ct_cc", ct_cc.ToString());
            strTempElement = strTempElement.Replace("$ct_tc", ct_tc.ToString());
            strTempElement = strTempElement.Replace("$nn_av_cn", nn_av_cn.ToString());
            strTempElement = strTempElement.Replace("$nn_av_cs", nn_av_cs.ToString());
            strTempElement = strTempElement.Replace("$nn_nnk_cn", nn_nnk_cn.ToString());
            strTempElement = strTempElement.Replace("$nn_nnk_cs", nn_nnk_cs.ToString());
            strHtmlContent += strTempElement;

            //Tinh toan gia tri tong cong
            tong_dv += dv;
            tong_pn += pn;
            tong_dt += dt;
            tong_hh_gs += hh_gs;
            tong_hh_pgs += hh_pgs;
            tong_cmnv_ts += cmnv_ts;
            tong_cmnv_tskh += cmnv_tskh;
            tong_cmnv_ths += cmnv_ths;
            tong_cmnv_dhcd += cmnv_dhcd;
            tong_ct_cc += ct_cc;
            tong_ct_tc += ct_tc;
            tong_nn_av_cn += nn_av_cn;
            tong_nn_av_cs += nn_av_cs;
            tong_nn_nnk_cn += nn_nnk_cn;
            tong_nn_nnk_cs += nn_nnk_cs;

            // In dong tong cong
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$tendonvi1", "Tổng cộng");
            strTempElement = strTempElement.Replace("$dv", tong_dv.ToString());
            strTempElement = strTempElement.Replace("$pn", tong_pn.ToString());
            strTempElement = strTempElement.Replace("$dt", tong_dt.ToString());
            strTempElement = strTempElement.Replace("$hh_gs", tong_hh_gs.ToString());
            strTempElement = strTempElement.Replace("$hh_pgs", tong_hh_pgs.ToString());
            strTempElement = strTempElement.Replace("$cmnv_tskh", tong_cmnv_tskh.ToString());
            strTempElement = strTempElement.Replace("$cmnv_ts", tong_cmnv_ts.ToString());
            strTempElement = strTempElement.Replace("$cmnv_ths", tong_cmnv_ths.ToString());
            strTempElement = strTempElement.Replace("$cmnv_dhcd", tong_cmnv_dhcd.ToString());
            strTempElement = strTempElement.Replace("$ct_cc", tong_ct_cc.ToString());
            strTempElement = strTempElement.Replace("$ct_tc", tong_ct_tc.ToString());
            strTempElement = strTempElement.Replace("$nn_av_cn", tong_nn_av_cn.ToString());
            strTempElement = strTempElement.Replace("$nn_av_cs", tong_nn_av_cs.ToString());
            strTempElement = strTempElement.Replace("$nn_nnk_cn", tong_nn_nnk_cn.ToString());
            strTempElement = strTempElement.Replace("$nn_nnk_cs", tong_nn_nnk_cs.ToString());
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Danh sách cán bộ hưởng lương chức vụ
        public string GetHtmlContent_Report_Type_1_4(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_4.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Danh sach can bo huong luong chuc vu");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "DANH SÁCH CÁN BỘ HƯỞNG LƯƠNG CHỨC VỤ");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_4.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_4(madv, dcb, tt);

            int stt = 0;
            int i = 0;
            int flag = 0;
            int pagenum = 1;
            string shcc = "";
            string cv = "";
            string cu = "";
            string hh = "";
            string tdnn = "";
            string nbncvkn = "";
            string cv1 = "";
            string cu1 = "";
            string hh1 = "";
            string tdnn1 = "";
            string nbncvkn1 = "";
            string hoten = "";
            string gt = "";
            string dt = "";
            string tdll = "";
            string ntns = "";
            string tdcm = "";

            foreach (DataRow row in dataTable.Rows)
            {
                if (shcc.CompareTo("") == 0)
                {
                    hoten = row["hoten"].ToString();
                    if (row["gt"].ToString().CompareTo("1") == 0)
                        gt = "Nam";
                    else
                        gt = "Nữ";
                    dt = row["dt"].ToString();
                    tdll = row["tdll"].ToString();
                    DateTime dateTime = (DateTime)row["ntns"];
                    ntns = dateTime.ToString("dd/MM/yyyy");
                    tdcm = row["tdcm"].ToString();
                    shcc = row["shcc"].ToString();
                }

                //Xu li sang trang
                if (i == 15)
                {
                    i = 0;
                    pagenum++;
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                    strHtmlContent += File.ReadAllText(path);
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_4.xml");
                    strHtmlContent += File.ReadAllText(path);
                }

                // Neu sang can bo moi hoac khong phai ban ghi thu 1
                if (row["shcc"].ToString().CompareTo(shcc) != 0)
                {
                    stt++;
                    if (dt.Trim().Length == 0) dt = "";
                    if (cu.Trim().Length == 0) cu = "";
                    if (tdcm.Trim().Length == 0) tdcm = "";
                    if (hh.Trim().Length == 0) hh = "";
                    if (tdll.Trim().Length == 0) tdll = "";
                    if (tdnn.Trim().Length == 0) tdnn = "";
                    if (nbncvkn.Trim().Length == 0) nbncvkn = "";

                    //In dong bao cao
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$hoten", hoten);
                    strTempElement = strTempElement.Replace("$ntns", ntns);
                    strTempElement = strTempElement.Replace("$gt", gt);
                    strTempElement = strTempElement.Replace("$dt", dt);
                    strTempElement = strTempElement.Replace("$cv", cv);
                    strTempElement = strTempElement.Replace("$cu", cu);
                    strTempElement = strTempElement.Replace("$tdcm", tdcm);
                    strTempElement = strTempElement.Replace("$hh", hh);
                    strTempElement = strTempElement.Replace("$tdll", tdll);
                    strTempElement = strTempElement.Replace("$tdnn", tdnn);
                    strTempElement = strTempElement.Replace("$nbncvkn", nbncvkn);
                    strHtmlContent += strTempElement;

                    cv = cu = hh = tdnn = nbncvkn = "";
                    cv1 = cu1 = hh1 = tdnn1 = nbncvkn1 = "";
                    hoten = row["hoten"].ToString();
                    if (row["gt"].ToString().CompareTo("1") == 0)
                        gt = "Nam";
                    else
                        gt = "Nữ";
                    dt = row["dt"].ToString();
                    tdll = row["tdll"].ToString();
                    DateTime dateTime = (DateTime)row["ntns"];
                    ntns = dateTime.ToString("dd/MM/yyyy");
                    tdcm = row["tdcm"].ToString();
                }
                flag = 0;
                // Tinh toan voi truong lap
                string ma_cvStr = ";" + row["ma_cv"].ToString() + ";";
                if (!cv1.Contains(ma_cvStr))
                {
                    cv1 += ma_cvStr;
                    if (cv.Length == 0)
                        cv = row["cv"].ToString();
                    else
                        cv += ", " + row["cv"];
                    flag = 1;
                }
                string ma_cuStr = ";" + row["ma_cu"].ToString() + ";";
                if (!cu1.Contains(ma_cuStr) && row["cu"].ToString().Length > 0)
                {
                    cu1 += ma_cuStr;
                    if (cu.Length == 0)
                        cu = row["cu"].ToString();
                    else
                        cu += ", " + row["cu"].ToString();
                    flag = 1;
                }
                string ma_hhStr = ";" + row["ma_hh"].ToString() + ";";
                if (!hh1.Contains(ma_hhStr))
                {
                    hh1 += ";" + row["ma_hh"] + ";";
                    if (hh.Length == 0)
                        hh = row["hh"].ToString();
                    else
                        hh += ", " + row["hh"].ToString();
                    flag = 1;
                }
                string ma_nnStr = ";" + row["ma_td"].ToString() + ";";
                if (!tdnn1.Contains(ma_nnStr))
                {
                    tdnn1 += ";" + row["ma_td"].ToString() + ";";
                    if (tdnn == "")
                        tdnn = row["tdnn"].ToString();
                    else
                        tdnn += ", " + row["tdnn"];
                    flag = 1;
                }
                string nbncvknStr = ";" + row["nbncvkn"] + ";";
                if (!nbncvkn1.Contains(nbncvknStr) && row["nbncvkn"].ToString().Length > 0)
                {
                    nbncvkn1 += ";" + row["nbncvkn"] + ";";
                    DateTime nbncvknDt = (DateTime)row["nbncvkn"];
                    if (nbncvkn == "")
                        nbncvkn = nbncvknDt.ToString("dd/MM/yyyy");
                    else
                        nbncvkn += ", " + nbncvknDt.ToString("dd/MM/yyyy");
                    flag = 1;
                }
                if (flag == 1) i++;
                shcc = row["shcc"].ToString();
            }

            // In dong cuoi
            stt++;
            if (dt.Trim().Length == 0) dt = "";
            if (cu.Trim().Length == 0) cu = "";
            if (tdcm.Trim().Length == 0) tdcm = "";
            if (hh.Trim().Length == 0) hh = "";
            if (tdll.Trim().Length == 0) tdll = "";
            if (tdnn.Trim().Length == 0) tdnn = "";
            if (nbncvkn.Trim().Length == 0) nbncvkn = "";

            // In dong bao cao
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$hoten", hoten);
            strTempElement = strTempElement.Replace("$ntns", ntns);
            strTempElement = strTempElement.Replace("$gt", gt);
            strTempElement = strTempElement.Replace("$dt", dt);
            strTempElement = strTempElement.Replace("$cv", cv);
            strTempElement = strTempElement.Replace("$cu", cu);
            strTempElement = strTempElement.Replace("$tdcm", tdcm);
            strTempElement = strTempElement.Replace("$hh", hh);
            strTempElement = strTempElement.Replace("$tdll", tdll);
            strTempElement = strTempElement.Replace("$tdnn", tdnn);
            strTempElement = strTempElement.Replace("$nbncvkn", nbncvkn);
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Thống kê đội ngũ cán bộ khoa học nghiệp vụ
        public string GetHtmlContent_Report_Type_1_5(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_1_5.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Thong ke doi ngu can bo khoa hoc nghiep vu");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "THỐNG KÊ ĐỘI NGŨ CÁN BỘ KHOA HỌC NGHIỆP VỤ");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_1_5.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_5(madv, dcb, tt);

            string tdhv = "";
            string shcc = "";
            string listofshcc = " ;";
            int tong = 0;
            int ctl_dv = 0;
            int ctl_n = 0;
            int ctl_dt = 0;
            int tndt_tn = 0;
            int tndt_xhcn = 0;
            int tndt_nk = 0;
            int td_d30 = 0;
            int td_t30 = 0;
            int ncc_gvcc = 0;
            int ncc_gvc = 0;
            int ncc_gv = 0;
            int ncc_cl = 0;
            int nn_av = 0;
            int nn_nnk = 0;
            int ct_cc = 0;
            int ct_tc = 0;
            int length = 0;

            string tdnn = "";

            foreach (DataRow row in dataTable.Rows)
            {
                string shccStr = ";" + row["shcc"] + ";";
                if (listofshcc.Contains(shccStr))
                {
                    if (listofshcc.IndexOf(shccStr) > length)
                        if (tdnn != row["ma_nn"].ToString())
                            if (row["ma_nn"].ToString().CompareTo("01") == 0)
                                nn_av += 1;
                            else if (ConvertStringToInt(row["ma_nn"].ToString()) > 1)
                                nn_nnk += 1;
                    tdnn = row["ma_nn"].ToString();
                    continue;
                }
                if (tdhv.Length < 1)
                {
                    tdhv = row["vbdtcm"].ToString();
                }
                if (row["vbdtcm"].ToString().CompareTo(tdhv) == 0)
                {
                    /*Tiep tuc tinh toan*/
                    tdnn = row["ma_nn"].ToString();
                    listofshcc += row["shcc"] + ";";
                    tdhv = row["vbdtcm"].ToString();
                    shcc = row["shcc"].ToString();
                    tong += 1;
                    //print row["shcc"];
                    if (row["nct"] != null) /*Da vao Dang*/
                        ctl_dv += 1;
                    if (row["gt"].ToString().CompareTo("0") == 0) /*La nu gioi*/
                        ctl_n += 1;
                    if (row["ma_dt"].ToString().CompareTo("01") != 0)
                        ctl_dt += 1;

                    if (row["ndtcm"].ToString().CompareTo("001") == 0)
                        tndt_tn += 1;
                    else
                        tndt_nk += 1;

                    DateTime dt = (DateTime)row["ntns"];
                    int tuoiInt = DateTime.Now.Year - dt.Year;
                    if (tuoiInt < 30)
                        td_d30 += 1;
                    else
                        td_t30 += 1;

                    switch (row["ma_ngach"].ToString())
                    {
                        case "15109": /*Giang vien cao cap*/
                            ncc_gvcc += 1;
                            break;
                        case "15110": /*Giang vien chinh*/
                            ncc_gvc += 1;
                            break;
                        case "15111": /*Giang vien*/
                            ncc_gv += 1;
                            break;
                        default: /*Con lai*/
                            ncc_cl += 1;
                            break;
                    }
                    if (ConvertStringToInt(row["ma_nn"].ToString()) >= 1 && ConvertStringToInt(row["ma_nn"].ToString()) <= 8)
                        nn_av += 1;
                    else if (ConvertStringToInt(row["ma_nn"].ToString()) > 8)
                        nn_nnk += 1;
                    if (row["ma_tdll"].ToString().CompareTo("01") == 0)
                        ct_cc += 1;
                    else if (row["ma_tdll"].ToString().CompareTo("02") == 0)
                        ct_tc += 1;
                }
                else
                {
                    length = listofshcc.Length;
                    /*In dong, tinh cho dong moi*/
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$tdhv", tdhv.ToString());
                    strTempElement = strTempElement.Replace("$tong", tong.ToString());
                    strTempElement = strTempElement.Replace("$ctl_dv", ctl_dv.ToString());
                    strTempElement = strTempElement.Replace("$ctl_n", ctl_n.ToString());
                    strTempElement = strTempElement.Replace("$ctl_dt", ctl_dt.ToString());
                    strTempElement = strTempElement.Replace("$tndt_tn", tndt_tn.ToString());
                    strTempElement = strTempElement.Replace("$tndt_xhcn", tndt_xhcn.ToString());
                    strTempElement = strTempElement.Replace("$tndt_nk", tndt_nk.ToString());
                    strTempElement = strTempElement.Replace("$td_d30", td_d30.ToString());
                    strTempElement = strTempElement.Replace("$td_t30", td_t30.ToString());
                    strTempElement = strTempElement.Replace("$ncc_gvcc", ncc_gvcc.ToString());
                    strTempElement = strTempElement.Replace("$ncc_gvc", ncc_gvc.ToString());
                    strTempElement = strTempElement.Replace("$ncc_gv", ncc_gv.ToString());
                    strTempElement = strTempElement.Replace("$ncc_cl", ncc_cl.ToString());
                    strTempElement = strTempElement.Replace("$nn_av", nn_av.ToString());
                    strTempElement = strTempElement.Replace("$nn_nnk", nn_nnk.ToString());
                    strTempElement = strTempElement.Replace("$ct_cc", ct_cc.ToString());
                    strTempElement = strTempElement.Replace("$ct_tc", ct_tc.ToString());
                    strHtmlContent += strTempElement;

                    tdhv = row["vbdtcm"].ToString();
                    shcc = row["shcc"].ToString();
                    tong = ctl_dv = ctl_n = ctl_dt = 0;
                    tndt_tn = tndt_xhcn = tndt_nk = 0;
                    td_d30 = td_t30 = 0;
                    ncc_gvcc = ncc_gvc = ncc_gv = ncc_cl = 0;
                    nn_av = nn_nnk = 0;
                    ct_cc = ct_tc = 0;

                    string shccStr2 = ";" + row["shcc"] + ";";
                    if (listofshcc.Contains(shccStr2))
                        continue;

                    listofshcc += row["shcc"].ToString() + ";";

                    tong = 1;
                    tdnn = row["ma_nn"].ToString();
                    //print row["shcc"];
                    if (row["nct"] != null) /*Da vao Dang*/
                        ctl_dv += 1;
                    if (row["gt"].ToString().CompareTo("0") == 0) /*La nu gioi*/
                        ctl_n += 1;
                    if (row["ma_dt"].ToString().CompareTo("01") != 0)
                        ctl_dt += 1;

                    if (row["ndtcm"].ToString().CompareTo("001") == 0)
                        tndt_tn += 1;
                    else
                        tndt_nk += 1;

                    DateTime dt2 = (DateTime)row["ntns"];
                    int tuoiInt2 = DateTime.Now.Year - dt2.Year;
                    if (tuoiInt2 < 30)
                        td_d30 += 1;
                    else
                        td_t30 += 1;

                    switch (row["ma_ngach"].ToString())
                    {
                        case "15109": /*Giang vien cao cap*/
                            ncc_gvcc += 1;
                            break;
                        case "15110": /*Giang vien chinh*/
                            ncc_gvc += 1;
                            break;
                        case "15111": /*Giang vien*/
                            ncc_gv += 1;
                            break;
                        default: /*Con lai*/
                            ncc_cl += 1;
                            break;
                    }

                    if (ConvertStringToInt(row["ma_nn"].ToString()) >= 1 && ConvertStringToInt(row["ma_nn"].ToString()) <= 8)
                        nn_av += 1;
                    else if (ConvertStringToInt(row["ma_nn"].ToString()) > 8)
                        nn_nnk += 1;

                    if (row["ma_tdll"].ToString().CompareTo("01") == 0)
                        ct_cc += 1;
                    else if (row["ma_tdll"].ToString().CompareTo("02") == 0)
                        ct_tc += 1;
                }
            }

            // In dong cuoi
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$tdhv", tdhv.ToString());
            strTempElement = strTempElement.Replace("$tong", tong.ToString());
            strTempElement = strTempElement.Replace("$ctl_dv", ctl_dv.ToString());
            strTempElement = strTempElement.Replace("$ctl_n", ctl_n.ToString());
            strTempElement = strTempElement.Replace("$ctl_dt", ctl_dt.ToString());
            strTempElement = strTempElement.Replace("$tndt_tn", tndt_tn.ToString());
            strTempElement = strTempElement.Replace("$tndt_xhcn", tndt_xhcn.ToString());
            strTempElement = strTempElement.Replace("$tndt_nk", tndt_nk.ToString());
            strTempElement = strTempElement.Replace("$td_d30", td_d30.ToString());
            strTempElement = strTempElement.Replace("$td_t30", td_t30.ToString());
            strTempElement = strTempElement.Replace("$ncc_gvcc", ncc_gvcc.ToString());
            strTempElement = strTempElement.Replace("$ncc_gvc", ncc_gvc.ToString());
            strTempElement = strTempElement.Replace("$ncc_gv", ncc_gv.ToString());
            strTempElement = strTempElement.Replace("$ncc_cl", ncc_cl.ToString());
            strTempElement = strTempElement.Replace("$nn_av", nn_av.ToString());
            strTempElement = strTempElement.Replace("$nn_nnk", nn_nnk.ToString());
            strTempElement = strTempElement.Replace("$ct_cc", ct_cc.ToString());
            strTempElement = strTempElement.Replace("$ct_tc", ct_tc.ToString());
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        // ------------------------------------------------------------------
        #region Danh sách cán bộ đến tuổi nghỉ hưu
        public string GetHtmlContent_Report_Type_2_1(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_2_1.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Danh sach can bo den tuoi nghi huu");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "DANH SÁCH CÁN BỘ ĐẾN TUỔI NGHỈ HƯU");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_1.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_2_1(madv, dcb, tt);

            int stt = 0;
            int i = 0;
            int pagenum = 1;
            int currentyear = DateTime.Now.Year;
            string shcc = "";
            string ngach = "";
            string chucdanh = "";
            string hocvi = "";

            int birthyear = 0;
            int tuoi = 0;
            string hoten = "";
            string donvi = "";
            string ma_ngach = "";
            double hsl = 0;
            string ntns = "";
            string lht = "";
            int gt = 0;
            string cdhvhh = "";

            foreach (DataRow row in dataTable.Rows)
            {
                if (shcc.Length == 0)
                {
                    DateTime dt = (DateTime)row["ntns"];
                    birthyear = dt.Year;
                    tuoi = currentyear - birthyear;
                    shcc = row["shcc"].ToString();
                    hoten = row["hoten"].ToString();
                    donvi = row["dv"].ToString();
                    ma_ngach = row["ma_ngach"].ToString();
                    hsl = double.Parse(row["hsl"].ToString());
                    ntns = dt.ToString("dd/MM/yyyy");
                    lht = ((DateTime)row["lht"]).ToString("dd/MM/yyyy");
                    gt = ConvertStringToInt(row["gt"].ToString());
                }

                if (row["shcc"].ToString().CompareTo(shcc) == 0)
                {
                    string ngachStr = row["ngach"].ToString();
                    if (!ngach.Contains(ngachStr) && ngachStr.Length > 0)
                        if (ngach.Length > 0)
                            ngach += " - " + ngachStr;
                        else
                            ngach = ngachStr;

                    string dhdpStr = row["dhdp"].ToString();
                    if (!chucdanh.Contains(dhdpStr) && dhdpStr.Length > 0)
                        chucdanh += " - " + dhdpStr;

                    string vbdtStr = row["vbdt"].ToString();
                    if (!hocvi.Contains(vbdtStr) && vbdtStr.Length > 0)
                        hocvi += " - " + vbdtStr;
                }
                else
                {
                    cdhvhh = ngach;
                    if (chucdanh.Length > 0)
                        cdhvhh += chucdanh;
                    if (hocvi.Length > 0)
                        cdhvhh += hocvi;
                    if (cdhvhh.Trim().Length == 0)
                        cdhvhh = "&nbsp;";

                    if (gt == 1 && tuoi >= 60)
                    {
                        i++;
                        stt++;
                        // In dong cho Nam
                        strTempElement = strElementHtmlContent;
                        strTempElement = strTempElement.Replace("$stt", stt.ToString());
                        strTempElement = strTempElement.Replace("$hoten", hoten);
                        strTempElement = strTempElement.Replace("$ntnsNam", ntns);
                        strTempElement = strTempElement.Replace("$ntnsNu", "&nbsp;");
                        strTempElement = strTempElement.Replace("$cdhvhh", cdhvhh);
                        strTempElement = strTempElement.Replace("$donvi", donvi);
                        strTempElement = strTempElement.Replace("$ma_ngach", ma_ngach);
                        strTempElement = strTempElement.Replace("$hsl", hsl.ToString());
                        strTempElement = strTempElement.Replace("$lht", lht);
                        strHtmlContent += strTempElement;
                    }

                    if (gt == 0 && tuoi >= 55)
                    {
                        i++;
                        stt++;
                        // In dong cho nu
                        strTempElement = strElementHtmlContent;
                        strTempElement = strTempElement.Replace("$stt", stt.ToString());
                        strTempElement = strTempElement.Replace("$hoten", hoten);
                        strTempElement = strTempElement.Replace("$ntnsNam", "&nbsp;");
                        strTempElement = strTempElement.Replace("$ntnsNu", ntns);
                        strTempElement = strTempElement.Replace("$cdhvhh", cdhvhh);
                        strTempElement = strTempElement.Replace("$donvi", donvi);
                        strTempElement = strTempElement.Replace("$ma_ngach", ma_ngach);
                        strTempElement = strTempElement.Replace("$hsl", hsl.ToString());
                        strTempElement = strTempElement.Replace("$lht", lht);
                        strHtmlContent += strTempElement;
                    }

                    //Lay gia tri moi 
                    DateTime dt2 = (DateTime)row["ntns"];
                    birthyear = dt2.Year;
                    tuoi = currentyear - birthyear;
                    shcc = row["shcc"].ToString();
                    hoten = row["hoten"].ToString();
                    donvi = row["dv"].ToString();
                    ma_ngach = row["ma_ngach"].ToString();
                    hsl = ConvertStringToDouble(row["hsl"].ToString());
                    ntns = dt2.ToString("dd/MM/yyyy");
                    lht = ConvertFullDateTimeStringToShortDateTimeString(row["lht"].ToString());
                    gt = ConvertStringToInt(row["gt"].ToString());
                    cdhvhh = "";
                    if (row["ngach"].ToString().Length > 0)
                        ngach = row["ngach"].ToString();
                    else
                        ngach = "";
                    if (row["dhdp"].ToString().Length > 0)
                        chucdanh = " - " + row["dhdp"].ToString();
                    else
                        chucdanh = "";
                    if (row["vbdt"].ToString().Length > 0)
                        hocvi = " - " + row["vbdt"].ToString();
                    else
                        hocvi = "";

                    if (i == 15)
                    {
                        i = 0;
                        pagenum++;
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                        strHtmlContent += File.ReadAllText(path);
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_1.xml");
                        strHtmlContent += File.ReadAllText(path);
                    }
                }
            }

            cdhvhh = ngach;
            if (chucdanh.Length > 0)
                cdhvhh += chucdanh;
            if (hocvi.Length > 0)
                cdhvhh += hocvi;
            if (cdhvhh.Trim().Length == 0)
                cdhvhh = "&nbsp;";

            if (gt == 1 && tuoi >= 60)
            {
                i++;
                stt++;
                // In dong cho Nam
                strTempElement = strElementHtmlContent;
                strTempElement = strTempElement.Replace("$stt", stt.ToString());
                strTempElement = strTempElement.Replace("$hoten", hoten);
                strTempElement = strTempElement.Replace("$ntnsNam", ntns);
                strTempElement = strTempElement.Replace("$ntnsNu", "&nbsp;");
                strTempElement = strTempElement.Replace("$cdhvhh", cdhvhh);
                strTempElement = strTempElement.Replace("$donvi", donvi);
                strTempElement = strTempElement.Replace("$ma_ngach", ma_ngach);
                strTempElement = strTempElement.Replace("$hsl", hsl.ToString());
                strTempElement = strTempElement.Replace("$lht", lht);
                strHtmlContent += strTempElement;
            }

            if (gt == 0 && tuoi >= 55)
            {
                i++;
                stt++;
                // In dong cho nu
                strTempElement = strElementHtmlContent;
                strTempElement = strTempElement.Replace("$stt", stt.ToString());
                strTempElement = strTempElement.Replace("$hoten", hoten);
                strTempElement = strTempElement.Replace("$ntnsNam", "&nbsp;");
                strTempElement = strTempElement.Replace("$ntnsNu", ntns);
                strTempElement = strTempElement.Replace("$cdhvhh", cdhvhh);
                strTempElement = strTempElement.Replace("$donvi", donvi);
                strTempElement = strTempElement.Replace("$ma_ngach", ma_ngach);
                strTempElement = strTempElement.Replace("$hsl", hsl.ToString());
                strTempElement = strTempElement.Replace("$lht", lht);
                strHtmlContent += strTempElement;
            }

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Báo cáo ngạch, bậc công chức, viên chức
        public string GetHtmlContent_Report_Type_2_2(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_2_2.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bao cao nganh bac cong chuc vien chuc");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "BÁO CÁO NGẠCH, BẬC CÔNG CHỨC, VIÊN CHỨC");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_2.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_2_2(madv, dcb, tt);

            int stt = 0;
            int i = 1;
            int pagenum = 1;
            string ngach = "";
            int tongso = 0;
            int b1 = 0;
            int b2 = 0;
            int b3 = 0;
            int b4 = 0;
            int b5 = 0;
            int b6 = 0;
            int b7 = 0;
            int b8 = 0;
            int b9 = 0;
            int b10 = 0;
            int b11 = 0;
            int b12 = 0;
            int b13 = 0;
            int b14 = 0;
            int b15 = 0;
            int b16 = 0;

            string ma_ngach = "";

            foreach (DataRow row in dataTable.Rows)
            {
                if (stt == 0)
                {
                    stt = 1;
                    ma_ngach = row["ma_ngach"].ToString();
                    ngach = row["ngach"].ToString();
                    tongso = 0;
                }
                //Xu li sang trang
                if (i == 15)
                {
                    i = 0;
                    pagenum++;
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                    strHtmlContent += File.ReadAllText(path);
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_2.xml");
                    strHtmlContent += File.ReadAllText(path);
                }

                if (row["ma_ngach"].ToString().CompareTo(ma_ngach) == 0)
                {
                    tongso++;
                    switch (ConvertStringToInt(row["bl_dbl"].ToString()))
                    {
                        case 1:
                            b1 += 1;
                            break;
                        case 2:
                            b2 += 1;
                            break;
                        case 3:
                            b3 += 1;
                            break;
                        case 4:
                            b4 += 1;
                            break;
                        case 5:
                            b5 += 1;
                            break;
                        case 6:
                            b6 += 1;
                            break;
                        case 7:
                            b7 += 1;
                            break;
                        case 8:
                            b8 += 1;
                            break;
                        case 9:
                            b9 += 1;
                            break;
                        case 10:
                            b10 += 1;
                            break;
                        case 11:
                            b11 += 1;
                            break;
                        case 12:
                            b12 += 1;
                            break;
                        case 13:
                            b13 += 1;
                            break;
                        case 14:
                            b14 += 1;
                            break;
                        case 15:
                            b15 += 1;
                            break;
                        case 16:
                            b16 += 1;
                            break;
                    }
                }
                else
                {
                    tongso = b1 + b2 + b3 + b4 + b5 + b6 + b7 + b8 + b9 + b10 + b11 + b12 + b13 + b14 + b15 + b16;
                    // In dong
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$ngach", ngach);
                    strTempElement = strTempElement.Replace("$tongso", tongso.ToString());
                    strTempElement = strTempElement.Replace("$b1", b1.ToString());
                    strTempElement = strTempElement.Replace("$b2", b2.ToString());
                    strTempElement = strTempElement.Replace("$b3", b3.ToString());
                    strTempElement = strTempElement.Replace("$b4", b4.ToString());
                    strTempElement = strTempElement.Replace("$b5", b5.ToString());
                    strTempElement = strTempElement.Replace("$b6", b6.ToString());
                    strTempElement = strTempElement.Replace("$b7", b7.ToString());
                    strTempElement = strTempElement.Replace("$b8", b8.ToString());
                    strTempElement = strTempElement.Replace("$b9", b9.ToString());
                    strTempElement = strTempElement.Replace("$b10", b10.ToString());
                    strTempElement = strTempElement.Replace("$b11", b11.ToString());
                    strTempElement = strTempElement.Replace("$b12", b12.ToString());
                    strTempElement = strTempElement.Replace("$b13", b13.ToString());
                    strTempElement = strTempElement.Replace("$b14", b14.ToString());
                    strTempElement = strTempElement.Replace("$b15", b15.ToString());
                    strTempElement = strTempElement.Replace("$b16", b16.ToString());
                    strHtmlContent += strTempElement;

                    tongso = 1;
                    b1 = b2 = b3 = b4 = b5 = b6 = b7 = b8 = b9 = b10 = b11 = b12 = b13 = b14 = b15 = b16 = 0;
                    stt++;
                    i++;
                    ma_ngach = row["ma_ngach"].ToString();
                    ngach = row["ngach"].ToString();

                    switch (ConvertStringToInt(row["bl_dbl"].ToString()))
                    {
                        case 1:
                            b1 += 1;
                            break;
                        case 2:
                            b2 += 1;
                            break;
                        case 3:
                            b3 += 1;
                            break;
                        case 4:
                            b4 += 1;
                            break;
                        case 5:
                            b5 += 1;
                            break;
                        case 6:
                            b6 += 1;
                            break;
                        case 7:
                            b7 += 1;
                            break;
                        case 8:
                            b8 += 1;
                            break;
                        case 9:
                            b9 += 1;
                            break;
                        case 10:
                            b10 += 1;
                            break;
                        case 11:
                            b11 += 1;
                            break;
                        case 12:
                            b12 += 1;
                            break;
                        case 13:
                            b13 += 1;
                            break;
                        case 14:
                            b14 += 1;
                            break;
                        case 15:
                            b15 += 1;
                            break;
                        case 16:
                            b16 += 1;
                            break;
                    }
                }
            }

            // In dong cuoi
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$ngach", ngach);
            strTempElement = strTempElement.Replace("$tongso", tongso.ToString());
            strTempElement = strTempElement.Replace("$b1", b1.ToString());
            strTempElement = strTempElement.Replace("$b2", b2.ToString());
            strTempElement = strTempElement.Replace("$b3", b3.ToString());
            strTempElement = strTempElement.Replace("$b4", b4.ToString());
            strTempElement = strTempElement.Replace("$b5", b5.ToString());
            strTempElement = strTempElement.Replace("$b6", b6.ToString());
            strTempElement = strTempElement.Replace("$b7", b7.ToString());
            strTempElement = strTempElement.Replace("$b8", b8.ToString());
            strTempElement = strTempElement.Replace("$b9", b9.ToString());
            strTempElement = strTempElement.Replace("$b10", b10.ToString());
            strTempElement = strTempElement.Replace("$b11", b11.ToString());
            strTempElement = strTempElement.Replace("$b12", b12.ToString());
            strTempElement = strTempElement.Replace("$b13", b13.ToString());
            strTempElement = strTempElement.Replace("$b14", b14.ToString());
            strTempElement = strTempElement.Replace("$b15", b15.ToString());
            strTempElement = strTempElement.Replace("$b16", b16.ToString());
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Báo cáo kỷ luật
        public string GetHtmlContent_Report_Type_2_3(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_2_3.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Bao cao ki luat");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "BÁO CÁO KỈ LUẬT");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_3.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_2_3(madv, dcb, tt);

            int stt = 0;
            int i = 0;
            int pagenum = 1;
            string shcc = "";
            string chucdanh = "";
            string chucvu = "";

            string hoten = "";
            string dv = "";
            string nkl = "";
            string nxkl = "";
            string kl = "";
            string ma_htkl = "";
            string cvcd = "";

            foreach (DataRow row in dataTable.Rows)
            {
                if (shcc.Length == 0)
                {
                    shcc = row["shcc"].ToString();
                    hoten = row["hoten"].ToString();
                    dv = row["dv"].ToString();
                    nkl = row["nkl"].ToString();
                    nxkl = row["nxkl"].ToString();
                    kl = row["kl"].ToString();
                    ma_htkl = row["ma_htkl"].ToString();
                }

                if ((row["shcc"].ToString().CompareTo(shcc) == 0) && (row["ma_htkl"].ToString().CompareTo(ma_htkl) == 0))
                {
                    string dhdpStr = row["dhdp"].ToString();
                    if (!chucdanh.Contains(dhdpStr) && dhdpStr.Length > 0)
                        if (chucdanh.Length > 0)
                            chucdanh += " - " + dhdpStr;
                        else
                            chucdanh = dhdpStr;
                    string cvStr = row["cv"].ToString();
                    if (!chucvu.Contains(cvStr) && cvStr.Length > 0)
                        if (chucvu.Length > 0)
                            chucvu += " - " + row["cv"];
                        else
                            chucvu = cvStr;
                }
                else
                {

                    stt++;
                    i++;
                    cvcd = "";
                    if (chucdanh.Length > 0)
                        cvcd = chucdanh;
                    if (cvcd.Length > 0)
                        cvcd += " - " + chucvu;

                    if (cvcd.Length == 0)
                        cvcd = "";

                    // In dong
                    strTempElement = strElementHtmlContent;
                    strTempElement = strTempElement.Replace("$stt", stt.ToString());
                    strTempElement = strTempElement.Replace("$hoten", hoten);
                    strTempElement = strTempElement.Replace("$dv", dv);
                    strTempElement = strTempElement.Replace("$cvcd", cvcd);
                    strTempElement = strTempElement.Replace("$nkl", ConvertFullDateTimeStringToShortDateTimeString(nkl));
                    strTempElement = strTempElement.Replace("$kl", kl);
                    strTempElement = strTempElement.Replace("$nxkl", ConvertFullDateTimeStringToShortDateTimeString(nxkl));
                    strHtmlContent += strTempElement;

                    //Gan du lieu moi
                    shcc = row["shcc"].ToString();
                    hoten = row["hoten"].ToString();
                    dv = row["dv"].ToString();
                    nkl = row["nkl"].ToString();
                    nxkl = row["nxkl"].ToString();
                    kl = row["kl"].ToString();
                    ma_htkl = row["ma_htkl"].ToString();
                    if (row["dhdp"].ToString().Length > 0)
                        chucdanh = row["dhdp"].ToString();
                    else
                        chucdanh = "";

                    if (row["cv"].ToString().Length > 0)
                        chucvu = row["cv"].ToString();
                    else
                        chucvu = "";

                    //Xu li sang trang
                    if (i == 16)
                    {
                        i = 0;
                        pagenum++;
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                        strHtmlContent += File.ReadAllText(path);
                        path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_2_3.xml");
                        strHtmlContent += File.ReadAllText(path);
                    }
                }
            }

            stt++; i++;
            cvcd = "";
            if (chucdanh.Length > 0)
                cvcd = chucdanh;
            if (cvcd.Length > 0)
                cvcd += " - " + chucvu;
            if (cvcd.Length == 0)
                cvcd = "";

            // In dong
            strTempElement = strElementHtmlContent;
            strTempElement = strTempElement.Replace("$stt", stt.ToString());
            strTempElement = strTempElement.Replace("$hoten", hoten);
            strTempElement = strTempElement.Replace("$dv", dv);
            strTempElement = strTempElement.Replace("$cvcd", cvcd);
            strTempElement = strTempElement.Replace("$nkl", ConvertFullDateTimeStringToShortDateTimeString(nkl));
            strTempElement = strTempElement.Replace("$kl", kl);
            strTempElement = strTempElement.Replace("$nxkl", ConvertFullDateTimeStringToShortDateTimeString(nxkl));
            strHtmlContent += strTempElement;

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        // ------------------------------------------------------------------
        #region Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương
        public string GetHtmlContent_Report_Type_3_1(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_3_1.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Danh sach de nghi nang luong");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "DANH SÁCH CÁN BỘ NGẠCH GIẢNG VIÊN CAO CẤP, CHUYÊN VIÊN CAO CẤP\n VÀ TƯƠNG ĐƯƠNG ĐỀ NGHỊ NÂNG LƯƠNG");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_3_1.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_3_1(madv, dcb, tt);

            int stt = 0;
            int i = 0;
            int pagenum = 1;

            string ntns = "";
            string lht = "";
            int blcu = 0;
            int blmoi;

            foreach (DataRow row in dataTable.Rows)
            {
                if (ConvertStringToInt(row["blcu"].ToString()) >= ConvertStringToInt(row["totkhung"].ToString()))
                    continue;

                //Xu li sang trang
                if (i == 15)
                {
                    i = 0;
                    pagenum++;
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                    strHtmlContent += File.ReadAllText(path);
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_3_1.xml");
                    strHtmlContent += File.ReadAllText(path);
                }

                ntns = ConvertFullDateTimeStringToShortDateTimeString(row["ntns"].ToString());
                lht = ConvertFullDateTimeStringToShortDateTimeString(row["lht"].ToString());
                blcu = ConvertStringToInt(row["blcu"].ToString());
                blmoi = blcu + 1;
                stt++;
                i++;

                // In dong
                strTempElement = strElementHtmlContent;
                strTempElement = strTempElement.Replace("$stt", stt.ToString());
                strTempElement = strTempElement.Replace("$hoten", row["hoten"].ToString());
                strTempElement = strTempElement.Replace("$ntns", ntns);
                strTempElement = strTempElement.Replace("$gt", (ConvertStringToInt(row["gt"].ToString()) == 1)? "Nam" : "Nữ");
                strTempElement = strTempElement.Replace("$dv", row["dv"].ToString());
                strTempElement = strTempElement.Replace("$ngach", row["ngach"].ToString());
                strTempElement = strTempElement.Replace("$ma_ngach", row["ma_ngach"].ToString());
                strTempElement = strTempElement.Replace("$blcu", blcu.ToString());
                strTempElement = strTempElement.Replace("$lht", lht);
                strTempElement = strTempElement.Replace("$blmoi", blmoi.ToString());
                strHtmlContent += strTempElement;
            }

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương
        public string GetHtmlContent_Report_Type_3_2(string madv, string tendonvi, string dcb, string tt)
        {
            string strTempElement;
            string elementPath = HttpContext.Current.Server.MapPath(@"Template\ReportElement_Type_3_2.xml");
            string strElementHtmlContent = File.ReadAllText(elementPath);
            string path = HttpContext.Current.Server.MapPath(@"Template\ReportHeader.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent = strHtmlContent.Replace("$TieuDe", "Danh sach de nghi nang luong");
            strHtmlContent = strHtmlContent.Replace("$TenDonVi", tendonvi);
            strHtmlContent = strHtmlContent.Replace("$TenBaoCao", "DANH SÁCH CÁN BỘ NGẠCH GIẢNG VIÊN CHÍNH, CHUYÊN VIÊN CHÍNH VÀ TƯƠNG ĐƯƠNG ĐỀ NGHỊ NÂNG LƯƠNG");
            strHtmlContent = strHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_3_2.xml");
            strHtmlContent += File.ReadAllText(path);

            DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_3_2(madv, dcb, tt);

            int stt=0;
            int i=0;
            int pagenum=1;

            string ntns = "";
            string lht = "";
            int blcu = 0;
            int blmoi = 0;

            foreach (DataRow row in dataTable.Rows)
            {
                if (ConvertStringToInt(row["blcu"].ToString()) >= ConvertStringToInt(row["totkhung"].ToString()))
                    continue;

                //Xu li sang trang
                if (i == 15)
                {
                    i = 0;
                    pagenum++;
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageBreak.xml");
                    strHtmlContent += File.ReadAllText(path);
                    path = HttpContext.Current.Server.MapPath(@"Template\ReportPageHeader_Type_3_2.xml");
                    strHtmlContent += File.ReadAllText(path);
                }

                ntns = ConvertFullDateTimeStringToShortDateTimeString(row["ntns"].ToString());
                lht = ConvertFullDateTimeStringToShortDateTimeString(row["lht"].ToString());
                blcu = ConvertStringToInt(row["blcu"].ToString());
                blmoi = blcu + 1;
                stt++;
                i++;
                
                // In dong
                strTempElement = strElementHtmlContent;
                strTempElement = strTempElement.Replace("$stt", stt.ToString());
                strTempElement = strTempElement.Replace("$hoten", row["hoten"].ToString());
                strTempElement = strTempElement.Replace("$ntns", ntns);
                strTempElement = strTempElement.Replace("$gt", (ConvertStringToInt(row["gt"].ToString()) == 1)? "Nam" : "Nữ");
                strTempElement = strTempElement.Replace("$dv", row["dv"].ToString());
                strTempElement = strTempElement.Replace("$ngach", row["ngach"].ToString());
                strTempElement = strTempElement.Replace("$ma_ngach", row["ma_ngach"].ToString());
                strTempElement = strTempElement.Replace("$blcu", blcu.ToString());
                strTempElement = strTempElement.Replace("$lht", lht);
                strTempElement = strTempElement.Replace("$blmoi", blmoi.ToString());
                strHtmlContent += strTempElement;
            }

            string footerPath = HttpContext.Current.Server.MapPath(@"Template\ReportFooter.xml");
            string footerHtmlContent = File.ReadAllText(footerPath);
            footerHtmlContent = footerHtmlContent.Replace("$ThoiGianXet", DateTime.Now.ToString("dd/MM/yyyy"));
            strHtmlContent += footerHtmlContent;

            return strHtmlContent;
        }
        #endregion

        #region Hàm hỗ trợ
        private int ConvertStringToInt(string str)
        {
            int i;
            bool isValid = int.TryParse(str, out i);
            if (isValid)
                return i;
            else
                return 0;
        }

        private double ConvertStringToDouble(string str)
        {
            double d;
            bool isValid = double.TryParse(str, out d);
            if (isValid)
                return d;
            else
                return 0;
        }

        private string ConvertFullDateTimeStringToShortDateTimeString(string str)
        {
            try
            {
                DateTime dt = DateTime.Parse(str);
                return dt.ToString("dd/MM/yyyy");
            }
            catch (System.Exception ex)
            {
                return "Khong xac dinh";
            }
        }
        #endregion

    }
}
