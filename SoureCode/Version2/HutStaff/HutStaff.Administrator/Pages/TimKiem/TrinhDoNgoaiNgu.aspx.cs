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
            if (IsPostBack)
                return;
            try
            {
                string id = Request.QueryString["id"];
                if (!"".Equals(id))
                {
                    iShcc = Convert.ToInt32(id);
                    ViewState["ishcc"] = iShcc.ToString();
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
            iShcc = Int32.Parse( ViewState["ishcc"].ToString());
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
            if (saveButton.Text == "Ghi nhận")
            {
                string id = Request.QueryString["id"];
                iShcc = Int32.Parse( ViewState["ishcc"].ToString());
                Thongtinchung.InsertNgoaiNgu(iShcc, Int32.Parse(ngoainguDropdownList.SelectedValue), Int32.Parse(trinhdoDropdownList.SelectedValue), thongtinchungTextBox.Text);
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {

                Thongtinchung.UpdateTrinhdoNgoaiNgu(Int32.Parse(ViewState["damn"].ToString()),Int32.Parse(ngoainguDropdownList.SelectedValue), Int32.Parse(trinhdoDropdownList.SelectedValue), thongtinchungTextBox.Text);
                Bind();
            }
        }


        protected void resetButtonClick(object sender, EventArgs e)
        {
            thongtinchungTextBox.Text = "";
            saveButton.Text = "Ghi nhận";                    
        }

        protected void gridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["damn"] = id.ToString();

            DataTable dataTable = Thongtinchung.FindByIDTrinhDoNgoaiNgu_TBL(id);

            int ma_ngoaingu =Int32.Parse( dataTable.Rows[0].ItemArray[2].ToString()) ;
            int ma_trinhdo = !String.IsNullOrEmpty(dataTable.Rows[0].ItemArray[3].ToString()) ? Convert.ToInt32(dataTable.Rows[0].ItemArray[3].ToString()) : 1;
            


            DataTable ngoaingu = SearchDetailBO.getAllNgoaiNgu();
            ngoainguDropdownList.DataTextField = "tnn";
            ngoainguDropdownList.DataValueField = "ma_tnn";
            ngoainguDropdownList.DataSource = ngoaingu;
            ngoainguDropdownList.DataBind();
            ngoainguDropdownList.SelectedValue = ma_ngoaingu.ToString();


            DataTable trinhdoNgoaingu = SearchDetailBO.getAllTrinhDoNgoaiNgu();
            trinhdoDropdownList.DataTextField = "tdnn";
            trinhdoDropdownList.DataValueField = "ma_tdnn";
            trinhdoDropdownList.DataSource = trinhdoNgoaingu;
            trinhdoDropdownList.DataBind();
            trinhdoDropdownList.SelectedValue = ma_trinhdo.ToString();

        }

        protected void gridViewDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void gridViewDeleted(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            
            Thongtinchung.DeleteTrinhDoNgoaiNgu(id);
            Bind();
        }


    }
}