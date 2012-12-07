<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TrinhDoQuanLyPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TrinhDoQuanLyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTrinhDoQuanLy" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Trình độ quản lý" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTrinhDoQuanLy" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
