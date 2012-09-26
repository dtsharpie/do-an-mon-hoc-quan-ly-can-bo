<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HutStaff.Administrator.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content quan-ly">
        <h1 class="title">
            Quản lý</h1>
        <hr width="750px" />
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
        <!-- InstanceEndEditable -->
    </div>
</asp:Content>
