﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HutStaff.Administrator.Pages.BaoCao
{
    public partial class XetNangLuong : System.Web.UI.Page
    {
        private int loaiHanNgach;
        private int loaiBang;
        private int thang;
        private int nam;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            loaiHanNgach = int.Parse(ddlLoaiHanNgach.SelectedValue);
            loaiBang = int.Parse(ddlLuaChonBang.SelectedValue);
            thang = int.Parse(ddlThoiHan.SelectedValue);
            bool isValidYear = int.TryParse(txtNam.Text, out nam);

            if (isValidYear)
            {
                DataTable salaryIncrementListDataTable = BO.Report.Report.GetSalaryIncrementList(loaiHanNgach, loaiBang, thang, nam);

                // Change column name of salary increment list table
                salaryIncrementListDataTable.Columns[0].ColumnName = "Họ đệm";
                salaryIncrementListDataTable.Columns[1].ColumnName = "Tên";
                salaryIncrementListDataTable.Columns[2].ColumnName = "Số hiệu công chức";
                salaryIncrementListDataTable.Columns[3].ColumnName = "Mã ngạch";
                salaryIncrementListDataTable.Columns[4].ColumnName = "Bậc lương";
                salaryIncrementListDataTable.Columns[5].ColumnName = "Hệ số lương";
                salaryIncrementListDataTable.Columns[6].ColumnName = "Thời gian bắt đầu";
                salaryIncrementListDataTable.Columns[7].ColumnName = "Thông tin khác";

                BO.Report.Exporter.ExporttoExcel(salaryIncrementListDataTable, String.Format("XetNangLuong_{0}.xls", DateTime.Now.ToString()));
            }
        }
    }
}