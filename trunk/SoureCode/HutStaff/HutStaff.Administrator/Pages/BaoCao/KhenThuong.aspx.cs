using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.BaoCaoBO;
using System.Data;

//  by Anh Nguyen The - 20080070

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class KhenThuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //cmb_HinhThucKhenThuong
            DataTable table_dm_kt = BaoCaoBO.ViewAlldm_kt();
            cmb_HinhThucKhenThuong.DataSource = table_dm_kt;
            cmb_HinhThucKhenThuong.DataValueField = table_dm_kt.Columns[0].ColumnName;
            cmb_HinhThucKhenThuong.DataTextField = table_dm_kt.Columns[1].ColumnName;
            cmb_HinhThucKhenThuong.DataBind();

            //tbFrom
            tbFrom.Text = "2007";

            //tbTo
            tbTo.Text = DateTime.Now.Year.ToString();

            //Đơn vị cấp ... chưa làm

            //cmb_DienCanBo
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            cmb_DienCanBo.DataSource = table_dm_dcb;
            cmb_DienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            cmb_DienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            cmb_DienCanBo.DataBind();


        }
		
		protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            BaoCaoktDataContext dbKt = new BaoCaoktDataContext();
            gvResultSearch.DataSource = dbKt.qtkt_tbls.ToList();

            int count = (from tt in dbKt.qtkt_tbls
                         select tt).Count();
            Response.Write("<h1>" +count+"</h1>");
            lbllblResultSearch.Text ="<u>"+ count.ToString() +" ket qua tim thay </u>";
            gvResultSearch.DataBind();

        }
    }
}