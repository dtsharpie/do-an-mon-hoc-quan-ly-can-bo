<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="QuocGiaPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.QuocGiaPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaQuocGia" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tên quốc gia" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbQuocGia" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
