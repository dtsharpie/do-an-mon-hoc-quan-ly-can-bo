<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="QuanHuyenPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.QuanHuyenPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số quận, huyện" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaQuanHuyen" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tỉnh, thành phố" />
            <asp:TableCell>
                <asp:DropDownList runat="server"  ID="dropDownTinhThanhPho" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Tên quận, huyện" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbQuanHuyen" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
