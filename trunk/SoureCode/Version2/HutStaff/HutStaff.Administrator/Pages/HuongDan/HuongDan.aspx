<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="HuongDan.aspx.cs" Inherits="HutStaff.Administrator.Pages.HuongDan.HuongDan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(3).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
</asp:Content>
