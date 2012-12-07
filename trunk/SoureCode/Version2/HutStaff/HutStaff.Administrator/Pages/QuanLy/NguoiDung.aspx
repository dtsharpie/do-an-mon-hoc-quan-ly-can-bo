<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="NguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.NguoiDung" %>
<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1>Danh sách người dùng</h1>
        <div>
            <div style="float:left">
                <asp:GridView id="GridView_User" 
                OnRowDeleting="Delete_User"
                runat="server" CellPadding="4"
                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                EmptyDataText="Không có người dùng nào!" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left"
                        SortExpression="id" ControlStyle-BackColor="Transparent">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("id")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>

                    <asp:HyperLinkField SortExpression="user" HeaderText="Tên truy cập" DataNavigateUrlFields="user" DataNavigateUrlFormatString='SuaNguoiDung.aspx?task=edit&user={0}' 
                    DataTextField="user" HeaderStyle-Width="15em"> <HeaderStyle Width="15em"></HeaderStyle>
                    </asp:HyperLinkField>
                    <asp:BoundField SortExpression="dv" HeaderText="Đơn vị" DataField="dv" />
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
                                <asp:LinkButton runat="server" CssClass="button-link" Text="Xóa" CommandName="Delete" OnClientClick='return confirm("Bạn thực sự muốn xóa?");'>
                                </asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField ControlStyle-Width="3em" ControlStyle-CssClass="button-link" DataNavigateUrlFields="user" DataNavigateUrlFormatString='SuaNguoiDung.aspx?task=edit&user={0}' Text="Sửa">

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
            <div style="clear:both"></div>
        </div>
        <div style="float:left; margin-right:10px;"><a href="SuaNguoiDung.aspx?task=add" class="lnk-button">Thêm người dùng mới</a></div>
  </div>
    
</asp:Content>
