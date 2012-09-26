<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="QLCB_BK.Pages.TimKiem.Search" %>

<%@ Register Src="../../Controls/TimKiem/SearchResult.ascx" TagName="SearchResult"
    TagPrefix="uc1" %>
<%@ Register Src="../../Controls/TimKiem/SearchForm.ascx" TagName="SearchForm" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(0).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content tim-kiem">
        <h1 class="title">
           Tìm kiếm</h1>
        <hr width="750px" />
        <uc2:SearchForm ID="SearchForm1" runat="server" />
        <hr width="750px" />

        <uc1:SearchResult ID="SearchResult1" runat="server" />
    </div>
</asp:Content>
