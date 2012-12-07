<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TrinhDoTinHocPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TrinhDoTinHocPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTrinhDoTinHoc" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Trình độ tin học" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTrinhDoTinHoc" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
