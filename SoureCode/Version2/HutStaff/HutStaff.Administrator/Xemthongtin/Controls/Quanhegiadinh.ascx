﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quanhegiadinh.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quanhegiadinh" %>
<div class="content">
    <h1 class="title">
        Quan hệ gia đình
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Họ và tên
                </td>
                <td>
                    Quan hệ
                </td>
                <td>
                    Năm sinh
                </td>
                <td>
                    Thông tin bổ sung
                </td>
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
                            <%# Eval("ns_qhgd")!= DBNull.Value ? Eval("ns_qhgd") : "" %>
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
                            <%# Eval("ns_qhgd")!= DBNull.Value ? Eval("ns_qhgd") : "" %>
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