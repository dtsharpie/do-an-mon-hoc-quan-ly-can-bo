using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;
using System.Data;

namespace HutStaff.Administrator.Xemthongtin.Controls
{
    public partial class Thongtinchung : ControlBase
    {
        DataTable tblData;
        protected void Page_Load(object sender, EventArgs e)
        {
            int iShcc = BO.Security.ViewCurrentUser.GetViewCurrentUser().Shcc;
            if (iShcc > 0)
            {
                tblData = BO.Soyeu.Soyeu.GetById(iShcc);
                rptData.DataSource = tblData;
                rptData.DataBind();
            }
        }

        protected void ddlHktt_OnDataBinding(object sender, EventArgs e)
        {
            if (tblData != null && tblData.Rows.Count > 0)
            {
                DataTable tblHktt = BO.Tinhthanhpho.Tinhthanhpho.GetAll();
                Administrator.Controls.Common.Dropdownlist ddl = (Administrator.Controls.Common.Dropdownlist)sender;
                ddl.DisplayMember = "display";
                ddl.ValueMember = "ma_huyen";
                ddl.Datasource = tblHktt;
                int iHktt = Convert.ToInt32(tblData.Rows[0]["ma_hktt"]);
                if (iHktt > 0)
                {
                    ddl.Value = iHktt.ToString();
                }
            }
        }

        protected void ddlNoicap_OnDataBinding(object sender, EventArgs e)
        {
            if (tblData != null && tblData.Rows.Count > 0)
            {
                DataTable tblTP = BO.Tinhthanhpho.Tinhthanhpho.GetAllCity();
                if (tblTP.Rows.Count > 0 && String.IsNullOrEmpty(tblTP.Rows[0][1].ToString()))
                {
                    tblTP.Rows[0][1] = "Chưa xác định";
                }
                Administrator.Controls.Common.Dropdownlist ddl = (Administrator.Controls.Common.Dropdownlist)sender;
                ddl.DisplayMember = "ttp";
                ddl.ValueMember = "ma_ttp";
                ddl.Datasource = tblTP;
                int iNoicap = Convert.ToInt32(tblData.Rows[0]["nc"]);
                if (iNoicap > 0)
                {
                    ddl.Value = iNoicap.ToString();
                }
            }
        }
    }
}