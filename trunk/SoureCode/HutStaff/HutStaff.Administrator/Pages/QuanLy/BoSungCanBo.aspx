<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BoSungCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BoSungCanBo" %>
<%@ Register src="../../Controls/QuanLy/ThongTinCanBoControl.ascx" tagname="ThongTinCanBoControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Script/chosen.jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(1).addClass('active');
            $('.subNav > li').removeClass("active");
            $('.subNav > li').eq(0).addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:ThongTinCanBoControl ID="ThongTinCanBoControl1" runat="server" />
</asp:Content>
