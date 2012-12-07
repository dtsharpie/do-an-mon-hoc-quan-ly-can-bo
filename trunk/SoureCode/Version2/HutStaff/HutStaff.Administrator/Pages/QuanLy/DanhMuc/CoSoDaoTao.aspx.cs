using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class CoSoDaoTao : System.Web.UI.Page
    {
        private const int PAGE_SIZE = 20;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageNumberHiddenField.Value = "1";
                BindData(0);
            }
        }

        private void BindData(int pageIndex)
        {
            int total = 0;
            CSDTGridView.DataSource = BO.PagesBO.QuanLy.DanhMucBO.GetDSCSDT(pageIndex, PAGE_SIZE, ref total);
            CSDTGridView.DataBind();

            int? totalItem = BO.PagesBO.QuanLy.DanhMucBO.CountDSCSDT();
            int maxPage = (int)Math.Ceiling((float)totalItem / PAGE_SIZE);
            string pageInfo = "Tổng số: " + totalItem + ". Đang xem trang " + (pageIndex + 1) + "/" + maxPage;
            PageInfoLabel.Text = pageInfo;

            int s = pageIndex * PAGE_SIZE;
            int f = CSDTGridView.Rows.Count;
            for (int i = 0; i < f; i++)
            {
                CSDTGridView.Rows[i].Cells[0].Text = (s + i + 1).ToString();
            }
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            int currentPage = 1;
            try
            {
                currentPage = Int32.Parse(PageNumberHiddenField.Value);
                if (currentPage <= 0)
                {
                    currentPage = 1;
                }
            }
            catch (Exception)
            {
            }

            int? total = BO.PagesBO.QuanLy.DanhMucBO.CountDSCSDT();
            if (total != null)
            {
                int maxPage = (int)Math.Ceiling((float)total / PAGE_SIZE);
                if (currentPage + 1 <= maxPage)
                {
                    currentPage++;
                }
                PageNumberHiddenField.Value = currentPage.ToString();
                BindData(currentPage - 1);
            }
        }

        protected void PrevButton_Click(object sender, EventArgs e)
        {
            int currentPage = 1;
            try
            {
                currentPage = Int32.Parse(PageNumberHiddenField.Value);
                if (currentPage <= 0)
                {
                    currentPage = 1;
                }
            }
            catch (Exception)
            {
            }

            if (currentPage > 1)
            {
                currentPage--;
            }
            PageNumberHiddenField.Value = currentPage.ToString();
            BindData(currentPage - 1);
        }

        protected void FirstButton_Click(object sender, EventArgs e)
        {
            PageNumberHiddenField.Value = "1";
            BindData(0);
        }

        protected void LastButton_Click(object sender, EventArgs e)
        {
            int? total = BO.PagesBO.QuanLy.DanhMucBO.CountDSCSDT();
            if (total != null)
            {
                int maxPage = (int)Math.Ceiling((float)total / PAGE_SIZE);
                PageNumberHiddenField.Value = maxPage.ToString();
                BindData(maxPage - 1);
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            GridViewRow row = (GridViewRow)b.Parent.Parent;
            string oldCSDT = ((HiddenField)row.FindControl("OldCSDTName")).Value;
            string newCSDT = ((TextBox)row.FindControl("NewCSDTName")).Text;
            if (oldCSDT.Trim() == newCSDT.Trim())
            {
                string err = "alert('Không có sự thay đổi');";
                ClientScript.RegisterStartupScript(this.GetType(), "Not_Changed", err, true);
            }
            else
            {
                BO.PagesBO.QuanLy.DanhMucBO.UpdateDSCSDT(oldCSDT, newCSDT);
                BindData(Int32.Parse(PageNumberHiddenField.Value) - 1);
            }
        }
    }
}