<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="ChucVuChinhQuyenPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.ChucVuChinhQuyenPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaChucVuChinhQuyen" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Chức vụ chính quyền" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbChucVuChinhQuyen" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Phụ cấp chức vụ" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbPhuCapChucVu" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
