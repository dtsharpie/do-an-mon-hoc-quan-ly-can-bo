<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="QuaTrinhCongTac.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.QuaTrinhCongTac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <li><a href="/Pages/TimKiem/ThongTinChiTiet.aspx?id=<%= iShcc %>">Thông tin chung</a></li>
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
    <li><a href="">Quá trình công tác</a></li>
    <li><a href="/Pages/TimKiem/DanhGiaCongChuc.aspx?id=<%= iShcc %>">Đánh giá công chức</a></li>
    <br/>
    <li><a href="/Pages/TimKiem/BaoHiemXaHoi.aspx?id=<%= iShcc %>">Thông tin BHXH</a></li>
    <li><a href="/Pages/TimKiem/DuLieuTruoc1993.aspx?id=<%= iShcc %>">Dữ Liệu Trước 4/1993</a></li>
    <li><a href="">In tờ khai BHXH</a></li>
    <li><a href="">In sổ BHXH</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="content">
    <h1 class="title">
        Quá trình công tác
    </h1>
    <br />        
    <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        class="table-result" 
        OnRowDeleting="gridViewDeleted" onselectedindexchanged="gridViewChanged">    
            
        <Columns>
        <asp:BoundField DataField="id" />
        <asp:BoundField DataField="tnn" Visible="true" HeaderText="Thời gian"/>
        <asp:BoundField DataField="tdnn" HeaderText="Biên chế tại đơn vị/ Nơi làm việc" />
        <asp:BoundField DataField="tnn" Visible="true" HeaderText="Công việc đảm nhận"/>
        <asp:BoundField DataField="tdnn" HeaderText="Diện cán bộ/ Tình trạng công tác" />
        <asp:CommandField SelectText="Sửa" ShowSelectButton="True" EditText="" />
        <asp:CommandField ShowDeleteButton="True" DeleteText="Xóa" />
    </Columns>
    </asp:GridView>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
<div>
    <div>
    <br/><br/>
      <table class="table-result">
            <tr class="title">
                <td>
                Bổ sung dữ liệu
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thời gian bắt đầu
                </td>
                <td>
                    <asp:TextBox ID="tbTimeBegin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thời gian kết thúc
                </td>
                <td>
                    <asp:TextBox ID="tbTimeEnd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Biên chế tại đơn vị
                </td>
                <td>
                    <asp:TextBox ID="tbDonViBienChe" runat="server"></asp:TextBox>
                    (Nếu là đơn vị trong trường)
                    <asp:DropDownList ID="ddlDonViBienChe" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Nơi làm việc
                </td>
                <td>
                    <asp:TextBox ID="tbNoiLamViec" runat="server"></asp:TextBox>
                    (Nếu là đơn vị trong trường)
                    <asp:DropDownList ID="ddlNoiLamViec" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Công việc đảm nhận
                </td>
                <td>
                    <asp:DropDownList ID="ddlCongViecDamNhan" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Diện cán bộ
                </td>
                <td>
                    <asp:DropDownList ID="ddlDienCanBo" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Tình trạng công tác
                </td>
                <td>
                    <asp:DropDownList ID="ddlTinhTrangCongTac" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Chức vụ(nếu có)
                </td>
                <td>
                    <asp:DropDownList ID="ddlChucVu" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Đánh giá
                </td>
                <td>
                    <asp:TextBox ID="tbDanhGia" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="tbThongTinKhac" runat="server" TextMode="MultiLine" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID ="saveButton" OnClick="saveButtonClick" runat="server" Text ="Ghi nhận"/>
                    <asp:Button ID ="resetButton" OnClick="resetButtonClick" runat = "server" Text ="Làm lại"/>
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>
