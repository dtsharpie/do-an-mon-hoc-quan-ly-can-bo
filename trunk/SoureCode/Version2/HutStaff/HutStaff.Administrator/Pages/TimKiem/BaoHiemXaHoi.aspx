<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="BaoHiemXaHoi.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.BaoHiemXaHoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divSideBar ul > li > a').eq(15).addClass('active');
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
        <br />
        <li><a href="">Thông tin BHXH</a></li>
        <li><a href="/Pages/TimKiem/DuLieuTruoc1993.aspx?id=<%= iShcc %>">Dữ Liệu Trước 4/1993</a></li>
        <li><a href="">In tờ khai BHXH</a></li>
        <li><a href="">In sổ BHXH</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Quá trình đóng bảo hiểm xã hội
        </h1>
        <hr />
        <div class="divInfo" style="margin-top: 10px;">
            <asp:LinkButton ID="lbnInSoBaoHiem" runat="server" Text="In sổ bảo hiểm"></asp:LinkButton>
            <div class="table-container">
                <%--<table class="table-result">
                    <tr class="header">
                        <td rowspan="2">
                            Thời gian
                        </td>
                        <td rowspan="2">
                            Chức danh, chức vụ, ngạch lương và đơn vị công tác
                        </td>
                        <td rowspan="2">
                            HSL cơ bản
                        </td>
                        <td rowspan="2">
                            Các khoản phụ cấp
                        </td>
                        <td rowspan="2">
                            Số tháng đóng bảo hiểm
                        </td>
                        <td rowspan="2">
                            Phụ cấp thâm niên vượt khung
                        </td>
                        <td colspan="5">
                            Số tiền đóng BHXH 1 tháng<br />
                            (Lương cơ bản)
                        </td>
                    </tr>
                    <tr class="title">
                        <td style="border-top: 2px solid #FFFFFF;">
                            BHXH
                        </td>
                        <td style="border-top: 2px solid #FFFFFF;">
                            BHYT
                        </td>
                        <td style="border-top: 2px solid #FFFFFF;">
                            BHTN
                        </td>
                        <td style="border-top: 2px solid #FFFFFF;">
                            Tổng tiền
                        </td>
                    </tr>
                    <asp:Repeater runat="server" ID="grdData">
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="even">
                                <td align="center">
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                                <td align="center">
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>--%>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false"/>
                            <asp:BoundField DataField="thoigian" HeaderText="Thời gian" />
                            <%--<asp:BoundField DataField="tgbd_dbl" Visible="false" />
                            <asp:BoundField DataField="tgkt_dbl" Visible="false" />--%>
                            <asp:BoundField DataField="mota" HeaderText="Chức danh, chức vụ, ngạch lương và đơn vị công tác" />
                            <asp:BoundField DataField="hsl" HeaderText="Hệ số lương cơ bản"/>
                            <asp:BoundField DataField="hspccv" HeaderText="Phụ cấp chức vụ"/>
                            <asp:BoundField DataField="hspckv" HeaderText="Phụ cấp vượt khung"/>
                            <asp:BoundField DataField="hspctn" HeaderText="Phụ cấp thâm niên giáo dục"/>
                            <asp:BoundField DataField="tonghsl" HeaderText="Tổng hệ số lương"/>
                            <asp:BoundField DataField="sothangdongbh" HeaderText="Số tháng đóng bảo hiểm"/>
                            <asp:BoundField DataField="tongtienbhxh" HeaderText = "Tổng số tiền đóng BHXH"/>
                            <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
