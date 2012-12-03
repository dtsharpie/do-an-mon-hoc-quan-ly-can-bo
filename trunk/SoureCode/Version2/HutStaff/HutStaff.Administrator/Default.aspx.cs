﻿using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table_dm_dcb = BaoCaoBO.ViewAlldm_dcb();
            DataRow dr = table_dm_dcb.NewRow();
            dr[0] = -1;
            dr[1] = "Tất cả";
            table_dm_dcb.Rows.InsertAt(dr, 0);
            ddlDcb.DataSource = table_dm_dcb;
            ddlDcb.DataValueField = table_dm_dcb.Columns[0].ColumnName;
            ddlDcb.DataTextField = table_dm_dcb.Columns[1].ColumnName;
            ddlDcb.DataBind();

            DataTable table_dm_kcb = BaoCaoBO.ViewAlldm_kcb();
            DataRow dr2 = table_dm_kcb.NewRow();
            dr2[0] = -1;
            dr2[1] = "Tất cả";
            table_dm_kcb.Rows.InsertAt(dr2, 0);
            khoicanbo.DataSource = table_dm_kcb;
            khoicanbo.DataValueField = table_dm_kcb.Columns[0].ColumnName;
            khoicanbo.DataTextField = table_dm_kcb.Columns[1].ColumnName;
            khoicanbo.DataBind();
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            DataTable tblData = BO.PagesBO.TimKiem.SearchBO.Search_soyeu_all(hdMadv.Value, txtName.Value, Convert.ToDecimal(ddlGender.Value), String.IsNullOrEmpty(minage.Value) ? -1 : Convert.ToInt32(minage.Value), String.IsNullOrEmpty(maxage.Value) ? -1 : Convert.ToInt32(maxage.Value), Convert.ToInt32(ddlDcb.SelectedValue), Convert.ToInt32(khoicanbo.SelectedValue), String.IsNullOrEmpty(txtNamVeTruong.Value) ? -1 : Convert.ToInt32(txtNamVeTruong.Value), 1, int.MaxValue);
            int iCount = tblData.Rows.Count;
            if (iCount == 0)
            {
                Pager1.Visible = false;
                Pager2.Visible = false;
                spInfo1.Visible = false;
                spInfo2.Visible = false;
                grdData.Visible = false;
                divEmpty.Visible = true;
            }
            else
            {
                Pager1.Visible = true;
                Pager2.Visible = true;
                spInfo1.Visible = true;
                spInfo2.Visible = true;
                grdData.Visible = true;
                divEmpty.Visible = false;

                Pager1.PageSize = Convert.ToInt32(ddPs.Value);
                if (iCount % Pager1.PageSize == 0)
                {
                    Pager1.TotalPage = iCount / Pager1.PageSize;
                }
                else
                {
                    Pager1.TotalPage = iCount / Pager1.PageSize + 1;
                }
                Pager1.CurrentPage = 1;
                
                grdData.DataSource = tblData;
                grdData.DataBind();

                spInfo1.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
                spInfo2.InnerText = ". Trang " + ((Pager1.CurrentPage - 1) * Pager1.PageSize + 1).ToString() + "-" + ((Pager1.PageSize * Pager1.CurrentPage < iCount) ? Pager1.PageSize * Pager1.CurrentPage : iCount).ToString() + "/" + iCount.ToString();
            }
        }

    }
}