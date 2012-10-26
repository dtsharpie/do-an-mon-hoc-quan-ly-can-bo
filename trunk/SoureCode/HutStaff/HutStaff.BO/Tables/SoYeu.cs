using System;
using System.Linq;
using System.Text;

namespace HutStaff.BO.Tables
{
    public class SoYeu
    {
        #region //--------- Private Fields --------------//
        /// <summary>
        /// Mảng string dùng để cho procedure insert của bảng sơ yếu.
        /// </summary>
        public static string[] InsertString =
        { 
            //"[user]",
		    "pass",
		    "nvcqhn",
		    "scmnd",
		    "nc",
		    "ngay_cap",
		    "ma_dvql",
	        "hodem",
		    "ten",  
		    "gt",
		    "ttd",
		    "ntns",
		    "ma_ns",
		    "ma_qq",
		    "ctqq",
		    "dctt",
		    "ma_dt",
		    "ma_tg",
		    "ma_gdtdcs",
		    "ma_tpxt",
		    "ntgcm",
		    "vdpc",
		    "nvbc",
		    "cvdn",
		    "nvd",
		    "nct",
		    "nnn",
		    "nxn",
		    "qh",
		    "ma_tb",
		    "ma_tdhv",
		    "ma_tdth",
		    "kn_tht",
		    "ma_tdllct",
		    "ma_tdqlnn",
		    "nlstnk",
		    "ma_ttsk",
		    "ma_nm",
		    "ddlsbt",
		    "ttk",
		    "dcb",
		    "sbh",
		    "ndbh",
		    "tthn",
		    "email",
		    "tel",
		    "cthktt",
		    "kcb",
		    "ma_hktt",
		    "ngay_kthd",
		    "ld_kthd",
		    "ngaybh",
		    "thanggd",
		    "ngaybhct",
		    "mochuongtn"
        };
        #endregion

        #region //--------- CLR Properties --------------//
        /// <summary>
        /// Lấy tên đăng nhập vào tài khoản của người dùng.
        /// Mặc định là bỏ dấu và khoảng trắng của họ + tên đệm + tên của người dùng.
        /// </summary>
        public string UserName
        {
            get
            {
                string fullname = String.Format("{0}{1}", HoDem, Ten);
                return GetUserName(fullname);
            }
        }

        /// <summary>
        /// Lấy mật khẩu của tài khoản của người dùng.
        /// Mặc định là lấy ngày sinh theo định dạng ddmmyyyy.
        /// </summary>
        public string Password
        {
            get
            {
                return NgaySinh.ToString("ddMMyyyy");
            }
        }

        /// <summary>
        /// Ngày về cơ quan.
        /// </summary>
        public DateTime NgayVeCoQuan { get; set; }

        /// <summary>
        /// Số chứng minh thư nhân dân.
        /// </summary>
        public string SoCmtnd { get; set; }

        /// <summary>
        /// Nơi cấp chứng minh thư nhân dân. Khóa phụ đến bảng dm_ttp.
        /// </summary>
        public int NoiCapCmtnd { get; set; }

        /// <summary>
        /// Ngày cấp chứng minh thư nhân dân.
        /// </summary>
        public DateTime NgayCapCmtnd { get; set; }

        /// <summary>
        /// Đơn vị quản lý. Khóa phụ đến bảng dm_dv.
        /// </summary>
        public int DonViQuanLy { get; set; }

        /// <summary>
        /// Họ và tên đệm.
        /// </summary>
        public string HoDem { get; set; }

        /// <summary>
        /// Tên.
        /// </summary>
        public string Ten { get; set; }

        /// <summary>
        /// Giới tính. Nam = 0, Nữ = 1.
        /// </summary>
        public int GioiTinh { get; set; }

        /// <summary>
        /// Tên thường dùng.
        /// </summary>
        public string TenThuongDung { get; set; }

        /// <summary>
        /// Ngày sinh.
        /// </summary>
        public DateTime NgaySinh { get; set; }

        /// <summary>
        /// Nơi sinh. Khóa phụ đến bảng dm_dd.
        /// </summary>
        public int NoiSinh { get; set; }

        /// <summary>
        /// Quê quán. Khóa phụ đến bảng dm_dd.
        /// </summary>
        public int QueQuan { get; set; }

        /// <summary>
        /// Chi tiết quê quán.
        /// </summary>
        public string ChiTietQueQuan { get; set; }

        /// <summary>
        /// Địa chỉ thường trú.
        /// </summary>
        public string DiaChiThuongTru { get; set; }

