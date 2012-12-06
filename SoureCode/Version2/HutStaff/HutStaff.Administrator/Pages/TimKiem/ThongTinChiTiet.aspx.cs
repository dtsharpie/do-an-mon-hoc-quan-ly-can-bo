using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;
using System.IO;
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class ThongTinChiTiet : System.Web.UI.Page
    {
        protected int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {
            //int iShcc = Convert.ToInt32(Request.QueryString["shcc"]);
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

        protected void Bind()
        {
            DataTable thongtinchitiet = SearchDetailBO.ThongTinChiTiet(iShcc);
            if (thongtinchitiet.Rows.Count > 0)
            {
                //try
                //{
                    DataTable huyen = SearchDetailBO.getAllHuyen();
                    DataTable tinhthanhpho = SearchDetailBO.getAllTinhThanhPho();
                    DataTable trinhdohocvan = SearchDetailBO.getAllTrinhDoHocVan();
                    DataTable trinhdotinhoc = SearchDetailBO.getAllTrinhDoTinHoc();
                    DataTable trinhdoliluanchinhtri = SearchDetailBO.getAllTrinhDoLiLuanChinhTri();
                    DataTable trinhdoquanlinhanuoc = SearchDetailBO.getAllTrinhDoQuanLiNhaNuoc();
                    DataTable khoicanbo = SearchDetailBO.getAllKhoiCanBo();
                    DataTable diencanbo = SearchDetailBO.getAllDienCanBo();
                    DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
                    DataTable thuongbinh = SearchDetailBO.getAllThuongBinh();
                    DataTable giadinhchinhsach = SearchDetailBO.getAllGiaDinhChinhSach();
                    DataTable thanhphanxuatthan = SearchDetailBO.getAllThanhPhanXuatThan();
                    List<String> tinhtrangsuckhoe = new List<string>() {"Tốt", "Trung bình", "Yếu"};
                    List<String> nhommau = new List<string>() { "A", "AB", "B","O"};
                    DataTable tinhtranghonnhan = SearchDetailBO.getAllTinhTrangHonNhan();
                    DataTable dantoc = SearchDetailBO.getAllDanToc();
                    DataTable tongiao = SearchDetailBO.getAllTonGiao();

                    htbHoVaTenDem.Text = thongtinchitiet.Rows[0]["hodem"].ToString();
                    htbTen.Text = thongtinchitiet.Rows[0]["ten"].ToString();
                    dpkNgaySinh.Text = thongtinchitiet.Rows[0]["ntns"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntns"]).ToString("dd/MM/yyyy") : ""; 
                    chzGioiTinh.Items.Add("Nữ");
                    chzGioiTinh.Items.Add("Nam");
                    decimal gt = decimal.Parse(thongtinchitiet.Rows[0]["gt"].ToString());
                    if (gt == 1)
                    {
                        chzGioiTinh.SelectedIndex = 1;
                    }
                    else
                    {
                        chzGioiTinh.SelectedIndex = 0;
                    }

                    //Socmtnd
                    txbSoCmtnd.Text = thongtinchitiet.Rows[0]["scmnd"].ToString();
                    //Ngày cấp
                    dpkNgayCapCmtnd.Text =  !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ngay_cap"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ngay_cap"]).ToString("dd/MM/yyyy") : "";
                    //Nơi cấp
                    chzNoiCapCmtnd.DataSource = tinhthanhpho;
                    chzNoiCapCmtnd.DataBind();
                    int ma_nc = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nc"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["nc"]) : 0;
                    chzNoiCapCmtnd.SelectedIndex = chzNoiCapCmtnd.Items.IndexOf(chzNoiCapCmtnd.Items.FindByValue(ma_nc.ToString()));
                    //Email
                    txbEmail.Text = thongtinchitiet.Rows[0]["email"].ToString();
                    //Số điện thoại
                    txbDienThoai.Text = thongtinchitiet.Rows[0]["tel"].ToString();
                    //Trình độ học vấn
                    chzTrinhDoHocVan.DataSource = trinhdohocvan;
                    chzTrinhDoHocVan.DataBind();
                    chzTrinhDoHocVan.Items.Insert(0,"");
                    int ma_tdhv = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ma_tdhv"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["ma_tdhv"].ToString()) : 0;
                    chzTrinhDoHocVan.SelectedIndex = chzTrinhDoHocVan.Items.IndexOf(chzTrinhDoHocVan.Items.FindByValue(ma_tdhv.ToString()));
                    //Trình độ tin học
                    chzTrinhDoTinHoc.DataSource = trinhdotinhoc;
                    chzTrinhDoTinHoc.DataBind();
                    chzTrinhDoTinHoc.Items.Insert(0,"");
                    int ma_tdth = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ma_tdth"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["ma_tdth"].ToString()) : 0;
                    chzTrinhDoTinHoc.SelectedIndex = chzTrinhDoTinHoc.Items.IndexOf(chzTrinhDoTinHoc.Items.FindByValue(ma_tdth.ToString()));
                    //Trình độ lí luận chính trị
                    chzTrinhDoLyLuan.DataSource = trinhdoliluanchinhtri;
                    chzTrinhDoLyLuan.DataBind();
                    chzTrinhDoLyLuan.Items.Insert(0, "");
                    int ma_tdllct = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ma_tdllct"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["ma_tdllct"].ToString()) : 0;
                    chzTrinhDoLyLuan.SelectedIndex = chzTrinhDoLyLuan.Items.IndexOf(chzTrinhDoLyLuan.Items.FindByValue(ma_tdllct.ToString()));
                   
                    //Trình độ quản lí nhà nước
                    chzTrinhDoQuanLy.DataSource = trinhdoquanlinhanuoc;
                    chzTrinhDoQuanLy.DataBind();
                    chzTrinhDoQuanLy.Items.Insert(0, "");
                    int ma_tdqlnn = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ma_tdqlnn"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["ma_tdqlnn"].ToString()) : 0;
                    chzTrinhDoQuanLy.SelectedIndex = chzTrinhDoQuanLy.Items.IndexOf(chzTrinhDoQuanLy.Items.FindByValue(ma_tdqlnn.ToString()));
                    
                    //Sở trường năng khiếu
                    txbSoTruong.Text = thongtinchitiet.Rows[0]["nlstnk"].ToString();
                    //Ngày về cơ quan                   
                    dpkNgayVeCoQuan.Text =  !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nvcqhn"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nvcqhn"]).ToString("dd/MM/yyyy") : "";
                    //Ngày vào biên chế
                    dpkNgayVaoBienChe.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nvbc"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nvbc"]).ToString("dd/MM/yyyy") : "";
                    //Khối cán bộ
                    chzKhoiCanBo.DataSource = khoicanbo;
                    chzKhoiCanBo.DataBind();
                    chzKhoiCanBo.Items.Insert(0,"");    
                    int kcb = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["kcb"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["kcb"]) : 0;
                    chzKhoiCanBo.SelectedIndex = chzKhoiCanBo.Items.IndexOf(chzKhoiCanBo.Items.FindByValue(kcb.ToString()));
                    //Diện cán bộ
                    chzDienCanBo.DataSource = diencanbo;
                    chzDienCanBo.DataBind();
                    chzDienCanBo.Items.Insert(0,"");
                    int dcb = int.Parse(thongtinchitiet.Rows[0]["dcb"].ToString());
                    chzDienCanBo.SelectedIndex = chzDienCanBo.Items.IndexOf(chzDienCanBo.Items.FindByValue(dcb.ToString()));
                    //Đơn vị quản lí
                    chzDonViQuanLy.DataSource = donviquanli;
                    chzDonViQuanLy.DataBind();
                    chzDonViQuanLy.Items.Insert(0, "");
                    int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
                    chzDonViQuanLy.SelectedIndex = chzDonViQuanLy.Items.IndexOf(chzDonViQuanLy.Items.FindByValue(ma_dvql.ToString()));
                    //Công việc được phân công
                    txbViecDuocPhanCong.Text = thongtinchitiet.Rows[0]["vdpc"].ToString();
                    //Công việc đảm nhận
                    txbCongViecDamNhan.Text = thongtinchitiet.Rows[0]["cvdn"].ToString();
                    //Ngày bắt đầu thâm niên
                    //dpkNgayBatDauTinhThamNien.Date = thongtinchitiet.Rows[0]["cvdn"].ToString();
                    //Mốc hưởng thâm niên
                    dpkMocHuongThamNien.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["mochuongtn"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["mochuongtn"]).ToString("dd/MM/yyyy") : "";
                    //Ngày kết thúc hợp đồng
                    dpkNgayKetThucHopDong.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ngay_kthd"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ngay_kthd"]).ToString("dd/MM/yyyy") : "";
                    //Lí do kết thúc hợp đồng
                    txbLyDoKetThucHopDong.Text = thongtinchitiet.Rows[0]["ld_kthd"].ToString();
                    //Tháng gián đoạn
                    txbThangGianDoan.Text = thongtinchitiet.Rows[0]["thanggd"].ToString();
                    //Ngày tham gia Cách Mạng
                    dpkNgayThamGiaCachMang.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ntgcm"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntgcm"]).ToString("dd/MM/yyyy") : "";
                    
                    //Ngày vào Đảng
                    dpkNgayVaoDang.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nvd"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nvd"]).ToString("dd/MM/yyyy") : "";
                    //object nvd = thongtinchitiet.Rows[0]["nvd"];
                    //if (!DBNull.Value.Equals(nvd))
                    //{
                    //    dpkNgayVaoDang.Text = thongtinchitiet.Rows[0]["nvd"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nvd"]).ToString("dd/MM/yyyy") : "";
                    //}
                    //Ngày chính thức vào Đảng
                    dpkNgayChinhThuc.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nct"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nct"]).ToString("dd/MM/yyyy") : "";
                    //object nct = thongtinchitiet.Rows[0]["nct"];
                    //if (!DBNull.Value.Equals(nct))
                    //{
                    //    dpkNgayChinhThuc.Text = thongtinchitiet.Rows[0]["nct"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nct"]).ToString("dd/MM/yyyy") : "";
                    //}
                    //Ngày nhập ngũ
                    dpkNgayNhapNgu.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nnn"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nnn"]).ToString("dd/MM/yyyy") : "";
                    //Ngày xuất ngũ
                    dpkNgayXuatNgu.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["nxn"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nxn"]).ToString("dd/MM/yyyy") : "";
                    //object nxn = thongtinchitiet.Rows[0]["nxn"];
                    //if (!DBNull.Value.Equals(nxn))
                    //{
                    //    dpkNgayXuatNgu.Text = thongtinchitiet.Rows[0]["nxn"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["nxn"]).ToString("dd/MM/yyyy") : "";
                    //}
                    //Quân hàm
                    txbQuanHam.Text = thongtinchitiet.Rows[0]["qh"].ToString();
                    //Thương binh
                    chzThuongBinh.DataSource = thuongbinh;
                    chzThuongBinh.DataBind();
                    object tb = thongtinchitiet.Rows[0]["ma_tb"];
                    if (!DBNull.Value.Equals(tb))
                    {
                        int ma_tb = int.Parse(thongtinchitiet.Rows[0]["ma_tb"].ToString());
                        chzThuongBinh.SelectedIndex = chzThuongBinh.Items.IndexOf(chzThuongBinh.Items.FindByValue(ma_tb.ToString()));
                    }
                    else
                    {
                        chzThuongBinh.Items.Insert(0,"");
                        chzThuongBinh.SelectedIndex = 0;
                    }
                    //Gia đình chính sách
                    chzGiaDinhChinhSach.DataSource = giadinhchinhsach;
                    chzGiaDinhChinhSach.DataBind();
                    object gdcs = thongtinchitiet.Rows[0]["ma_gdtdcs"];
                    if (!DBNull.Value.Equals(gdcs))
                    {                        
                        int ma_gdtdcs = int.Parse(thongtinchitiet.Rows[0]["ma_gdtdcs"].ToString());
                        chzGiaDinhChinhSach.SelectedIndex = chzGiaDinhChinhSach.Items.IndexOf(chzGiaDinhChinhSach.Items.FindByValue(ma_gdtdcs.ToString()));
                    }
                    else
                    {
                        chzGiaDinhChinhSach.Items.Insert(0, "");
                        chzGiaDinhChinhSach.SelectedIndex = 0;
                    }
                    //Thành phần xuất thân
                    chzThanhPhanXuatThan.DataSource = thanhphanxuatthan;
                    chzThanhPhanXuatThan.DataBind();
                    object tpxt = thongtinchitiet.Rows[0]["ma_tpxt"];
                    if (!DBNull.Value.Equals(tpxt))
                    {                                                
                        int ma_tpxt = int.Parse(thongtinchitiet.Rows[0]["ma_tpxt"].ToString());
                        chzThanhPhanXuatThan.SelectedIndex = chzThanhPhanXuatThan.Items.IndexOf(chzThanhPhanXuatThan.Items.FindByValue(ma_tpxt.ToString()));
                    }
                    else
                    {
                        chzThanhPhanXuatThan.Items.Insert(0, "");
                        chzThanhPhanXuatThan.SelectedIndex = 0;
                    }
                    //Tên thường dùng
                    txbTenThuongDung.Text = thongtinchitiet.Rows[0]["ttd"].ToString();
                    //Nơi sinh                    
                    chzNoiSinh.DataSource = huyen;
                    chzNoiSinh.DataBind();
                    chzNoiSinh.Items.Insert(0,"");
                    int ma_ns = int.Parse(thongtinchitiet.Rows[0]["ma_ns"].ToString());
                    chzNoiSinh.SelectedIndex = chzNoiSinh.Items.IndexOf(chzNoiSinh.Items.FindByValue(ma_ns.ToString()));
                    //Quê quán
                    chzQueQuan.DataSource = tinhthanhpho;
                    chzQueQuan.DataBind();
                    chzQueQuan.Items.Insert(0, "");
                    int ma_qq = int.Parse(thongtinchitiet.Rows[0]["ma_qq"].ToString());
                    chzQueQuan.SelectedIndex = chzQueQuan.Items.IndexOf(chzQueQuan.Items.FindByValue(ma_qq.ToString()));
                    //Chi tiết quê quán
                    txbChiTietQueQuan.Text = thongtinchitiet.Rows[0]["ctqq"].ToString();
                    //Địa chỉ thường trú
                    txbDiaChiThuongTru.Text = thongtinchitiet.Rows[0]["dctt"].ToString();
                    //Hộ khẩu thường trú
                    chzHoKhauThuongTru.DataTextField = "ten_huyen";
                    chzHoKhauThuongTru.DataValueField = "ma_huyen";
                    chzHoKhauThuongTru.DataSource = huyen;
                    chzHoKhauThuongTru.DataBind();
                    chzHoKhauThuongTru.Items.Insert(0,"");
                    int ma_hktt = int.Parse(thongtinchitiet.Rows[0]["ma_hktt"].ToString());
                    chzHoKhauThuongTru.SelectedIndex = chzHoKhauThuongTru.Items.IndexOf(chzHoKhauThuongTru.Items.FindByValue(ma_hktt.ToString()));
                    //Chi tiết hộ khẩu thường trú
                    txbChiTietHoKhauThuongTru.Text = thongtinchitiet.Rows[0]["cthktt"].ToString();
                    //Số bảo hiểm
                    txbSoBaoHiem.Text = thongtinchitiet.Rows[0]["sbh"].ToString();
                    //Ngày bắt đầu đóng bảo hiểm
                    dpkNgayBatDauDongBaoHiem.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ndbh"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ndbh"]).ToString("dd/MM/yyyy") : "";
                    //object ndbh = thongtinchitiet.Rows[0]["ndbh"];
                    //if (!DBNull.Value.Equals(ndbh))
                    //{
                    //    dpkNgayBatDauDongBaoHiem.Text = thongtinchitiet.Rows[0]["ndbh"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ndbh"]).ToString("dd/MM/yyyy") : "";
                    //}
                    //Ngày nhận bảo hiểm chính thức
                    dpkNgayNhanBaoHiemChinhThuc.Text = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["ngaybh"].ToString()) ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ngaybh"]).ToString("dd/MM/yyyy") : "";
                    //object ngaybh = thongtinchitiet.Rows[0]["ngaybh"];
                    //if (!DBNull.Value.Equals(ngaybh))
                    //{
                    //    dpkNgayNhanBaoHiemChinhThuc.Text = thongtinchitiet.Rows[0]["ngaybh"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ngaybh"]).ToString("dd/MM/yyyy") : "";
                    //}
                    //Tình trạng sức khỏe
                    chzTinhTrangSucKhoe.DataSource = tinhtrangsuckhoe;
                    chzTinhTrangSucKhoe.DataBind();
                    chzTinhTrangSucKhoe.Items.Insert(0, "");
                    string ttsk = thongtinchitiet.Rows[0]["ma_ttsk"].ToString();
                    chzTinhTrangSucKhoe.SelectedIndex = chzTinhTrangSucKhoe.Items.IndexOf(chzTinhTrangSucKhoe.Items.FindByText(ttsk));
                    //chzTinhTrangSucKhoe.Items.Add(thongtinchitiet.Rows[0]["ma_ttsk"].ToString());
                    //Nhóm máu
                    chzNhomMau.DataSource = nhommau;
                    chzNhomMau.DataBind();
                    chzNhomMau.Items.Insert(0, "");
                    string nm = thongtinchitiet.Rows[0]["ma_nm"].ToString();
                    chzNhomMau.SelectedIndex = chzNhomMau.Items.IndexOf(chzNhomMau.Items.FindByText(nm));
                    //chzNhomMau.Items.Add(thongtinchitiet.Rows[0]["ma_nm"].ToString());
                    //Tình trạng hôn nhân
                    chzTinhTrangHonNhan.DataSource = tinhtranghonnhan;
                    chzTinhTrangHonNhan.DataBind();
                    chzTinhTrangHonNhan.Items.Insert(0, "");
                    int tthn = !String.IsNullOrEmpty(thongtinchitiet.Rows[0]["tthn"].ToString()) ? Convert.ToInt32(thongtinchitiet.Rows[0]["tthn"]) : 0;
                    chzTinhTrangHonNhan.SelectedIndex = chzTinhTrangHonNhan.Items.IndexOf(chzTinhTrangHonNhan.Items.FindByValue(tthn.ToString()));
                    //Lịch sử bản thân
                    txbLichSuBanThan.Text = thongtinchitiet.Rows[0]["ddlsbt"].ToString();
                    //Dân tộc
                    chzDanToc.DataSource = dantoc;
                    chzDanToc.DataBind();
                    chzDanToc.Items.Insert(0, "");
                    int ma_dt = int.Parse(thongtinchitiet.Rows[0]["ma_dt"].ToString());
                    chzDanToc.SelectedIndex = chzDanToc.Items.IndexOf(chzDanToc.Items.FindByValue(ma_dt.ToString()));
                    
                    //Tôn giáo
                    chzTonGiao.DataSource = tongiao;
                    chzTonGiao.DataBind();
                    chzTonGiao.Items.Insert(0, "");
                    int ma_tg = int.Parse(thongtinchitiet.Rows[0]["ma_tg"].ToString());
                    chzTonGiao.SelectedIndex = chzTonGiao.Items.IndexOf(chzTonGiao.Items.FindByValue(ma_tg.ToString()));
                    
                    //Thông tin khác
                    txbThongTinKhac.Text = thongtinchitiet.Rows[0]["ttk"].ToString();
                //}
                //catch (Exception e) { }






                //thông tin bên cạnh cái ảnh
                   // hoten_canbo.Text = String.Format("H/t: {0} {1}", htbHoVaTenDem.Text, htbTen.Text);
                   //// sohieu_canbo.Text = string.Format("S/h: {0}",);
                   // gioitinh_canbo.Text = String.Format("G/t: {0}",chzGioiTinh.Text);
                   // ngaysinh_canbo.Text = String.Format("N/s: {0}", dpkNgaySinh.Text);

            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            SearchDetailBO.Delete(iShcc);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string ngaythangnamKT = string.Format("01/01/1900");
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd/MM/yyyy";
            dtfi.DateSeparator = "/";
            DateTime datetime = Convert.ToDateTime(ngaythangnamKT, dtfi);

            string hovatendem = htbHoVaTenDem.Text;
            string ten = htbTen.Text;
            DateTime ngaysinh;
            if(!DateTime.TryParse(dpkNgaySinh.Text,out ngaysinh)){
                ngaysinh = datetime;
            }
            int gioitinh;
            if ("Nam".Equals(chzGioiTinh.SelectedValue))
            {
                gioitinh = 1;
            }
            else
            {
                gioitinh = 0;
            }
            string scmnd = txbSoCmtnd.Text;
            DateTime ngaycap;
            if (!DateTime.TryParse(dpkNgayCapCmtnd.Text, out ngaycap))
            {
                ngaycap = datetime;
            }

            int noicap;
            if (!int.TryParse(chzNoiCapCmtnd.SelectedValue, out noicap) || noicap==0)
            {
                noicap = -1;
            }
            string email = txbEmail.Text;
            string dienthoai = txbDienThoai.Text;
            int tdhv;
            if (!int.TryParse(chzTrinhDoHocVan.SelectedValue, out tdhv) || tdhv==0)
            {
                tdhv = -1;
            }
            int tdth;
            if (!int.TryParse(chzTrinhDoTinHoc.SelectedValue, out tdth) || tdth == 0)
            {
                tdth = -1;
            }
            int tdll;
            if (!int.TryParse(chzTrinhDoLyLuan.SelectedValue, out tdll) || tdll == 0)
            {
                tdll = -1;
            }
            int tdql;
            if (!int.TryParse(chzTrinhDoQuanLy.SelectedValue, out tdql) || tdql == 0)
            {
                tdql = -1;
            }
            string sotruong = txbSoTruong.Text;
            DateTime ngayvecq;
            if (!DateTime.TryParse(dpkNgayVeCoQuan.Text, out ngayvecq))
            {
                ngayvecq = datetime;
            }
            DateTime ngayvaobienche;
            if (!DateTime.TryParse(dpkNgayVaoBienChe.Text, out ngayvaobienche))
            {
                ngayvaobienche = datetime;
            }
            int khoicanbo;
            if (!int.TryParse(chzKhoiCanBo.SelectedValue, out khoicanbo) || khoicanbo == 0)
            {
                khoicanbo = -1;
            }
            int diencanbo;
            if (!int.TryParse(chzKhoiCanBo.SelectedValue, out diencanbo) || diencanbo == 0)
            {
                diencanbo = -1;
            }
            int dvql;
            if (!int.TryParse(chzDonViQuanLy.SelectedValue, out dvql) || dvql == 0)
            {
                dvql = -1;
            }
            string viecphancong = txbViecDuocPhanCong.Text;
            string viecdamnhan = txbCongViecDamNhan.Text;

            DateTime ngaybatdau;
            if (!DateTime.TryParse(dpkNgayBatDauTinhThamNien.Text, out ngaybatdau))
            {
                ngaybatdau = datetime;
            }
            DateTime mocthamnien;
            if (!DateTime.TryParse(dpkMocHuongThamNien.Text, out mocthamnien))
            {
                mocthamnien = datetime;
            }
            DateTime ngaykthd;
            if (!DateTime.TryParse(dpkNgayKetThucHopDong.Text, out ngaykthd))
            {
                ngaykthd = datetime;
            }
            string lidokthd = txbLyDoKetThucHopDong.Text;
            int thanggd;
            if (!int.TryParse(txbThangGianDoan.Text, out thanggd))
            {
                thanggd = 0;
            }

            DateTime ngaythamgiacm;
            if (!DateTime.TryParse(dpkNgayThamGiaCachMang.Text, out ngaythamgiacm))
            {
                ngaythamgiacm = datetime;
            }
            DateTime ngayvaodang;
            if (!DateTime.TryParse(dpkNgayVaoDang.Text, out ngayvaodang))
            {
                ngayvaodang = datetime;
            }
            DateTime ngaychinhthuc;
            if (!DateTime.TryParse(dpkNgayChinhThuc.Text, out ngaychinhthuc))
            {
                ngaychinhthuc = datetime;
            }
            DateTime ngaynhapngu;
            if (!DateTime.TryParse(dpkNgayNhapNgu.Text, out ngaynhapngu))
            {
                ngaynhapngu = datetime;
            }
            DateTime ngayxuatngu;
            if (!DateTime.TryParse(dpkNgayXuatNgu.Text, out ngayxuatngu))
            {
                ngayxuatngu = datetime;
            }
            string quanham = txbQuanHam.Text;
            int thuongbinh;
            if (!int.TryParse(chzThuongBinh.SelectedValue, out thuongbinh) || thuongbinh == 0)
            {
                thuongbinh = -1;
            }
            int giadinhchinhsach;
            if (!int.TryParse(chzGiaDinhChinhSach.SelectedValue, out giadinhchinhsach) || giadinhchinhsach == 0)
            {
                giadinhchinhsach = -1;
            }
            int thanhphanxuatthan;
            if (!int.TryParse(chzThanhPhanXuatThan.SelectedValue, out thanhphanxuatthan) || thanhphanxuatthan == 0)
            {
                thanhphanxuatthan = -1;
            }
            string tenthuongdung = txbTenThuongDung.Text;
            int noisinh;
            if (!int.TryParse(chzNoiSinh.SelectedValue, out noisinh) || noisinh == 0)
            {
                noisinh = -1;
            }
            int quequan;
            if (!int.TryParse(chzQueQuan.SelectedValue, out quequan) || quequan == 0)
            {
                quequan = -1;
            }
            string chitietquequan = txbChiTietQueQuan.Text;
            string diachithuongtru = txbDiaChiThuongTru.Text;

            int hokhauthuongtru;
            if (!int.TryParse(chzHoKhauThuongTru.SelectedValue, out hokhauthuongtru) || hokhauthuongtru == 0)
            {
                hokhauthuongtru = -1;
            }
            string chitiethktt = txbChiTietHoKhauThuongTru.Text;
            string sobaohiem = txbSoBaoHiem.Text;

            DateTime ngaydongbh;
            if (!DateTime.TryParse(dpkNgayBatDauDongBaoHiem.Text, out ngaydongbh))
            {
                ngaydongbh = datetime;
            }

            DateTime ngaybhchinhthuc;
            if (!DateTime.TryParse(dpkNgayNhanBaoHiemChinhThuc.Text, out ngaybhchinhthuc))
            {
                ngaybhchinhthuc = datetime;
            }

            string ttsk = chzTinhTrangSucKhoe.SelectedItem.Text;
            string nm = chzNhomMau.SelectedItem.Text;
            int tthn;
            if (!int.TryParse(chzTinhTrangHonNhan.SelectedValue, out tthn) || tthn == 0)
            {
                tthn = -1;
            }
            string lsbt = txbLichSuBanThan.Text;
            int dt;
            if (!int.TryParse(chzDanToc.SelectedValue, out dt) || dt == 0)
            {
                dt = -1;
            }
            int tg;
            if (!int.TryParse(chzTonGiao.SelectedValue, out tg) || tg == 0)
            {
                tg = -1;
            }
            string thongtinkhac = txbThongTinKhac.Text;
            SearchDetailBO.Update(iShcc, hovatendem, ten, ngaysinh, gioitinh, scmnd, ngaycap, noicap, email, dienthoai, tdhv, tdll, tdql,
                tdth, sotruong, ngayvecq, ngayvaobienche, khoicanbo, diencanbo, dvql, viecphancong, viecdamnhan, ngaybatdau, mocthamnien, 
                ngaykthd, lidokthd, thanggd, ngaythamgiacm, ngayvaodang, ngaychinhthuc, ngaynhapngu, ngayxuatngu, quanham, thuongbinh,
                giadinhchinhsach, thanhphanxuatthan, tenthuongdung, noisinh, quequan, chitietquequan, diachithuongtru, hokhauthuongtru, 
                chitiethktt, sobaohiem, ngaydongbh, ngaybhchinhthuc, ttsk, nm, tthn, lsbt, dt, tg, thongtinkhac);
        }
    }
}