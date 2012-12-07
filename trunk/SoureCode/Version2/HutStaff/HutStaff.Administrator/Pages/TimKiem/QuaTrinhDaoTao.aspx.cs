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
    public partial class QuaTrinhDaoTao : System.Web.UI.Page
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
            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQuatrinhdaotao(iShcc);
            if (tblData.Rows.Count > 0)
            {

                DataColumn themColums = tblData.Columns.Add("thoigian");
                foreach (DataRow Row in tblData.Rows)
                {
                    string namBatDau = !String.IsNullOrEmpty(Row["tgbd_dtcm"].ToString()) ? Convert.ToDateTime(Row["tgbd_dtcm"].ToString()).ToString("MM/yyyy") : "nay";
                    string namKetThuc = !String.IsNullOrEmpty(Row["tgkt_dtcm"].ToString()) ? Convert.ToDateTime(Row["tgkt_dtcm"].ToString()).ToString("MM/yyyy") : "nay";
                    Row["thoigian"] = string.Format("{0} > {1}", namBatDau, namKetThuc);
                }
                GridView1.DataSource = tblData;
                GridView1.DataBind();

            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }

            DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            DropDownListTaiNuoc.DataSource = danhmucquocgiaDT;
            DropDownListTaiNuoc.DataTextField = "qg";
            DropDownListTaiNuoc.DataValueField = "ma_qg";
            DropDownListTaiNuoc.DataBind();

            DataTable danhmucchuyenganh = BO.Thongtinchung.Thongtinchung.GetAllDanhMucChuyenNganh();
            DropDownListChuyenNganhDaoTao.DataSource = danhmucchuyenganh;
            DropDownListChuyenNganhDaoTao.DataTextField = "cn";
            DropDownListChuyenNganhDaoTao.DataValueField = "ma_cn";
            DropDownListChuyenNganhDaoTao.DataBind();

            DataTable vanbangdaotao = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            DropDownListVanBangDaoTao.DataSource = vanbangdaotao;
            DropDownListVanBangDaoTao.DataTextField = "vbdt";
            DropDownListVanBangDaoTao.DataValueField = "ma_vbdt";
            DropDownListVanBangDaoTao.DataBind();

            DataTable hinhthucdaoto = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucDaoTao.DataSource = hinhthucdaoto;
            DropDownListHinhThucDaoTao.DataTextField = "htdt";
            DropDownListHinhThucDaoTao.DataValueField = "ma_htdt";
            DropDownListHinhThucDaoTao.DataBind();

        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
            BO.Thongtinchung.Thongtinchung.DeleteQuaTrinhDaoTao(id);
            Bind();
        }

        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable quatrinhdaotao = BO.Thongtinchung.Thongtinchung.FindQuaTrinhDaoTaoById(id);

            string ngaythangDi = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["tgbd_dtcm"].ToString()) ? Convert.ToDateTime(quatrinhdaotao.Rows[0]["tgbd_dtcm"].ToString()).ToString("dd/MM/yyyy") : "";

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
            string ngaythangph = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["tgkt_dtcm"].ToString()) ? Convert.ToDateTime(quatrinhdaotao.Rows[0]["tgkt_dtcm"].ToString()).ToString("dd/MM/yyyy") : "";
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


            txtCoSoDaoTao.Text = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["csdtcm"].ToString()) ? quatrinhdaotao.Rows[0]["csdtcm"].ToString() : "";
            txtThongTinKhac.Text = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["ttk_qtdt"].ToString()) ? quatrinhdaotao.Rows[0]["ttk_qtdt"].ToString() : "";
            txtXepLoai.Text = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["xl_dtcm"].ToString()) ? quatrinhdaotao.Rows[0]["xl_dtcm"].ToString() : "";


            DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            DropDownListTaiNuoc.DataSource = danhmucquocgiaDT;
            DropDownListTaiNuoc.DataTextField = "qg";
            DropDownListTaiNuoc.DataValueField = "ma_qg";
            DropDownListTaiNuoc.DataBind();
            DropDownListTaiNuoc.SelectedValue = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["ndtcm"].ToString()) ? quatrinhdaotao.Rows[0]["ndtcm"].ToString() : "1";

            DataTable danhmucchuyenganh = BO.Thongtinchung.Thongtinchung.GetAllDanhMucChuyenNganh();
            DropDownListChuyenNganhDaoTao.DataSource = danhmucchuyenganh;
            DropDownListChuyenNganhDaoTao.DataTextField = "cn";
            DropDownListChuyenNganhDaoTao.DataValueField = "ma_cn";
            DropDownListChuyenNganhDaoTao.DataBind();
            DropDownListChuyenNganhDaoTao.SelectedValue = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["ma_cndt"].ToString()) ? quatrinhdaotao.Rows[0]["ma_cndt"].ToString() : "1";

            DataTable vanbangdaotao = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            DropDownListVanBangDaoTao.DataSource = vanbangdaotao;
            DropDownListVanBangDaoTao.DataTextField = "vbdt";
            DropDownListVanBangDaoTao.DataValueField = "ma_vbdt";
            DropDownListVanBangDaoTao.DataBind();
            DropDownListVanBangDaoTao.SelectedValue = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["vbdtcm"].ToString()) ? quatrinhdaotao.Rows[0]["vbdtcm"].ToString() : "1";

            DataTable hinhthucdaoto = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucDaoTao.DataSource = hinhthucdaoto;
            DropDownListHinhThucDaoTao.DataTextField = "htdt";
            DropDownListHinhThucDaoTao.DataValueField = "ma_htdt";
            DropDownListHinhThucDaoTao.DataBind();
            DropDownListHinhThucDaoTao.SelectedValue = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["htdtcm"].ToString()) ? quatrinhdaotao.Rows[0]["htdtcm"].ToString() : "1";

            string chuyenmon = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["cmpcp_cndt"].ToString()) ? quatrinhdaotao.Rows[0]["cmpcp_cndt"].ToString() : "0";
            if (chuyenmon == "True")
            {
                checkBoxChuyenMon.Checked = true;
            }
            else
            {
                checkBoxChuyenMon.Checked = false;
            }

            string hocvi = !String.IsNullOrEmpty(quatrinhdaotao.Rows[0]["hvcn_cndt"].ToString()) ? quatrinhdaotao.Rows[0]["hvcn_cndt"].ToString() : "0";
            if (chuyenmon == "True")
            {
                checkBoxHocViCaoNhat.Checked = true;
            }
            else
            {
                checkBoxHocViCaoNhat.Checked = false;
            }


        }

        protected void saveButtonClick(object sender, EventArgs e)
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
            
            int chuyenmon =0;
            int hocvi =0;
            if(checkBoxChuyenMon.Checked == true)
            {
                chuyenmon = 1;
            }
            else
            {
                chuyenmon =0;
            }
            if(checkBoxHocViCaoNhat.Checked == true)
            {
                hocvi =1;
            }
            else
            {
                hocvi =0;
            }

            if (saveButton.Text == "Ghi nhận")
            {
                BO.Thongtinchung.Thongtinchung.InsertQuaTrinhDaoTao(Int32.Parse(ViewState["ishcc"].ToString()), ngaythangBD, ngaythangKT, txtCoSoDaoTao.Text, Int32.Parse(DropDownListTaiNuoc.SelectedValue.ToString()), Int32.Parse(DropDownListChuyenNganhDaoTao.SelectedValue.ToString()), Int32.Parse(DropDownListHinhThucDaoTao.SelectedValue.ToString()), Int32.Parse(DropDownListVanBangDaoTao.SelectedValue.ToString()), txtXepLoai.Text, chuyenmon, hocvi, txtThongTinKhac.Text);
            }
            if (saveButton.Text == "Cập nhật")
            {
                BO.Thongtinchung.Thongtinchung.UpdateQuaTrinhDaoTao(Int32.Parse(ViewState["id"].ToString()), ngaythangBD, ngaythangKT, txtCoSoDaoTao.Text, Int32.Parse(DropDownListTaiNuoc.SelectedValue.ToString()), Int32.Parse(DropDownListChuyenNganhDaoTao.SelectedValue.ToString()), Int32.Parse(DropDownListHinhThucDaoTao.SelectedValue.ToString()), Int32.Parse(DropDownListVanBangDaoTao.SelectedValue.ToString()), txtXepLoai.Text, chuyenmon, hocvi, txtThongTinKhac.Text);
            }
            Bind();
            resetData();
        }

        protected void resetButtonClick(object sender, EventArgs e)
        {
            resetData();
        }
        public void resetData()
        {
            txtCoSoDaoTao.Text = "";
            txtNamBatDau.Text = "";
            txtNamKetThuc.Text = "";
            txtThongTinKhac.Text = "";
            txtXepLoai.Text = "";

            DataTable danhmucquocgiaDT = BO.Thongtinchung.Thongtinchung.GetAllDanhMucQuocGia();
            DropDownListTaiNuoc.DataSource = danhmucquocgiaDT;
            DropDownListTaiNuoc.DataTextField = "qg";
            DropDownListTaiNuoc.DataValueField = "ma_qg";
            DropDownListTaiNuoc.DataBind();

            DataTable danhmucchuyenganh = BO.Thongtinchung.Thongtinchung.GetAllDanhMucChuyenNganh();
            DropDownListChuyenNganhDaoTao.DataSource = danhmucchuyenganh;
            DropDownListChuyenNganhDaoTao.DataTextField = "cn";
            DropDownListChuyenNganhDaoTao.DataValueField = "ma_cn";
            DropDownListChuyenNganhDaoTao.DataBind();

            DataTable vanbangdaotao = BO.Thongtinchung.Thongtinchung.GetAllVanBang();
            DropDownListVanBangDaoTao.DataSource = vanbangdaotao;
            DropDownListVanBangDaoTao.DataTextField = "vbdt";
            DropDownListVanBangDaoTao.DataValueField = "ma_vbdt";
            DropDownListVanBangDaoTao.DataBind();

            DataTable hinhthucdaoto = BO.Thongtinchung.Thongtinchung.GetAllHinhThucBoiDuong();
            DropDownListHinhThucDaoTao.DataSource = hinhthucdaoto;
            DropDownListHinhThucDaoTao.DataTextField = "htdt";
            DropDownListHinhThucDaoTao.DataValueField = "ma_htdt";
            DropDownListHinhThucDaoTao.DataBind();
        }
    }
}