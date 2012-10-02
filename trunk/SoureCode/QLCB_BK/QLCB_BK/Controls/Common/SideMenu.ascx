﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideMenu.ascx.cs" Inherits="QLCB_BK.Controls.Common.SideMenu" %>
<div id="divNav">
    <ul class="mainNav">
        <li class="ml"><a href="/Pages/TimKiem/Search.aspx">Tìm kiếm</a></li>
        <li class="ml"><a href="/Default.aspx">Quản lý</a></li>
        <li>
            <ul class="subNav">
                <li><a href="/Pages/QuanLy/BoSungCanBo.aspx">Bổ sung cán bộ</a></li>
                <li><a href="/Pages/QuanLy/ImportLuong.aspx">Import dữ liệu</a></li>
                <li><a href="/Pages/QuanLy/NguoiDung.aspx">Người dùng</a></li>
                <li><a href="/Pages/QuanLy/BangDanhMuc.aspx">Bảng danh mục</a></li>
                <li><a href="/Pages/QuanLy/DoiDonVi.aspx">Đổi đơn vị</a></li>
            </ul>
        </li>
        <li class="ml"><a href="/Pages/HoSo/HoSo.aspx">Duyệt/Hủy/Khôi phục hồ sơ</a></li>
        <li class="ml"><a href="/Pages/BaoCao/InBaoCao.aspx">In báo cáo</a></li>
        <li>
            <ul class="subNav">
                <li><a href="/Pages/BaoCao/BaoCaoThongKe.aspx">Báo cáo thống kê</a></li>
                <li><a href="/Pages/BaoCao/XetNangLuong.aspx">Xét nâng lương</a></li>
                <li><a href="/Pages/BaoCao/KhenThuong.aspx">Khen thưởng</a></li>
            </ul>
        </li>
        <li class="ml"><a href="/Default.aspx">Hướng dẫn</a></li>
    </ul>
</div>
<script type="text/javascript">
    $('.mainNav .ml').click(function () {
        $('.mainNav .ml').removeClass("active");
        $('.subNav > li').removeClass("active");

        $(this).addClass("active");
    });

    $('.subNav > li').click(function () {
        $('.subNav > li').removeClass("active");
        $(this).addClass("active");
        $('.mainNav .ml').removeClass("active");
        $(this).parent().parent().prev().addClass("active");

    });

//    function CheckEnterKey(e) {
//        var keycode;
//        if (e) keycode = e.which;
//        else
//            if (window.event) keycode = window.event.keyCode;

//        window.history.back(1);

//        var alias = window.location.hash;
//        if (alias != '') {
//            alias = alias.substring(1);

//            if (keycode == 8) {
//                loadContent({ 'alias': alias }, false);
//                $('.menu').removeClass('selected');
//                $("ul#mainnav li a.menu[alias='" + alias + "']").addClass('selected');
//            }
//        }
//        return false;
//    }
//    document.onkeypress = CheckEnterKey;
</script>