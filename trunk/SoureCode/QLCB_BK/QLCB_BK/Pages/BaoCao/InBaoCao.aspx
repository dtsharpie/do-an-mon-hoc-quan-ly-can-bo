<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="InBaoCao.aspx.cs" Inherits="QLCB_BK.Pages.BaoCao.InBaoCao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(3).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="content">
        <h1 class="title">
            In báo cáo</h1>
        <hr width="700px" />
        <div class="main">
            <div class="row">
                <div class="row_logo">
                    <a href="/Pages/BaoCao/BaoCaoThongKe.aspx">
                        <img src="../../Images/baocao1.png" height="50" width="50"/></a></div>
                <div class="row_text">
                    <a href="/Pages/BaoCao/BaoCaoThongKe.aspx">Báo cáo thống kê</a>
                    <p>
                        In ra bản báo cáo phân loại cán bộ theo danh sách lựa chọn.</p>
                </div>
            </div>
            
            <div class="row">
                <div class="row_logo">
                    <a href="/Pages/BaoCao/XetNangLuong.aspx">
                        <img src="../../Images/quanly5.png" height="50" width="50"/></a></div>
                <div class="row_text">
                    <a href="/Pages/BaoCao/XetNangLuong.aspx">In bảng xét nâng lương hàng năm</a>
                    <p>
                        Cập nhật bảng danh sách chờ quyết định nâng lương của cán bộ hàng năm.</p>
                </div>
            </div>

            <div class="row">
                <div class="row_logo">
                    <a href="/Pages/BaoCao/KhenThuong.aspx">
                        <img src="../../Images/baocao1.png" height="50" width="50"/></a></div>
                <div class="row_text">
                    <a href="/Pages/BaoCao/KhenThuong.aspx">In danh sách khen thưởng</a>
                    <p>
                        Tìm kiếm và in danh sách cán bộ được khen thưởng.</p>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </div>
</asp:Content>
