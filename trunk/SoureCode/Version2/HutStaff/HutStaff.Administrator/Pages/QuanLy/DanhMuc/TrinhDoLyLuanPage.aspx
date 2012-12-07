<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TrinhDoLyLuanPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TrinhDoLyLuanPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTrinhDoLyLuan" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Trình độ lý luận" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTrinhDoLyLuan" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
