﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="DuLieuTruoc1993.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.DuLieuTruoc1993" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divSideBar ul > li > a').eq(16).addClass('active');
        });
    </script>
    <style type="text/css">
        .style1
        {
            width: 338px;
        }
    </style>
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

        <br />
        <li><a href="/Pages/TimKiem/BaoHiemXaHoi.aspx?id=<%= iShcc %>">Thông tin BHXH</a></li>
        <li><a>Dữ Liệu Trước 4/1993</a></li>
        <li><a href="">In tờ khai BHXH</a></li>
        <li><a href="">In sổ BHXH</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Dữ liệu trước 1993
        </h1>
        <hr />
        <h3>
            <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
        </h3>
        <div class="divInfo" style="margin-top: 10px;">
            <div class="table-container">
                <%--<table class="table-result">
                    <tr class="header">
                        <td>
                            Thời gian
                        </td>
                        <td>
                            Chức danh, chức vụ, ngạch lương, đơn vị công tác
                        </td>
                        <td>
                            HSL
                        </td>
                        <td>
                            Phụ cấp
                        </td>
                        <td>
                            Số tháng
                        </td>
                        <td>
                            Tổng tiền
                        </td>
                    </tr>
                    <asp:Repeater runat="server" ID="grdData">
                        <ItemTemplate>
                            <tr>
                                <td>
                                </td>
                                <td>
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
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="even">
                                <td>
                                </td>
                                <td>
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
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>--%>
                <asp:GridView ID="GridView1" runat="server" class="table-result" AutoGenerateColumns="False"
                    OnRowDeleting="GridViewDeleting" OnSelectedIndexChanged="GridViewChanged">
                    <Columns>
                        <asp:BoundField DataField="id" />
                        <asp:BoundField DataField="thoigian" HeaderText="Thời gian" />
                        <asp:BoundField DataField="mota" HeaderText=" Chức danh, chức vụ, ngạch lương, đơn vị công tác" />
                        <asp:BoundField DataField="hsluong" HeaderText="HSL" />
                        <asp:BoundField DataField="phucap" HeaderText="Phụ cấp" />
                        <asp:BoundField DataField="sothang" HeaderText="Số tháng" />
                        <asp:BoundField DataField="tongtien" HeaderText="Tổng tiền"/>
                        <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="nodata" id="divNodata" runat="server">
                <br />
                <br />
            </div>
            <div class="form-container">
                <table>
                    <tr>
                        <td>
                            Thời điểm bắt đầu
                        </td>
                        <td class="style1">
                            <asp:DropDownList ID="DropDownListNgayBatDau" runat="server">
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:DropDownList>
                            /
                            <asp:DropDownList ID="DropDownListThangBatDau" runat="server">
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            /
                            <asp:TextBox ID="txtNamBatDau" runat="server" Width="50px"></asp:TextBox>
                            (ngày/tháng/năm)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Thời điểm kết thúc
                        </td>
                        <td class="style1">
                            <asp:DropDownList ID="DropDownListNgayKetThuc" runat="server">
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:DropDownList>
                            /
                            <asp:DropDownList ID="DropDownListThangKetThuc" runat="server">
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            /
                            <asp:TextBox ID="txtNamKetThuc" runat="server" Width="50px"></asp:TextBox>
                            (ngày/tháng/năm)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Chức danh, chức vụ, ngạch lương, đơn vị công tác
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtChucDanh" runat="server" TextMode="MultiLine"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hệ số lương
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtHeSoLuong" runat="server" Width="75px"/>
                            Phụ cấp
                             <asp:TextBox ID="txtPhuCap" runat="server" Width="60px"/>
                             Số tháng
                              <asp:TextBox ID="txtSoThang" runat="server" Width="72px"/>
                        </td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3" class="style1">
                            <asp:Button ID="saveButton" OnClick="saveButtonClick" runat="server" Text="Ghi nhận" />
                            <asp:Button ID="resetButton" OnClick="resetButtonClick" runat="server" Text="Làm lại" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
