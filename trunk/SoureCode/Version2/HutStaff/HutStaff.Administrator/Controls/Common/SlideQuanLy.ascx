<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideQuanLy.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.Common.SlideQuanLy" %>
<ul>
    <li><a href="/Pages/QuanLy/BoSungCanBo.aspx">Bổ sung</a> </li>
    <li><a href="/Pages/QuanLy/NguoiDung.aspx">Người dùng</a> </li>
    <li><a href="javascript:void(0);">Xét duyệt</a><span><img src="/Images/indicator_down.png"
        width="8px" height="4px" alt="" /></span>
        <ul class="subform">
            <li ><a href="/Pages/QuanLy/Xetduyet/Tanngluong.aspx" alias="view-tang-luong">Xét nâng lương</a></li>
            <li><a href="/Pages/QuanLy/Xetduyet/Khenthuong.aspx" class="view_reward">Xét khen thưởng</a></li>
            <li><a href="/Pages/QuanLy/Xetduyet/Baohiem.aspx" class="view_baohiem">Xét khen thưởng</a></li>
        </ul>
    </li>
    <li><a href="/Pages/QuanLy/BangDanhMuc.aspx">Bảng danh mục</a> </li>
    <li><a href="/Pages/QuanLy/DoiDonVi.aspx">Đổi đơn vị</a> </li>
    <li><a href="/Pages/QuanLy/Duyethuyhoso.aspx">Duyệt/Hủy/Khôi phục hồ sơ</a> </li>
</ul>
<script type="text/javascript">
    $(document).ready(function () {
        $('#divHeader .nav a').removeClass("active");
        $('#divHeader .nav a').eq(1).addClass('active');
    });
</script>