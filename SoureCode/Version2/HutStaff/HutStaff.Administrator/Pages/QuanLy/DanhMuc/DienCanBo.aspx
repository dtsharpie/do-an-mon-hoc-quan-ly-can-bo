<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="DienCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.DienCanBo" %>

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
    <asp:Table runat="Server">
        <asp:TableRow runat="Server">
            <asp:TableHeaderCell runat="Server" ColumnSpan="2">Bổ sung dữ liệu</asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="Server">
            <asp:TableHeaderCell runat="Server">Mã diện cán bộ</asp:TableHeaderCell>
            <asp:TableCell runat="Server">
                <asp:TextBox runat="Server" ID="txbMaDienCanBo" />
            </asp:TableCell></asp:TableRow><asp:TableRow runat="Server">
            <asp:TableHeaderCell runat="Server">Diện cán bộ</asp:TableHeaderCell><asp:TableCell
                runat="Server">
                <asp:TextBox runat="Server" ID="txbDienCanBo" />
            </asp:TableCell></asp:TableRow><asp:TableRow runat="Server">
            <asp:TableCell runat="Server" />
            <asp:TableCell>
                <asp:Button runat="Server" Text="Ghi lại" />
                <asp:Button runat="Server" Text="Nhập mới" />
            </asp:TableCell></asp:TableRow></asp:Table><br />
    <asp:GridView runat="Server" ID="grvDienCanBo" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField runat="Server" DataField="ma_dcb" HeaderText="Mã diện cán bộ" />
            <asp:BoundField runat="Server" DataField="dcb" HeaderText="Diện cán bộ" />
            <asp:CommandField runat="Server" ShowDeleteButton="true" />
            <asp:CommandField runat="Server" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
