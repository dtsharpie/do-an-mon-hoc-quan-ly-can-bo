<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="KinhPhiDiNuocNgoaiPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.KinhPhiDiNuocNgoaiPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã số" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaKinhPhiDiNuocNgoai" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Nguồn kinh phi đi nước ngoài" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbKinhPhiDiNuocNgoai" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
