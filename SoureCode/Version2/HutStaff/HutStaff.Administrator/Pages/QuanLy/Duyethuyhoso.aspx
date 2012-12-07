<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Duyethuyhoso.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Duyethuyhoso" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="divSearchForm" class="form-container">
        <label>
            Danh sánh</label>
        <select style="width: 150px;" id="ddlHuyhoso">
            <option value="0">Đợi hủy</option>
            <option value="1">Đã hủy</option>
        </select>
        <label>
            Tìm kiếm theo tên</label>
        <input id="txtTen" />
    </div>
</asp:Content>
