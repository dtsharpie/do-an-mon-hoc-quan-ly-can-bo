﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class DanhHieuPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            // Chưa ở trạng thái Insert thì chuyển sang Insert.
            if (EditState != EditState.Insert)
            {
                EditState = EditState.Insert;

                txbMaDanhHieu.Enabled = false;
                txbMaDanhHieu.Text = "Auto";

                txbDanhHieu.Text = "";
            }
            // Còn không thì add vào csdl.
            else if (EditState == EditState.Insert)
            {
                DanhMucTable.Insert(new string[] { txbDanhHieu.Text });
                txbDanhHieu.Text = "";
            }
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            // Không ở EditState.Update khi page vừa được load, đang ở trạng thái EditState.None
            if (EditState == EditState.Update)
            {
                string ma_hh = txbMaDanhHieu.Text;
                string hh = txbDanhHieu.Text;
                DanhMucTable.Update(new string[] { ma_hh, hh });
            }
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaDanhHieu.ReadOnly = true;
            txbMaDanhHieu.Enabled = true;
            txbMaDanhHieu.Text = GetCellContent(selectedIndex, 0);

            txbDanhHieu.Text = GetCellContent(selectedIndex, 1);
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            DanhMucTable.Delete(GetCellContent(args.RowIndex, 0));

            txbMaDanhHieu.Enabled = true;
            txbMaDanhHieu.ReadOnly = true;
            txbDanhHieu.Text = "";
            txbMaDanhHieu.Text = "";
        }
    }
}