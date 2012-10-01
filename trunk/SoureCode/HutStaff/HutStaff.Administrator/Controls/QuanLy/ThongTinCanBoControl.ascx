<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThongTinCanBoControl.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.QuanLy.ThongTinCanBoControl" %>
<%@ Register Src="DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="DropDownChosen.ascx" TagName="DropDownChosen" TagPrefix="uc2" %>
<%@ Register Src="HintTextBox.ascx" TagName="HintTextBox" TagPrefix="uc3" %>
<link href="../../Styles/container.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<script src="../../Script/chosen.jquery.min.js" type="text/javascript"></script>
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
                    <uc3:HintTextBox ID="htbHoVaTenDem" runat="server" HintText="Họ và tên đệm" Width="175px" />
                    &nbsp;<uc3:HintTextBox ID="htbTen" runat="server" HintText="Tên" Width="100px" />
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
                    <uc2:DropDownChosen ID="chzGioiTinh" runat="server" PlaceHolder="Chọn giới tính"
                        CssClass="droplist_medium" />
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
                    <uc2:DropDownChosen ID="chzNoiCapCmtnd" runat="server" DataSourceID="noiCapCmtndSqlDataSource"
                        DataTextField="ttp" DataValueField="ma_ttp" PlaceHolder="Chọn địa danh" CssClass="droplist_medium" />
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
                    <uc2:DropDownChosen ID="chzTrinhDoHocVan" runat="server" DataSourceID="sdsTrinhDoHocVan"
                        DataTextField="tdhv" DataValueField="ma_tdhv" PlaceHolder="Chọn trình độ học vấn"
                        CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Trình độ tin học:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoTinHoc" runat="server" DataSourceID="sdsTrinhDoTinHoc"
                        DataTextField="tdth" DataValueField="ma_tdth" PlaceHolder="Chọn trình độ tin học"
                        CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzTrinhDoLyLuan" runat="server" DataSourceID="sdsTrinhDoLyLuan"
                        DataTextField="tdll" DataValueField="ma_tdll" PlaceHolder="Chọn trình độ lý luận chính trị"
                        CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Trình độ quản lý nhà nước:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTrinhDoQuanLy" runat="server" DataSourceID="sdsTrinhDoQuanLy"
                        DataTextField="tdql" DataValueField="ma_tdql" PlaceHolder="Chọn trình độ quản lý nhà nước"
                        CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzKhoiCanBo" runat="server" DataSourceID="sdsKhoiCanBo"
                        DataTextField="kcb" DataValueField="ma_kcb" PlaceHolder="Chọn khối cán bộ" CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Diện cán bộ:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzDienCanBo" runat="server" DataSourceID="sdsDienCanBo"
                        DataTextField="dcb" DataValueField="ma_dcb" PlaceHolder="Chọn diện cán bộ" CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Đơn vị quản lý:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzDonViQuanLy" runat="server" DataSourceID="donViQuanLySqlDataSource"
                        DataTextField="dv" DataValueField="ma_dv" PlaceHolder="Chọn đơn vị quản lý" CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzThangGianDoan" runat="server" PlaceHolder="Chọn tháng"
                        CssClass="droplist_medium" />
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
                    <uc2:DropDownChosen ID="chzThuongBinh" runat="server" DataSourceID="sdsThuongBinh"
                        DataTextField="tb" DataValueField="ma_tb" PlaceHolder="Chọn loại thương binh"
                        CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Gia đình chính sách:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzGiaDinhChinhSach" runat="server" DataSourceID="sdsGiaDinhChinhSach"
                        DataTextField="gdcs" DataValueField="ma_gdcs" PlaceHolder="Chọn gia đình chính sách"
                        CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Thành phần xuất thân:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzThanhPhanXuatThan" runat="server" DataSourceID="sdsThanhPhanXuatThan"
                        DataTextField="tpxt" DataValueField="ma_tpxt" PlaceHolder="Chọn thành phần xuất thân"
                        CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzNoiSinh" runat="server" DataSourceID="noiSinhSqlDataSource"
                        DataTextField="ten_huyen" DataValueField="ma_huyen" PlaceHolder="Chọn địa danh"
                        CssClass="droplist_medium" />
                </td>
            </tr>
            <tr>
                <td>
                    Quê quán:
                </td>
                <td>
                    <uc2:DropDownChosen ID="DropDownChosen1" runat="server" DataSourceID="queQuanSqlDataSource"
                        DataTextField="ten_huyen" DataValueField="ma_huyen" PlaceHolder="Chọn địa danh"
                        CssClass="droplist_medium" />
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
                    <uc2:DropDownChosen ID="chzHoKhauThuongTru" runat="server" DataSourceID="sdsHoKhauThuongTru"
                        DataTextField="ten_huyen" DataValueField="ma_huyen" PlaceHolder="Chọn địa danh" />
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
                    <uc2:DropDownChosen ID="chzTinhTrangSucKhoe" runat="server" PlaceHolder="Chọn tình trạng sức khỏe"
                        CssClass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Nhóm máu:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzNhomMau" runat="server" PlaceHolder="Chọn nhóm máu" CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzTinhTrangHonNhan" runat="server" DataSourceID="sdsTinhTrangHonNhanSql"
                        DataTextField="tthn" DataValueField="ma_tthn" PlaceHolder="Chọn tình trạng hôn nhân"
                        CssClass="droplist_large" />
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
                    <uc2:DropDownChosen ID="chzDanToc" runat="server" DataSourceID="sdsDanToc" DataTextField="dt"
                        DataValueField="ma_dt" PlaceHolder="Chọn dân tộc" CssClass="droplist_medium" />
                </td>
            </tr>
            <tr>
                <td>
                    Tôn giáo:
                </td>
                <td>
                    <uc2:DropDownChosen ID="chzTonGiao" runat="server" DataSourceID="sdsTonGiao" DataTextField="tg"
                        DataValueField="ma_tg" PlaceHolder="Chọn tôn giáo" CssClass="droplist_medium" />
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
<table>
</table>
<div id="dataSource">
    <asp:SqlDataSource ID="noiCapCmtndSqlDataSource" runat="Server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_ttp]" />
    <asp:SqlDataSource ID="donViQuanLySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT [ma_dv], [dv] FROM [dm_dv]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="noiSinhSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT [ma_huyen], [ten_huyen] FROM [dm_dd]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="queQuanSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT [ma_huyen], [ten_huyen] FROM [dm_dd]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTonGiao" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tg]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDanToc" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_dt]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsGiaDinhChinhSach" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_gdcs]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsThanhPhanXuatThan" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tpxt]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsThuongBinh" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tb]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTrinhDoHocVan" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tdhv]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTrinhDoTinHoc" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tdth]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTrinhDoLyLuan" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tdll]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTrinhDoQuanLy" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tdql]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDienCanBo" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_dcb]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTinhTrangHonNhanSql" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_tthn]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsKhoiCanBo" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT * FROM [dm_kcb]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsHoKhauThuongTru" runat="server" ConnectionString="<%$ ConnectionStrings:QLCB %>"
        SelectCommand="SELECT [ma_huyen], [ten_huyen] FROM [dm_dd]"></asp:SqlDataSource>
</div>
