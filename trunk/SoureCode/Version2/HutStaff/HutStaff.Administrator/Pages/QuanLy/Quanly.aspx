<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Quanly.aspx.cs" Inherits="HutStaff.Administrator.Pages.Quanly.Quanly" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <uc1:SlideQuanLy ID="SlideQuanLy1" runat="server" />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1 class="title">
        Quản lý</h1>
    <div id="divQuanLy" class="main">
        <div class="row">
            <div class="row_logo">
                <a href="/Pages/QuanLy/BoSungCanBo.aspx">
                    <img src="/images/quanly1.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/QuanLy/BoSungCanBo.aspx">Thêm cán bộ mới</a>
                <p>
                    Thêm thông tin cán bộ mới vào danh sách.</p>
            </div>
        </div>
        <div class="row">
            <div class="row_logo">
                <a href="/Pages/QuanLy/ImportLuong.aspx">
                    <img src="/images/quanly3.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/QuanLy/ImportLuong.aspx">Import dữ liệu cán bộ</a>
                <p>
                    Thêm thông tin một hay nhiều cán bộ vào danh sách bằng bảng excel.</p>
            </div>
        </div>
        <div class="row">
            <div class="row_logo">
                <a href="/Pages/QuanLy/NguoiDung.aspx">
                    <img src="/images/quanly2.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/QuanLy/NguoiDung.aspx">Quản lý người dùng</a>
                <p>
                    Theo dõi, thêm,bớt, chỉnh sửa quyền...của các user.</p>
            </div>
        </div>
        <div class="row">
            <div class="row_logo">
                <a href="/Pages/QuanLy/BangDanhMuc.aspx">
                    <img src="/images/quanly3.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/QuanLy/BangDanhMuc.aspx">Quản lý bảng danh mục</a>
                <p>
                    Thêm,bớt, chỉnh sửa...các bảng trong cơ sở dữ liệu.</p>
            </div>
        </div>
        <div class="row" id="hsgd" onclick="nhay();">
            <div class="row_logo">
                <a href="/Pages/QuanLy/DoiDonVi.aspx">
                    <img src="/images/quanly6.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/QuanLy/DoiDonVi.aspx">Đổi đơn vị</a>
                <p>
                    Chuyển toàn bộ danh sách nhân viên từ đơn vị này sang đơn vị khác.</p>
            </div>
            <!--? if(isxoa()) { ?-->
        </div>
        <div class="row" id="Div1" onclick="nhay();">
            <div class="row_logo">
                <a href="/Pages/HoSo/HoSo.aspx">
                    <img src="/images/quanly6.png" height="50" width="50"></a></div>
            <div class="row_text">
                <a href="/Pages/HoSo/HoSo.aspx">Duyệt hủy/Khôi phục hồ sơ</a>
                <p>
                    Duyệt hủy, khôi phục hồ sơ cán bộ.</p>
            </div>
            <!--? }?-->
        </div>
    </div>
</asp:Content>
