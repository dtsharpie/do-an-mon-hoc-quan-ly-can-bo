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

        int pageSize = 10;
        string ma_dv = "";

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

        public void Search_click(object sender, EventArgs e )
        {

            DataTable gridView1DataTable = GetData();
            GridView1.DataSource = gridView1DataTable;
            GridView1.DataBind();
            countTotalNumberResult(out totalResult);
            
            numberResultLabel.Text = string.Format("Đang hiện 1 đến 10 trên {0} kết quả tìm được", totalResult);
        }


        //protected void checkBox_nam_Click(object sender, EventArgs e)
        //{
        //    checkBox_nam.Checked = true;
        //    checkBox_nu.Checked = false;
        //}

        //protected void checkBox_nu_Click(object sender, EventArgs e)
        //{
        //    checkBox_nu.Checked = true;
        //    checkBox_nam.Checked = false;
        //}

        protected void numberResultChange(object sender, EventArgs e)
        {
            ma_dv = txtDepartmentCode.Value;
            pageSize = Int32.Parse( numberResultDropDownList.SelectedValue);
            DataTable gridView1DataTable = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all(ma_dv, tenCanBo, gioiTinh, tuTuoi, denTuoi, dienCB, khoiCB, namVeTruong);
            DataColumn orderColumn = gridView1DataTable.Columns.Add("STT");
            orderColumn.SetOrdinal(0);
            int order = 0;
            foreach (DataRow row in gridView1DataTable.Rows)
            {
                order++;
                row["STT"] = order.ToString();
            }
            GridView1.DataSource = gridView1DataTable;
            GridView1.PageSize = pageSize;
            GridView1.DataBind();
            countTotalNumberResult(out totalResult);

            numberResultLabel.Text = string.Format("Đang hiện 1 đến {0} trên {1} kết quả tìm được",pageSize ,totalResult);

        }







        public void countTotalNumberResult(out int _totalResult)
        {
            ma_dv = txtDepartmentCode.Value;
            DataTable total = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all_total(ma_dv, tenCanBo, gioiTinh, tuTuoi, denTuoi, dienCB, khoiCB, namVeTruong);
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

             ma_dv = txtDepartmentCode.Value;

             if (gt_nam.Checked == true)
             {
                 gioiTinh = 1;
             }
             else
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

            panelResult.Visible = true;
            GridView1.Visible = true;
            System.Data.SqlClient.SqlParameter code = new System.Data.SqlClient.SqlParameter("@Total", SqlDbType.Int);
            code.Direction = ParameterDirection.Output;
            DataTable gridView1DataTable = HutStaff.BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all(ma_dv, tenCanBo, gioiTinh, tuTuoi, denTuoi, dienCB, khoiCB, namVeTruong);

            DataColumn orderColumn = gridView1DataTable.Columns.Add("STT");
            orderColumn.SetOrdinal(0);
            int order = 0;
            foreach (DataRow row in gridView1DataTable.Rows)
            {
                order++;
                row["STT"] = order.ToString();
            }

            return gridView1DataTable;

        }

    }
}