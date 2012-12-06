using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class DonVi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillGridView();
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs args)
        {
            GridViewRow selectedRow = grvDonVi.Rows[grvDonVi.SelectedIndex];
            txbMaDonVi.Text = selectedRow.Cells[0].Text;
            txbTenDonVi.Text = HttpUtility.HtmlDecode(selectedRow.Cells[1].Text);
        }

        protected void OnSaveButtonClick(object sender, EventArgs args)
        {
            string ma_dv = txbMaDonVi.Text;
            string dv = txbTenDonVi.Text;
            bool found = HutStaff.BO.QuanLy.DanhMuc.DonVi.Find(ma_dv, "id", "id");

            if (found)
            {
                HutStaff.BO.QuanLy.DanhMuc.DonVi.Update(ma_dv, dv);
                FillGridView();
            }
            else
            {
                HutStaff.BO.QuanLy.DanhMuc.DonVi.Insert(ma_dv, dv);
                FillGridView();
            }
        }

        protected void OnNewButtonClick(object sender, EventArgs args)
        {
            txbMaDonVi.Text = "";
            txbTenDonVi.Text = "";
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            string ma_dv = args.Values[0].ToString();
            HutStaff.BO.QuanLy.DanhMuc.DonVi.Delete(ma_dv);

            FillGridView();
        }

        /// <summary>
        /// Lấy dữ liệu từ bảng dm_dv và cho vào view.
        /// </summary>
        private void FillGridView()
        {
            grvDonVi.DataSource = HutStaff.BO.QuanLy.DanhMuc.DonVi.GetAll();
            grvDonVi.DataBind();
        }
    }
}