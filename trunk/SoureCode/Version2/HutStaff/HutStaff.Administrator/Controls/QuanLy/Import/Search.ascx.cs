using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Controls.QuanLy.Import
{
    public partial class Search : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int  iLoaiHanNgach = GetInt("loaiHanNgach");
            int iloaiBang = GetInt("loaiBang");
            DateTime dtthoiGian = GetDate("thoiGian",DateTime.Now);

            DataTable tblData = BO.PagesBO.BaoCaoBO.BaoCaoBO.ViewSetNangLuong(iLoaiHanNgach, iloaiBang, dtthoiGian);
            grdData.DataSource = tblData;
            grdData.DataBind();
        }
    }
}