using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class CacChucDanh : System.Web.UI.Page
    {
        protected int iShcc;
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
                    ViewState["ishcc"] = iShcc;
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

        protected void Bind()
        {

            //add name
            iShcc = Int32.Parse (ViewState["ishcc"].ToString());
            DataTable thongtinchitiet = SearchDetailBO.ThongTinChiTiet(iShcc);
            string htbHoVaTenDem = thongtinchitiet.Rows[0]["hodem"].ToString();
            string htbTen = thongtinchitiet.Rows[0]["ten"].ToString();
            string dpkNgaySinh = thongtinchitiet.Rows[0]["ntns"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntns"]).ToString("dd/MM/yyyy") : "";

            int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            donviquanli.PrimaryKey = new DataColumn[1] { donviquanli.Columns[0] };
            DataRow dataRow = donviquanli.Rows.Find(ma_dvql.ToString());
            if (dataRow != null)
            {
                object tableRow = dataRow.ItemArray[1];
                string nameDonVi = tableRow.ToString();
                nameLabel.Text = string.Format("{0} {1}({2}) - {3}", htbHoVaTenDem, htbTen, dpkNgaySinh, nameDonVi);
            }

            nameLabel.Text = string.Format("{0} {1}({2})", htbHoVaTenDem, htbTen, dpkNgaySinh);


            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetChucdanh(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }


            DataTable dataTable = BO.Thongtinchung.Thongtinchung.GetAllDanhHieuDuocPhong();
            cacchudanhdownList.DataSource = dataTable;
            cacchudanhdownList.DataTextField = "dhdp";
            cacchudanhdownList.DataValueField = "ma_dhdp";
            cacchudanhdownList.DataBind();
            
        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if (saveButton.Text == "Cập nhật")
            {
                int cdcn = 0;
                if(Checkbox1.Checked == true)
                {
                    cdcn =1;
                }
                else
                {
                    cdcn = 0;
                }
                string ngay = DropDownListNgayBoNhiem.SelectedValue.ToString();
                string thang = DropDownListThangBoNhiem.SelectedValue.ToString();
                string nam = txtNamBoNhiem.Text;
                if (nam == "")
                    return;

                string ngaythangnam = string.Format("{0}/{1}/{2}",ngay,thang,nam);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythang = Convert.ToDateTime(ngaythangnam, dtfi);

                BO.Thongtinchung.Thongtinchung.UpdateCacChucDanh(Int32.Parse(ViewState["id"].ToString()), Int32.Parse(ViewState["ishcc"].ToString()),Int32.Parse(cacchudanhdownList.SelectedValue.ToString()),Int32.Parse(txtNamBoNhiem.Text),1,cdcn,thongtinkhacTextBox.Text,ngaythang);
                Bind();

            }
            if(saveButton.Text == "Ghi nhận")
            {
                int cdcn = 0;
                if(Checkbox1.Checked == true)
                {
                    cdcn =1;
                }
                else
                {
                    cdcn = 0;
                }
                string ngay = DropDownListNgayBoNhiem.SelectedValue.ToString();
                string thang = DropDownListThangBoNhiem.SelectedValue.ToString();
                string nam = txtNamBoNhiem.Text;
                if (nam == "")
                    return;

                string ngaythangnam = string.Format("{0}/{1}/{2}",ngay,thang,nam);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythang = Convert.ToDateTime(ngaythangnam, dtfi);
                BO.Thongtinchung.Thongtinchung.InsertCacChucDanh(Int32.Parse(ViewState["ishcc"].ToString()), Int32.Parse(cacchudanhdownList.SelectedValue.ToString()), Int32.Parse( nam), 1, cdcn, thongtinkhacTextBox.Text, ngaythang);
                Bind();
            }
        }

        protected void resetButtonClick(object sender, EventArgs e)
        {
            thongtinkhacTextBox.Text = "";
            Checkbox1.Checked = false;
            txtNamBoNhiem.Text = "";
            saveButton.Text = "Ghi nhận";

            DataTable dataTableDanhHieu = BO.Thongtinchung.Thongtinchung.GetAllDanhHieuDuocPhong();
            cacchudanhdownList.DataSource = dataTableDanhHieu;
            cacchudanhdownList.DataTextField = "dhdp";
            cacchudanhdownList.DataValueField = "ma_dhdp";
            cacchudanhdownList.DataBind();
        }

        protected void updateData(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();


            DataTable dataTable = BO.Thongtinchung.Thongtinchung.FindCacDanhHieuByID(id);
            int ma_hp = Int32.Parse( dataTable.Rows[0].ItemArray[2].ToString());

            DataTable dataTableDanhHieu = BO.Thongtinchung.Thongtinchung.GetAllDanhHieuDuocPhong();
            cacchudanhdownList.DataSource = dataTableDanhHieu;
            cacchudanhdownList.DataTextField = "dhdp";
            cacchudanhdownList.DataValueField = "ma_dhdp";
            cacchudanhdownList.DataBind();
            cacchudanhdownList.SelectedValue = ma_hp.ToString();


            string ngaythangph = dataTable.Rows[0]["ntnpdh"] != null ? Convert.ToDateTime(dataTable.Rows[0]["ntnpdh"]).ToString("dd/MM/yyyy") : "";
           // string ngay = DateTime.Parse(ngaythangph, new CultureInfo("en-US")).Day.ToString();
            string ngay = ngaythangph.Substring(0, 2);
            DropDownListNgayBoNhiem.SelectedValue = ngay;
          //  string thang = DateTime.Parse(ngaythangph, new CultureInfo("en-US")).Month.ToString();
            string thang = ngaythangph.Substring(3, 2);
            DropDownListThangBoNhiem.SelectedValue = thang;

            string nam = ngaythangph.Substring(6, 4);
            txtNamBoNhiem.Text = nam;

            thongtinkhacTextBox.Text = dataTable.Rows[0]["ttk_qtcd"] != null ? dataTable.Rows[0]["ttk_qtcd"].ToString() : "";
            string cdcn  = dataTable.Rows[0]["cdcn"] != null ?  dataTable.Rows[0]["cdcn"].ToString(): "";
            if (cdcn == "True")
            {
                Checkbox1.Checked = true;
            }
            else
            {
                Checkbox1.Checked = false;
            }
        }

        protected void deleteData(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);

            Thongtinchung.DeleteCacChucDanh(id);
            Bind();
        }
    }
}