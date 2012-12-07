<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="DoiDonVi.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DoiDonVi" %>
<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
            $(".ddl").chosen({ no_results_text: "Không có kết quả phù hợp" });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="form-container">
        <h2>Chuyển đổi đơn vị</h2>
        <table class="table-form" width="100%">
            <tr>
                <td>Đơn vị ban đầu</td>
                <td></td>
                <td>Đơn vị sẽ chuyển đến</td>
            </tr>
            <tr>
                <td><asp:DropDownList runat="server" CssClass="ddl" id="ddlDonViNguon" AutoPostBack="true" OnSelectedIndexChanged="ddlDonViNguon_SelectedIndexChanged"></asp:DropDownList></td>
                <td><asp:Button runat="server" ID="btnChuyen" Text="Chuyển" OnClientClick="return confirm('Bạn có thực sự muốn chuyển đơn vị những cán bộ này không?');"
                        onclick="btnChuyen_Click" CssClass="button"/></td>
                <td><asp:DropDownList runat="server" CssClass="ddl" id="ddlDonViDich"></asp:DropDownList></td>
            </tr>
        </table>
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        <asp:GridView ID="gvCanBoChuyen" runat="server" AutoGenerateColumns="False" DataKeyNames="shcc" 
            CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="STT" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="shcc" HeaderText="Số hiệu" InsertVisible="False" 
                    ReadOnly="True" SortExpression="shcc" />
                <asp:BoundField DataField="hodem" HeaderText="Họ đệm" SortExpression="hodem" />
                <asp:BoundField DataField="ten" HeaderText="Tên" SortExpression="ten" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>
