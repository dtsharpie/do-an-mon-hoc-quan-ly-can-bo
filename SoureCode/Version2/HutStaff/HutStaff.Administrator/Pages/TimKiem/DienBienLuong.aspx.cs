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
    public partial class DienBienLuong : System.Web.UI.Page
    {
        protected int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {

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


            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQuatrinhDienBienLuongById(iShcc);
            if (tblData.Rows.Count > 0)
            {

                DataColumn orderColumn = tblData.Columns.Add("thoigian");
                orderColumn.SetOrdinal(0);
                foreach ( DataRow Row in tblData.Rows)
                {
                    string thoigianBatdau = Row["tgbd_dbl"] != DBNull.Value ? Convert.ToDateTime(Row["tgbd_dbl"].ToString()).ToString("MM/yyyy") : "";
                    string thoigianKetThuc =   Row["tgkt_dbl"] != DBNull.Value ? Convert.ToDateTime(Row["tgkt_dbl"]).ToString("MM/yyyy") : "nay";
                    Row["thoigian"] = string.Format("{0} > {1}", thoigianBatdau, thoigianKetThuc);
                }

                DataColumn phucapColumn = tblData.Columns.Add("phucap");
                phucapColumn.SetOrdinal(0);
                foreach (DataRow Row in tblData.Rows)       
                {
                    string chucvu =  Row["hspccv"]!= DBNull.Value && !String.IsNullOrEmpty( Row["hspccv"].ToString()) ?"Chức vụ: "+   Row["hspccv"].ToString() + "\n" : "";
                    string thamnien = Row["hspctn"] != DBNull.Value && !String.IsNullOrEmpty(Row["hspctn"].ToString()) ? "Thâm niên: " + Row["hspctn"].ToString() + "\n" : "";
                    string vuotkhung = Row["hspckv"] != DBNull.Value && !String.IsNullOrEmpty(Row["hspckv"].ToString()) ? "Vượt khung: " + Row["hspckv"].ToString() : "";
                    Row["phucap"] = string.Format("{0}\n{1}\n{2}", chucvu, thamnien, vuotkhung);
                }

                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }


            DataTable ngachDataTable = BO.Thongtinchung.Thongtinchung.GetAllNgach();
            DataColumn themColumns = ngachDataTable.Columns.Add("stupidDataBase");
            foreach (DataRow Row in ngachDataTable.Rows)
            {
                string ten_ngach = Row["ten_ngach"].ToString();
                string ma_ngach = Row["ma_ngach"].ToString();

                Row["stupidDataBase"] = string.Format("{0} ({1})", ten_ngach, ma_ngach);
            }
            DropDownlistNgach.DataTextField = "stupidDataBase";
            DropDownlistNgach.DataValueField = "ma_ngach";
            DropDownlistNgach.DataSource = ngachDataTable;
            DropDownlistNgach.DataBind();



        }

        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable DienBienLuongByID = BO.Thongtinchung.Thongtinchung.FindDienBienLuongByID(id);
            string ngach =  DienBienLuongByID.Rows[0]["ma_ngach"].ToString();

            DataTable ngachDataTable = BO.Thongtinchung.Thongtinchung.GetAllNgach();
            DataColumn themColumns = ngachDataTable.Columns.Add("stupidDataBase");
            foreach (DataRow Row in ngachDataTable.Rows)
            {
                string ten_ngach = Row["ten_ngach"].ToString();
                string ma_ngach = Row["ma_ngach"].ToString();

                Row["stupidDataBase"] = string.Format("{0} ({1})", ten_ngach, ma_ngach);
            }
            DropDownlistNgach.DataTextField = "stupidDataBase";
            DropDownlistNgach.DataValueField = "ma_ngach";
            DropDownlistNgach.DataSource = ngachDataTable;
            DropDownlistNgach.DataBind();
            DropDownlistNgach.SelectedValue = ngach;

            //thong tin khac
            txtThongTinKhac.Text = DienBienLuongByID.Rows[0]["ttk_qtdbl"].ToString();
            DropDownlistBacLuong.SelectedValue = !String.IsNullOrEmpty(DienBienLuongByID.Rows[0]["bl_dbl"].ToString()) ? DienBienLuongByID.Rows[0]["bl_dbl"].ToString() : "0";

            txtHeSoLuong1.Text = DienBienLuongByID.Rows[0]["hsl"].ToString();
            txtChucVu.Text = DienBienLuongByID.Rows[0]["hsl"].ToString();
            txtThamNien.Text = DienBienLuongByID.Rows[0]["hspctn"].ToString();
            txtVuotKhung.Text = DienBienLuongByID.Rows[0]["hspckv"].ToString();

            //ngay bat dau
            string ngaythangBD = DienBienLuongByID.Rows[0]["tgbd_dbl"] != null ? Convert.ToDateTime(DienBienLuongByID.Rows[0]["tgbd_dbl"]).ToString("dd/MM/yyyy") : "";
            // string ngay = DateTime.Parse(ngaythangph, new CultureInfo("en-US")).Day.ToString();
            string ngay = ngaythangBD.Substring(0, 2);
            DropDownListNgayHuongTu.SelectedValue = ngay;
            //  string thang = DateTime.Parse(ngaythangph, new CultureInfo("en-US")).Month.ToString();
            string thang = ngaythangBD.Substring(3, 2);
            DropDownListThangHuongTu.SelectedValue = thang;

            string nam = ngaythangBD.Substring(6, 4);
            txtNamHuongTu.Text = nam;
            
            //ngay ket thuc 
            string ngaythangph = DienBienLuongByID.Rows[0]["tgkt_dbl"] != null ? Convert.ToDateTime(DienBienLuongByID.Rows[0]["tgkt_dbl"]).ToString("dd/MM/yyyy") : "";
            if (ngaythangph == "")
            {
                DropDownListNgayTinhLanSau.SelectedValue = "0";
                DropDownListThangTinhLanSau.SelectedValue = "0";
                txtNamTinhLanSau.Text = "";
            }
            else
            {
                string ngaythangnamKT = string.Format("01/01/1900"); 
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime checkDateTime = Convert.ToDateTime(ngaythangnamKT,dtfi);

                if (Convert.ToDateTime(DienBienLuongByID.Rows[0]["tgkt_dbl"]) != checkDateTime)
                {
                    string ngayKT = ngaythangph.Substring(0, 2);
                    DropDownListNgayTinhLanSau.SelectedValue = ngay;
                    string thangKT = ngaythangph.Substring(3, 2);
                    DropDownListThangTinhLanSau.SelectedValue = thang;

                    string namKT = ngaythangph.Substring(6, 4);
                    txtNamHuongTu.Text = nam;
                }
                else
                {
                    DropDownListThangTinhLanSau.SelectedValue = "0";
                    txtNamTinhLanSau.Text = "";
                }
            }

            string hiennay = DienBienLuongByID.Rows[0]["hnay"] != null ? DienBienLuongByID.Rows[0]["hnay"].ToString() : "0";
            if (hiennay == "True")
            {
                checkBoxDenNay.Checked = true;
            }
            else
            {
                checkBoxDenNay.Checked = false;
            }


        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            Thongtinchung.DeleteDienBienLuong(id);
            Bind();
        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if (saveButton.Text == "Ghi nhận")
            {
                string ngayHT = DropDownListNgayHuongTu.SelectedValue.ToString();
                string thangHT = DropDownListThangHuongTu.SelectedValue.ToString();
                string namHT = txtNamHuongTu.Text;
                if (namHT == "")
                    return;

                string ngaythangnamHT = string.Format("{0}/{1}/{2}",ngayHT,thangHT,namHT);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangHuongTu = Convert.ToDateTime(ngaythangnamHT, dtfi);

                string ngayKT = DropDownListNgayTinhLanSau.SelectedValue.ToString();
                string thangKT = DropDownListThangTinhLanSau.SelectedValue.ToString();
                string namKT = txtNamTinhLanSau.Text;
                DateTime ngaythangKT;

                if (namKT != "")
                {
                    string ngaythangnamKT = string.Format("{0}/{1}/{2}", ngayKT, thangKT, namKT);
                    ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);
                }
                else
                {
                    string ngaythangnamKT = string.Format("01/01/1900");
                    ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);
                }

                int hiennay = 0;
                if(checkBoxDenNay.Checked == true)
                {
                    hiennay =1;
                }
                else
                {
                    hiennay = 0;
                }
                 
                 decimal bacluong =  Decimal.Parse(DropDownlistBacLuong.SelectedValue.ToString());
                decimal hesoluong =  !String.IsNullOrEmpty(txtHeSoLuong1.Text) ? Decimal.Parse(txtHeSoLuong1.Text) : 0;
                decimal hesophucapChucVu =!String.IsNullOrEmpty(txtChucVu.Text) ? Decimal.Parse(txtChucVu.Text) : 0;
                string ttKhac =  txtThongTinKhac.Text;
                decimal hesophucapThamNien = !String.IsNullOrEmpty(txtThamNien.Text) ? Decimal.Parse(txtThamNien.Text) :0;
                decimal hesophucapVuotKhung = !String.IsNullOrEmpty(txtVuotKhung.Text) ? Decimal.Parse(txtVuotKhung.Text) : 0;
                BO.Thongtinchung.Thongtinchung.InsertDienBienLuong(Int32.Parse(ViewState["ishcc"].ToString()), ngaythangHuongTu, ngaythangKT, DropDownlistNgach.SelectedValue.ToString(), bacluong, hesoluong, hesophucapChucVu, ttKhac, hesophucapThamNien, hesophucapVuotKhung, 0, hiennay);
                Bind();
            }
            if(saveButton.Text == "Cập nhật")
            {
                string ngayHT = DropDownListNgayHuongTu.SelectedValue.ToString();
                string thangHT = DropDownListThangHuongTu.SelectedValue.ToString();
                string namHT = txtNamHuongTu.Text;
                if (namHT == "")
                    return;

                string ngaythangnamHT = string.Format("{0}/{1}/{2}", ngayHT, thangHT, namHT);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangHuongTu = Convert.ToDateTime(ngaythangnamHT, dtfi);

                string ngayKT = DropDownListNgayTinhLanSau.SelectedValue.ToString();
                string thangKT = DropDownListThangTinhLanSau.SelectedValue.ToString();
                string namKT = txtNamTinhLanSau.Text;
                DateTime ngaythangKT;
                if (namKT != "")
                {
                    string ngaythangnamKT = string.Format("{0}/{1}/{2}", ngayKT, thangKT, namKT);
                    ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);
                }
                else
                {
                    string ngaythangnamKT = string.Format("01/01/1900");
                    ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);
                }


                int hiennay = 0;
                if (checkBoxDenNay.Checked == true)
                {
                    hiennay = 1;
                }
                else
                {
                    hiennay = 0;
                }

                decimal bacluong = Decimal.Parse(DropDownlistBacLuong.SelectedValue.ToString());
                decimal hesoluong = !String.IsNullOrEmpty(txtHeSoLuong1.Text) ? Decimal.Parse(txtHeSoLuong1.Text) : 0;
                decimal hesophucapChucVu = !String.IsNullOrEmpty(txtChucVu.Text) ? Decimal.Parse(txtChucVu.Text) : 0;
                string ttKhac = txtThongTinKhac.Text;
                decimal hesophucapThamNien = !String.IsNullOrEmpty(txtThamNien.Text) ? Decimal.Parse(txtThamNien.Text) : 0;
                decimal hesophucapVuotKhung = !String.IsNullOrEmpty(txtVuotKhung.Text) ? Decimal.Parse(txtVuotKhung.Text) : 0;
                BO.Thongtinchung.Thongtinchung.UpdateDienBienLuong(Int32.Parse(ViewState["id"].ToString()), ngaythangHuongTu, ngaythangKT, DropDownlistNgach.SelectedValue.ToString(), bacluong, hesoluong, hesophucapChucVu, ttKhac, hesophucapThamNien, hesophucapVuotKhung, 0, hiennay);
                Bind();
            }
        }

        protected void resetButtonClick(object sender, EventArgs e)
        {

        }
    }
}