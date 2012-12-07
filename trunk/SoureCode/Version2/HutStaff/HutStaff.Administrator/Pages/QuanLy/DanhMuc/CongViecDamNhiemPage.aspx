<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/QuanLy/DanhMuc/DanhMucMaster.master" AutoEventWireup="true" CodeBehind="CongViecDamNhiemPage.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.CongViecDamNhiemPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Danh mục công việc đảm nhiệm</h1>
    <asp:Table runat="server" ID="tblMain"> 
        <asp:TableRow>
            <asp:TableHeaderCell Text="Mã công việc" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbMaTinhTrang" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell Text="Công việc" />
            <asp:TableCell>
                <asp:TextBox runat="server" ID="txbTinhTrangCongTac" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <hr /><br />
    <h1>Danh sách công việc đảm nhiệm trong bảng Sơ yếu</h1>
    <asp:GridView runat="server" ID="gv" AutoGenerateColumns="false" >
        <Columns>
            <asp:TemplateField HeaderText="STT" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Công việc" SortExpression="cvdn" HeaderStyle-Width="10em" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:TextBox runat="server" ReadOnly="true" Text='<%# Eval("cvdn")%> ' Width="20em"></asp:TextBox></ItemTemplate><HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" SortExpression="cvdn" HeaderStyle-Width="10em" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Button runat="server" Text="Thêm vào bảng danh mục" CssClass="button" onclick="ThemVaoDanhMuc" CommandName='<%# Eval("cvdn") %>'/>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="" HeaderStyle-Width="10em" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Button runat="server" Text="Ghi lại" CssClass="button" onclick="GhiLai" CommandName='<%# Container.DataItemIndex + 1 %>" %>'/>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
            </asp:TemplateField>
--%>        </Columns>
    </asp:GridView>
</asp:Content>