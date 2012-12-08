<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="MucDichDiNuocNgoai.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.MucDichDiNuocNgoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Danh mục mục đích đi nước ngoài</h1>
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã mục đích" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaMucDichDiNuocNgoai" />
            </asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mục đích" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMucDichDiNuocNgoai" />
            </asp:TableCell></asp:TableRow>
    </asp:Table>
</asp:Content>
