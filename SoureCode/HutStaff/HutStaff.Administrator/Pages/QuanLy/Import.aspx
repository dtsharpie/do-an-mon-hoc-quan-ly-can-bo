<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Import.aspx.cs" Inherits="QLCB_BK.Pages.QuanLy.Import" %>

<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(1).addClass('active');
            $('.subNav > li').removeClass("active");
            $('.subNav > li').eq(1).addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Import dữ liệu</h1>
        <hr width="750px" />
        <br />
        <div>
            <input type="button" id="btnLuong" value="Lương" class="button-blue active" />
            <input type="button" id="btnKhen" value="Khen thưởng" class="button-blue" />
            <input type="button" id="btnBHXH" value="Sổ BHXH" class="button-blue" />
        </div><br />
        <div class="main clear">
            <form id="searchForm">
            <div class="filterBox">
                <table>
                    <tr>
                        <td style="width: 60px">
                            Tìm kiếm
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtSearch" class="textbox" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlStatus" runat="server" DataTextField="Name" DataValueField="Id"
                                Width="200px">
                                <asp:ListItem Value="2">Trạng thái</asp:ListItem>
                                <asp:ListItem Value="0">Chưa duyệt</asp:ListItem>
                                <asp:ListItem Value="1">Đã duyệt</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <input type="submit" id="btnSearch" class="button" value="Tìm kiếm" />
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
                    <uc1:Pager ID="Pager2" runat="server" />
                </div>
            </div>
            <div class="title-bar">
                <p>
                    Danh sách người dùng</p>
            </div>
            <div class="main-table">
                <table class="table-1">
                    <tr>
                        <th>
                            STT
                        </th>
                        <th>
                            Họ và tên
                        </th>
                        <th>
                            Số hiệu
                        </th>
                        <th>
                            Đơn vị công tác
                        </th>
                        <th>
                            Điện thoại
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            Duyệt
                        </th>
                        <th>
                            Xóa
                        </th>
                    </tr>
                    <tr>
                        <td align="center" width="20px">
                            1
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(322);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Trần Viết Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.002.00954
                        </td>
                        <td width="230px">
                            Bm Công nghệ các chất vô cơ
                        </td>
                        <td class="rong" width="50px">
                        </td>
                        <td class="rong" width="100px">
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=322">Xóa</a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td align="center" width="20px">
                            2
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(692);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Vũ Đức Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.005.00389
                        </td>
                        <td width="230px">
                            Bm Công nghệ phần mềm
                        </td>
                        <td class="rong" width="50px">
                            0984753061
                        </td>
                        <td class="rong" width="100px">
                            vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=692">Xóa</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="20px">
                            3
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(762);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Nguyễn Minh Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.006.00473
                        </td>
                        <td width="230px">
                            Bm Vật liệu học, xử lý nhiệt và bề mặt
                        </td>
                        <td class="rong" width="50px">
                        </td>
                        <td class="rong" width="100px">
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=762">Xóa</a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td align="center" width="20px">
                            2
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(692);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Vũ Đức Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.005.00389
                        </td>
                        <td width="230px">
                            Bm Công nghệ phần mềm
                        </td>
                        <td class="rong" width="50px">
                            0984753061
                        </td>
                        <td class="rong" width="100px">
                            vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=692">Xóa</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Duyệt / Không duyệt</a> 
                </div>
                <div class="right">
                    <uc1:Pager ID="Pager1" runat="server" />
                </div>
            </div>
        </div><br /><br />
        <hr width="750px" /><br /><br />
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
                        <th>
                            Họ và tên
                        </th>
                        <th>
                            Số hiệu
                        </th>
                        <th>
                            Đơn vị công tác
                        </th>
                        <th>
                            Điện thoại
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            Duyệt
                        </th>
                        <th>
                            Xóa
                        </th>
                    </tr>
                    <tr>
                        <td align="center" width="20px">
                            1
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(322);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Trần Viết Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.002.00954
                        </td>
                        <td width="230px">
                            Bm Công nghệ các chất vô cơ
                        </td>
                        <td class="rong" width="50px">
                        </td>
                        <td class="rong" width="100px">
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=322">Xóa</a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td align="center" width="20px">
                            2
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(692);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Vũ Đức Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.005.00389
                        </td>
                        <td width="230px">
                            Bm Công nghệ phần mềm
                        </td>
                        <td class="rong" width="50px">
                            0984753061
                        </td>
                        <td class="rong" width="100px">
                            vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=692">Xóa</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="20px">
                            3
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(762);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Nguyễn Minh Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.006.00473
                        </td>
                        <td width="230px">
                            Bm Vật liệu học, xử lý nhiệt và bề mặt
                        </td>
                        <td class="rong" width="50px">
                        </td>
                        <td class="rong" width="100px">
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=762">Xóa</a>
                        </td>
                    </tr>
                    <tr class="even">
                        <td align="center" width="20px">
                            2
                        </td>
                        <td width="230">
                            <b><a href="javascript:viewinfor(692);" onmousemove="mOvr();" onmouseout="mOut();"
                                class="link-view">Vũ Đức Vượng</a></b>
                        </td>
                        <td width="70px">
                            002.005.00389
                        </td>
                        <td width="230px">
                            Bm Công nghệ phần mềm
                        </td>
                        <td class="rong" width="50px">
                            0984753061
                        </td>
                        <td class="rong" width="100px">
                            vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                        </td>
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td class="xoa" align="center">
                            <a href="huyhoso.php?sh=692">Xóa</a>
                        </td>
                    </tr>
                </table>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Duyệt / Không duyệt</a> 
                </div>
                <div class="right">
                    <uc1:Pager ID="Pager4" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.button-blue').click(function () {
                $('.button-blue').removeClass('active');
                $(this).addClass('active');
            });
        });
    </script>
</asp:Content>
