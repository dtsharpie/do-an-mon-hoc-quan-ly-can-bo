<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="DienCanBoPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DienCanBoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableCell Text="Mã diện cán bộ" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbMaDienCanBo" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="Diện cán bộ" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbDienCanBo" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
