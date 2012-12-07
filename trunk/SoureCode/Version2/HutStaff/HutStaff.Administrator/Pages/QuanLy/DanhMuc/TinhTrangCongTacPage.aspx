<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master"
    AutoEventWireup="true" CodeBehind="TinhTrangCongTacPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TinhTrangCongTacPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableCell Text="Mã tình trạng" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbMaTinhTrang" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="Tình trạng công tác" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbTinhTrangCongTac" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
    <br />
</asp:Content>
