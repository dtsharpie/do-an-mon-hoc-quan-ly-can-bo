<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="MatBangBaoHiem.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.MatBangBaoHiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableCell Text="Mã" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbMa" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="Tính từ" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbTinhTu" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="%BHXH" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbBHXH" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="%BHYT" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbBHYT" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="%BHTN" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbBHTN" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
