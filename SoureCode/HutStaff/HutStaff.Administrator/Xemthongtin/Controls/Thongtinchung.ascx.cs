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
        protected int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {
            iShcc = BO.Security.ViewCurrentUser.GetViewCurrentUser().Shcc;
            if (iShcc > 0)
            {
                tblData = BO.Soyeu.Soyeu.GetById(iShcc);
                rptData.DataSource = tblData;
                rptData.DataBind();
            }
        }

        protected string GenHktt()
        {
            string sHtml = "<select id=\"ddlHktt\" class=\"ddlChosen\">";
            if (tblData != null && tblData.Rows.Count > 0)
            {
                DataTable tblHktt = BO.Tinhthanhpho.Tinhthanhpho.GetAll();

                string sHktt = tblData.Rows[0]["ma_hktt"].ToString();
                foreach (DataRow dr in tblHktt.Rows)
                {
                    sHtml += (dr["ma_huyen"].ToString() != sHktt ? "<option value=\"" + dr["ma_huyen"].ToString() + "\">" : "<option selected=\"selected\" value=\"" + dr["ma_huyen"].ToString() + "\">") + dr["display"].ToString() + "</option>";
                }
            }
            sHtml += "</select>";
            return sHtml;
        }

        protected string GenNoicap()
        {
            string sHtml = "<select id=\"ddlNoicap\" class=\"ddlChosen\">";
            if (tblData != null && tblData.Rows.Count > 0)
            {
                DataTable tblNoicap = BO.Tinhthanhpho.Tinhthanhpho.GetAllCity();

                string sNc = tblData.Rows[0]["nc"].ToString();
                foreach (DataRow dr in tblNoicap.Rows)
                {
                    sHtml += (dr["ma_ttp"].ToString() != sNc ? "<option value=\"" + dr["ma_ttp"].ToString() + "\">" : "<option selected=\"selected\" value=\"" + dr["ma_ttp"].ToString() + "\">") + (!String.IsNullOrEmpty(dr["ttp"].ToString()) ? dr["ttp"].ToString() : "Chưa xác định") + "</option>";
                }
            }
            sHtml += "</select>";
            return sHtml;
        }
    }
}