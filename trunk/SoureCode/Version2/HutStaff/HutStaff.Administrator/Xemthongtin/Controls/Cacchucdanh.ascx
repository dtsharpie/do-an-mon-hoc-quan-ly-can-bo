<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cacchucdanh.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Cacchucdanh" %>
<div class="content">
    <h1 class="title">
        Các chức danh
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Chức danh
                </th>
                <th>
                    Ngày tháng năm phong
                </th>
                <th>
                    Thông tin khác
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("dhdp")%>
                        </td>
                        <td>
                            <%# Convert.ToDateTime(Eval("ntnpdh")).ToString("dd/MM/yyyy")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtcd")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("dhdp")%>
                        </td>
                        <td>
                            <%# Convert.ToDateTime(Eval("ntnpdh")).ToString("dd/MM/yyyy")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtcd")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
