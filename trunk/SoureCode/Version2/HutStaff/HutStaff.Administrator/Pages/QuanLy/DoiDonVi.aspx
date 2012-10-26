<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="DoiDonVi.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DoiDonVi" %>
<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>

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
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
</asp:Content>