        /// <summary>
        /// Dân tộc. Khóa phụ đến bảng dm_dt.
        /// </summary>
        public int DanToc { get; set; }

        /// <summary>
        /// Tôn giáo. Khóa phụ đến bảng dm_tg.
        /// </summary>
        public int TonGiao { get; set; }

        /// <summary>
        /// Gia đình chính sách. Khóa phụ đến bảng dm_gdcs.
        /// </summary>
        public int GiaDinhChinhSach { get; set; }

        /// <summary>
        /// Thành phần xuất thân. Khóa phụ đến bảng dm_tpxt.
        /// </summary>
        public int ThanhPhanXuatThan { get; set; }

        /// <summary>
        /// Ngày tham gia cách mạng.
        /// </summary>
        public DateTime NgayThamGiaCM { get; set; }

        /// <summary>
        /// Việc được phân công.
        /// </summary>
        public string ViecDuocPhanCong { get; set; }

        /// <summary>
        /// Ngày vào biên chế.
        /// </summary>
        public DateTime NgayVaoBienChe { get; set; }

        /// <summary>
        /// Công việc đảm nhận.
        /// </summary>
        public string CongViecDamNhan { get; set; }

        /// <summary>
        /// Ngày vào Đảng.
        /// </summary>
        public DateTime NgayVaoDang { get; set; }

        /// <summary>
        /// Ngày vào Đảng chính thức.
        /// </summary>
        public DateTime NgayChinhThuc { get; set; }

        /// <summary>
        /// Ngày nhâp ngũ.
        /// </summary>
        public DateTime NgayNhapNgu { get; set; }

        /// <summary>
        /// Ngày xuất ngũ.
        /// </summary>
        public DateTime NgayXuatNgu { get; set; }

        /// <summary>
        /// Quân hàm.
        /// </summary>
        public string QuanHam { get; set; }

        /// <summary>
        /// Thương binh. Khóa phụ đến bảng dm_tb.
        /// </summary>
        public int ThuongBinh { get; set; }

        /// <summary>
        /// Trình độ học vấn. Khóa phụ đến bảng dm_tdhv.
        /// </summary>
        public int TrinhDoHocVan { get; set; }

        /// <summary>
        /// Trình độ tin học. Khóa phụ đến bảng dm_tdth.
        /// </summary>
        public int TrinhDoTinHoc { get; set; }

        /// <summary>
        /// Trình độ lý luận. Khóa phụ đến bảng dm_tdll.
        /// </summary>
        public int TrinhDoLyLuan { get; set; }

        /// <summary>
        /// Trình độ quản lý. Khóa phụ đến bảng dm_tdql.
        /// </summary>
        public int TrinhDoQuanLy { get; set; }

        /// <summary>
        ///  Sở trường, năng khiếu.
        /// </summary>
        public string SoTruongNangKhieu { get; set; }

        /// <summary>
        /// Tình trạng sức khỏe: Tốt / Trung bình / Yếu.
        /// </summary>
        public string TinhTrangSucKhoe { get; set; }

        /// <summary>
        /// Nhóm máu: A / AB / B / O.
        /// </summary>
        public string NhomMau { get; set; }

        /// <summary>
        /// Lịch sử bản thân.
        /// </summary>
        public string LichSuBanThan { get; set; }

        /// <summary>
        /// Thông tin khác.
        /// </summary>
        public string ThongTinKhac { get; set; }

        /// <summary>
        /// Diện cán bộ. Khóa phụ đến bảng dm_dcb.
        /// </summary>
        public int DienCanBo { get; set; }

        /// <summary>
        /// Sổ bảo hiểm.
        /// </summary>
        public string SoBaoHiem { get; set; }

        /// <summary>
        /// Ngày bắt đầu đóng bảo hiểm.
        /// </summary>
        public DateTime NgayBatDauDongBH { get; set; }

        /// <summary>
        /// Tình trạng hôn nhân. Khóa phụ đến bảng dm_tthn.
        /// </summary>
        public int TinhTrangHonNhan { get; set; }

        /// <summary>
        /// Email.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Điện thoại.
        /// </summary>
        public string Dienthoai { get; set; }

        /// <summary>
        /// Chi tiết hộ khẩu thường trú.
        /// </summary>
        public string ChiTietHktt { get; set; }

        /// <summary>
        /// Khối cán bộ. Khóa phụ đến bảng dm_kcb.
        /// </summary>
        public int KhoiCanBo { get; set; }

        /// <summary>
        /// Hộ khẩu thường trú. Khóa phụ đến bảng dm_dd.
        /// </summary>
        public int HoKhauThuongTru { get; set; }

