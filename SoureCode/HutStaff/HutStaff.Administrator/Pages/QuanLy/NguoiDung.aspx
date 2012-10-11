<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="NguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.NguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <asp:SqlDataSource id="SqlDataSource_User" runat="server"
            ConnectionString="<%$ ConnectionStrings:QLCB %>" 
            SelectCommand="SELECT [user], [quyen], [isLock], dv FROM [Users], [dm_dv] WHERE [Users].ma_dv = [dm_dv].ma_dv"
            DeleteCommand="DELETE [Users] WHERE [user]=@User">
        </asp:SqlDataSource>

        <h1>Danh sách người dùng</h1>

        <asp:GridView id="GridView_User" DataSourceID="SqlDataSource_User" 
            runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4"
            ForeColor="#333333" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="user"
            EmptyDataText="Không có người dùng nào!" PageSize="2" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="STT" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
                </asp:TemplateField>

                <asp:HyperLinkField HeaderText="Tên truy cập" DataNavigateUrlFields="user" DataNavigateUrlFormatString='SuaNguoiDung.aspx?task=edit&user={0}' DataTextField="user" HeaderStyle-Width="15em" Target="_blank">
<HeaderStyle Width="15em"></HeaderStyle>
                </asp:HyperLinkField>
                <asp:BoundField HeaderText="Đơn vị" DataField="dv" />
                <asp:CheckBoxField DataField="quyen" HeaderText="Có quyền sửa" 
                    HeaderStyle-Width="15em" ItemStyle-HorizontalAlign="Center"
                    SortExpression="quyen" >
<HeaderStyle Width="15em"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CheckBoxField>
                <asp:TemplateField HeaderText="Tình trạng" 
                    SortExpression="isLock" ControlStyle-BackColor="Transparent">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("isLock").ToString() ==  "False" ? "Hoạt động" : "Khóa" %>'></asp:Label>
                    </ItemTemplate>

<ControlStyle BackColor="Transparent"></ControlStyle>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Xóa" CommandName="Delete" OnClientClick='return confirm("Bạn thực sự muốn xóa?");'>
                            </asp:LinkButton>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="user" DataNavigateUrlFormatString='SuaNguoiDung.aspx?task=edit&user={0}' Target="_blank" Text="Sửa">

                </asp:HyperLinkField>
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
    <a href="SuaNguoiDung.aspx?task=add">Thêm mới người dùng</a>
</asp:Content>
