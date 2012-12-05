<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="dm_hh.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.dm_hh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <table>
        <tr>
            <td><asp:Label runat="server" ID="lblTenHocHam">Tên học hàm</asp:Label></td>
            <td><asp:TextBox runat="server" ID="txtTenHocHam"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" ID="btnGhiLai" Text="Thêm học hàm" 
                    onclick="btnGhiLai_Click"/></td>
        </tr>
    </table>
    <br /><hr /><br />
    <asp:GridView runat="server" ID="gv" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ma_hh" DataSourceID="SqlDataSource_dm_hh" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ma_hh" HeaderText="Mã học hàm" InsertVisible="False" 
                ReadOnly="True" SortExpression="ma_hh" />
            <asp:BoundField DataField="hh" HeaderText="Tên học hàm" SortExpression="hh" />
            <asp:CommandField HeaderText="" ShowEditButton="True" ItemStyle-Width = "40" ItemStyle-HorizontalAlign="Center"/>
            <asp:CommandField HeaderText="" ShowDeleteButton="True" ItemStyle-Width = "50" ItemStyle-HorizontalAlign="Center"/>
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
    <asp:SqlDataSource ID="SqlDataSource_dm_hh" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLCB %>" 
        SelectCommand="SELECT [ma_hh], [hh] FROM [dm_hh]"
        UpdateCommand="UPDATE [dm_hh] SET [hh] = @hh WHERE [ma_hh]=@ma_hh"
        DeleteCommand="DELETE [dm_hh] WHERE [ma_hh]=@ma_hh">
     </asp:SqlDataSource>
</asp:Content>
