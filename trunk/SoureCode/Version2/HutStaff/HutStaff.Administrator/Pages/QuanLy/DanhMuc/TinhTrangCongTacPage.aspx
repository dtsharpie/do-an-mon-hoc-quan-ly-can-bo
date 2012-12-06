<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master"
    AutoEventWireup="true" CodeBehind="TinhTrangCongTacPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TinhTrangCongTacPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã tình trạng" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinhTrang" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tình trạng công tác" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTinhTrangCongTac" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
