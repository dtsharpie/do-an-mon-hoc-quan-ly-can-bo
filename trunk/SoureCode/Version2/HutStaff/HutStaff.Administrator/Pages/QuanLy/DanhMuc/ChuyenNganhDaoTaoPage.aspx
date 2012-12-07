<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="ChuyenNganhDaoTaoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.ChuyenNganhDaoTaoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaChuyenNganhDaoTao" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Chuyên ngành đào tạo" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbChuyenNganhDaoTao" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
