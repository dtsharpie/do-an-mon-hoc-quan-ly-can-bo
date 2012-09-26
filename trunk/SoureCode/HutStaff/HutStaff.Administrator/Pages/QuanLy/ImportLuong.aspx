<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="ImportLuong.aspx.cs" Inherits="QLCB_BK.Pages.QuanLy.ImportLuong" %>

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
            Quản lý</h1>
        <hr width="750px" />
        
    </div>
</asp:Content>
