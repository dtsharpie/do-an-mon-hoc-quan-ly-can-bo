<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="HinhThucDaoTaoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.HinhThucDaoTaoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaHinhThucDaoTao" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Hình thức đào tạo" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbHinhThucDaoTao" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
