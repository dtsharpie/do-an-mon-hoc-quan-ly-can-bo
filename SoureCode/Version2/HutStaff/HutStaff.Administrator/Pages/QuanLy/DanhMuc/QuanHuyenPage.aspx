<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="QuanHuyenPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.QuanHuyenPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số quận, huyện" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaHuyen" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tỉnh, thành phố" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinh" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tên quận, huyện" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTenHuyen" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
