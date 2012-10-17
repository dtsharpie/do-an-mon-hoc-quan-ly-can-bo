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
    public partial class Report : System.Web.UI.Page
    {
        private int typeOfPage = 0;

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

            DataTable table_dm_dv = BaoCaoBO.ViewAlldm_dv();
            ddlDonVi.DataSource = table_dm_dv;
            ddlDonVi.DataValueField = table_dm_dv.Columns[0].ColumnName;
            ddlDonVi.DataTextField = table_dm_dv.Columns[1].ColumnName;
            ddlDonVi.DataBind();

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

        protected void btnXuat_Click(object sender, EventArgs e)
        {

        }

        protected void btnXem_Click(object sender, EventArgs e)
        {

        }
    }
}