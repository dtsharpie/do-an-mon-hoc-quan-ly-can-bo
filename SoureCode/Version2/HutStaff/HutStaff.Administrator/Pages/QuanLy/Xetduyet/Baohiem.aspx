<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Baohiem.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Xetduyet.Baohiem" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#divSideBar li:eq(2) ul").css("display", "block");

            $("a.view_baohiem]").attr("style", "background-color: rgb(247, 247, 247);");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy ID="SlideQuanLy1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="table-container">
        <div>
            Bảng mẫu
        </div>
        <div class="main-table">
            <asp:GridView ID="grdData" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="False"
                Height="20px" Width="100%" CssClass="table-result">
                <AlternatingRowStyle CssClass="even" />
                <Columns>
                    <asp:TemplateField HeaderText="Shcc">
                        <ItemTemplate>
                            <%# Eval("shcc") %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Họ tên">
                        <ItemTemplate>
                            <%# Eval("fullname") %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số bhxh">
                        <ItemTemplate>
                            <%# Eval("htkt") %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày bắt đầu đóng bhxh">
                        <ItemTemplate>
                            <%# Eval("nam") %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Button CssClass="lnk-button" ID="btnDownload" Text="Tải về" runat="server" OnClick="btnDownload_Click" />
            <asp:FileUpload CssClass="lnk-button" ID="fileUpload" runat="server" />
            <asp:Button CssClass="lnk-button" ID="btnImport" Text="Import" runat="server" OnClick="btnImport_Click" />
            <asp:Button CssClass="lnk-button" ID="btnUpdate" Text="Cập nhật" runat="server" OnClick="btnUpdate_Click" />
        </div>
    </div>
</asp:Content>
