<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.TimKiem.SearchResult" %>
<%@ Register Src="../Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<div id="divResult" class="main">
    <div align="left">
        >> Tìm thấy <font color="red" style="font-weight: bold">3075</font>cán bộ
    </div>
    <br />
    <div class="footer-table">
        <div class="left">
            <a target="_blank" href="" class="link-tool left">Xuất dữ liệu</a>
            <a target="_blank" href="" class="link-tool left" style="margin-left: 10px">
                In sổ cái</a> <a href="" class="link-tool left" style="margin-left: 10px">
                    Gửi Email</a>
        </div>
        <div class="right">
            <asp:DropDownList runat="server" id="pageview" size="1" style="float: left;">
                
            </asp:DropDownList>
        </div>
    </div>
    <table class="table-result">
        <tr class="title">
            <td>
                STT
            </td>
            <td>
                Họ và tên
            </td>
            <td>
                Số hiệu
            </td>
            <td>
                Đơn vị công tác
            </td>
            <td>
                Điện thoại
            </td>
            <td>
                Email
            </td>
            <td>
                Xóa
            </td>
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
            <td class="xoa" align="center">
                <a href="huyhoso.php?sh=692">Xóa</a>
            </td>
        </tr>
    </table>
    <div class="footer-table">
        <div class="left">
            <a target="_blank" href="javascript:void(0);" class="link-tool left">Xuất dữ liệu</a>
            <a target="_blank" href="javascript:void(0);" class="link-tool left" style="margin-left: 10px">
                In sổ cái</a> <a href="mailto:abc@gmail.com" class="link-tool left" style="margin-left: 10px">
                    Gửi Email</a>
        </div>
        <div class="right">
            <asp:DropDownList runat="server" id="Select1" size="1" style="float: left;">
                
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <hr width="750px" />
    <br />
    <div class="footer-table">
        <div class="left">
            <a target="_blank" href="javascript:void(0);" class="link-tool left">Xuất dữ liệu</a>
            <a target="_blank" href="javascript:void(0);" class="link-tool left" style="margin-left: 10px">
                In sổ cái</a> <a href="mailto:abc@gmail.com" class="link-tool left" style="margin-left: 10px">
                    Gửi Email</a>
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
                <td class="xoa" align="center">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="footer-table">
        <div class="left">
            <a target="_blank" href="javascript:void(0);" class="link-tool left">Xuất dữ liệu</a>
            <a target="_blank" href="javascript:void(0);" class="link-tool left" style="margin-left: 10px">
                In sổ cái</a> <a href="mailto:abc@gmail.com" class="link-tool left" style="margin-left: 10px">
                    Gửi Email</a>
        </div>
        <div class="right">
            <uc1:Pager ID="Pager1" runat="server" />
        </div>
    </div>
</div>
