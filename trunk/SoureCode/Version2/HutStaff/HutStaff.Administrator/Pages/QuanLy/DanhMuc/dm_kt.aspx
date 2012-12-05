<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="dm_kt.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.dm_kt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <table>
        <tr>
            <td><asp:Label runat="server" ID="lbl">Hình thức khen thưởng</asp:Label></td>
            <td><asp:TextBox runat="server" ID="txt"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" ID="btnGhiLai" Text="Thêm Hình thức khen thưởng" 
                    onclick="btnGhiLai_Click"/></td>
        </tr>
    </table>
    <br /><hr /><br />
    <asp:GridView runat="server" ID="gv" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ma_kt" DataSourceID="SqlDataSource" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="STT" HeaderStyle-Width="5em" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="5em"></HeaderStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="ma_kt" HeaderText="Mã khen thưởng" InsertVisible="False" 
                ReadOnly="True" SortExpression="ma_kt" />
            <asp:BoundField DataField="kt" HeaderText="Hình thức khen thưởng" SortExpression="kt" />
            <asp:CommandField HeaderText="" ShowEditButton="True" ItemStyle-Width = "40" ItemStyle-HorizontalAlign="Center" UpdateText="Sửa" EditText="Sửa"/>
            <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CssClass="button-link" Text="Xóa" CommandName="Delete" OnClientClick='return confirm("Bạn thực sự muốn xóa?");'>
                        </asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLCB %>" 
        SelectCommand="SELECT [ma_kt], [kt] FROM [dm_kt]"
        UpdateCommand="UPDATE [dm_kt] SET [kt] = @kt WHERE [ma_kt]=@ma_kt"
        DeleteCommand="DELETE [dm_kt] WHERE [ma_kt]=@ma_kt">
     </asp:SqlDataSource>
</asp:Content>
