<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TinhTrangHonNhanPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TinhTrangHonNhanPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinhTrangHonNhan" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tình trạng hôn nhân" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTinhTrangHonNhan" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
