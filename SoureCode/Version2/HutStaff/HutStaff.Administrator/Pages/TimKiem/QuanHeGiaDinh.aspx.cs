using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class QuanHeGiaDinh : System.Web.UI.Page
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
            iShcc = Int32.Parse(ViewState["ishcc"].ToString());
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

            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQhgdById(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }


            DataTable quanheGiaDinhDT = BO.Thongtinchung.Thongtinchung.GetAllQuanHeGiaDinh();
            DropDownlistQuanHe.DataSource = quanheGiaDinhDT;
            DropDownlistQuanHe.DataTextField = "qhgd";
            DropDownlistQuanHe.DataValueField = "ma_qhgd";
            DropDownlistQuanHe.DataBind();

            DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            DropdownListQuocTich.DataSource = danhmucquocgiaDT;
            DropdownListQuocTich.DataTextField = "qg";
            DropdownListQuocTich.DataValueField = "ma_qg";
            DropdownListQuocTich.DataBind();


            DropdownListNoiDinhCu.DataSource = danhmucquocgiaDT;
            DropdownListNoiDinhCu.DataTextField = "qg";
            DropdownListNoiDinhCu.DataValueField = "ma_qg";
            DropdownListNoiDinhCu.DataBind();

        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            Thongtinchung.DeleteQuanHeGiaDinh(id);
            Bind();
        }

        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable qhgdDataTable = BO.Thongtinchung.Thongtinchung.FindQuanHeGiaDinhByID(id);
            string quanhe = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["qhgd"].ToString()) ? qhgdDataTable.Rows[0]["qhgd"].ToString() : "0";
            string quoctich = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["qt_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["qt_qhgd"].ToString() : "0";
            string noidinhcu = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["ndc_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["ndc_qhgd"].ToString() : "0";

            DataTable quanheGiaDinhDT = BO.Thongtinchung.Thongtinchung.GetAllQuanHeGiaDinh();
            DropDownlistQuanHe.DataSource = quanheGiaDinhDT;
            DropDownlistQuanHe.DataTextField = "qhgd";
            DropDownlistQuanHe.DataValueField = "ma_qhgd";
            DropDownlistQuanHe.DataBind();
            DropDownlistQuanHe.SelectedValue = quanhe;

            DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            DropdownListQuocTich.DataSource = danhmucquocgiaDT;
            DropdownListQuocTich.DataTextField = "qg";
            DropdownListQuocTich.DataValueField = "ma_qg";
            DropdownListQuocTich.DataBind();
            DropdownListQuocTich.SelectedValue = quoctich;


            DropdownListNoiDinhCu.DataSource = danhmucquocgiaDT;
            DropdownListNoiDinhCu.DataTextField = "qg";
            DropdownListNoiDinhCu.DataValueField = "ma_qg";
            DropdownListNoiDinhCu.DataBind();
            DropdownListNoiDinhCu.SelectedValue = noidinhcu;



            string ngaythangBD = qhgdDataTable.Rows[0]["ns_qhgd"] != null ? Convert.ToDateTime(qhgdDataTable.Rows[0]["ns_qhgd"]).ToString("dd/MM/yyyy") : "";
            string ngay = ngaythangBD.Substring(0, 2);
            DropDownListNgaySinh.SelectedValue = ngay;
            string thang = ngaythangBD.Substring(3, 2);
            DropDownListThangSinh.SelectedValue = thang;
            string nam = ngaythangBD.Substring(6, 4);
            txtNamSinh.Text = nam;

            txtHoVaTen.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["ht_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["ht_qhgd"].ToString() : "";
            txtChoOHienNay.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["no_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["no_qhgd"].ToString() : "";
            txtChucVu.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["cv_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["cv_qhgd"].ToString() : "";
            txtNgheNghiep.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["nn_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["nn_qhgd"].ToString() : "";
            txtNoiCongTac.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["nct_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["nct_qhgd"].ToString() : "";
            txtThongTinKhac.Text = !String.IsNullOrEmpty(qhgdDataTable.Rows[0]["ttk_qhgd"].ToString()) ? qhgdDataTable.Rows[0]["ttk_qhgd"].ToString() : "";
        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if (saveButton.Text == "Ghi nhận")
            {
                string namSinh = txtNamSinh.Text;
                string ngaySinh = DropDownListNgaySinh.SelectedValue.ToString();
                string thangSinh = DropDownListThangSinh.SelectedValue.ToString();
                string ngaythangnam = string.Format("{0}/{1}/{2}",ngaySinh,thangSinh,  namSinh);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangnamSinh;
                try
                {
                     ngaythangnamSinh = Convert.ToDateTime(ngaythangnam, dtfi);
                }
                catch
                {
                    return;
                }

                BO.Thongtinchung.Thongtinchung.InsertQuanHeGiaDinh(Int32.Parse(ViewState["ishcc"].ToString()), Int32.Parse(DropDownlistQuanHe.SelectedValue.ToString()), txtHoVaTen.Text, ngaythangnamSinh, txtNgheNghiep.Text, txtChucVu.Text, txtChoOHienNay.Text, txtNoiCongTac.Text, Int32.Parse(DropdownListQuocTich.SelectedValue.ToString()), Int32.Parse(DropdownListNoiDinhCu.SelectedValue.ToString()), txtThongTinKhac.Text);
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {
                string namSinh = txtNamSinh.Text;
                string ngaySinh = DropDownListNgaySinh.SelectedValue.ToString();
                string thangSinh = DropDownListThangSinh.SelectedValue.ToString();
                string ngaythangnam = string.Format("{0}/{1}/{2}", ngaySinh, thangSinh, namSinh);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangnamSinh = Convert.ToDateTime(ngaythangnam, dtfi);

                BO.Thongtinchung.Thongtinchung.UpdateQuanHeGiaDinh(Int32.Parse(ViewState["id"].ToString()), Int32.Parse(DropDownlistQuanHe.SelectedValue.ToString()), txtHoVaTen.Text, ngaythangnamSinh, txtNgheNghiep.Text, txtChucVu.Text, txtChoOHienNay.Text, txtNoiCongTac.Text, Int32.Parse(DropdownListQuocTich.SelectedValue.ToString()), Int32.Parse(DropdownListNoiDinhCu.SelectedValue.ToString()), txtThongTinKhac.Text);
                Bind();
            }
            resetData();
        }

        protected void resetButtonClick(object sender, EventArgs e)
        {
            resetData();
        }

        public void resetData()
        {
            saveButton.Text = "Ghi nhận";
            //DataTable quanheGiaDinhDT = BO.Thongtinchung.Thongtinchung.GetAllQuanHeGiaDinh();
            //DropDownlistQuanHe.DataSource = quanheGiaDinhDT;
            //DropDownlistQuanHe.DataTextField = "qhgd";
            //DropDownlistQuanHe.DataValueField = "ma_qhgd";
            //DropDownlistQuanHe.DataBind();
            //DropDownlistQuanHe.SelectedValue = "0";

            //DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            //DropdownListQuocTich.DataSource = danhmucquocgiaDT;
            //DropdownListQuocTich.DataTextField = "qg";
            //DropdownListQuocTich.DataValueField = "ma_qg";
            //DropdownListQuocTich.DataBind();
            //DropdownListQuocTich.SelectedValue = "0";


            //DropdownListNoiDinhCu.DataSource = danhmucquocgiaDT;
            //DropdownListNoiDinhCu.DataTextField = "qg";
            //DropdownListNoiDinhCu.DataValueField = "ma_qg";
            //DropdownListNoiDinhCu.DataBind();
            //DropdownListNoiDinhCu.SelectedValue = "0";

            DropDownListNgaySinh.SelectedValue = "0";
            DropDownListThangSinh.SelectedValue = "0";

            txtHoVaTen.Text = "";
            txtChucVu.Text = "";
            txtChoOHienNay.Text = "";
            txtNamSinh.Text = "";
            txtNgheNghiep.Text = "";
            txtNoiCongTac.Text = "";
            txtThongTinKhac.Text = "";
        }
    }
}