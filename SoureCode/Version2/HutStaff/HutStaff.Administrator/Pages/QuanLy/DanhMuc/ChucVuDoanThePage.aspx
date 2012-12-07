<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="ChucVuDoanThePage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.ChucVuDoanThePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaChucVuDoanThe" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Chức vụ Đoàn thể" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbChucVuDoanThe" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
