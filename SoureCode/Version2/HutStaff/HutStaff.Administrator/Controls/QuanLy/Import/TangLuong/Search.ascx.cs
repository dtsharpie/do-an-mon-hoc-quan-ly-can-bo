using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Controls.QuanLy.Import.TangLuong
{
    public partial class Search : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int  iLoaiHanNgach = GetInt("loaiHanNgach");
            int iloaiBang = GetInt("loaiBang");
            DateTime dtthoiGian = GetDate("thoiGian",DateTime.Now);
            string sDelete = GetString("delete");

            DataTable tblData = BO.PagesBO.QuanLy.XetDuyet.ViewSetNangLuong(PageIndex,PageSize,iLoaiHanNgach, iloaiBang, dtthoiGian,sDelete);
            grdData.DataSource = tblData;
            grdData.DataBind();
        }
    }
}