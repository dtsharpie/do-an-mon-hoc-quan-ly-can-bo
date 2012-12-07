<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TrinhDoHocVanPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TrinhDoHocVanPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTenNgoaiNgu" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Trình độ học vấn" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTenNgoaiNgu" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
