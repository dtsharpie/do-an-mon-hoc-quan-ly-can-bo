<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master"
    AutoEventWireup="true" CodeBehind="HocHamPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.HocHamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server" ID="tblMain">
        <asp:TableRow>
            <asp:TableCell Text="Mã học hàm" Font-Size="15px" />
            <asp:TableCell Font-Size="15px" CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbMaHocHam" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Text="Học hàm" Font-Size="15px" />
            <asp:TableCell CssClass="grvTextBox">
                <asp:TextBox runat="server" ID="txbHocHam" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
