<%@Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
 CodeBehind="ThongTinChiTiet.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.ThongTinChiTiet" %>

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
  <%--  <uc:SlideQuanLy runat="server" ID="SlideQuanLy" />--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="container">
        <br />
        <br />
        <div class="header">
            Thông tin cá nhân
        </div>
        <div class="body" id="thongtincanhan">
            <table>
                <tr>
                    <td>
                        Họ tên:
                    </td>
                    <td>
                        <uc3:HintTextBox id="htbHoVaTenDem" runat="server" hinttext="Họ và tên đệm" width="175px" />
                        &nbsp;<uc3:HintTextBox id="htbTen" runat="server" hinttext="Tên" width="100px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày sinh:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgaySinh" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Giới tính:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzGioiTinh" runat="server" placeholder="Chọn giới tính"
                            cssclass="droplist_medium" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Số chứng minh thư nhân dân:
                    </td>
                    <td>
                        <asp:TextBox ID="txbSoCmtnd" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày cấp:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayCapCmtnd" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Nơi cấp:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzNoiCapCmtnd" runat="server" placeholder="Chọn địa danh"
                            datatextfield="ttp" datavaluefield="ma_ttp" cssclass="droplist_medium" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txbEmail" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Điện thoại:
                    </td>
                    <td>
                        <asp:TextBox ID="txbDienThoai" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div class="header">
            Trình độ chuyên môn
        </div>
        <div class="body" id="trinhdochuyenmon">
            <table>
                <tr>
                    <td>
                        Trình độ học vấn:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTrinhDoHocVan" runat="server" datatextfield="tdhv" datavaluefield="ma_tdhv"
                            placeholder="Chọn trình độ học vấn" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Trình độ tin học:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTrinhDoTinHoc" runat="server" datatextfield="tdth" datavaluefield="ma_tdth"
                            placeholder="Chọn trình độ tin học" cssclass="droplist_large" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Trình độ lý luận chính trị:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTrinhDoLyLuan" runat="server" datatextfield="tdll" datavaluefield="ma_tdll"
                            placeholder="Chọn trình độ lý luận chính trị" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Trình độ quản lý nhà nước:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTrinhDoQuanLy" runat="server" datatextfield="tdql" datavaluefield="ma_tdql"
                            placeholder="Chọn trình độ quản lý nhà nước" cssclass="droplist_large" />
                    </td>
                </tr>
            </table>
            <br />
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
        </div>
        <br />
        <br />
        <div class="header">
            Công việc giảng dạy
        </div>
        <div class="body">
            <br />
            <table>
                <tr>
                    <td>
                        Ngày về cơ quan:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayVeCoQuan" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày vào biên chế:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayVaoBienChe" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Khối cán bộ:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzKhoiCanBo" runat="server" datatextfield="kcb" datavaluefield="ma_kcb"
                            placeholder="Chọn khối cán bộ" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Diện cán bộ:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzDienCanBo" runat="server" datatextfield="dcb" datavaluefield="ma_dcb"
                            placeholder="Chọn diện cán bộ" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Đơn vị quản lý:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzDonViQuanLy" runat="server" datatextfield="dv" datavaluefield="ma_dv"
                            placeholder="Chọn đơn vị quản lý" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Việc được phân công:
                    </td>
                    <td>
                        <asp:TextBox ID="txbViecDuocPhanCong" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Công việc đảm nhận:
                    </td>
                    <td>
                        <asp:TextBox ID="txbCongViecDamNhan" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Ngày bắt đầu tính thâm niên:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayBatDauTinhThamNien" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Mốc hưởng thâm niên:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkMocHuongThamNien" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Ngày kết thúc hợp đồng:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayKetThucHopDong" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Lý do kết thúc hợp đồng:
                    </td>
                    <td>
                        <asp:TextBox ID="txbLyDoKetThucHopDong" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tháng gián đoạn:
                    </td>
                    <td>
                        <asp:TextBox ID="txbThangGianDoan" runat="server" CssClass="inputtextbox_short" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div class="header">
            Chính trị - Cách mạng
        </div>
        <div class="body" id="chinhtricachmang">
            <table>
                <tr>
                    <td>
                        Ngày tham gia cách mạng:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayThamGiaCachMang" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày vào đảng:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayVaoDang" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày chính thức:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayChinhThuc" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày nhập ngũ:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayNhapNgu" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày xuất ngũ:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayXuatNgu" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Quân hàm:
                    </td>
                    <td>
                        <asp:TextBox ID="txbQuanHam" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Thương binh:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzThuongBinh" runat="server" datatextfield="tb" datavaluefield="ma_tb"
                            placeholder="Chọn loại thương binh" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Gia đình chính sách:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzGiaDinhChinhSach" runat="server" datatextfield="gdcs"
                            datavaluefield="ma_gdcs" placeholder="Chọn gia đình chính sách" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Thành phần xuất thân:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzThanhPhanXuatThan" runat="server" datatextfield="tpxt"
                            datavaluefield="ma_tpxt" placeholder="Chọn thành phần xuất thân" cssclass="droplist_large" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div class="header">
            Thông tin bổ sung
        </div>
        <div class="body" id="thongtinbosung">
            <table>
                <tr>
                    <td>
                        Tên thường dùng:
                    </td>
                    <td>
                        <asp:TextBox ID="txbTenThuongDung" runat="server" CssClass="inputextbox_short" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Nơi sinh:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzNoiSinh" runat="server" datatextfield="ten_huyen" datavaluefield="ma_huyen"
                            placeholder="Chọn địa danh" cssclass="droplist_medium" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Quê quán:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzQueQuan" runat="server" datatextfield="ten_huyen" datavaluefield="ma_huyen"
                            placeholder="Chọn địa danh" cssclass="droplist_medium" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Chi tiết quê quán:
                    </td>
                    <td>
                        <asp:TextBox ID="txbChiTietQueQuan" runat="server" Width="100%" CssClass="inputtextbox_long" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Địa chỉ thường trú:
                    </td>
                    <td>
                        <asp:TextBox ID="txbDiaChiThuongTru" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Hộ khẩu thường trú:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzHoKhauThuongTru" runat="server" datatextfield="ten_huyen"
                            datavaluefield="ma_huyen" placeholder="Chọn địa danh" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Chi tiết hộ khẩu thường trú:
                    </td>
                    <td>
                        <asp:TextBox ID="txbChiTietHoKhauThuongTru" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Số bảo hiểm:
                    </td>
                    <td>
                        <asp:TextBox ID="txbSoBaoHiem" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày bắt đầu đóng bảo hiểm:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayBatDauDongBaoHiem" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày nhận bảo hiểm chính thức:
                    </td>
                    <td>
                        <uc1:DatePicker ID="dpkNgayNhanBaoHiemChinhThuc" runat="server" CssClass="datepicker" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tình trạng sức khỏe:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTinhTrangSucKhoe" runat="server" placeholder="Chọn tình trạng sức khỏe"
                            cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Nhóm máu:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzNhomMau" runat="server" placeholder="Chọn nhóm máu" cssclass="droplist_large" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Tình trạng hôn nhân:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTinhTrangHonNhan" runat="server" datatextfield="tthn"
                            datavaluefield="ma_tthn" placeholder="Chọn tình trạng hôn nhân" cssclass="droplist_large" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Lịch sử bản thân:
                    </td>
                    <td>
                        <asp:TextBox ID="txbLichSuBanThan" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td>
                        Dân tộc:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzDanToc" runat="server" datatextfield="dt" datavaluefield="ma_dt"
                            placeholder="Chọn dân tộc" cssclass="droplist_medium" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tôn giáo:
                    </td>
                    <td>
                        <uc2:dropdownchosen id="chzTonGiao" runat="server" datatextfield="tg" datavaluefield="ma_tg"
                            placeholder="Chọn tôn giáo" cssclass="droplist_medium" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Thông tin khác
                    </td>
                    <td>
                        <asp:TextBox ID="txbThongTinKhac" runat="server" CssClass="inputtextbox_long" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
    </div>
    <div id="submit">
        <asp:Button ID="btnSubmit" runat="Server" OnClick="OnSubmitButtonClick" Text="Nhập xong" />
        &nbsp;hoặc
        <asp:LinkButton ID="lbnReset" runat="server" Text="Làm lại" OnClick="OnResetLinkButtonClick" />
    </div>
</asp:Content>
