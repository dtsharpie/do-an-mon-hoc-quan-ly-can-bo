<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="VanBangDaoTaoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.VanBangDaoTaoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaVanBangDaoTao" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Văn bằng đào tạo" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbVanBangDaoTao" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
