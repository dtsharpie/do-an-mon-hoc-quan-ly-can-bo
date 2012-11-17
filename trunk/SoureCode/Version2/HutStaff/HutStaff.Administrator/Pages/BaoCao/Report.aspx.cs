using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;
using HutStaff.BO.Report;
using System.IO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class Report : System.Web.UI.Page
    {
        private int typeOfPage = 0;

        private IExportData _exporter;
        private static string strHtmlContent = "";
        private static bool isNotGottenHtmlContent = true;

        public Report() : this(new ExportData()) { }

        public Report(IExportData exporter)
        {
            _exporter = exporter;
        }

#region Set Up View
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
#endregion
        protected void btnXuat_Click(object sender, EventArgs e)
        {
            this.GetHtmlContent();
            BO.Report.Exporter.ExportToDoc(strHtmlContent, String.Format("b01_{0}.doc", DateTime.Now.ToString()));       
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            this.GetHtmlContent();
            lblResult.Text = Server.HtmlDecode(strHtmlContent);
        }

        private void GetHtmlContent()
        {
            if (isNotGottenHtmlContent)
            {
                strHtmlContent = _exporter.GetHtmlContent_Report_Type_1_1("0206", "1", "1");
                isNotGottenHtmlContent = false;
            }          
        }

    }
}