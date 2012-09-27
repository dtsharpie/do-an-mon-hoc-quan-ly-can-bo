<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="NguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.NguoiDung" %>

<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(1).addClass('active');
            $('.subNav > li').removeClass("active");
            $('.subNav > li').eq(2).addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Quản lý người dùng</h1>
        <hr width="750px" />
        <div class="main clear">
            <form id="Form1">
            <div class="filterBox">
                <table>
                    <tr>
                        <td style="width: 60px">
                            Tìm kiếm
                        </td>
                        <td>
                            <input type="text" runat="server" id="Text1" class="textbox" />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Name" DataValueField="Id"
                                Width="200px">
                                <asp:ListItem Value="2">Trạng thái</asp:ListItem>
                                <asp:ListItem Value="0">Chưa duyệt</asp:ListItem>
                                <asp:ListItem Value="1">Đã duyệt</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="submit" id="Submit1" class="button" value="Tìm kiếm" />
                        </td>
                    </tr>
                </table>
            </div>
            </form>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Duyệt / Không duyệt</a>
                </div>
                <div class="right">
                    <uc1:Pager ID="Pager3" runat="server" />
                </div>
            </div>
            <table class="table-result">
                <tr>
                    <th>
                        STT
                    </th>
                    <th width="180">
                        Tên truy cập
                    </th>
                    <th width="300">
                        Chi tiết
                    </th>
                    <th>
                        Tình trạng
                    </th>
                    <th>
                        &nbsp;
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <td class="Row1" width="30">
                        1
                    </td>
                    <td class="Row2" width="80">
                        <a href="javascript:view('anhcp');">anhcp</a>
                    </td>
                    <td class="Row1">
                        Chuyên viên phòng TCCB
                    </td>
                    <td class="Row2" width="70">
                        Hoạt động
                    </td>
                    <td class="Row1" width="70">
                        <a href="huyhoso.php?sh=322">Xóa</a>
                    </td>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr class="even">
                    <td class="Row1" width="30">
                        2
                    </td>
                    <td class="Row2" width="80">
                        <a href="javascript:view('bdhung');">bdhung</a>
                    </td>
                    <td class="Row1">
                        BCH Công đoàn
                    </td>
                    <td class="Row2" width="70">
                        Hoạt động
                    </td>
                    <td class="Row1" width="70">
                        <a href="huyhoso.php?sh=322">Xóa</a>
                    </td>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td class="Row1" width="30">
                        3
                    </td>
                    <td class="Row2" width="80">
                        <a href="javascript:view('bklib');">bklib</a>
                    </td>
                    <td class="Row1">
                        Phó Giám đốc Thư viện Tạ Quang Bửu
                    </td>
                    <td class="Row2" width="70">
                        Hoạt động
                    </td>
                    <td class="Row1" width="70">
                        <a href="huyhoso.php?sh=322">Xóa</a>
                    </td>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr class="even">
                    <td class="Row1" width="30">
                        4
                    </td>
                    <td class="Row2" width="80">
                        <a href="javascript:view('btthuong');">btthuong</a>
                    </td>
                    <td class="Row1">
                        Phong Tccb
                    </td>
                    <td class="Row2" width="70">
                        Hoạt động
                    </td>
                    <td class="Row1" width="70">
                        <a href="huyhoso.php?sh=322">Xóa</a>
                    </td>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
            </table>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Tạo mới</a>
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Xóa</a>
                </div>
                <div class="right">
                    <uc1:Pager ID="Pager4" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
