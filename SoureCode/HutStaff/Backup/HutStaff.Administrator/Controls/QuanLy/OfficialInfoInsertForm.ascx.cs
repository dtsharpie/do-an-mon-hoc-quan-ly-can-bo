using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using HutStaff.Administrator.Controls.Common;
using HutStaff.BO.Tables;

namespace HutStaff.Administrator.Controls.QuanLy
{
    public partial class OfficialInfoInsertForm : System.Web.UI.UserControl
    {
        #region //--------- Private Fields --------------//
        /// <summary>
        /// List chứa tất cả các DropDownChosen có trong control này.
        /// </summary>
        private List<DropDownChosen> _chosenList;

        /// <summary>
        /// List chứa tất cả các TextBox có trong control này.
        /// </summary>
        private List<TextBox> _textBoxList;

        /// <summary>
        /// List chứa tất cả các DatePicker có trong control này.
        /// </summary>
        private List<DatePicker> _datePickerList;

        /// <summary>
        /// List chứa tất cả các HintTextBox có trong control này.
        /// </summary>
        private List<HintTextBox> _hintTextBoxList;
        #endregion

        #region //--------- Public Constructors ---------//
        /// <summary>
        /// Khởi tạo đối tượng.
        /// </summary>
        public OfficialInfoInsertForm()
        {
            _chosenList = new List<DropDownChosen>();
            _textBoxList = new List<TextBox>();
            _datePickerList = new List<DatePicker>();
            _hintTextBoxList = new List<HintTextBox>();
        }
        #endregion

        #region //--------- Event Handlers --------------//
        /// <summary>
        /// Nạp dữ liệu các Chosen.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeChosen();
            InitializeControlList();
            CreateTestSample();
        }

        /// <summary>
        /// Xóa tất cả các lựa chọn, text đã nhập.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnResetLinkButtonClick(object sender, EventArgs e)
        {
            ClearAllControl();
            InitializeChosen();
        }

        /// <summary>
        /// Đưa dữ liệu vào database.
        /// </summary>
        protected void OnSubmitButtonClick(object sender, EventArgs e)
        {
            SoYeu soYeu = new SoYeu()
            {
                HoDem = htbHoVaTenDem.Text,
                Ten = htbTen.Text,
                NgaySinh = dpkNgaySinh.Date,
                GioiTinh = Convert.ToInt32(chzGioiTinh.SelectedValue),
                //
                SoCmtnd = txbSoCmtnd.Text,
                NgayCapCmtnd = dpkNgayCapCmtnd.Date,
                NoiCapCmtnd = Convert.ToInt32(chzNoiCapCmtnd.SelectedValue),
                //
                Email = txbEmail.Text,
                Dienthoai = txbDienThoai.Text,
                //
                TrinhDoHocVan = Convert.ToInt32(chzTrinhDoHocVan.SelectedValue),
                TrinhDoTinHoc = Convert.ToInt32(chzTrinhDoTinHoc.SelectedValue),
                TrinhDoLyLuan = Convert.ToInt32(chzTrinhDoLyLuan.SelectedValue),
                TrinhDoQuanLy = Convert.ToInt32(chzTrinhDoQuanLy.SelectedValue),
                //
                SoTruongNangKhieu = txbSoTruong.Text,
                //
                NgayVeCoQuan = dpkNgayVeCoQuan.Date,
                NgayVaoBienChe = dpkNgayVaoBienChe.Date,
                //
                KhoiCanBo = Convert.ToInt32(chzKhoiCanBo.SelectedValue),
                DienCanBo = Convert.ToInt32(chzDienCanBo.SelectedValue),
                DonViQuanLy = Convert.ToInt32(chzDonViQuanLy.SelectedValue),
                ViecDuocPhanCong = txbViecDuocPhanCong.Text,
                CongViecDamNhan = txbCongViecDamNhan.Text,
                //
                NgayTinhThamNiem = dpkNgayBatDauTinhThamNien.Date,
                MocHuongThamNiem = dpkMocHuongThamNien.Date,
                //
                NgayKetThucHD = dpkNgayKetThucHopDong.Date,
                LyDoKetThucHD = txbLyDoKetThucHopDong.Text,
                ThangGianDoan = Convert.ToInt32(txbThangGianDoan.Text),
                //
                NgayThamGiaCM = dpkNgayThamGiaCachMang.Date,
                NgayVaoDang = dpkNgayVaoDang.Date,
                NgayChinhThuc = dpkNgayChinhThuc.Date,
                //
                NgayNhapNgu = dpkNgayNhapNgu.Date,
                NgayXuatNgu = dpkNgayXuatNgu.Date,
                //
                QuanHam = txbQuanHam.Text,
                ThuongBinh = Convert.ToInt32(chzThuongBinh.SelectedValue),
                GiaDinhChinhSach = Convert.ToInt32(chzGiaDinhChinhSach.SelectedValue),
                ThanhPhanXuatThan = Convert.ToInt32(chzThanhPhanXuatThan.SelectedValue),
                //
                TenThuongDung = txbTenThuongDung.Text,
                //
                NoiSinh = Convert.ToInt32(chzNoiSinh.SelectedValue),
                QueQuan = Convert.ToInt32(chzQueQuan.SelectedValue),
                ChiTietQueQuan = txbChiTietQueQuan.Text,
                //
                DiaChiThuongTru = txbDiaChiThuongTru.Text,
                HoKhauThuongTru = Convert.ToInt32(chzHoKhauThuongTru.SelectedValue),
                ChiTietHktt = txbChiTietHoKhauThuongTru.Text,
                //
                SoBaoHiem = txbSoBaoHiem.Text,
                NgayBatDauDongBH = dpkNgayBatDauDongBaoHiem.Date,
                NgayNhanBaoHiem = dpkNgayNhanBaoHiemChinhThuc.Date,
                //
                TinhTrangSucKhoe = chzTinhTrangSucKhoe.SelectedValue,
                NhomMau = chzNhomMau.SelectedValue,
                //
                TinhTrangHonNhan = Convert.ToInt32(chzTinhTrangHonNhan.SelectedValue),
                LichSuBanThan = txbLichSuBanThan.Text,
                //
                DanToc = Convert.ToInt32(chzDanToc.SelectedValue),
                TonGiao = Convert.ToInt32(chzTonGiao.SelectedValue),
                ThongTinKhac = txbThongTinKhac.Text
            };

            HutStaff.BO.Tables.SoYeu.Insert(soYeu);
        }
        #endregion
        
