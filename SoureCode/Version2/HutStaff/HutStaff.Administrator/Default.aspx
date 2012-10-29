<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HutStaff.Administrator.Default" %>

<%@ Register Src="/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(0).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideSearch1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1 class="title">
        Thông tin tìm kiếm</h1>
    <div id="divSearchForm" class="form-container">
        <form id="formSearch">
        <table class="table-form">
            <tr class="row">
                <td>
                    Tên cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <input style="width: 300px" name="hoten" id="hoten" onkeypress="return submitenter(this,event);  "
                        type="text" />
                </td>
                <td class="spacing">
                </td>
                <td>
                    Diện cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <select name="dcb" style="width: 300px;">
                        <option value="-1" selected="selected">---Không chọn---</option>
                        <option value="0">Tuyển dụng 2008</option>
                        <option value="1">Biên chế</option>
                        <option value="2">Hợp đồng dài hạn</option>
                        <option value="3">Hợp đồng ngắn hạn</option>
                        <option value="4">Nghiên cứu khoa học</option>
                        <option value="5">Hợp đồng chờ biên chế</option>
                        <option value="6">Đã rời biên chế</option>
                        <option value="7">Tuyển dụng 2003</option>
                        <option value="8">Gửi lương</option>
                        <option value="9">Tuyển dụng 10/2004</option>
                        <option value="10">Tuyển dụng 2005</option>
                        <option value="11">Tuyển dụng 2006</option>
                        <option value="12">Tuyển dụng 2007</option>
                        <option value="13">Biệt phái</option>
                        <option value="14">Tuyển dụng 2009</option>
                        <option value="15">Tuyển dụng 2010</option>
                        <option value="16">Tuyển dụng 2011</option>
                        <option value="17">Tuyển dụng 2012</option>
                    </select>
                </td>
            </tr>
            <tr class="row">
                <td>
                    Giới tính
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <input name="gt_nam" value="1" type="checkbox" />&nbsp; Nam
                    <input name="gt_nu" value="0" type="checkbox" />&nbsp;Nữ
                </td>
                <td class="spacing">
                </td>
                <td>
                    Hiện nay
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <select name="hiennay" style="width: 300px;">
                        <option value="-1" selected="selected">---Không chọn---</option>
                        <option value="1">Hiện đang công tác</option>
                        <option value="2">Đã nghỉ hưu</option>
                        <option value="3">Đã mất</option>
                        <option value="4">Đã chuyển cơ quan khác</option>
                        <option value="5">Thôi việc</option>
                        <option value="6">Hiện không hưởng lương</option>
                    </select>
                </td>
            </tr>
            <tr class="row">
                <td>
                    Tuổi
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    Từ&nbsp;
                    <input style="width: 30px" name="tuoi_lonhon" type="text" />
                    Đến&nbsp;
                    <input style="width: 30px" name="tuoi_nhohon" type="text" />
                </td>
                <td class="spacing">
                </td>
                <td>
                    Khối cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <select name="khoicanbo" style="width: 300px;">
                        <option value="-1" selected="selected">---Không chọn---</option>
                        <option value="1">Giảng dạy</option>
                        <option value="2">Phục vụ</option>
                        <option value="3">Hành chính</option>
                        <option value="4">Nghiên cứu</option>
                        <option value="5">Khác</option>
                    </select>
                </td>
            </tr>
            <tr class="row">
                <td>
                    Năm về trường
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <input style="width: 40px" name="namvetruong" type="text" />
                    <font size="1"><i>(Nhỏ nhất: 1956) </i></font>
                </td>
                <td class="spacing">
                </td>
                <td>
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <input type="button" class="button fr" value="Tìm kiếm" />
                    <div class="clear">
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <div class="sub-title">
        <h2>
            Kết quả</h2>
    </div>
    <div class="div-tool">
        <a href="javascript:void(0);" class="lnk-button">Xuất dữ liệu</a><a href="javascript:void(0);"
            class="lnk-button margin-left-10">In sổ cái</a><a href="javascript:void(0);" class="lnk-button margin-left-10">Gửi
                email</a>
    </div>
    <div id="divSearchResult" class="table-container">
        <div class="header-table">
            <div>
                Hiển thị &nbsp;
                <select style="width: 60px;">
                    <option selected="selected" value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;Đang hiện 1 đến 10 trên 51 kết quả
                tìm được
            </div>
            <div class="paging fr">
                <span class="first paging_button">First</span> <span class="previous paging_button disable">
                    Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                        2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                        <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
                <span class="last paging_button">Last</span>
            </div>
            <div class="clear">
            </div>
        </div>
        <table class="table-result">
            <tr class="header">
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
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
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
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
        </table>
        <div class="footer-table">
            <div>
                Hiển thị &nbsp;
                <select style="width: 60px;">
                    <option selected="selected" value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;Đang hiện 1 đến 10 trên 51 kết quả
                tìm được
            </div>
            <div class="paging fr">
                <span class="first paging_button">First</span> <span class="previous paging_button disable">
                    Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                        2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                        <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
                <span class="last paging_button">Last</span>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="div-tool">
        <a href="javascript:void(0);" class="lnk-button">Xuất dữ liệu</a><a href="javascript:void(0);"
            class="lnk-button margin-left-10">In sổ cái</a><a href="javascript:void(0);" class="lnk-button margin-left-10">Gửi
                email</a>
    </div>
</asp:Content>
