using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class BoSungCanBo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void BindData()
        {

            List<String> date = new List<String> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
                "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};
            List<String> month = new List<String> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };
            Dictionary<string, int> homeList = new Dictionary<string, int>(); // danh sach ten Quehuong
            homeList = BoSungCanBoBO.getQueHuong();
            Dictionary<string, int> provinceList = new Dictionary<string, int>(); // danh sach ten Tinh
            provinceList = BoSungCanBoBO.getTinh();


            // bind ddl DienCanBo
            ddlDiencanbo.DataSource = BoSungCanBoBO.getDienCanBo();
            ddlDiencanbo.DataBind();
            // bind ddl DropDownList1 - Hiennay
            DropDownList1.Items.Add(new ListItem("Hiện đang công tác", "0"));
            DropDownList1.Items.Add(new ListItem("Đã nghỉ hưu", "1"));
            DropDownList1.Items.Add(new ListItem("Đã mất", "2"));
            DropDownList1.Items.Add(new ListItem( "Đã chuyển cơ quan khác", "3"));
            DropDownList1.Items.Add(new ListItem("Thôi việc", "4"));
            DropDownList1.Items.Add(new ListItem("Hiện không hưởng lương", "5"));
            //bind DropDownList2 - Trang thai
            DropDownList2.Items.Add(new ListItem("", "0"));
            DropDownList2.Items.Add(new ListItem("Nghỉ thai sản có lương", "1"));
            DropDownList2.Items.Add(new ListItem("Nghỉ thai sản không lương", "2"));
            DropDownList2.Items.Add(new ListItem("Nghỉ không lương", "3"));
            DropDownList2.Items.Add(new ListItem("Nghỉ ốm dài hạn", "4"));
            DropDownList2.Items.Add(new ListItem("Đang đi nước ngoài", "5"));
            //bind DropDownList3 - Don vi
            DropDownList3.DataSource = BoSungCanBoBO.getDonVi();
            DropDownList3.DataBind();
            // bind DropDownList4 -- Gioi tinh
            DropDownList4.Items.Add(new ListItem("Nam", "0"));
            DropDownList4.Items.Add(new ListItem("Nữ", "1"));
            // bind DropDownList5 -- Ngay sinh
            DropDownList5.DataSource = date;
            DropDownList5.DataBind();
            // bind DropDownList6 -- Thang sinh
            DropDownList6.DataSource = month;
            DropDownList6.DataBind();
            // bind DropDownList7 -- Hon nhan
            DropDownList7.DataSource = BoSungCanBoBO.getTinhTrangHonNhan();
            DropDownList7.DataBind();
            // bind DropDownList8 -- Noi sinh
            DropDownList8.DataSource = homeList;
            DropDownList8.DataBind();
            // bind DropDownList9 -- Que quan
            DropDownList9.DataSource = homeList;
            DropDownList9.DataBind();
            // bind DropDownList10 -- Ho khau thuong tru
            DropDownList10.DataSource = homeList;
            DropDownList10.DataBind();
            // bind DropDownList11 -- Noi cap CMTND
            DropDownList11.DataSource = provinceList;
            DropDownList11.DataBind();
            // bind DropDownList12 -- Dan toc
            DropDownList12.DataSource = BoSungCanBoBO.getDantoc();
            DropDownList12.DataBind();
            // bind DropDownList14 -- Ton giao
            DropDownList14.DataSource = BoSungCanBoBO.getTonGiao();
            DropDownList14.DataBind();
            // bind DropDownList18 - Thanh phan xuat than
            DropDownList18.DataSource = BoSungCanBoBO.getThanhPhanXuatThan();
            DropDownList18.DataBind();
            // bind DropDownList19 -- Gia dinh chinh sach
            DropDownList19.DataSource = BoSungCanBoBO.getGiaDinhChinhSach();
            DropDownList19.DataBind();
            // bind DropDownList20 -- Dien uu tien
            DropDownList20.DataSource = BoSungCanBoBO.getDienUuTien(); // thuong binh
            DropDownList20.DataBind();
            // bind DropDownList13 -- Ngay hop dong
            DropDownList13.DataSource = date;
            DropDownList13.DataBind();
            // bind DropDownList15 -- Thang hop dong
            DropDownList15.DataSource = month;
            DropDownList15.DataBind();
            // bind DropDownList16 -- Ngay thi tuyen vien chuc
            DropDownList16.DataSource = date;
            DropDownList16.DataBind();
            // bind DropDownList17 -- Thang thi tuyen vien chuc
            DropDownList17.DataSource = month;
            DropDownList17.DataBind();
            // bind DropDownList22 -- Ngay ve co quan
            DropDownList22.DataSource = date;
            DropDownList22.DataBind();
            // bind DropDownList23 -- Thang ve co quan
            DropDownList23.DataSource = month;
            DropDownList23.DataBind();
            // bind DropDownList24 -- Khoi can bo
            DropDownList24.DataSource = BoSungCanBoBO.getKhoiCanBo();
            DropDownList24.DataBind();
            // bind DropDownList26 -- Ngay dong BHXH
            DropDownList26.DataSource = date;
            DropDownList26.DataBind();
            // bind DropDownList27 -- Thang dong BHXH
            DropDownList27.DataSource = month;
            DropDownList27.DataBind();
            // bind DropDownList28 -- Ngay vao Dang
            DropDownList28.DataSource = date;
            DropDownList28.DataBind();
            // bind DropDownList29 -- Thang vao Dang
            DropDownList29.DataSource = month;
            DropDownList29.DataBind();
            // bind DropDownList30 -- Ngay chinh thuc
            DropDownList30.DataSource = date;
            DropDownList30.DataBind();
            // bind DropDownList31 -- Thang chinh thuc
            DropDownList31.DataSource = month;
            DropDownList31.DataBind();
            // bind DropDownList32 -- Ngay nhap ngu
            DropDownList32.DataSource = date;
            DropDownList32.DataBind();
            // bind DropDownList33 -- Thang nhap ngu
            DropDownList33.DataSource = month;
            DropDownList33.DataBind();
            // bind DropDownList34 -- Ngay xuat ngu
            DropDownList34.DataSource = date;
            DropDownList34.DataBind();
            // bind DropDownList35 -- Thang xuat ngu
            DropDownList35.DataSource = month;
            DropDownList35.DataBind();
            // bind DropDownList36 -- Trinh do LLCT
            DropDownList36.DataSource = BoSungCanBoBO.getTrinhDoLiLuan();
            DropDownList36.DataBind();
            // bind DropDownList37 -- Trinh do DLNN
            DropDownList37.DataSource = BoSungCanBoBO.getTrinhDoNgoaiNgu();
            DropDownList37.DataBind();
            // bind DropDownList38 -- Trinh do hoc van pho thong
            DropDownList38.DataSource = BoSungCanBoBO.getTrinhDoHocVanPhoThong();
            DropDownList38.DataBind();
            // bind DropDownList39 -- Trinh do tin hoc
            DropDownList39.DataSource = BoSungCanBoBO.getTrinhDoTinHoc();
            DropDownList39.DataBind();
            // bind DropDownList40 -- Suc khoe
            DropDownList40.Items.Add(new ListItem("Tốt", "0"));
            DropDownList40.Items.Add(new ListItem("Trung bình", "1"));
            DropDownList40.Items.Add(new ListItem("Kém", "2"));
            // bind DropDownList41 -- Nhom mau
            DropDownList41.Items.Add(new ListItem("A", "0"));
            DropDownList41.Items.Add(new ListItem("B", "1"));
            DropDownList41.Items.Add(new ListItem("O", "2"));
            DropDownList41.Items.Add(new ListItem("AB", "3"));
            // bind DropDownList42 -- Ngay ket thuc hop dong
            DropDownList42.DataSource = date;
            DropDownList42.DataBind();
            // bind DropDownList43 -- Thang ket thuc hop dong
            DropDownList43.DataSource = month;
            DropDownList43.DataBind();
            // bind DropDownList44 -- Ngay bat dau tinh tham nien
            DropDownList44.DataSource = date;
            DropDownList44.DataBind();
            // bind DropDownList45 -- Thang bat dau tinh tham nien
            DropDownList45.DataSource = month;
            DropDownList45.DataBind();
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            String soHieu = tbSohieu.Text;
            Int16 dienCanBo = Int16.Parse(ddlDiencanbo.SelectedItem.Value);
            String hienNay = DropDownList1.SelectedItem.Text;
            String trangThai = DropDownList2.SelectedItem.Text;
            Int16 donVi = Int16.Parse(DropDownList3.SelectedItem.Value);
            String hoTen = tbHoTen.Text;
            String gioiTinh = DropDownList4.SelectedItem.Text;
            String tenThuongDung = tbTenThuongDung.Text;
            String ngaySinh = DropDownList5.SelectedItem.Text.ToString() + "/" + DropDownList6.SelectedItem.Text.ToString() + "/" + tbNamSinh.Text.ToString();
            Int16 honNhan = Int16.Parse(DropDownList7.SelectedItem.Value);
            Int16 noiSinh = Int16.Parse(DropDownList8.SelectedItem.Value);
            Int16 queQuan = Int16.Parse(DropDownList9.SelectedItem.Value);
            String chiTietQueQuan = tbChiTietQueQuan.Text;
            Int16 hoKhauThuongTru = Int16.Parse(DropDownList10.SelectedItem.Value);
            String chiTietHKTT = tbChiTietHKTT.Text;
            String choOHienNay = tbChoOHienNay.Text;
            String dienThoai = tbDienThoai.Text;
            String email = tbEmail.Text;
            String soCMT = tbCMT.Text;
            Int16 noiCapCMT = Int16.Parse(DropDownList11.SelectedItem.Value);
            String ngayCap = tbNgayCap.Text;
            Int16 danToc = Int16.Parse(DropDownList12.SelectedItem.Value);
            Int16 tonGiao = Int16.Parse(DropDownList14.SelectedItem.Value);
            Int16 thanhPhanXuatThan = Int16.Parse(DropDownList18.SelectedItem.Value);
            Int16 giaDinhChinhSach = Int16.Parse(DropDownList19.SelectedItem.Value);
            Int16 dienUuTien = Int16.Parse(DropDownList20.SelectedItem.Value);
            String ngayHopDong = DropDownList13.SelectedItem.Text.ToString() + "/" + DropDownList15.SelectedItem.Text.ToString() + "/" + tbNamHopDong.Text.ToString();
            String ngayThiVienChuc = DropDownList16.SelectedItem.Text.ToString() + "/" + DropDownList17.SelectedItem.Text.ToString() + "/" + tbNamThiVienChuc.Text.ToString();
            String coQuanTiepNhan = tbCoquantiepnhan.Text;
            String congViecDuocGiao = tbCongviecduocgiao.Text;
            String ngayVeCoQuan = DropDownList22.SelectedItem.Text.ToString() + "/" + DropDownList23.SelectedItem.Text.ToString() + "/" + tbNamVeCoQuan.Text.ToString();
            Int16 khoiCanBo = Int16.Parse(DropDownList24.SelectedItem.Value);
            String congViecHienNay = tbCongviechiennay.Text;
            String soBHXH = tbBHXH.Text;
            String ngayVaoDang = DropDownList28.SelectedItem.Text.ToString() + "/" + DropDownList29.SelectedItem.Text.ToString() + "/" + tbNamVaoDang.Text.ToString();
            String ngayChinhThuc = DropDownList30.SelectedItem.Text.ToString() + "/" + DropDownList31.SelectedItem.Text.ToString() + "/" + tbNamChinhThuc.Text.ToString();
            String ngayNhapNgu = DropDownList32.SelectedItem.Text.ToString() + "/" + DropDownList33.SelectedItem.Text.ToString() + "/" + tbNamNhapNgu.Text.ToString();
            String ngayXuatNgu = DropDownList34.SelectedItem.Text.ToString() + "/" + DropDownList35.SelectedItem.Text.ToString() + "/" + tbNamXuatNgu.Text.ToString();
            Int16 trinhDoLLCT = Int16.Parse(DropDownList36.SelectedItem.Value);
            Int16 trinhDoQLNN = Int16.Parse(DropDownList37.SelectedItem.Value);
            Int16 trinhDoHocVanPhoThong = Int16.Parse(DropDownList38.SelectedItem.Value);
            Int16 trinhDoTinHoc = Int16.Parse(DropDownList39.SelectedItem.Value);
            String sucKhoe = DropDownList40.SelectedItem.Text;
            String nhomMau = DropDownList41.SelectedItem.Text;
            String ngayKetThucHD = DropDownList42.SelectedItem.Text.ToString() + "/" + DropDownList43.SelectedItem.Text.ToString() + "/" + tbNamKetThucHD.Text.ToString();
            String liDo = taLido.Value;
            String ngayTinhThamNien = DropDownList44.SelectedItem.Text.ToString() + "/" + DropDownList45.SelectedItem.Text.ToString() + "/" + tbNamTinhThamNien.Text.ToString();
            String soThangGianDoan = tbThanggiandoan.Text;
            String lichSu = taLichsubanthan.Value;
            String thongTinKhac = taThongtinkhac.Value;


        }

        protected void btReset_Click(object sender, EventArgs e)
        {

        }

        
    }
}