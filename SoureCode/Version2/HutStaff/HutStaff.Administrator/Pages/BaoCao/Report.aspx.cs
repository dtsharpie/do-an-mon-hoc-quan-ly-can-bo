using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;
using System.IO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class Report : System.Web.UI.Page
    {
        private int typeOfPage = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                typeOfPage = Convert.ToInt32(Request.QueryString["type"]);
            }
            catch (FormatException ex)
            {
                typeOfPage = 1;
            }

            BuildTreeViewdm_dv();

            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            chkboxDienCanBo.DataSource = table_dm_dcb;
            chkboxDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            chkboxDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            chkboxDienCanBo.DataBind();

            //title
            String titleMenu = "";
            switch (typeOfPage)
            {
                case 1:
                    {
                        titleMenu = "Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính";
                        break;
                    }
                case 13:
                    {
                        titleMenu = "Danh sách cán bộ đến tuổi nghỉ hưu";
                        break;
                    }
                case 2:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức 1";
                        break;
                    }
                case 6:
                    {
                        titleMenu = "Báo cáo ngạch, bậc công chức, viên chức";
                        break;
                    }
                case 3:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức 2";
                        break;
                    }
                case 15:
                    {
                        titleMenu = "Báo cáo kỷ luật";
                        break;
                    }
                case 4:
                    {
                        titleMenu = "Danh sách cán bộ hưởng lương chức vụ";
                        break;
                    }
                case 5:
                    {
                        titleMenu = "Thống kê đội ngũ cán bộ khoa học nghiệp vụ";
                        break;
                    }
                case 8:
                    {
                        titleMenu = "Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương";
                        break;
                    }
                case 21:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức chia theo lĩnh vực";
                        break;
                    }
                case 10:
                    {
                        titleMenu = "Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương";
                        break;
                    }
                case 22:
                    {
                        titleMenu = "Báo cáo chất lượng cán bộ công chức chia theo đơn vị";
                        break;
                    }
                case 9:
                    {
                        titleMenu = "Danh sách cán bộ không thuộc ngạch cao cấp và chính đề nghị nâng lương";
                        break;
                    }
                case 23:
                    {
                        titleMenu = "Báo cáo số lượng công chức giữ các chức vụ lãnh đạo do bổ nhiệm";
                        break;
                    }
                case 14:
                    {
                        titleMenu = "Danh sách cán bộ có hệ lương tột khung";
                        break;
                    }
                case 24:
                    {
                        titleMenu = "Báo cáo danh sách và tiền lương cán bộ công chức";
                        break;
                    }
                case 7:
                    {
                        titleMenu = "In quyết định đề nghị nâng lương";
                        break;
                    }
                case 25:
                    {
                        titleMenu = "Báo cáo tổng hợp ngạch, bậc và phụ cấp công chức";
                        break;
                    }
            }
            lblTitle.Text = titleMenu;
        }

        public DataView GetChildLevel0(DataTable inputDataTable)
        {
            DataView child = new DataView(inputDataTable);
            child.RowFilter = "Len(ma_dv) = 1";
            return child;
        }

        public DataView GetChildLevel1(DataTable inputDataTable, string parentId)
        {
            DataView child = new DataView(inputDataTable);
            child.RowFilter = "Len(ma_dv) = 2 And Substring(ma_dv,1,1) = '" + parentId + "'";
            return child;
        }

        public DataView GetChildLevel2(DataTable inputDataTable, string parentId)
        {
            DataView child = new DataView(inputDataTable);
            child.RowFilter = "Len(ma_dv) = 4 And Substring(ma_dv,1,2) = " + parentId;
            return child;
        }

        public DataView GetChildLevel3(DataTable inputDataTable, string parentId)
        {
            DataView child = new DataView(inputDataTable);
            child.RowFilter = "Len(ma_dv) = 6 And Substring(ma_dv,1,4) = " + parentId;
            return child;
        }

        private void BuildTreeViewdm_dv()
        {
            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            treeViewDonVi.Nodes.Clear();
            foreach (DataRowView row0 in GetChildLevel0(table_dm_dv))
            {
                TreeNode node0 = new TreeNode();
                node0.Text = row0["dv"].ToString();
                node0.Value = row0["ma_dv"].ToString();
                foreach (DataRowView row1 in GetChildLevel1(table_dm_dv, node0.Value))
                {
                    TreeNode node1 = new TreeNode();
                    node1.Text = row1["dv"].ToString();
                    node1.Value = row1["ma_dv"].ToString();
                    foreach (DataRowView row2 in GetChildLevel2(table_dm_dv, node1.Value))
                    {
                        TreeNode node2 = new TreeNode();
                        node2.Text = row2["dv"].ToString();
                        node2.Value = row2["ma_dv"].ToString();
                        foreach (DataRowView row3 in GetChildLevel3(table_dm_dv, node2.Value))
                        {
                            TreeNode node3 = new TreeNode();
                            node3.Text = row3["dv"].ToString();
                            node3.Value = row3["ma_dv"].ToString();
                            node2.ChildNodes.Add(node3);
                        }
                        node1.ChildNodes.Add(node2);
                    }
                    node0.ChildNodes.Add(node1);
                }
                treeViewDonVi.Nodes.Add(node0);
            }
        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {
            BO.Report.Exporter.ExportToDoc(this.GetHtmlContent(), String.Format("b01_{0}.doc", DateTime.Now.ToString()));       
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            lblResult.Text = Server.HtmlDecode(this.GetHtmlContent());
        }

        private string GetHtmlContent()
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

            if (this.typeOfPage == 1)
            {
                DataTable dataTable = BO.Report.Report.GetDataTableToReport_Type_1_1("0206", 1);

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
            return "";
        }
    }
}