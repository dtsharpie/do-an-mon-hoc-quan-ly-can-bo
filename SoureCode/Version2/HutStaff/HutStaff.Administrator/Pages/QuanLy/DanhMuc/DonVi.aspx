<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="DonVi.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DonVi" %>

<%@ Register Src="../../../Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#divSideBar li:eq(2) ul").css("display", "block");
            $("a.view_reward]").attr("style", "background-color: rgb(247, 247, 247);");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy ID="SlideQuanLy1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Table ID="Table1" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="100%"
        CssClass="table-form">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server" HorizontalAlign="Center" ColumnSpan="2">Cập nhật dữ liệu</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Mã đơn vị</asp:TableHeaderCell>
            <asp:TableCell runat="server">
                <asp:TextBox runat="server" ID="txbMaDonVi" />
            </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Tên đơn vị</asp:TableHeaderCell><asp:TableCell
                runat="server">
                <asp:TextBox runat="server" ID="txbTenDonVi" />
            </asp:TableCell></asp:TableRow><asp:TableRow runat="server">
            <asp:TableCell runat="server" />
            <asp:TableCell runat="server">
                <asp:Button runat="server" Text="Ghi lại" OnClick="OnSaveButtonClick" />
                <asp:Button runat="server" Text="Nhập mới" OnClick="OnNewButtonClick" />
            </asp:TableCell></asp:TableRow></asp:Table><asp:GridView ID="grvDonVi" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="OnSelectedIndexChanged"
        OnRowDeleting="OnRowDeleting">
        <Columns>
            <asp:BoundField runat="server" DataField="ma_dv" HeaderText="Mã đơn vị" />
            <asp:BoundField runat="Server" DataField="dv" HeaderText="Đơn vị" />
            <asp:CommandField ShowSelectButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
