<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="BangDanhMuc.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BangDanhMuc" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1 class="title">
        Bảng danh mục</h1>
    <hr width="750px" />
    <div class="main">
        <table width="100%" cellspacing="1" cellpadding="4" border="0" style="border-spacing: 1px;
            border-collapse: separate;">
            <tr>
                <td class="row1">
                    <a href="DanhMuc/DonViPage.aspx">01 - Bảng danh mục đơn vị</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/HocHamPage.aspx">02 - Bảng danh mục học hàm </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/DienCanBoPage.aspx">03 - Bảng danh mục diện cán bộ</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/HinhThucKhenThuongPage.aspx">04 - Bảng danh mục hình thức khen thưởng
                    </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/TinhTrangCongTacPage.aspx">05 - Bảng danh mục tình trạng công tác
                    </a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/HinhThucKyLuatPage.aspx ">06 - Bảng danh mục hình thức kỷ luật
                    </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    
                </td>
                <td class="row1">
                    <a href="DanhMuc/TrinhDoNgoaiNguPage.aspx">08 - Bảng danh mục trình độ ngoại ngữ</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/CongViecDamNhiemPage.aspx">09 - Bảng danh mục công việc đảm nhận</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TenNgoaiNguPage.aspx">10 - Bảng danh mục tên ngoại ngữ </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/QuanHeGiaDinhPage.aspx">11 - Bảng danh mục quan hệ gia đình</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TrinhDoHocVanPage.aspx">12 - Bảng danh mục trình độ học vấn </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/ChuyenNganhDaoTaoPage.aspx">13 - Bảng danh mục chuyên ngành đào tạo</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TrinhDoQuanLyPage.aspx">14 - Bảng danh mục trình độ quản lý</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/HinhThucDaoTaoPage.aspx">15 - Bảng danh mục hình thức đào tạo</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TrinhDoLyLuanPage.aspx">16 - Bảng danh mục trình độ lý luận </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/VanBangDaoTaoPage.aspx">17 - Bảng danh mục văn bằng đào tạo</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TrinhDoTinHocPage.aspx">18 - Bảng danh mục trình độ tin học </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/dm_csbd.php">19 - Bảng danh mục cơ sở bồi dưỡng</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/QuocGiaPage.aspx">20 - Bảng danh mục quốc gia </a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/ChucVuChinhQuyenPage.aspx">21 - Bảng danh mục chức vụ chính quyền
                    </a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/TinhThanhPhoPage.aspx">22 - Bảng danh mục tỉnh, thành phố Việt Nam</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/ChucVuDangPage.aspx">23 - Bảng danh mục chức vụ Đảng</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/NgachLuongPage.aspx">24 - Bảng danh mục ngạch lương</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/ChucVuDoanThePage.aspx">25 - Bảng danh mục chức vụ đoàn thể</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/MatBangLuongPage.aspx">26 - Bảng danh mục mặt bằng lương</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/DanhHieuPage.aspx">27 - Bảng danh mục danh hiệu</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/KinhPhiDiNuocNgoaiPage.aspx">28 - Bảng danh mục nguồn kinh phí đi nước
                        ngoài</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    
                </td>
                <td class="row1">
                    <a href="DanhMuc/MucDichDiNuocNgoai.aspx">30 - Bảng danh mục mục đích đi nước ngoài</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    
                </td>
                <td class="row1">
                    <a href="DanhMuc/TinhTrangHonNhanPage.aspx">32 - Bảng danh mục tình trạng hôn nhân</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/QuanHuyenPage.aspx">33 - Bảng danh mục quận, huyện Việt Nam</a>
                </td>
                <td class="row1">
                    <a href="DanhMuc/CoSoDaoTaoChuyenMonPage.aspx">34 - Bảng danh mục cơ sở đào tạo chuyên
                        môn</a>
                </td>
            </tr>
            <tr>
                <td class="row1">
                    <a href="DanhMuc/MatBangBaoHiem.aspx">35 - Bảng danh mục Bảo hiểm</a>
                </td>
                <td class="row1">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
