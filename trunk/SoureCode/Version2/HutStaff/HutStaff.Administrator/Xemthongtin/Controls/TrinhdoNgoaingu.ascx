<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrinhdoNgoaingu.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.TrinhdoNgoaingu" %>
<div class="content">
    <h1 class="title">
        Trình độ ngoại ngữ
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Ngoại ngữ
                </th>
                <th>
                    Trình độ
                </th>
                <th>
                    Thông tin khác
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("tnn") %>
                        </td>
                        <td>
                            <%# Eval("tdnn") %>
                        </td>
                        <td>
                            <%# Eval("ttk_tdnn")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("tnn") %>
                        </td>
                        <td>
                            <%# Eval("tdnn") %>
                        </td>
                        <td>
                            <%# Eval("ttk_tdnn")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