        #region //--------- Private Methods -------------//
        /// <summary>
        /// Đưa dữ liệu vào cho các DropDownChosen.
        /// Bổ sung PlaceHolder (dòng chữ hiển thị mặc định) nếu cần thiết.
        /// </summary>
        private void InitializeChosen()
        {
            // Giới tính
            chzGioiTinh.AddItem(new ListItem("Nam", "1"));
            chzGioiTinh.AddItem(new ListItem("Nữ", "0"));

            // Tình trạng sức khỏe
            chzTinhTrangSucKhoe.AddItem(new ListItem("Tốt", "Tốt"));
            chzTinhTrangSucKhoe.AddItem(new ListItem("Trung bình", "Trung bình"));
            chzTinhTrangSucKhoe.AddItem(new ListItem("Yếu", "Yếu"));

            // Nhóm máu
            chzNhomMau.AddItem(new ListItem("A", "A"));
            chzNhomMau.AddItem(new ListItem("AB", "AB"));
            chzNhomMau.AddItem(new ListItem("B", "B"));
            chzNhomMau.AddItem(new ListItem("O", "O"));

            chzNoiCapCmtnd.DataSource = HutStaff.BO.DanhMuc.TinhThanhPho.GetAll();
            chzTrinhDoHocVan.DataSource = HutStaff.BO.DanhMuc.TrinhDoHocVan.GetAll();
            chzTrinhDoTinHoc.DataSource = HutStaff.BO.DanhMuc.TrinhDoTinHoc.GetAll();
            chzTrinhDoLyLuan.DataSource = HutStaff.BO.DanhMuc.TrinhDoLyLuan.GetAll();
            chzTrinhDoQuanLy.DataSource = HutStaff.BO.DanhMuc.TrinhDoQuanLy.GetAll();
            chzKhoiCanBo.DataSource = HutStaff.BO.DanhMuc.KhoiCanBo.GetAll();
            chzDienCanBo.DataSource = HutStaff.BO.DanhMuc.DienCanBo.GetAll();
            chzDonViQuanLy.DataSource = HutStaff.BO.DanhMuc.DonViQuanLy.GetAll();
            chzThuongBinh.DataSource = HutStaff.BO.DanhMuc.ThuongBinh.GetAll();
            chzGiaDinhChinhSach.DataSource = HutStaff.BO.DanhMuc.GiaDinhChinhSach.GetAll();
            chzThanhPhanXuatThan.DataSource = HutStaff.BO.DanhMuc.ThanhPhanXuatThan.GetAll();
            chzNoiSinh.DataSource = HutStaff.BO.DanhMuc.DiaDanh.GetAll();
            chzQueQuan.DataSource = HutStaff.BO.DanhMuc.DiaDanh.GetAll();
            chzHoKhauThuongTru.DataSource = HutStaff.BO.DanhMuc.DiaDanh.GetAll();
            chzTinhTrangHonNhan.DataSource = HutStaff.BO.DanhMuc.TinhTrangHonNhan.GetAll();
            chzDanToc.DataSource = HutStaff.BO.DanhMuc.DanToc.GetAll();
            chzTonGiao.DataSource = HutStaff.BO.DanhMuc.TonGiao.GetAll();

            AddPlaceHolderItem(new DropDownChosen[]
            {
                chzGioiTinh,
                chzNoiCapCmtnd,
                chzTrinhDoHocVan,
                chzTrinhDoTinHoc,
                chzTrinhDoLyLuan,
                chzTrinhDoQuanLy,
                chzKhoiCanBo,
                chzDienCanBo,
                chzDonViQuanLy,
                chzThuongBinh,
                chzGiaDinhChinhSach,
                chzThanhPhanXuatThan,
                chzNoiSinh,
                chzQueQuan,
                chzHoKhauThuongTru,
                chzTinhTrangSucKhoe,
                chzNhomMau,
                chzTinhTrangHonNhan,
                chzDanToc,
                chzTonGiao
            });
        }

