<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="TrinhDoNgoaiNguPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.TrinhDoNgoaiNguPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTrinhDoNgoaiNgu" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Trình độ ngoại ngữ" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTrinhDoNgoaiNgu" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
