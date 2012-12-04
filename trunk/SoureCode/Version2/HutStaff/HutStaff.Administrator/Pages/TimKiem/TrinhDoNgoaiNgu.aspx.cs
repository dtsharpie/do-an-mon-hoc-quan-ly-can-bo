using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class TrinhDoNgoaiNgu : System.Web.UI.Page
    {
        public int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //    return;
            try
            {
                string id = Request.QueryString["id"];
                if (!"".Equals(id))
                {
                    iShcc = Convert.ToInt32(id);
                }
            }
            catch (Exception e1)
            {
            }
            if (iShcc > 0)
            {
                Bind();
            }

            string sDirectory = HttpContext.Current.Server.MapPath("/Anhcanbo");
            sDirectory = sDirectory.EndsWith("\\") ? sDirectory : sDirectory + "\\";
            string sImage = "";
            if (File.Exists(sDirectory + iShcc.ToString() + ".jpg"))
            {
                sImage = "/Anhcanbo/" + iShcc.ToString() + ".jpg";
            }
            else if (File.Exists(sDirectory + iShcc.ToString() + ".png"))
            {
                sImage = "/Anhcanbo/" + iShcc.ToString() + ".png";
            }
            else
            {
                sImage = "/Images/" + "no_avatar.jpg";
            }

            FaceImage.ImageUrl = sImage;

        }

        public void Bind()
        {
            //add name
            DataTable thongtinchitiet = SearchDetailBO.ThongTinChiTiet(iShcc);
            string htbHoVaTenDem = thongtinchitiet.Rows[0]["hodem"].ToString();
            string htbTen  = thongtinchitiet.Rows[0]["ten"].ToString();
            string dpkNgaySinh  = thongtinchitiet.Rows[0]["ntns"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntns"]).ToString("dd/MM/yyyy") : "";
           
            int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            donviquanli.PrimaryKey = new DataColumn[1] { donviquanli.Columns[0]};
            DataRow dataRow = donviquanli.Rows.Find(ma_dvql.ToString());
            if (dataRow != null)
            {
                object tableRow = dataRow.ItemArray[1];
                string nameDonVi = tableRow.ToString();
                nameLabel.Text = string.Format("{0} {1}({2}) - {3}", htbHoVaTenDem, htbTen, dpkNgaySinh, nameDonVi);
            }

            nameLabel.Text = string.Format("{0} {1}({2})", htbHoVaTenDem, htbTen, dpkNgaySinh);




            DataTable ngoaingu = SearchDetailBO.getAllNgoaiNgu();
            ngoainguDropdownList.DataTextField = "tnn";
            ngoainguDropdownList.DataValueField = "ma_tnn";
            ngoainguDropdownList.DataSource = ngoaingu;
            ngoainguDropdownList.DataBind();


            DataTable trinhdoNgoaingu = SearchDetailBO.getAllTrinhDoNgoaiNgu();
            trinhdoDropdownList.DataTextField = "tdnn";
            trinhdoDropdownList.DataValueField = "ma_tdnn";
            trinhdoDropdownList.DataSource = trinhdoNgoaingu;
            trinhdoDropdownList.DataBind();




            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetTrinhdoNgoaiNguById(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }
        }

        public void saveButtonClick(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!"".Equals(id))
            {
                iShcc = Convert.ToInt32(id);
            }

            Thongtinchung.InsertNgoaiNgu (iShcc,Int32.Parse(ngoainguDropdownList.SelectedValue),Int32.Parse(trinhdoDropdownList.SelectedValue), thongtinchungTextBox.Text);

            Bind();
        }


        protected void resetButtonClick(object sender, EventArgs e)
        {
            thongtinchungTextBox.Text = "";
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if ("edit".Equals(e.CommandName))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string tnn = row.Cells[0].Text;
                string tdnn = row.Cells[1].Text;
                ngoainguDropdownList.SelectedIndex = ngoainguDropdownList.Items.IndexOf(ngoainguDropdownList.Items.FindByValue(tnn));
                trinhdoDropdownList.SelectedIndex = trinhdoDropdownList.Items.IndexOf(trinhdoDropdownList.Items.FindByValue(tdnn));
                lbResult.Text = "Sửaaaaaaa";
            }
            else if ("delete".Equals(e.CommandName))
            {
                lbResult.Text = "Xóaaaa";
            }
        }
    }
}