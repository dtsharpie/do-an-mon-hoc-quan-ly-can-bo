using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using HutStaff.BO.PagesBO.TimKiem;
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class ChucVuChinhQuyen : System.Web.UI.Page
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
            iShcc = Int32.Parse( ViewState["ishcc"].ToString());
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
            //END add name

            //
            DataTable tblData = BO.Thongtinchung.Thongtinchung.Getchucvuchinhquyen(iShcc);
            DataColumn themColumns = tblData.Columns.Add("thoigian");
            foreach (DataRow Row in tblData.Rows)
            {
                string namBatDau = !String.IsNullOrEmpty( Row["nbncvkn"].ToString()) ? Convert.ToDateTime(Row["nbncvkn"].ToString()).ToString("MM/yyyy"):"nay";
                string namKetThuc = !String.IsNullOrEmpty(Row["nktcvkn"].ToString()) ? Convert.ToDateTime(Row["nktcvkn"].ToString()).ToString("MM/yyyy") : "nay";
                if (namKetThuc == "01/1900")
                    namKetThuc = "nay";
                Row["thoigian"] = string.Format("{0} > {1}", namBatDau, namKetThuc);
            }

            GridView1.DataSource = tblData;
            GridView1.DataBind();

            DataTable chucvuChinhQuyenDT = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
            DropDownListBoSungDuLieuChucVu.DataSource = chucvuChinhQuyenDT;
            DropDownListBoSungDuLieuChucVu.DataTextField = "cv";
            DropDownListBoSungDuLieuChucVu.DataValueField = "ma_cv";
            DropDownListBoSungDuLieuChucVu.DataBind();


            DropDownListBoSungDuLieuDonViQuanLy.DataSource = donviquanli;
            DropDownListBoSungDuLieuDonViQuanLy.DataTextField = "dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataValueField = "ma_dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataBind();


        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if (saveButton.Text == "Ghi nhận")
            {
                if (checkBoxDennay.Checked == true)
                {
                    txtNamKetThuc.Text = "";
                }
                string ngayHT = DropDownListNgayBoNhiem.SelectedValue.ToString();
                string thangHT = DropDownListThangBoNhiem.SelectedValue.ToString();
                string namHT = txtNamBoNhiem.Text;
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
                DateTime ngaythangBD = Convert.ToDateTime(ngaythangnamHT, dtfi);

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


                string donvi = DropDownListBoSungDuLieuDonViQuanLy.SelectedItem.Text;
                BO.Thongtinchung.Thongtinchung.InsertChucVuChinhQuyen(Int32.Parse(ViewState["ishcc"].ToString()), Int32.Parse(DropDownListBoSungDuLieuChucVu.SelectedValue.ToString()), ngaythangBD, ngaythangKT, txtThongTinKhac.Text,donvi);
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {
                if (checkBoxDennay.Checked == true)
                {
                    txtNamKetThuc.Text = "";
                }
                string ngayHT = DropDownListNgayBoNhiem.SelectedValue.ToString();
                string thangHT = DropDownListNgayBoNhiem.SelectedValue.ToString();
                string namHT = txtNamBoNhiem.Text;
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
                DateTime ngaythangBD = Convert.ToDateTime(ngaythangnamHT, dtfi);

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

                string donvi = DropDownListBoSungDuLieuDonViQuanLy.SelectedItem.Text;
                BO.Thongtinchung.Thongtinchung.UpdateChucVuChinhQuyen(Int32.Parse(ViewState["id"].ToString()), Int32.Parse(DropDownListBoSungDuLieuChucVu.SelectedValue.ToString()), ngaythangBD, ngaythangKT, txtThongTinKhac.Text, donvi);
                Bind();
            }
            resetData();
        }

        protected void resetButtonClick(object sender, EventArgs e)
        {
            resetData();
        }

        protected void GridView1Changed(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable chucvuchinhquyenByID = BO.Thongtinchung.Thongtinchung.GetChucVuChinhQuyenByID(id);

            DataTable chucvuChinhQuyenDT = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
            DropDownListBoSungDuLieuChucVu.DataSource = chucvuChinhQuyenDT;
            DropDownListBoSungDuLieuChucVu.DataTextField = "cv";
            DropDownListBoSungDuLieuChucVu.DataValueField = "ma_cv";
            DropDownListBoSungDuLieuChucVu.DataBind();
            DropDownListBoSungDuLieuChucVu.SelectedValue = !String.IsNullOrEmpty(chucvuchinhquyenByID.Rows[0]["ma_cv"].ToString()) ? chucvuchinhquyenByID.Rows[0]["ma_cv"].ToString() : "0";

            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            DropDownListBoSungDuLieuDonViQuanLy.DataSource = donviquanli;
            DropDownListBoSungDuLieuDonViQuanLy.DataTextField = "dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataValueField = "ma_dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataBind();
            DropDownListBoSungDuLieuDonViQuanLy.SelectedItem.Text = !String.IsNullOrEmpty(chucvuchinhquyenByID.Rows[0]["donvi"].ToString()) ? chucvuchinhquyenByID.Rows[0]["donvi"].ToString() : "Trường Đại Học Bách Khoa Hà Nội";

            txtThongTinKhac.Text = !String.IsNullOrEmpty(chucvuchinhquyenByID.Rows[0]["ttk_qtct"].ToString()) ? chucvuchinhquyenByID.Rows[0]["ttk_qtct"].ToString() : "";


            string ngaythangBD = chucvuchinhquyenByID.Rows[0]["nbncvkn"] != null ? Convert.ToDateTime(chucvuchinhquyenByID.Rows[0]["nbncvkn"]).ToString("dd/MM/yyyy") : "";
            if (ngaythangBD == "" || ngaythangBD == "01/01/1900")
            {
                DropDownListNgayBoNhiem.SelectedValue = "0";
                DropDownListThangBoNhiem.SelectedValue = "0";
                txtNamBoNhiem.Text = "";
            }
            else
            {
                string ngay = ngaythangBD.Substring(0, 2);
                DropDownListNgayBoNhiem.SelectedValue = ngay;
                string thang = ngaythangBD.Substring(3, 2);
                DropDownListThangBoNhiem.SelectedValue = thang;
                string nam = ngaythangBD.Substring(6, 4);
                txtNamBoNhiem.Text = nam;

            }


            //ngay ket thuc 
            string ngaythangph = chucvuchinhquyenByID.Rows[0]["nktcvkn"] != null ? Convert.ToDateTime(chucvuchinhquyenByID.Rows[0]["nktcvkn"]).ToString("dd/MM/yyyy") : "";
            if (ngaythangph == "" || ngaythangph == "01/01/1900")
            {
                DropDownListNgayKetThuc.SelectedValue = "0";
                DropDownListThangKetThuc.SelectedValue = "0";
                txtNamKetThuc.Text = "";
            }
            else
            {

                string ngayKT = ngaythangph.Substring(0, 2);
                DropDownListNgayKetThuc.SelectedValue = ngayKT;
                string thangKT = ngaythangph.Substring(3, 2);
                DropDownListThangKetThuc.SelectedValue = thangKT;
                string namKT = ngaythangph.Substring(6, 4);
                txtNamKetThuc.Text = namKT;

            }
        }

        protected void Gridview1Deleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            BO.Thongtinchung.Thongtinchung.DeletetChucVuChinhQuyen(id);
            Bind();
        }


        public void resetData()
        {
            saveButton.Text = "Ghi nhận";
            txtNamKetThuc.Text = "";
            txtNamKetThuc.Text = "";
            txtThongTinKhac.Text = "";

            DataTable chucvuChinhQuyenDT = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
            DropDownListBoSungDuLieuChucVu.DataSource = chucvuChinhQuyenDT;
            DropDownListBoSungDuLieuChucVu.DataTextField = "cv";
            DropDownListBoSungDuLieuChucVu.DataValueField = "ma_cv";
            DropDownListBoSungDuLieuChucVu.DataBind();

            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            DropDownListBoSungDuLieuDonViQuanLy.DataSource = donviquanli;
            DropDownListBoSungDuLieuDonViQuanLy.DataTextField = "dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataValueField = "ma_dv";
            DropDownListBoSungDuLieuDonViQuanLy.DataBind();

            DropDownListNgayBoNhiem.SelectedValue = "0";
            DropDownListNgayKetThuc.SelectedValue = "0";
            DropDownListThangBoNhiem.SelectedValue = "0";
            DropDownListThangKetThuc.SelectedValue = "0";

        }
    }
}
