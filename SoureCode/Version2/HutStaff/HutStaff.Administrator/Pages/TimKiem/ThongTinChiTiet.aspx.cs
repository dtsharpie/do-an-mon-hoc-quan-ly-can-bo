using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class ThongTinChiTiet : System.Web.UI.Page
    {
        private int iShcc;
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
                    dpkNgaySinh.Date = (DateTime)thongtinchitiet.Rows[0]["ntns"];
                    
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

                    //Ngày cấp
                    txbSoCmtnd.Text = thongtinchitiet.Rows[0]["scmnd"].ToString();
                    dpkNgayCapCmtnd.Date = (DateTime)thongtinchitiet.Rows[0]["ngay_cap"];
                    //Nơi cấp
                    chzNoiCapCmtnd.DataSource = tinhthanhpho;
                    chzNoiCapCmtnd.DataBind();
                    int ma_nc = int.Parse(thongtinchitiet.Rows[0]["nc"].ToString());
                    chzNoiCapCmtnd.SelectedIndex = chzNoiCapCmtnd.Items.IndexOf(chzNoiCapCmtnd.Items.FindByValue(ma_nc.ToString()));
                    //Email
                    txbEmail.Text = thongtinchitiet.Rows[0]["email"].ToString();
                    //Số điện thoại
                    txbDienThoai.Text = thongtinchitiet.Rows[0]["tel"].ToString();
                    //Trình độ học vấn
                    chzTrinhDoHocVan.DataSource = trinhdohocvan;
                    chzTrinhDoHocVan.DataBind();
                    int ma_tdhv = int.Parse(thongtinchitiet.Rows[0]["ma_tdhv"].ToString());
                    chzTrinhDoHocVan.SelectedIndex = chzTrinhDoHocVan.Items.IndexOf(chzTrinhDoHocVan.Items.FindByValue(ma_nc.ToString()));
                    //Trình độ tin học
                    chzTrinhDoTinHoc.DataSource = trinhdotinhoc;
                    chzTrinhDoTinHoc.DataBind();
                    object tdth = thongtinchitiet.Rows[0]["ma_tdth"];
                    if (!DBNull.Value.Equals(tdth))
                    {
                        int ma_tdth = int.Parse(thongtinchitiet.Rows[0]["ma_tdth"].ToString());
                        chzTrinhDoTinHoc.SelectedIndex = chzTrinhDoTinHoc.Items.IndexOf(chzTrinhDoTinHoc.Items.FindByValue(ma_tdth.ToString()));
                    }
                    else
                    {
                        chzTrinhDoTinHoc.Items.Add("");
                        chzTrinhDoTinHoc.SelectedIndex = chzTrinhDoTinHoc.Items.Count-1;
                    }
                    //Trình độ lí luận chính trị
                    chzTrinhDoLyLuan.DataSource = trinhdoliluanchinhtri;
                    chzTrinhDoLyLuan.DataBind();
                    object tdllct = thongtinchitiet.Rows[0]["ma_tdllct"];
                    if (!DBNull.Value.Equals(tdllct))
                    {                                                
                        int ma_tdllct = int.Parse(thongtinchitiet.Rows[0]["ma_tdllct"].ToString());
                        chzTrinhDoLyLuan.SelectedIndex = chzTrinhDoLyLuan.Items.IndexOf(chzTrinhDoLyLuan.Items.FindByValue(ma_tdllct.ToString()));
                    }
                    else
                    {
                        chzTrinhDoLyLuan.Items.Add("");
                        chzTrinhDoLyLuan.SelectedIndex = chzTrinhDoLyLuan.Items.Count - 1;
                    }
                    //Trình độ quản lí nhà nước
                    chzTrinhDoQuanLy.DataSource = trinhdoquanlinhanuoc;
                    chzTrinhDoQuanLy.DataBind();
                    object tdqlnn = thongtinchitiet.Rows[0]["ma_tdqlnn"];
                    if (!DBNull.Value.Equals(tdqlnn))
                    {                                                
                        int ma_tdqlnn = int.Parse(thongtinchitiet.Rows[0]["ma_tdqlnn"].ToString());
                        chzTrinhDoQuanLy.SelectedIndex = chzTrinhDoQuanLy.Items.IndexOf(chzTrinhDoQuanLy.Items.FindByValue(ma_tdqlnn.ToString()));
                    }
                    else
                    {
                        chzTrinhDoQuanLy.Items.Add("");
                        chzTrinhDoQuanLy.SelectedIndex = chzTrinhDoQuanLy.Items.Count - 1;
                    }
                    //Sở trường năng khiếu
                    txbSoTruong.Text = thongtinchitiet.Rows[0]["nlstnk"].ToString();
                    //Ngày về cơ quan
                    dpkNgayVeCoQuan.Date = (DateTime)thongtinchitiet.Rows[0]["nvcqhn"];
                    //Ngày vào biên chế
                    dpkNgayVaoBienChe.Date = (DateTime)thongtinchitiet.Rows[0]["nvbc"];
                    //Khối cán bộ
                    chzKhoiCanBo.DataSource = khoicanbo;
                    chzKhoiCanBo.DataBind();
                    int kcb = int.Parse(thongtinchitiet.Rows[0]["kcb"].ToString());
                    chzKhoiCanBo.SelectedIndex = chzKhoiCanBo.Items.IndexOf(chzKhoiCanBo.Items.FindByValue(kcb.ToString()));
                    //Diện cán bộ
                    chzDienCanBo.DataSource = diencanbo;
                    chzDienCanBo.DataBind();
                    int dcb = int.Parse(thongtinchitiet.Rows[0]["dcb"].ToString());
                    chzDienCanBo.SelectedIndex = chzDienCanBo.Items.IndexOf(chzDienCanBo.Items.FindByValue(dcb.ToString()));
                    //Đơn vị quản lí
                    chzDonViQuanLy.DataSource = donviquanli;
                    chzDonViQuanLy.DataBind();
                    int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
                    chzDonViQuanLy.SelectedIndex = chzDonViQuanLy.Items.IndexOf(chzDonViQuanLy.Items.FindByValue(ma_dvql.ToString()));
                    //Công việc được phân công
                    txbViecDuocPhanCong.Text = thongtinchitiet.Rows[0]["vdpc"].ToString();
                    //Công việc đảm nhận
                    txbCongViecDamNhan.Text = thongtinchitiet.Rows[0]["cvdn"].ToString();
                    //Ngày bắt đầu thâm niên
                    //dpkNgayBatDauTinhThamNien.Date = thongtinchitiet.Rows[0]["cvdn"].ToString();
                    //Mốc hưởng thâm niên
                    dpkMocHuongThamNien.Date = (DateTime)thongtinchitiet.Rows[0]["mochuongtn"];
                    //Ngày kết thúc hợp đồng
                    object ngay_kthd = thongtinchitiet.Rows[0]["ngay_kthd"];
                    if (!DBNull.Value.Equals(ngay_kthd))
                    {
                        dpkNgayKetThucHopDong.Date = (DateTime)ngay_kthd;
                    }
                    //Lí do kết thúc hợp đồng
                    txbLyDoKetThucHopDong.Text = thongtinchitiet.Rows[0]["ld_kthd"].ToString();
                    //Tháng gián đoạn
                    txbThangGianDoan.Text = thongtinchitiet.Rows[0]["thanggd"].ToString();
                    //Ngày tham gia Cách Mạng
                    object ntgcm = thongtinchitiet.Rows[0]["ntgcm"];
                    if (!DBNull.Value.Equals(ntgcm))
                    {
                        dpkNgayThamGiaCachMang.Date = (DateTime)ntgcm;
                    }
                    //Ngày vào Đảng
                    object nvd = thongtinchitiet.Rows[0]["nvd"];
                    if (!DBNull.Value.Equals(nvd))
                    {
                        dpkNgayVaoDang.Date = (DateTime)thongtinchitiet.Rows[0]["nvd"];
                    }
                    //Ngày chính thức vào Đảng
                    object nct = thongtinchitiet.Rows[0]["nct"];
                    if (!DBNull.Value.Equals(nct))
                    {
                        dpkNgayChinhThuc.Date = (DateTime)thongtinchitiet.Rows[0]["nct"];
                    }
                    //Ngày nhập ngũ
                    object nnn = thongtinchitiet.Rows[0]["nnn"];
                    if (!DBNull.Value.Equals(nnn))
                    {
                        dpkNgayNhapNgu.Date = (DateTime)thongtinchitiet.Rows[0]["nnn"];
                    }
                    //Ngày xuất ngũ
                    object nxn = thongtinchitiet.Rows[0]["nxn"];
                    if (!DBNull.Value.Equals(nxn))
                    {
                        dpkNgayXuatNgu.Date = (DateTime)thongtinchitiet.Rows[0]["nxn"];
                    }
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
                        chzThuongBinh.Items.Add("");
                        chzThuongBinh.SelectedIndex = chzThuongBinh.Items.Count - 1;
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
                        chzGiaDinhChinhSach.Items.Add("");
                        chzGiaDinhChinhSach.SelectedIndex = chzGiaDinhChinhSach.Items.Count - 1;
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
                        chzThanhPhanXuatThan.Items.Add("");
                        chzThanhPhanXuatThan.SelectedIndex = chzThanhPhanXuatThan.Items.Count - 1;
                    }
                    //Tên thường dùng
                    txbTenThuongDung.Text = thongtinchitiet.Rows[0]["ttd"].ToString();
                    //Nơi sinh                    
                    chzNoiSinh.DataSource = huyen;
                    chzNoiSinh.DataBind();
                    int ma_ns = int.Parse(thongtinchitiet.Rows[0]["ma_ns"].ToString());
                    chzNoiSinh.SelectedIndex = chzNoiSinh.Items.IndexOf(chzNoiSinh.Items.FindByValue(ma_ns.ToString()));
                    //Quê quán
                    chzQueQuan.DataSource = tinhthanhpho;
                    chzQueQuan.DataBind();
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
                    int ma_hktt = int.Parse(thongtinchitiet.Rows[0]["ma_hktt"].ToString());
                    chzHoKhauThuongTru.SelectedIndex = chzHoKhauThuongTru.Items.IndexOf(chzHoKhauThuongTru.Items.FindByValue(ma_hktt.ToString()));
                    //Chi tiết hộ khẩu thường trú
                    txbChiTietHoKhauThuongTru.Text = thongtinchitiet.Rows[0]["cthktt"].ToString();
                    //Số bảo hiểm
                    txbSoBaoHiem.Text = thongtinchitiet.Rows[0]["sbh"].ToString();
                    //Ngày bắt đầu đóng bảo hiểm
                    object ndbh = thongtinchitiet.Rows[0]["ndbh"];
                    if (!DBNull.Value.Equals(ndbh))
                    {
                        dpkNgayBatDauDongBaoHiem.Date = (DateTime)thongtinchitiet.Rows[0]["ndbh"];
                    }
                    //Ngày nhận bảo hiểm chính thức
                    object ngaybh = thongtinchitiet.Rows[0]["ngaybh"];
                    if (!DBNull.Value.Equals(ngaybh))
                    {
                        dpkNgayNhanBaoHiemChinhThuc.Date = (DateTime)thongtinchitiet.Rows[0]["ngaybh"];
                    }
                    //Tình trạng sức khỏe
                    chzTinhTrangSucKhoe.DataSource = tinhtrangsuckhoe;
                    chzTinhTrangSucKhoe.DataBind();
                    //chzTinhTrangSucKhoe.Items.Add(thongtinchitiet.Rows[0]["ma_ttsk"].ToString());
                    //Nhóm máu
                    chzNhomMau.DataSource = nhommau;
                    chzNhomMau.DataBind();
                    //chzNhomMau.Items.Add(thongtinchitiet.Rows[0]["ma_nm"].ToString());
                    //Tình trạng hôn nhân
                    chzTinhTrangHonNhan.DataSource = tinhtranghonnhan;
                    chzTinhTrangHonNhan.DataBind();
                    int tthn = int.Parse(thongtinchitiet.Rows[0]["tthn"].ToString());
                    chzTinhTrangHonNhan.SelectedIndex = chzTinhTrangHonNhan.Items.IndexOf(chzTinhTrangHonNhan.Items.FindByValue(tthn.ToString()));
                    //Lịch sử bản thân
                    txbLichSuBanThan.Text = thongtinchitiet.Rows[0]["ddlsbt"].ToString();
                    //Dân tộc
                    chzDanToc.DataSource = dantoc;
                    chzDanToc.DataBind();
                    int ma_dt = int.Parse(thongtinchitiet.Rows[0]["ma_dt"].ToString());
                    chzDanToc.SelectedIndex = chzDanToc.Items.IndexOf(chzDanToc.Items.FindByValue(ma_dt.ToString()));
                    
                    //Tôn giáo
                    chzTonGiao.DataSource = tongiao;
                    chzTonGiao.DataBind();
                    int ma_tg = int.Parse(thongtinchitiet.Rows[0]["ma_tg"].ToString());
                    chzTonGiao.SelectedIndex = chzTonGiao.Items.IndexOf(chzTonGiao.Items.FindByValue(ma_tg.ToString()));
                    
                    //Thông tin khác
                    txbThongTinKhac.Text = thongtinchitiet.Rows[0]["ttk"].ToString();
                //}
                //catch (Exception e) { }
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            SearchDetailBO.Delete(iShcc);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string hovatendem = htbHoVaTenDem.Text;
            string ten = htbTen.Text;
            DateTime ngaysinh = dpkNgaySinh.Date;
            int gioitinh = int.Parse(chzGioiTinh.SelectedValue);
            string scmnd = txbSoCmtnd.Text;
            DateTime ngaycap = dpkNgayCapCmtnd.Date;
            int noicap = int.Parse(chzNoiCapCmtnd.SelectedValue);
            string email = txbEmail.Text;
            string dienthoai = txbDienThoai.Text;
            int tdhv = int.Parse(chzTrinhDoHocVan.SelectedValue);
            int tdth = int.Parse(chzTrinhDoTinHoc.SelectedValue);
            int tdll = int.Parse(chzTrinhDoLyLuan.SelectedValue);
            int tdql = int.Parse(chzTrinhDoQuanLy.SelectedValue);
            string sotruong = txbSoTruong.Text;
            DateTime ngayvecq = dpkNgayVeCoQuan.Date;
            DateTime ngayvaobienche = dpkNgayVaoBienChe.Date;
            int khoicanbo = int.Parse(chzKhoiCanBo.SelectedValue);
            int diencanbo = int.Parse(chzDienCanBo.SelectedValue);
            int dvql = int.Parse(chzDonViQuanLy.SelectedValue);
            string viecphancong = txbViecDuocPhanCong.Text;
            string viecdamnhan = txbCongViecDamNhan.Text;
            DateTime ngaybatdau = dpkNgayBatDauTinhThamNien.Date;
            DateTime mocthamnien = dpkMocHuongThamNien.Date;
            DateTime ngaykthd = dpkNgayKetThucHopDong.Date;
            string lidokthd = txbLyDoKetThucHopDong.Text;
            int thanggd = int.Parse(txbThangGianDoan.Text);
            DateTime ngaythamgiacm = dpkNgayThamGiaCachMang.Date;
            DateTime ngayvaodang = dpkNgayVaoDang.Date;
            DateTime ngaychinhthuc = dpkNgayChinhThuc.Date;
            DateTime ngaynhapngu = dpkNgayNhapNgu.Date;
            DateTime ngayxuatngu = dpkNgayXuatNgu.Date;
            string quanham = txbQuanHam.Text;
            int thuongbinh = int.Parse(chzThuongBinh.SelectedValue);
            int giadinhchinhsach = int.Parse(chzGiaDinhChinhSach.SelectedValue);
            int thanhphanxuatthan = int.Parse(chzThanhPhanXuatThan.SelectedValue);
            string tenthuongdung = txbTenThuongDung.Text;
            int noisinh = int.Parse(chzNoiSinh.SelectedValue);
            int quequan = int.Parse(chzQueQuan.SelectedValue);
            string chitietquequan = txbChiTietQueQuan.Text;
            string diachithuongtru = txbDiaChiThuongTru.Text;
            int hokhauthuontru = int.Parse(chzHoKhauThuongTru.SelectedValue);
            string chitiethktt = txbChiTietHoKhauThuongTru.Text;
            string sobaohiem = txbSoBaoHiem.Text;
            DateTime ngaydongbh = dpkNgayBatDauDongBaoHiem.Date;
            DateTime ngaybhchinhthuc = dpkNgayNhanBaoHiemChinhThuc.Date;
            int ttsk = int.Parse(chzTinhTrangSucKhoe.SelectedValue);
            int nm = int.Parse(chzNhomMau.SelectedValue);
            int tthn = int.Parse(chzTinhTrangHonNhan.SelectedValue);
            string lsbt = txbLichSuBanThan.Text;
            int dt = int.Parse(chzDanToc.SelectedValue);
            int tg = int.Parse(chzTonGiao.SelectedValue);
            string thongtinkhac = txbThongTinKhac.Text;
            //SearchDetailBO.Edit(iShcc,);
        }
    }
}