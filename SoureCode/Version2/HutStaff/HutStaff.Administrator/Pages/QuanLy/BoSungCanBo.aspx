<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="BoSungCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BoSungCanBo" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc" TagName="SlideQuanLy" %>
<%@ Register Src="~/Controls/Common/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Common/DropDownChosen.ascx" TagName="DropDownChosen"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/Common/HintTextBox.ascx" TagName="HintTextBox" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="container">
        <table>
            <tr>
                <td>
                    Họ tên:
                </td>
                <td>
                    <uc3:HintTextBox ID="htbHoVaTenDem" runat="server" HintText="Họ và tên đệm" Width="175px" />
                    &nbsp;<uc3:HintTextBox ID="htbTen" runat="server" HintText="Tên" Width="100px" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Ngày sinh:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgaySinh" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Giới tính:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzGioiTinh" runat="server" PlaceHolder="Chọn giới tính"
                        CssClass="droplist_medium" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txbEmail" runat="server" CssClass="inputextbox_short" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Số CMTND:
                </td>
                <td>
                    <asp:TextBox ID="txbSoCmtnd" runat="server" CssClass="inputextbox_short" />
                </td>
                <td>
                    Ngày cấp:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayCapCmtnd" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Nơi cấp:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzNoiCapCmtnd" runat="server" PlaceHolder="Chọn địa danh"
                        DataTextField="ttp" DataValueField="ma_ttp" CssClass="droplist_medium" />
                </td>
                <td>
                    Điện thoại:
                </td>
                <td>
                    <asp:TextBox ID="txbDienThoai" runat="server" CssClass="inputextbox_short" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    TĐ học vấn:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoHocVan" runat="server" DataTextField="tdhv" DataValueField="ma_tdhv"
                        PlaceHolder="Chọn trình độ học vấn" CssClass="droplist_large" />
                </td>
                <td>
                    TĐ tin học:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoTinHoc" runat="server" DataTextField="tdth" DataValueField="ma_tdth"
                        PlaceHolder="Chọn trình độ tin học" CssClass="droplist_large" />
                </td>
                <td>
                    TĐ LLCT:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoLyLuan" runat="server" DataTextField="tdll" DataValueField="ma_tdll"
                        PlaceHolder="Chọn trình độ lý luận chính trị" CssClass="droplist_large" />
                </td>
                <td>
                    TĐ QLNN:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoQuanLy" runat="server" DataTextField="tdql" DataValueField="ma_tdql"
                        PlaceHolder="Chọn trình độ quản lý nhà nước" CssClass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Sở trường, năng khiếu:
                </td>
                <td>
                    <asp:TextBox ID="txbSoTruong" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Ngày về cơ quan:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayVeCoQuan" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày vào biên chế:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayVaoBienChe" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Khối cán bộ:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzKhoiCanBo" runat="server" DataTextField="kcb" DataValueField="ma_kcb"
                        PlaceHolder="Chọn khối cán bộ" CssClass="droplist_large" />
                </td>
                <td>
                    Diện cán bộ:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzDienCanBo" runat="server" DataTextField="dcb" DataValueField="ma_dcb"
                        PlaceHolder="Chọn diện cán bộ" CssClass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Đơn vị quản lý:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzDonViQuanLy" runat="server" DataTextField="dv" DataValueField="ma_dv"
                        PlaceHolder="Chọn đơn vị quản lý" CssClass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Việc được phân công:
                </td>
                <td>
                    <asp:TextBox ID="txbViecDuocPhanCong" runat="server" CssClass="inputextbox_short" />
                </td>
                <td>
                    Công việc đảm nhận:
                </td>
                <td>
                    <asp:TextBox ID="txbCongViecDamNhan" runat="server" CssClass="inputextbox_short" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Ngày bắt đầu tính thâm niên:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayBatDauTinhThamNien" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Mốc hưởng thâm niên:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkMocHuongThamNien" runat="server" CssClass="datepicker" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Ngày kết thúc hợp đồng:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayKetThucHopDong" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Lý do kết thúc hợp đồng:
                </td>
                <td>
                    <asp:TextBox ID="txbLyDoKetThucHopDong" runat="server" CssClass="inputtextbox_long" />
                </td>
                <td>
                    Tháng gián đoạn:
                </td>
                <td>
                    <asp:TextBox ID="txbThangGianDoan" runat="server" CssClass="inputtextbox_short" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Ngày tham gia cách mạng:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayThamGiaCachMang" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày vào đảng:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayVaoDang" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày chính thức:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayChinhThuc" runat="server" CssClass="datepicker" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Ngày nhập ngũ:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayNhapNgu" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày xuất ngũ:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayXuatNgu" runat="server" CssClass="datepicker" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Quân hàm:
                </td>
                <td>
                    <asp:TextBox ID="txbQuanHam" runat="server" CssClass="inputextbox_short" />
                </td>
                <td>
                    Thương binh:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzThuongBinh" runat="server" DataTextField="tb" DataValueField="ma_tb"
                        PlaceHolder="Chọn loại thương binh" CssClass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Gia đình chính sách:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzGiaDinhChinhSach" runat="server" DataTextField="gdcs"
                        DataValueField="ma_gdcs" PlaceHolder="Chọn gia đình chính sách" CssClass="droplist_large" />
                </td>
                <td>
                    Thành phần xuất thân:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzThanhPhanXuatThan" runat="server" DataTextField="tpxt"
                        DataValueField="ma_tpxt" PlaceHolder="Chọn thành phần xuất thân" CssClass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Tên thường dùng:
                </td>
                <td>
                    <asp:TextBox ID="txbTenThuongDung" runat="server" CssClass="inputextbox_short" />
                </td>
                <td>
                    Nơi sinh:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzNoiSinh" runat="server" DataTextField="ten_huyen" DataValueField="ma_huyen"
                        PlaceHolder="Chọn địa danh" CssClass="droplist_medium" />
                </td>
                <td>
                    Quê quán:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzQueQuan" runat="server" DataTextField="ten_huyen" DataValueField="ma_huyen"
                        PlaceHolder="Chọn địa danh" CssClass="droplist_medium" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Chi tiết quê quán:
                </td>
                <td>
                    <asp:TextBox ID="txbChiTietQueQuan" runat="server" Width="100%" CssClass="inputtextbox_long" />
                </td>
                <td>
                    Địa chỉ thường trú:
                </td>
                <td>
                    <asp:TextBox ID="txbDiaChiThuongTru" runat="server" CssClass="inputtextbox_long" />
                </td>
                <td>
                    Hộ khẩu thường trú:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzHoKhauThuongTru" runat="server" DataTextField="ten_huyen"
                        DataValueField="ma_huyen" PlaceHolder="Chọn địa danh" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Chi tiết hộ khẩu thường trú:
                </td>
                <td>
                    <asp:TextBox ID="txbChiTietHoKhauThuongTru" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Số bảo hiểm:
                </td>
                <td>
                    <asp:TextBox ID="txbSoBaoHiem" runat="server" CssClass="inputtextbox_long" />
                </td>
                <td>
                    Ngày bắt đầu đóng bảo hiểm:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayBatDauDongBaoHiem" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày nhận bảo hiểm chính thức:
                </td>
                <td>
                    <uc1:DatePicker ID="dpkNgayNhanBaoHiemChinhThuc" runat="server" CssClass="datepicker" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Tình trạng sức khỏe:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTinhTrangSucKhoe" runat="server" PlaceHolder="Chọn tình trạng sức khỏe"
                        CssClass="droplist_large" />
                </td>
                <td>
                    Nhóm máu:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzNhomMau" runat="server" PlaceHolder="Chọn nhóm máu" CssClass="droplist_large" />
                </td>
                <td>
                    Tình trạng hôn nhân:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTinhTrangHonNhan" runat="server" DataTextField="tthn"
                        DataValueField="ma_tthn" PlaceHolder="Chọn tình trạng hôn nhân" CssClass="droplist_large" />
                </td>
                <td>
                    Lịch sử bản thân:
                </td>
                <td>
                    <asp:TextBox ID="txbLichSuBanThan" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Dân tộc:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzDanToc" runat="server" DataTextField="dt" DataValueField="ma_dt"
                        PlaceHolder="Chọn dân tộc" CssClass="droplist_medium" />
                </td>
                <td>
                    Tôn giáo:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTonGiao" runat="server" DataTextField="tg" DataValueField="ma_tg"
                        PlaceHolder="Chọn tôn giáo" CssClass="droplist_medium" />
                </td>
                <td>
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="txbThongTinKhac" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="submit">
        <asp:Button ID="btnSubmit" runat="Server" OnClick="OnSubmitButtonClick" Text="Nhập xong" />
        &nbsp;hoặc
        <asp:LinkButton ID="lbnReset" runat="server" Text="Làm lại" OnClick="OnResetLinkButtonClick" />
    </div>
</asp:Content>
