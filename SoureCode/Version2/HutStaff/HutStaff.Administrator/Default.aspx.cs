using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.TimKiem;
using System.Data;
using HutStaff.BO.PagesBO.BaoCaoBO;

namespace HutStaff.Administrator
{
    public partial class Default : System.Web.UI.Page
    {
        
        string tenCanBo ="";
        int gioiTinh = 1;
        int tuTuoi = 0;
        int denTuoi = 0;
        int namVeTruong = 0;
        int dienCB = 0;
        int khoiCB = 0;
        public int totalResult = 0;

        int pageIndex = 0;
        int pageSize = 30;

        private int _pageNumber;

        public int PageNumber
        {
            get { return _pageNumber; }
            set { _pageNumber = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //BuildTreeViewdm_dv();
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

        //private void BuildTreeViewdm_dv()
        //{
        //    DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
        //   treeViewDonVi.Nodes.Clear();
        //    foreach (DataRowView row0 in GetChildLevel0(table_dm_dv))
        //    {
        //        TreeNode node0 = new TreeNode();
        //        node0.Text = row0["dv"].ToString();
        //        node0.Value = row0["ma_dv"].ToString();
        //        foreach (DataRowView row1 in GetChildLevel1(table_dm_dv, node0.Value))
        //        {
        //            TreeNode node1 = new TreeNode();
        //            node1.Text = row1["dv"].ToString();
        //            node1.Value = row1["ma_dv"].ToString();
        //            foreach (DataRowView row2 in GetChildLevel2(table_dm_dv, node1.Value))
        //            {
        //                TreeNode node2 = new TreeNode();
        //                node2.Text = row2["dv"].ToString();
        //                node2.Value = row2["ma_dv"].ToString();
        //                foreach (DataRowView row3 in GetChildLevel3(table_dm_dv, node2.Value))
        //                {
        //                    TreeNode node3 = new TreeNode();
        //                    node3.Text = row3["dv"].ToString();
        //                    node3.Value = row3["ma_dv"].ToString();
        //                    node2.ChildNodes.Add(node3);
        //                }
        //                node1.ChildNodes.Add(node2);
        //            }
        //            node0.ChildNodes.Add(node1);
        //        }
        //        treeViewDonVi.Nodes.Add(node0);
        //    }
        //}


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

        public void Search_click(object sender, EventArgs e )
        {

            DataTable gridView1DataTable = GetData();
            GridView1.DataSource = gridView1DataTable;
            GridView1.DataBind();
            countTotalNumberResult(out totalResult);
            
            numberResultLabel.Text = string.Format("Đang hiện 1 đến 10 trên {0} kết quả tìm được", totalResult);
        }


        protected void checkBox_nam_Click(object sender, EventArgs e)
        {
            checkBox_nam.Checked = true;
            checkBox_nu.Checked = false;
        }

        protected void checkBox_nu_Click(object sender, EventArgs e)
        {
            checkBox_nu.Checked = true;
            checkBox_nam.Checked = false;
        }

        protected void numberResultChange(object sender, EventArgs e)
        {
            pageSize = Int32.Parse( numberResultDropDownList.SelectedValue);
            DataTable gridView1DataTable = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all("0", tenCanBo, gioiTinh, tuTuoi, denTuoi, dienCB, khoiCB, namVeTruong, pageIndex, 9000);
            GridView1.DataSource = gridView1DataTable;
            GridView1.PageSize = pageSize;
            GridView1.DataBind();
            countTotalNumberResult(out totalResult);

            numberResultLabel.Text = string.Format("Đang hiện 1 đến {0} trên {1} kết quả tìm được",pageSize ,totalResult);

        }







        public void countTotalNumberResult(out int _totalResult)
        {
            DataTable total = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all_total("0", tenCanBo, gioiTinh, tuTuoi, denTuoi, dienCB, khoiCB, namVeTruong);
            _totalResult = Int32.Parse(total.Rows[0][0].ToString());
        }



        protected void gvResultSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int newPage;
            newPage = e.NewPageIndex;
            if (newPage < 0 || newPage >= GridView1.PageCount)
            {
                e.Cancel = true;
            }
            else
            {
                GridView1.PageIndex = newPage;
                this.LoadDataToGridView();
            }
        }

        private void LoadDataToGridView()
        {
            DataTable salaryIncrementListDataTable = this.GetData();
            GridView1.DataSource = salaryIncrementListDataTable;
            GridView1.DataBind();
        }



        public DataTable GetData()
        {
             if (txtName.Text != null)
            {
                tenCanBo = txtName.Text;
            }
           
            if (checkBox_nam.Checked == true)
            {
                gioiTinh = 1;
            }
            if (checkBox_nu.Checked == true)
            {
                gioiTinh = 0;
            }

           
            if(txtTuTuoi.Text != "")
            tuTuoi = Int32.Parse(txtTuTuoi.Text);
            
            if (txtDenTuoi.Text != "")
            denTuoi = Int32.Parse(txtDenTuoi.Text);

            if (txtNamVeTruong.Text != "")
            namVeTruong = Int32.Parse(txtNamVeTruong.Text);

            dienCB = Int32.Parse(dcb.SelectedValue);  
            khoiCB = Int32.Parse(khoicanbo.SelectedValue);
            string ma_dv = txtDepartmentCode.Value;
            if (string.IsNullOrEmpty(ma_dv))
                ma_dv = "0";
            
            panelResult.Visible = true;
            GridView1.Visible = true;

            System.Data.SqlClient.SqlParameter code = new System.Data.SqlClient.SqlParameter("@Total", SqlDbType.Int);
            code.Direction = ParameterDirection.Output;
            DataTable gridView1DataTable = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all(ma_dv, tenCanBo, gioiTinh, tuTuoi == 0 ? -1 : tuTuoi, denTuoi == 0 ? -1 : denTuoi, dienCB, khoiCB, namVeTruong == 0 ? -1 : namVeTruong, 0, int.MaxValue);

            Pager1.CurrentPage = 1;
            Pager1.TotalPage = (int)Math.Ceiling(((float)gridView1DataTable.Rows.Count / pageSize));
            Pager1.PageSize = pageSize;
            Pager2.CurrentPage = 1;
            Pager2.TotalPage = (int)Math.Ceiling(((float)gridView1DataTable.Rows.Count / pageSize));
            Pager2.PageSize = pageSize;

            return gridView1DataTable;
        }

    }
}