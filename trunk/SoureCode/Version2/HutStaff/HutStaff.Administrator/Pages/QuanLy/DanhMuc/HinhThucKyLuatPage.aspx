<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="HinhThucKyLuatPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.HinhThucKyLuatPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã kỷ luật" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaKyLuat" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Hình thức kỷ luật" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbKyLuat" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