        /// <summary>
        /// DataBound event của DropDownList không phát khi gọi DataBind() nên phải làm như này :(
        /// </summary>
        private void AddPlaceHolderItem(DropDownChosen[] chosens)
        {
            foreach (DropDownChosen chosen in chosens)
            {
                chosen.CheckPlaceHolder();
                chosen.SelectedIndex = 0;
            }
        }

        /// <summary>
        /// Thêm các control vào 2 list _chosenList và _textBoxList.
        /// </summary>
        private void InitializeControlList()
        {
            _chosenList.AddRange(
                new DropDownChosen[] 
                {
                    chzDanToc, chzDienCanBo, chzDonViQuanLy, chzGiaDinhChinhSach, chzGioiTinh,
                    chzHoKhauThuongTru, chzKhoiCanBo, chzNhomMau, chzNoiCapCmtnd, chzNoiSinh,
                    chzQueQuan, chzThanhPhanXuatThan, chzThuongBinh,
                    chzTinhTrangHonNhan, chzTinhTrangSucKhoe,chzTonGiao, chzTrinhDoHocVan,
                    chzTrinhDoLyLuan, chzTrinhDoQuanLy, chzTrinhDoTinHoc
                });

            _textBoxList.AddRange(
                new TextBox[] 
                {
                    txbChiTietHoKhauThuongTru, txbChiTietQueQuan, txbCongViecDamNhan, 
                    txbDiaChiThuongTru, txbDienThoai, txbEmail, txbLichSuBanThan, 
                    txbLyDoKetThucHopDong, txbQuanHam, txbSoBaoHiem, txbSoCmtnd, txbSoTruong, 
                    txbTenThuongDung, txbThongTinKhac, txbViecDuocPhanCong, txbThangGianDoan
                });

            _datePickerList.AddRange(
                new DatePicker[] 
                {
                    dpkMocHuongThamNien, dpkNgayBatDauDongBaoHiem, dpkNgayBatDauTinhThamNien,
                    dpkNgayVeCoQuan, dpkNgayXuatNgu, dpkNgayNhanBaoHiemChinhThuc,
                    dpkNgayNhapNgu, dpkNgaySinh, dpkNgayThamGiaCachMang, dpkNgayVaoBienChe,
                    dpkNgayCapCmtnd, dpkNgayChinhThuc, dpkNgayKetThucHopDong, dpkNgayVaoDang
                });

            _hintTextBoxList.AddRange(
                new HintTextBox[] 
                {
                    htbHoVaTenDem, htbTen
                });
        }

