using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.BaoCaoBO;
using System.Data;

//  by Nguyen Vuong Quyen

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class KhenThuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ddlHinhThucKhenThuong: dropdownList Hinh thuc khen thuong
            DataTable table_dm_kt = BaoCaoBO.ViewAlldm_kt();
            ddlHinhThucKhenThuong.DataSource = table_dm_kt;
            ddlHinhThucKhenThuong.DataValueField = table_dm_kt.Columns[0].ColumnName;
            ddlHinhThucKhenThuong.DataTextField = table_dm_kt.Columns[1].ColumnName;
            ddlHinhThucKhenThuong.DataBind();

            //tbFrom
            tbFrom.Text = "2007";

            //tbTo
            tbTo.Text = DateTime.Now.Year.ToString();

            //Đơn vị cấp ... chưa làm

            //ddlDienCanBo: dropdownList dien can bo
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            ddlDienCanBo.DataSource = table_dm_dcb;
            ddlDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            ddlDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            ddlDienCanBo.DataBind();

            //ddlKhoiCanBo: dropdownList Khoi can bo
            DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
            ddlKhoiCb.DataSource = table_dm_kcb;
            ddlKhoiCb.DataValueField = table_dm_kcb.Columns[0].ColumnName;
            ddlKhoiCb.DataTextField = table_dm_kcb.Columns[1].ColumnName;
            ddlKhoiCb.DataBind();

        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            //BaoCaoktDataContext dbKt = new BaoCaoktDataContext();
            //gvResultSearch.DataSource = dbKt.qtkt_tbls.ToList();

            //int count = (from tt in dbKt.qtkt_tbls
            //             select tt).Count();
            //Response.Write("<h1>" +count+"</h1>");
            //lbllblResultSearch.Text ="<u>"+ count.ToString() +" ket qua tim thay </u>";
            //gvResultSearch.DataBind();

        }
    }
}
