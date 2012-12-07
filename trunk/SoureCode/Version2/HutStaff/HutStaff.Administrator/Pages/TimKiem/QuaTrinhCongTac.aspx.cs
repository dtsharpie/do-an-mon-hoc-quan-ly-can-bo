﻿using System;
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
    public partial class QuaTrinhCongTac : System.Web.UI.Page
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


            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQuatrinhcongtac(iShcc);
            if (tblData.Rows.Count > 0)
            {
                DataColumn themColumns = tblData.Columns.Add("thoigian");
                foreach (DataRow Row in tblData.Rows)
                {
                    string namBatDau = !String.IsNullOrEmpty(Row["tgbd_qtct"].ToString()) ? Convert.ToDateTime(Row["tgbd_qtct"].ToString()).ToString("MM/yyyy") : "nay";
                    string namKetThuc = !String.IsNullOrEmpty(Row["tgkt_qtct"].ToString()) ? Convert.ToDateTime(Row["tgkt_qtct"].ToString()).ToString("MM/yyyy") : "nay";
                    Row["thoigian"] = string.Format("{0} > {1}", namBatDau, namKetThuc);
                }

                DataColumn themColums1 = tblData.Columns.Add("noilamviec");
                foreach (DataRow Row in tblData.Rows)
                {
                    string donvi = !String.IsNullOrEmpty(Row["dvct"].ToString()) ? Row["dvct"].ToString() : "";
                    string nlv = !String.IsNullOrEmpty(Row["nlv"].ToString()) ? Row["nlv"].ToString() : "";
                    if (donvi != "")
                    {
                        if (nlv != "")
                        {
                            Row["noilamviec"] = string.Format("{0}/{1}", donvi, nlv);
                        }
                        else
                        {
                            Row["noilamviec"] = string.Format("{0}", donvi);
                        }
                    }
                    else
                    {
                        if (nlv != "")
                        {
                            Row["noilamviec"] = string.Format("{0}", nlv);
                        }
                        else
                        {
                            Row["noilamviec"] = "";
                        }
                    }

                }

                GridView1.DataSource = tblData;
                GridView1.DataBind();

                DropDownListDonViTrongTruong.DataSource = donviquanli;
                DropDownListDonViTrongTruong.DataTextField = "dv";
                DropDownListDonViTrongTruong.DataValueField = "ma_dv";
                DropDownListDonViTrongTruong.DataBind();

                DropDownListDonViTrongTruong1.DataSource = donviquanli;
                DropDownListDonViTrongTruong1.DataTextField = "dv";
                DropDownListDonViTrongTruong1.DataValueField = "ma_dv";
                DropDownListDonViTrongTruong1.DataBind();

                DataTable diencanbo = SearchDetailBO.getAllDienCanBo();
                DropDownListDienCanBo.DataSource = diencanbo;
                DropDownListDienCanBo.DataTextField = "dcb";
                DropDownListDienCanBo.DataValueField = "ma_dcb";
                DropDownListDienCanBo.DataBind();

                DataTable chucvu = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
                DropDownListChucVuCongTac.DataSource = chucvu;
                DropDownListChucVuCongTac.DataTextField = "cv";
                DropDownListChucVuCongTac.DataValueField = "ma_cv";
                DropDownListChucVuCongTac.DataBind();

                DataTable congviecdamnhan = BO.Thongtinchung.Thongtinchung.GetAllCongViecDamNhan();
                DropDownListCongViecDamNhan.DataSource = congviecdamnhan;
                DropDownListCongViecDamNhan.DataTextField = "cvdn";
                DropDownListCongViecDamNhan.DataValueField = "ma_cvdn";
                DropDownListCongViecDamNhan.DataBind();



            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }
        }

        public void saveButtonClick(object sender, EventArgs e)
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
            DateTime ngaythangBD = Convert.ToDateTime(ngaythangnamHT, dtfi);

            string ngayKT = DropDownListNgayKetThuc.SelectedValue.ToString();
            string thangKT = DropDownListThangKetThuc.SelectedValue.ToString();
            string namKT = txtNamKetThuc.Text;
            string ngaythangnamKT;
            if (namHT == "")
            {
                ngaythangnamKT = "01/01/1900";
            }
            else
            {
                ngaythangnamKT = string.Format("{0}/{1}/{2}", ngayKT, thangKT, namKT);
            }

            DateTime ngaythangKT = Convert.ToDateTime(ngaythangnamKT, dtfi);

            if (saveButton.Text == "Ghi nhận")
            {
                BO.Thongtinchung.Thongtinchung.InsertQuaTRinhCongTac(Int32.Parse(ViewState["ishcc"].ToString()), ngaythangBD, ngaythangKT, txtDonViCongTac.Text, Int32.Parse(DropDownListChucVuCongTac.SelectedValue.ToString()), Int32.Parse(DropDownListCongViecDamNhan.SelectedValue.ToString()), txtDanhGia.Text, txtThongTinKhac.Text, txtBienChe.Text, txtNoiLamViec.Text, Int32.Parse(DropDownListDienCanBo.SelectedValue.ToString()));
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {
                BO.Thongtinchung.Thongtinchung.UpdateQuaTRinhCongTac(Int32.Parse(ViewState["id"].ToString()), ngaythangBD, ngaythangKT, txtDonViCongTac.Text, Int32.Parse(DropDownListChucVuCongTac.SelectedValue.ToString()), Int32.Parse(DropDownListCongViecDamNhan.SelectedValue.ToString()), txtDanhGia.Text, txtThongTinKhac.Text, txtBienChe.Text, txtNoiLamViec.Text, Int32.Parse(DropDownListDienCanBo.SelectedValue.ToString()));
                Bind();
            }

            resetData();
        }


        protected void resetButtonClick(object sender, EventArgs e)
        {
            resetData();
        }



        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable quatrinhCongTac = BO.Thongtinchung.Thongtinchung.FindQuaTRinhCongTacByID(id);

            string ngaythangDi = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["tgbd_qtct"].ToString()) ? Convert.ToDateTime(quatrinhCongTac.Rows[0]["tgbd_qtct"].ToString()).ToString("dd/MM/yyyy") : "";

            if (ngaythangDi == "" || ngaythangDi == "01/01/1900")
            {
                DropDownListNgayBatDau.SelectedValue = "0";
                DropDownListThangBatDau.SelectedValue = "0";
                txtNamBatDau.Text = "";
            }
            else
            {
                string ngay = ngaythangDi.Substring(0, 2);
                DropDownListNgayBatDau.SelectedValue = ngay;
                string thang = ngaythangDi.Substring(3, 2);
                DropDownListThangBatDau.SelectedValue = thang;
                string nam = ngaythangDi.Substring(6, 4);
                txtNamBatDau.Text = nam;

            }

            //ngay ket thuc 
            string ngaythangph = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["tgkt_qtct"].ToString()) ? Convert.ToDateTime(quatrinhCongTac.Rows[0]["tgkt_qtct"].ToString()).ToString("dd/MM/yyyy") : "";
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

            txtBienChe.Text = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["bctdv"].ToString()) ? quatrinhCongTac.Rows[0]["bctdv"].ToString() : "";
            txtDanhGia.Text = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["dgqtct"].ToString()) ? quatrinhCongTac.Rows[0]["dgqtct"].ToString() : "";
            txtDonViCongTac.Text = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["dvct"].ToString()) ? quatrinhCongTac.Rows[0]["dvct"].ToString() : "";
            txtNoiLamViec.Text = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["nlv"].ToString()) ? quatrinhCongTac.Rows[0]["nlv"].ToString() : "";
            txtThongTinKhac.Text = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["ttk_qtct"].ToString()) ? quatrinhCongTac.Rows[0]["ttk_qtct"].ToString() : "";



            DataTable diencanbo = SearchDetailBO.getAllDienCanBo();
            DropDownListDienCanBo.DataSource = diencanbo;
            DropDownListDienCanBo.DataTextField = "dcb";
            DropDownListDienCanBo.DataValueField = "ma_dcb";
            DropDownListDienCanBo.DataBind();
            DropDownListDienCanBo.SelectedValue = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["ma_dcb"].ToString()) ? quatrinhCongTac.Rows[0]["ma_dcb"].ToString() : "1";

            DataTable chucvu = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
            DropDownListChucVuCongTac.DataSource = chucvu;
            DropDownListChucVuCongTac.DataTextField = "cv";
            DropDownListChucVuCongTac.DataValueField = "ma_cv";
            DropDownListChucVuCongTac.DataBind();
            DropDownListChucVuCongTac.SelectedValue = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["cvct"].ToString()) ? quatrinhCongTac.Rows[0]["cvct"].ToString() : "1";

            DataTable congviecdamnhan = BO.Thongtinchung.Thongtinchung.GetAllCongViecDamNhan();
            DropDownListCongViecDamNhan.DataSource = congviecdamnhan;
            DropDownListCongViecDamNhan.DataTextField = "cvdn";
            DropDownListCongViecDamNhan.DataValueField = "ma_cvdn";
            DropDownListCongViecDamNhan.DataBind();
            DropDownListCongViecDamNhan.SelectedValue = !String.IsNullOrEmpty(quatrinhCongTac.Rows[0]["cvdn"].ToString()) ? quatrinhCongTac.Rows[0]["cvdn"].ToString() : "1";
        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            BO.Thongtinchung.Thongtinchung.DeleteQuatrinhcongtac(id);
            Bind();

        }

        protected void DropDownListBienCheSeleted(object sender, EventArgs e)
        {
            txtBienChe.Text = DropDownListDonViTrongTruong.SelectedItem.Text;
        }

        protected void DropdownlistNoiLamViecSeleted(object sender, EventArgs e)
        {
            txtNoiLamViec.Text = DropDownListDonViTrongTruong1.SelectedItem.Text;
        }

        public void resetData()
        {
            saveButton.Text = "Ghi nhận";
            txtBienChe.Text = "";
            txtDanhGia.Text = "";
            txtDonViCongTac.Text = "";
            txtNamBatDau.Text = "";
            txtNamKetThuc.Text = "";
            txtNoiLamViec.Text = "";
            txtThongTinKhac.Text = "";

            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            DropDownListDonViTrongTruong.DataSource = donviquanli;
            DropDownListDonViTrongTruong.DataTextField = "dv";
            DropDownListDonViTrongTruong.DataValueField = "ma_dv";
            DropDownListDonViTrongTruong.DataBind();

            DropDownListDonViTrongTruong1.DataSource = donviquanli;
            DropDownListDonViTrongTruong1.DataTextField = "dv";
            DropDownListDonViTrongTruong1.DataValueField = "ma_dv";
            DropDownListDonViTrongTruong1.DataBind();

            DataTable diencanbo = SearchDetailBO.getAllDienCanBo();
            DropDownListDienCanBo.DataSource = diencanbo;
            DropDownListDienCanBo.DataTextField = "dcb";
            DropDownListDienCanBo.DataValueField = "ma_dcb";
            DropDownListDienCanBo.DataBind();

            DataTable chucvu = BO.Thongtinchung.Thongtinchung.GetAllChuVuChinhQuyen();
            DropDownListChucVuCongTac.DataSource = chucvu;
            DropDownListChucVuCongTac.DataTextField = "cv";
            DropDownListChucVuCongTac.DataValueField = "ma_cv";
            DropDownListChucVuCongTac.DataBind();

            DataTable congviecdamnhan = BO.Thongtinchung.Thongtinchung.GetAllCongViecDamNhan();
            DropDownListCongViecDamNhan.DataSource = congviecdamnhan;
            DropDownListCongViecDamNhan.DataTextField = "cvdn";
            DropDownListCongViecDamNhan.DataValueField = "ma_cvdn";
            DropDownListCongViecDamNhan.DataBind();
        }
    }
}