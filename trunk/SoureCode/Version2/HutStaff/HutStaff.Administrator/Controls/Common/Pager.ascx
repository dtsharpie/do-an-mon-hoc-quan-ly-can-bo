<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.Pager" %>
<table cellpadding="4" id="<%= UID %>tblPager">
    <tr>
        <td>
            Đến trang
        </td>
        <td>
            <asp:TextBox ID="txtPageIndex" runat="server" Width="30px"></asp:TextBox>
            <input type="hidden" id="hdControlId" value="<%= HtmlId %>" />
            <input type="hidden" id="hdUniqueId" value="<%= UID %>" />
            <input type="hidden" id="hdControlParams" value="<%= ControlParams %>" />
        </td>
        <td>
            Số dòng
        </td>
        <td>
            <asp:DropDownList ID="ddlPageSize" runat="server">
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="50">50</asp:ListItem>
                <asp:ListItem Value="100">100</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="lblInfo" runat="server"></asp:Label>
        </td>
        <td>
            <a href="javascript:void(0);" runat="server" id="lnkPrePage">
                <img src="/images/pager/previous.jpg" border='0' title="Trang trước" alt="Trang trước" /></a>
        </td>
        <td>
            <a href="javascript:void(0);" runat="server" id="lnkNextPage">
                <img src="/images/pager/Next.jpg" border='0' title="Trang sau" alt="Trang sau" /></a>
        </td>
    </tr>
</table>
