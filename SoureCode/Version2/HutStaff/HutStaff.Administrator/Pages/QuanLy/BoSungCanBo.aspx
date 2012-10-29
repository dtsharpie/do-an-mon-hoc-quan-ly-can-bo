﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BoSungCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BoSungCanBo" %>
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
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

</asp:Content>