        /// <summary>
        /// Ngày kết thúc hợp đồng.
        /// </summary>
        public DateTime NgayKetThucHD { get; set; }

        /// <summary>
        /// Lý do kết thúc hợp đồng.
        /// </summary>
        public string LyDoKetThucHD { get; set; }

        /// <summary>
        /// Ngày bắt đầu tính thâm niên.
        /// </summary>
        public DateTime NgayTinhThamNiem { get; set; }

        /// <summary>
        /// Tháng gián đoạn.
        /// </summary>
        public int ThangGianDoan { get; set; }

        /// <summary>
        /// Ngày nhận bảo hiểm chính thức.
        /// </summary>
        public DateTime NgayNhanBaoHiem { get; set; }

        /// <summary>
        /// Mốc hưởng thâm niên.
        /// </summary>
        public DateTime MocHuongThamNiem { get; set; }

        /// <summary>
        /// Xóa hồ sơ hay không.
        ///     1: đã bị xóa.
        ///     0: tồn tại hồ sơ.
        /// </summary>
        public bool XoaHoSo { get; set; }
        #endregion

        #region //--------- Static Methods --------------//
        /// <summary>
        /// Thêm 1 bản ghi mới vào bảng Sơ Yếu, [user] và [pass] được tự động thêm vào.
        ///     - [user]: họ và tên bỏ dấu
        ///     - [pass]: ngày sinh (ddmmyyyy)
        /// </summary>
        public static void Insert(SoYeu soYeu)
        {
            HutStaff.DAL.Repository.Execute(
                "sp_insert_soyeu",
                SoYeu.InsertString,
                soYeu.ToArray());
        }
        #endregion

        #region //--------- Private Methods -------------//
        /// <summary>
        /// Lấy tài khoản của người dùng bằng cách bỏ dấu, khoảng trắng trong tên của người dùng.
        /// </summary>
        /// <param name="fullName">Tên đầy đủ gồm dấu và khoảng trắng.</param>
        /// <remarks>Tên đã được bỏ các kí tự đặc biệt. Có thể đã được xử lý
        ///     bằng validation từ trước.</remarks>
        /// <returns></returns>
        public string GetUserName(string fullName)
        {
            StringBuilder builder = new StringBuilder();

            string signedChar = "ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý";
            string unsignedChar = "aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyy";

            foreach (char c in fullName)
            {
                int index = signedChar.IndexOf(c);
                char uc = c;    // unsigned char.

                // Tìm thấy c trong chuỗi có dấu.
                if (index != -1)
                {
                    uc = unsignedChar[index];
                }

                builder.Append(uc);
            }

            return builder.ToString().Replace(" ", "");
        }

        /// <summary>
        /// Lấy mảng các đối tượng tương ứng với InsertString.
        /// </summary>
        /// <returns></returns>
        public object[] ToArray()
        {
            return new object[]
            {
                //UserName,
                Password,
                NgayVeCoQuan,
                SoCmtnd,
                NoiCapCmtnd,
                NgayCapCmtnd,
                DonViQuanLy,
                HoDem, 
                Ten,
                GioiTinh,
                TenThuongDung,
                NgaySinh,
                NoiSinh,
                QueQuan,
                ChiTietQueQuan,
                DiaChiThuongTru,
                DanToc,
                TonGiao,
                GiaDinhChinhSach,
                ThanhPhanXuatThan,
                NgayThamGiaCM,
                ViecDuocPhanCong,
                NgayVaoBienChe,
                CongViecDamNhan,
                NgayVaoDang,
                NgayChinhThuc,
                NgayNhapNgu,
                NgayXuatNgu,
                QuanHam,
                ThuongBinh,
                TrinhDoHocVan,
                TrinhDoTinHoc,
                "", // kn_tht
                TrinhDoLyLuan,
                TrinhDoQuanLy,
                SoTruongNangKhieu,
                TinhTrangSucKhoe,
                NhomMau,
                LichSuBanThan,
                ThongTinKhac,
                DienCanBo,
                SoBaoHiem,
                NgayBatDauDongBH,
                TinhTrangHonNhan,
                Email,
                Dienthoai,
                ChiTietHktt,
                KhoiCanBo,
                HoKhauThuongTru,
                NgayKetThucHD,
                LyDoKetThucHD,
                NgayTinhThamNiem,
                ThangGianDoan,
                NgayNhanBaoHiem,
                MocHuongThamNiem
            };
        }
        #endregion
    }
}