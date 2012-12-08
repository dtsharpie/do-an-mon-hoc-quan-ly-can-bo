<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master"
AutoEventWireup="true" CodeBehind="DonViPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DonViPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableCell Text="Mã đơn vị" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbMaDonVi" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="Đơn vị" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbDonVi" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
