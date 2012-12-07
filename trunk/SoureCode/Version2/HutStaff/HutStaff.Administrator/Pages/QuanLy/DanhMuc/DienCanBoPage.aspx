<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="DienCanBoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DienCanBoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã diện cán bộ" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaDienCanBo" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Diện cán bộ" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbDienCanBo" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
