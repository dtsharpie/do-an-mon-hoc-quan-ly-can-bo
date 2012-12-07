<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="ChucVuDangPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.ChucVuDangPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaChucVuDang" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Chức vụ Đảng" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbChucVuDang" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
