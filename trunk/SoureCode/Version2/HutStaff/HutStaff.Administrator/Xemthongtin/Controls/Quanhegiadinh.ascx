<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quanhegiadinh.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quanhegiadinh" %>
<div class="content">
    <h1 class="title">
        Quan hệ gia đình
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Họ và tên
                </th>
                <th>
                    Quan hệ
                </th>
                <th>
                    Năm sinh
                </th>
                <th>
                    Thông tin bổ sung
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("ht_qhgd")%>
                        </td>
                        <td>
                            <%# Eval("quanhegd")%>
                        </td>
                        <td>
                            <%# Eval("ns_qhgd")!= DBNull.Value ? Convert.ToDateTime( Eval("ns_qhgd")).ToString("dd/MM/yyyy") : "" %>
                        </td>
                        <td>
                            <%# Eval("ttk_qhgd")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("ht_qhgd")%>
                        </td>
                        <td>
                            <%# Eval("quanhegd")%>
                        </td>
                        <td>
                            <%# Eval("ns_qhgd")!= DBNull.Value ? Convert.ToDateTime( Eval("ns_qhgd")).ToString("dd/MM/yyyy") : "" %>
                        </td>
                        <td>
                            <%# Eval("ttk_qhgd")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
