<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master"
    AutoEventWireup="true" CodeBehind="DonViPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DonViPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã đơn vị" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaDonVi" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Đơn vị" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbDonVi" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
