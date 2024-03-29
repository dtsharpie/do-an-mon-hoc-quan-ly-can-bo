﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;
using HutStaff.BO.PagesBO.QuanLy;
using System.Data;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class CongViecDamNhiemPage : DanhMucPageBase
    {
        #region //--------- Event Handlers --------------//

        /// <summary>
        /// Thêm cột và đổ dữ liệu cho GridView.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_cvdn", "Mã công việc");
                InsertColumn(1, "cvdn", "Công việc");

                FillData();

                gv.DataSource = DanhMucBO.View_all_cvdn_from_soyeu();
                gv.DataBind();
            }
        }

        #endregion

        #region //--------- Abstract Class Members ------//

        /// <summary>
        /// Thêm vào bảng dm_tt. Disable textbox mã tình trạng.
        /// </summary>
        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            txbMaTinhTrang.Enabled = false;
            txbMaTinhTrang.Text = "Auto";

            txbTinhTrangCongTac.Text = "";
        }

        /// <summary>
        /// Chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            if (EditState == EditState.Insert)
            {
                if (!String.IsNullOrEmpty(txbTinhTrangCongTac.Text))
                {
                    DanhMucTable.Insert(new string[] { txbTinhTrangCongTac.Text });
                }
            }
            else if (EditState == EditState.Update)
            {
                if (!String.IsNullOrEmpty(txbTinhTrangCongTac.Text))
                {
                    string ma_tt = txbMaTinhTrang.Text;
                    string tt = txbTinhTrangCongTac.Text;

                    DanhMucTable.Update(new string[] { ma_tt, tt });
                }
            }
        }

        /// <summary>
        /// Chỉnh sửa 1 dòng. TextBox mã tình trạng được enable và cho readonly.
        /// </summary>
        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            int selectedIndex = dataGridView.SelectedIndex;

            txbMaTinhTrang.ReadOnly = true;
            txbMaTinhTrang.Enabled = true;
            txbMaTinhTrang.Text = GetCellContent(selectedIndex, 0);

            txbTinhTrangCongTac.Text = GetCellContent(selectedIndex, 1);
        }

        /// <summary>
        /// Xử lý sắp sửa xóa 1 dòng.
        /// </summary>
        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            string ma_tt = GetCellContent(args.RowIndex, 0);
            DanhMucTable.Delete(ma_tt);

            txbMaTinhTrang.Enabled = true;
            txbMaTinhTrang.ReadOnly = true;
            txbTinhTrangCongTac.Text = "";
            txbMaTinhTrang.Text = "";
        }

        /// <summary>
        /// Lấy BO TinhTrangCongTac.
        /// </summary>
        protected override DanhMucTableBase DanhMucTable
        {
            get
            {
                if (danhMucTable == null)
                {
                    danhMucTable = new CongViecDamNhiemTable();
                }

                return danhMucTable;
            }
        }

        #endregion

        protected void ThemVaoDanhMuc(object sender, EventArgs e)
        {
            Button b = (Button)sender;

            DanhMucBO.Insert_dm_cvdn(b.CommandName);
            Response.Redirect("CongViecDamNhiemPage.aspx");
        }
        protected void GhiLai(object sender, EventArgs e)
        {
            Button b = (Button)sender;

            string s = b.CommandName;
        }
    }
}