        /// <summary>
        /// Đưa các DropDownChosen về lựa chọn mặc định, xóa các chữ đã điền vào trong TextBox.
        /// </summary>
        private void ClearAllControl()
        {
            foreach (DropDownChosen chosen in _chosenList)
            {
                chosen.Items.Clear();
            }

            foreach (TextBox textbox in _textBoxList)
            {
                textbox.Text = "";
            }

            foreach (DatePicker datePicker in _datePickerList)
            {
                datePicker.Clear();
            }

            foreach (HintTextBox hintTextBox in _hintTextBoxList)
            {
                hintTextBox.ShowHintText();
            }
        }

        /// <summary>
        /// Tạo mẫu để thêm vào csdl.
        /// </summary>
        private void CreateTestSample()
        {
            htbHoVaTenDem.Text = "Nguyễn Văn";
            htbTen.Text = "A";
            dpkNgaySinh.Date = DateTime.Now;
            chzGioiTinh.SelectedIndex = 1;

            txbSoCmtnd.Text = "102093819029";
            dpkNgayCapCmtnd.Date = DateTime.Now;
            chzNoiCapCmtnd.SelectedIndex = 1;

            txbEmail.Text = "mail@abc.d";
            txbDienThoai.Text = "09283039893";

            chzTrinhDoHocVan.SelectedIndex = 1;
            chzTrinhDoTinHoc.SelectedIndex = 1;
            chzTrinhDoLyLuan.SelectedIndex = 1;
            chzTrinhDoQuanLy.SelectedIndex = 1;

            txbSoTruong.Text = "Không có gì";

            dpkNgayVeCoQuan.Date = DateTime.Now;
            dpkNgayVaoBienChe.Date = DateTime.Now;

            chzKhoiCanBo.SelectedIndex = 1;
            chzDienCanBo.SelectedIndex = 1;
            chzDonViQuanLy.SelectedIndex = 1;
            txbViecDuocPhanCong.Text = "Chưa có";
            txbCongViecDamNhan.Text = "Chưa có";

            dpkNgayBatDauTinhThamNien.Date = DateTime.Now;
            dpkMocHuongThamNien.Date = DateTime.Now;

            dpkNgayKetThucHopDong.Date = DateTime.Now;
            txbLyDoKetThucHopDong.Text = "Chưa rõ";
            txbThangGianDoan.Text = "12";

            dpkNgayThamGiaCachMang.Date = DateTime.Now;
            dpkNgayVaoDang.Date = DateTime.Now;
            dpkNgayChinhThuc.Date = DateTime.Now;
            dpkNgayNhapNgu.Date = DateTime.Now;
            dpkNgayXuatNgu.Date = DateTime.Now;

            txbQuanHam.Text = "Chưa rõ";
            chzThuongBinh.SelectedIndex = 1;
            chzGiaDinhChinhSach.SelectedIndex = 1;
            chzThanhPhanXuatThan.SelectedIndex = 1;

            txbTenThuongDung.Text = "Không có";
            chzNoiSinh.SelectedIndex = 1;
            chzQueQuan.SelectedIndex = 1;
            txbChiTietQueQuan.Text = "Chưa rõ";

            txbDiaChiThuongTru.Text = "Chưa rõ";
            chzHoKhauThuongTru.SelectedIndex = 1;
            txbChiTietHoKhauThuongTru.Text = "Chưa rõ";

            txbSoBaoHiem.Text = "019283908";
            dpkNgayBatDauDongBaoHiem.Date = DateTime.Now;
            dpkNgayNhanBaoHiemChinhThuc.Date = DateTime.Now;
            chzTinhTrangSucKhoe.SelectedIndex = 1;
            chzNhomMau.SelectedIndex = 1;

            chzTinhTrangHonNhan.SelectedIndex = 1;
            txbLichSuBanThan.Text = "Không có gì đặc biệt";

            chzDanToc.SelectedIndex = 1;
            chzTonGiao.SelectedIndex = 1;
            txbThongTinKhac.Text = "Không có";
        }
        #endregion
    }
}