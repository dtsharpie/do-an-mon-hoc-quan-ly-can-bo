<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="HinhThucKhenThuongPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.HinhThucKhenThuongPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã khen thưởng" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaKhenThuong" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Hình thức khen thưởng" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbKhenThuong" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
