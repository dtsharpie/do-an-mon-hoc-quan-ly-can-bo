<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="TrinhDoNgoaiNgu.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.TrinhDoNgoaiNgu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divSideBar ul > li > a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <div>
        <asp:Image ID="FaceImage" runat="server" alt="Smiley face" Height="100" Width="100" />
        <%--        <asp:Label ID="sohieu_canbo" runat="server" Text=""/>
        <asp:Label ID="hoten_canbo" runat="server" Text=""/>
        <asp:Label ID="gioitinh_canbo" runat="server" Text=""/>
        <asp:Label ID="ngaysinh_canbo" runat="server" Text=""/>--%>
    </div>
    <ul>
        <li><a href="/Pages/TimKiem/ThongTinChiTiet.aspx?id=<%= iShcc %>">Thông tin chung</a></li>
        <li><a>Trình độ ngoại ngữ</a></li>
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
        <br />
        <li><a href="/Pages/TimKiem/BaoHiemXaHoi.aspx?id=<%= iShcc %>">Thông tin BHXH</a></li>
        <li><a href="/Pages/TimKiem/DuLieuTruoc1993.aspx?id=<%= iShcc %>">Dữ Liệu Trước 4/1993</a></li>
        <li><a href="">In tờ khai BHXH</a></li>
        <li><a href="">In sổ BHXH</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Trình độ ngoại ngữ
        </h1>
        <br />
        <h3>
            <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
        </h3>
        <hr />
        <div class="divInfo" style="margin-top: 10px;">
            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table-result"
                    OnRowDeleting="gridViewDeleted" OnSelectedIndexChanged="gridViewChanged">
                    <Columns>
                        <%--<asp:BoundField HeaderText="Ngoại ngữ" DataField="tnn" />
            <asp:BoundField HeaderText="Trình độ" DataField="tdnn" />--%>
                        <asp:BoundField DataField="id" />
                        <asp:BoundField DataField="tnn" Visible="true" HeaderText="Ngoại ngữ" />
                        <asp:BoundField DataField="tdnn" HeaderText="Trình độ" />
                        <asp:BoundField HeaderText="Thông tin khác" DataField="ttk_tdnn" />
                        <asp:CommandField SelectText="Sửa" ShowSelectButton="True" EditText="" />
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Xóa" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label ID="lbResult" runat="server"></asp:Label>
            <div class="nodata" id="divNodata" runat="server">
            </div>
            <div>
                <br />
                <br />
                <table class="table-result">
                    <tr class="title">
                        <td>
                            Bổ sung dữ liệu
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Ngoại ngữ
                        </td>
                        <td>
                            <asp:DropDownList ID="ngoainguDropdownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Trình độ
                        </td>
                        <td>
                            <asp:DropDownList ID="trinhdoDropdownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Thông tin chung
                        </td>
                        <td>
                            <asp:TextBox ID="thongtinchungTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="saveButton" OnClick="saveButtonClick" runat="server" Text="Ghi nhận" />
                            <asp:Button ID="resetButton" OnClick="resetButtonClick" runat="server" Text="Làm lại" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
