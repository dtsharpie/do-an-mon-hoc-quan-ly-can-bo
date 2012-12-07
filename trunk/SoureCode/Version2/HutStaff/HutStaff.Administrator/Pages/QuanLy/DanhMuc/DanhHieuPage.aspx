<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="DanhHieuPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DanhHieuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaDanhHieu" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tên danh hiệu được phong" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbDanhHieu" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>

<%--Bảng dm_dhdp--%>