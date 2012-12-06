<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="BoSungCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BoSungCanBo" %>

<%@ Register src="../../Controls/QuanLy/OfficialInfoInsertForm.ascx" tagname="OfficialInfoInsertForm" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <uc1:OfficialInfoInsertForm ID="OfficialInfoInsertForm1" runat="server" />
</asp:Content>
