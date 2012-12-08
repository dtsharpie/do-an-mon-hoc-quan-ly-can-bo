﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TinhTrangHonNhanPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InsertColumn(0, "dm_tthn", "Mã số");
                InsertColumn(1, "tthn", "Tình trạng hôn nhân");
            }
        }
        
        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                return new TinhTrangHonNhanTable();
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaTinhTrangHonNhan.Enabled = false;
                txbMaTinhTrangHonNhan.Text = "Auto";

                txbTinhTrangHonNhan.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbTinhTrangHonNhan.Text });
                txbTinhTrangHonNhan.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaTinhTrangHonNhan.Text;
                string hh = txbTinhTrangHonNhan.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaTinhTrangHonNhan.ReadOnly = true;
            txbMaTinhTrangHonNhan.Enabled = true;
            txbMaTinhTrangHonNhan.Text = GetCellContent(selectedIndex, 0);

            txbTinhTrangHonNhan.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaTinhTrangHonNhan.Enabled = true;
            txbMaTinhTrangHonNhan.ReadOnly = true;
            txbTinhTrangHonNhan.Text = "";
            txbMaTinhTrangHonNhan.Text = "";
        }
    }
}