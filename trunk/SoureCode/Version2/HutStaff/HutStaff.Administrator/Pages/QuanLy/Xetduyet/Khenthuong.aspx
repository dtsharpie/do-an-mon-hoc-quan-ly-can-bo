<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Khenthuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Xetduyet.Khenthuong" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy ID="SlideQuanLy1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
</asp:Content>
