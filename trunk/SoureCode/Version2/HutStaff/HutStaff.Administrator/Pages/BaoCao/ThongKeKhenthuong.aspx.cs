using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class ThongKeKhenthuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildTreeViewdm_dv();

            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            chkboxDienCanBo.DataSource = table_dm_dcb;
            chkboxDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            chkboxDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            chkboxDienCanBo.DataBind();
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

        }

        protected void btnXem_Click(object sender, EventArgs e)
        {

        }
    }
}