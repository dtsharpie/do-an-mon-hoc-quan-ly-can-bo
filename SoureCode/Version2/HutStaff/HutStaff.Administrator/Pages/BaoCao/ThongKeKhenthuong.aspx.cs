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
            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonViLapBaoCao.DataSource = table_dm_dv;
            ddlDonViLapBaoCao.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonViLapBaoCao.DataTextField = table_dm_dv.Columns[1].ColumnName;
            foreach (DataRow row in table_dm_dv.Rows)
            {
                int x = row.ItemArray[0].ToString().Length / 2;
                for (int i = 0; i < x; i++)
                {
                    row.SetField(table_dm_dv.Columns[1], "| - - - " + row.ItemArray[1].ToString());
                }
            }
            ddlDonViLapBaoCao.DataBind();

            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            chkboxDienCanBo.DataSource = table_dm_dcb;
            chkboxDienCanBo.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            chkboxDienCanBo.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            chkboxDienCanBo.DataBind();

            DataTable table_dm_tt = BaoCaoBO.ViewAlldm_tt();
            chkboxTinhTrangHienTai.DataSource = table_dm_tt;
            chkboxTinhTrangHienTai.DataValueField = table_dm_tt.Columns[0].ColumnName;
            chkboxTinhTrangHienTai.DataTextField = table_dm_tt.Columns[1].ColumnName;
            chkboxTinhTrangHienTai.DataBind();
        }

        protected void btnXuat_Click(object sender, EventArgs e)
        {

        }

        protected void btnXem_Click(object sender, EventArgs e)
        {

        }
    }
}