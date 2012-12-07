<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
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
            $('#divSideBar ul > li > a').eq(0).addClass('active');
        });
    </script>
    <script type="text/javascript" src="../../Scripts/jquery-1.8.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input").not($(":button")).keypress(function (evt) {
                if (evt.keyCode == 13) {
                    iname = $(this).val();
                    if (iname !== 'Submit') {
                        var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
                        var index = fields.index(this);
                        if (index > -1 && (index + 1) < fields.length) {
                            fields.eq(index + 1).focus();
                        }
                        return false;
                    }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <div>
        <asp:Image ID="FaceImage" runat="server" alt="Smiley face" height="100" width="100"/>
<%--        <asp:Label ID="sohieu_canbo" runat="server" Text=""/>
        <asp:Label ID="hoten_canbo" runat="server" Text=""/>
        <asp:Label ID="gioitinh_canbo" runat="server" Text=""/>
        <asp:Label ID="ngaysinh_canbo" runat="server" Text=""/>--%>

    </div>
  <ul>
    <li><a href="">Thông tin chung</a></li>
    <li><a href="/Pages/TimKiem/TrinhDoNgoaiNgu.aspx?id=<%= iShcc %>">Trình độ ngoại ngữ</a></li>
    <li><a href="/Pages/TimKiem/CacChucDanh.aspx?id=<%= iShcc %>">Các chức danh</a></li>
    <li><a href="/Pages/TimKiem/ChucVuChinhQuyen.aspx?id=<%= iShcc %>">Chức vụ chính quyền</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDang.aspx?id=<%= iShcc %>">Chức vụ Đảng</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDoanThe.aspx?id=<%= iShcc %>">Chức vụ đoàn thể</a></li>
    <li><a href="/Pages/TimKiem/KhenThuong.aspx?id=<%= iShcc %>">Khen thưởng</a></li>
    <li><a href="/Pages/TimKiem/KyLuat.aspx?id=<%= iShcc %>">Kỷ luật</a></li>
    <li><a href="/Pages/TimKiem/DienBienLuong.aspx?id=<%= iShcc %>">Diễn biến lương</a></li>
    <li><a href="/Pages/TimKiem/QuanHeGiaDinh.aspx?id=<%= iShcc %>">Quan hệ gia đình</a></li>
    <li><a href="/Pages/TimKiem/NuocNgoaiDaDen.aspx?id=<%= iShcc %>">Nước ngoài đã đến</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhDaoTao.aspx?id=<%= iShcc %>">Quá trình đào tạo</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhBoiDuong.aspx?id=<%= iShcc %>">Quá trình bồi dưỡng</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhCongTac.aspx?id=<%= iShcc %>">Quá trình công tác</a></li>
    <li><a href="/Pages/TimKiem/DanhGiaCongChuc.aspx?id=<%= iShcc %>">Đánh giá công chức</a></li>
    <br/>
    <li><a href="/Pages/TimKiem/BaoHiemXaHoi.aspx?id=<%= iShcc %>">Thông tin BHXH</a></li>
    <li><a href="/Pages/TimKiem/DuLieuTruoc1993.aspx?id=<%= iShcc %>">Dữ Liệu Trước 4/1993</a></li>
    <li><a href="">In tờ khai BHXH</a></li>
    <li><a href="">In sổ BHXH</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="detail-container">
        <table>
            <tr>
                <td>
                    Họ tên:
                </td>
                <td>
                    <asp:TextBox ID="htbHoVaTenDem" Text="Họ và tên đệm" runat="server" Width="98px" />
                   <%-- <asp:TextBox id="htbHoVaTenDem" runat="server" hinttext="Họ và tên đệm" width="100px" />--%>
                    &nbsp;<asp:TextBox ID="htbTen" runat="server" Text ="Tên" width="50px" />
                </td>
                <td>
                    Ngày sinh:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgaySinh" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Giới tính:
                </td>
                <td>
                    <asp:DropDownList id="chzGioiTinh" runat="server" placeholder="Chọn giới tính"
                        cssclass="droplist_medium" />
                </td>
                <td>
                    Email:
                </td>
                <td>
                    <asp:TextBox ID="txbEmail" runat="server" CssClass="inputextbox_short" />
                </td>
            </tr>
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
                    <asp:TextBox ID="dpkNgayCapCmtnd" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Nơi cấp:
                </td>
                <td>
                    <asp:DropDownList ID="chzNoiCapCmtnd" runat="server" placeholder="Chọn địa danh"
                        datatextfield="ttp" datavaluefield="ma_ttp" cssclass="droplist_medium" />
                </td>
                <td>
                    Điện thoại:
                </td>
                <td>
                    <asp:TextBox ID="txbDienThoai" runat="server" CssClass="inputextbox_short" />
                </td>
            </tr>
            <tr>
                <td>
                    TĐ học vấn:
                </td>
                <td>
                    <asp:DropDownList id="chzTrinhDoHocVan" runat="server" datatextfield="tdhv" datavaluefield="ma_tdhv"
                        placeholder="Chọn trình độ học vấn" cssclass="droplist_large" />
                </td>
                <td>
                    TĐ tin học:
                </td>
                <td>
                    <asp:DropDownList id="chzTrinhDoTinHoc" runat="server" datatextfield="tdth" datavaluefield="ma_tdth"
                        placeholder="Chọn trình độ tin học" cssclass="droplist_large" />
                </td>
                <td>
                    TĐ LLCT:
                </td>
                <td>
                    <asp:DropDownList id="chzTrinhDoLyLuan" runat="server" datatextfield="tdll" datavaluefield="ma_tdll"
                        placeholder="Chọn trình độ lý luận chính trị" cssclass="droplist_large" />
                </td>
                <td>
                    TĐ QLNN:
                </td>
                <td>
                    <asp:DropDownList id="chzTrinhDoQuanLy" runat="server" datatextfield="tdql" datavaluefield="ma_tdql"
                        placeholder="Chọn trình độ quản lý nhà nước" cssclass="droplist_large" />
                </td>
            </tr>
            <tr>
                <td>
                    Sở trường, năng khiếu:
                </td>
                <td>
                    <asp:TextBox ID="txbSoTruong" runat="server" CssClass="inputtextbox_long" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Ngày về cơ quan:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayVeCoQuan" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày vào biên chế:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayVaoBienChe" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Khối cán bộ:
                </td>
                <td>
                    <asp:DropDownList id="chzKhoiCanBo" runat="server" datatextfield="kcb" datavaluefield="ma_kcb"
                        placeholder="Chọn khối cán bộ" cssclass="droplist_large" />
                </td>
                <td>
                    Diện cán bộ:
                </td>
                <td>
                    <asp:DropDownList id="chzDienCanBo" runat="server" datatextfield="dcb" datavaluefield="ma_dcb"
                        placeholder="Chọn diện cán bộ" cssclass="droplist_large" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="label">
                    Đơn vị quản lý:
                </td>
                <td>
                    <asp:DropDownList id="chzDonViQuanLy" runat="server" datatextfield="dv" datavaluefield="ma_dv"
                        placeholder="Chọn đơn vị quản lý" cssclass="droplist_large" />
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
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày bắt đầu tính thâm niên:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayBatDauTinhThamNien" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Mốc hưởng thâm niên:
                </td>
                <td>
                    <asp:TextBox ID="dpkMocHuongThamNien" runat="server" CssClass="datepicker" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày kết thúc hợp đồng:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayKetThucHopDong" runat="server" CssClass="datepicker" />
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
            <tr>
                <td>
                    Ngày tham gia cách mạng:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayThamGiaCachMang" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày vào đảng:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayVaoDang" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày chính thức:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayChinhThuc" runat="server" CssClass="datepicker" />
                </td>
            </tr>
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
                    <asp:DropDownList id="chzThuongBinh" runat="server" DataTextField="tb" datavaluefield="ma_tb"
                        placeholder="Chọn loại thương binh" cssclass="droplist_large" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Gia đình chính sách:
                </td>
                <td>
                    <asp:DropDownList id="chzGiaDinhChinhSach" runat="server" datatextfield="gdcs"
                        datavaluefield="ma_gdcs" placeholder="Chọn gia đình chính sách" cssclass="droplist_large" />
                </td>
                <td>
                    Thành phần xuất thân:
                </td>
                <td>
                    <asp:DropDownList id="chzThanhPhanXuatThan" runat="server" datatextfield="tpxt"
                        datavaluefield="ma_tpxt" placeholder="Chọn thành phần xuất thân" cssclass="droplist_large" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
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
                    <asp:DropDownList id="chzNoiSinh" runat="server" datatextfield="ten_huyen" datavaluefield="ma_huyen"
                        placeholder="Chọn địa danh" cssclass="droplist_medium" />
                </td>
                <td>
                    Quê quán:
                </td>
                <td>
                    <asp:DropDownList id="chzQueQuan" runat="server" datatextfield="ttp" datavaluefield="ma_ttp"
                        placeholder="Chọn địa danh" cssclass="droplist_medium" />
                </td>
            </tr>
            <tr>
                <td>
                    Chi tiết quê quán:
                </td>
                <td>
                    <asp:TextBox ID="txbChiTietQueQuan" runat="server" CssClass="inputtextbox_long" />
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
                    <asp:DropDownList id="chzHoKhauThuongTru" runat="server" datatextfield="ten_huyen"
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
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày nhập ngũ:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayNhapNgu" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày xuất ngũ:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayXuatNgu" runat="server" CssClass="datepicker" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
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
                    <asp:TextBox ID="dpkNgayBatDauDongBaoHiem" runat="server" CssClass="datepicker" />
                </td>
                <td>
                    Ngày nhận bảo hiểm chính thức:
                </td>
                <td>
                    <asp:TextBox ID="dpkNgayNhanBaoHiemChinhThuc" runat="server" CssClass="datepicker" />
                </td>
            </tr>
            <tr>
                <td>
                    Dân tộc:
                </td>
                <td>
                    <asp:DropDownList id="chzDanToc" runat="server" datatextfield="dt" datavaluefield="ma_dt"
                        placeholder="Chọn dân tộc" cssclass="droplist_medium" />
                </td>
                <td>
                    Tôn giáo:
                </td>
                <td>
                    <asp:DropDownList id="chzTonGiao" runat="server" datatextfield="tg" datavaluefield="ma_tg"
                        placeholder="Chọn tôn giáo" cssclass="droplist_medium" />
                </td>
                <td>
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="txbThongTinKhac" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    Tình trạng sức khỏe:
                </td>
                <td>
                    <asp:DropDownList id="chzTinhTrangSucKhoe" runat="server" placeholder="Chọn tình trạng sức khỏe"
                        cssclass="droplist_large" />
                </td>
                <td>
                    Nhóm máu:
                </td>
                <td>
                    <asp:DropDownList id="chzNhomMau" runat="server" placeholder="Chọn nhóm máu" cssclass="droplist_large" />
                </td>
                <td>
                    Tình trạng hôn nhân:
                </td>
                <td>
                    <asp:DropDownList id="chzTinhTrangHonNhan" runat="server" datatextfield="tthn"
                        datavaluefield="ma_tthn" placeholder="Chọn tình trạng hôn nhân" cssclass="droplist_large" />
                </td>
                <td>
                    Lịch sử bản thân:
                </td>
                <td>
                    <asp:TextBox ID="txbLichSuBanThan" runat="server" CssClass="inputtextbox_long" />
                </td>
            </tr>
        </table>
    </div>
    <div id="submit">
        <asp:Button ID="btnEdit" runat="Server" Width="80px" Text="Sửa" OnClick="btnEdit_Click" />
        <%--&nbsp;hoặc
        <asp:LinkButton ID="lbnReset" runat="server" Text="Làm lại" OnClick="OnResetLinkButtonClick" />--%>
        <asp:Button ID="btDelete" runat="Server" Width="80px" Text="Hủy" OnClick="btDelete_Click" />
    </div>
</asp:Content>
