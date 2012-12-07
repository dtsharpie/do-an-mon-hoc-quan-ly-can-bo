<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="CongViecDamNhiemPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.CongViecDamNhiemPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Danh mục công việc đảm nhiệm</h1>
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã công việc" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinhTrang" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Công việc" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTinhTrangCongTac" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
