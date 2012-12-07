<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TinhThanhPhoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TinhThanhPhoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinhThanhPho" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tên tỉnh, thành phố" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTinhThanhPho" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
