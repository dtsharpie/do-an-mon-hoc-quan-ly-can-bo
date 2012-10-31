using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.TimKiem;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildTreeViewdm_dv();
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            dcb.DataSource = table_dm_dcb;
            dcb.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            dcb.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            dcb.DataBind();

            DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
            khoicanbo.DataSource = table_dm_kcb;
            khoicanbo.DataValueField = table_dm_kcb.Columns[0].ColumnName;
            khoicanbo.DataTextField = table_dm_kcb.Columns[1].ColumnName;
            khoicanbo.DataBind();

        }

        
        protected void Button1_Click1(object sender, EventArgs e)
        {
           // panelResult.Visible = true;
            GridView1.Visible = true;

           // cmd.Parameters.AddWithValue("@id", textBox1.Text);
            System.Data.SqlClient.SqlParameter code = new System.Data.SqlClient.SqlParameter("@Total", SqlDbType.Int);
            code.Direction = ParameterDirection.Output;
           // cmd.Parameters.Add(code);


           // System.Data.SqlClient.SqlParameter total = new System.Data.SqlClient.SqlParameter(@"total", total);
            DataTable gridView1DataTable =  HutStaff.BO.PagesBO.TimKiem.Search.Search_soyeu_all("0", "", 2, 0, 0, 0, 0, 0, 0, 1000);
            GridView1.DataSource = gridView1DataTable;
            GridView1.DataBind();
 
        }




        private void BuildTreeViewdm_dv()
        {
            DataTable table_dm_dv =  BaoCaoBO.ViewAlldm_dv();
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

    }
}