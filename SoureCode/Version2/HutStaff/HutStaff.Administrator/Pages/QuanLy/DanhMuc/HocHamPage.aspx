<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="HocHamPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.HocHamPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã học hàm" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaHocHam" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Học hàm" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbHocHam" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
