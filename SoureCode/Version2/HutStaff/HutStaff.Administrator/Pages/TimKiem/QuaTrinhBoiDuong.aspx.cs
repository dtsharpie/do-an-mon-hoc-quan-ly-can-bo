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
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class QuaTrinhBoiDuong : System.Web.UI.Page
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




            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQuatrinhboiduong(iShcc);
            if (tblData.Rows.Count > 0)
            {
                DataColumn themColumns = tblData.Columns.Add("thoigian");
                foreach (DataRow Row in tblData.Rows)
                {
                    string namBatDau = !String.IsNullOrEmpty(Row["tgbd_bd"].ToString()) ? Convert.ToDateTime(Row["tgbd_bd"].ToString()).ToString("MM/yyyy") : "nay";
                    string namKetThuc = !String.IsNullOrEmpty(Row["tgkt_bd"].ToString()) ? Convert.ToDateTime(Row["tgkt_bd"].ToString()).ToString("MM/yyyy") : "nay";
                    Row["thoigian"] = string.Format("{0} > {1}", namBatDau, namKetThuc);
                }
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }

            DataTable vanbang = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            
            DropDownListVanBang.DataSource = vanbang;
            DropDownListVanBang.DataTextField = "vbdt";
            DropDownListVanBang.DataValueField = "ma_vbdt";
            DropDownListVanBang.DataBind();

            DataTable hinhthuc = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucBoiDuong.DataSource = hinhthuc;
            DropDownListHinhThucBoiDuong.DataTextField = "htdt";
            DropDownListHinhThucBoiDuong.DataValueField = "ma_htdt";
            DropDownListHinhThucBoiDuong.DataBind();


        }

        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();


            DataTable quatrinhboiduong = BO.Thongtinchung.Thongtinchung.FindQuaTrinhBoiDuongByID(id);

            DataTable vanbang = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            DropDownListVanBang.DataSource = vanbang;
            DropDownListVanBang.DataTextField = "vbdt";
            DropDownListVanBang.DataValueField = "ma_vbdt";
            DropDownListVanBang.DataBind();
            DropDownListVanBang.SelectedItem.Text = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["vbbd"].ToString()) ? quatrinhboiduong.Rows[0]["vbbd"].ToString() : "Chưa qua đào tạo";

            DataTable hinhthuc = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucBoiDuong.DataSource = hinhthuc;
            DropDownListHinhThucBoiDuong.DataTextField = "htdt";
            DropDownListHinhThucBoiDuong.DataValueField = "ma_htdt";
            DropDownListHinhThucBoiDuong.DataBind();
            DropDownListHinhThucBoiDuong.SelectedValue = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["htbd"].ToString()) ? quatrinhboiduong.Rows[0]["htbd"].ToString() : "0";

            //thoi gian bat dau
            string ngaythangDi = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["tgbd_bd"].ToString()) ? Convert.ToDateTime(quatrinhboiduong.Rows[0]["tgbd_bd"].ToString()).ToString("dd/MM/yyyy") : "";
            string ngay = ngaythangDi.Substring(0, 2);
            DropDownListNgayBatDau.SelectedValue = ngay;
            string thang = ngaythangDi.Substring(3, 2);
            DropDownListThangBatDau.SelectedValue = thang;
            try
            {
                string nam = ngaythangDi.Substring(6, 4);
                txtNamBatDau.Text = nam;
            }
            catch (Exception)
            {

            }

            //ngay ket thuc 
            string ngaythangph = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["tgkt_bd"].ToString()) ? Convert.ToDateTime(quatrinhboiduong.Rows[0]["tgkt_bd"].ToString()).ToString("dd/MM/yyyy") : "";
            if (ngaythangph == "")
            {
                DropDownListNgayKetThuc.SelectedValue = "0";
                DropDownListThangKetThuc.SelectedValue = "0";
                txtNamKetThuc.Text = "";
            }
            else
            {
                string ngaythangnamKT = string.Format("01/01/1900");
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime checkDateTime = Convert.ToDateTime(ngaythangnamKT, dtfi);

                if (Convert.ToDateTime(quatrinhboiduong.Rows[0]["tgkt_bd"].ToString()) != checkDateTime)
                {
                    string ngayKT = ngaythangph.Substring(0, 2);
                    DropDownListNgayKetThuc.SelectedValue = ngayKT;
                    string thangKT = ngaythangph.Substring(3, 2);
                    DropDownListThangKetThuc.SelectedValue = thangKT;
                    try
                    {
                        string namKT = ngaythangph.Substring(6, 4);
                        txtNamKetThuc.Text = namKT;
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
                    DropDownListNgayKetThuc.SelectedValue = "0";
                    DropDownListThangKetThuc.SelectedValue = "0";
                    txtNamKetThuc.Text = "";
                }
            }

            txtNoiBoiDuong.Text = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["nbd_qtbd"].ToString()) ? (quatrinhboiduong.Rows[0]["nbd_qtbd"].ToString()): "";
            txtNoiDungBoiDuong.Text = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["ndbd"].ToString()) ? (quatrinhboiduong.Rows[0]["ndbd"].ToString()) : "";
            txtDanhGia.Text = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["dg_qtbd"].ToString()) ? (quatrinhboiduong.Rows[0]["dg_qtbd"].ToString()) : "";
            txtThongTinKhac.Text = !String.IsNullOrEmpty(quatrinhboiduong.Rows[0]["ttk_qtbd"].ToString()) ?(quatrinhboiduong.Rows[0]["ttk_qtbd"].ToString()) : "";
        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            Thongtinchung.DeleteQuyTrinhBoiDuong(id);
            Bind();
        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if (saveButton.Text == "Ghi nhận")
            {
                string ngayHT = DropDownListNgayBatDau.SelectedValue.ToString();
                string thangHT = DropDownListThangBatDau.SelectedValue.ToString();
                string namHT = txtNamBatDau.Text;
                string ngaythangnamHT;
                if (namHT == "")
                {
                    ngaythangnamHT = "01/01/1900";
                }
                else
                {
                    ngaythangnamHT = string.Format("{0}/{1}/{2}", ngayHT, thangHT, namHT);
                }
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangHuongTu = Convert.ToDateTime(ngaythangnamHT, dtfi);

                string ngayKT = DropDownListNgayKetThuc.SelectedValue.ToString();
                string thangKT = DropDownListThangKetThuc.SelectedValue.ToString();
                string namKT = txtNamKetThuc.Text;
                string ngaythangnamKT;
                if (namKT == "")
                {
                    ngaythangnamKT = "01/01/1900";
                }
                else
                {
                    ngaythangnamKT = string.Format("{0}/{1}/{2}", ngayKT, thangKT, namKT);
                }
                DateTime ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);

                BO.Thongtinchung.Thongtinchung.InsertQuyTrinhBoiDuong(Int32.Parse(ViewState["ishcc"].ToString()), ngaythangHuongTu, ngaythangKT, txtNoiBoiDuong.Text, Int32.Parse(DropDownListHinhThucBoiDuong.SelectedValue.ToString()), txtNoiDungBoiDuong.Text, DropDownListVanBang.SelectedItem.Text, txtDanhGia.Text, txtThongTinKhac.Text);
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {
                string ngayHT = DropDownListNgayBatDau.SelectedValue.ToString();
                string thangHT = DropDownListThangBatDau.SelectedValue.ToString();
                string namHT = txtNamBatDau.Text;
                if (namHT == "")
                    return;

                string ngaythangnamHT = string.Format("{0}/{1}/{2}", ngayHT, thangHT, namHT);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangHuongTu = Convert.ToDateTime(ngaythangnamHT, dtfi);

                string ngayKT = DropDownListNgayKetThuc.SelectedValue.ToString();
                string thangKT = DropDownListThangKetThuc.SelectedValue.ToString();
                string namKT = txtNamKetThuc.Text;
                if (namHT == "")
                    return;
                string ngaythangnamKT = string.Format("{0}/{1}/{2}", ngayKT, thangKT, namKT);
                DateTime ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);

                BO.Thongtinchung.Thongtinchung.UpdateQuyTrinhBoiDuong(Int32.Parse(ViewState["id"].ToString()), ngaythangHuongTu, ngaythangKT, txtNoiBoiDuong.Text, Int32.Parse(DropDownListHinhThucBoiDuong.SelectedValue.ToString()), txtNoiDungBoiDuong.Text, DropDownListVanBang.SelectedItem.Text, txtDanhGia.Text, txtThongTinKhac.Text);
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
            txtDanhGia.Text = "";
            txtNamBatDau.Text = "";
            txtNamKetThuc.Text = "";
            txtNoiBoiDuong.Text = "";
            txtNoiDungBoiDuong.Text = "";
            txtThongTinKhac.Text = "";


            DataTable vanbang = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            DropDownListVanBang.DataSource = vanbang;
            DropDownListVanBang.DataTextField = "vbdt";
            DropDownListVanBang.DataValueField = "ma_vbdt";
            DropDownListVanBang.DataBind();

            DataTable hinhthuc = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucBoiDuong.DataSource = hinhthuc;
            DropDownListHinhThucBoiDuong.DataTextField = "htdt";
            DropDownListHinhThucBoiDuong.DataValueField = "ma_htdt";
            DropDownListHinhThucBoiDuong.DataBind();
        }
    }
}