﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Kyluat.ascx.cs" Inherits="HutStaff.Administrator.Xemthongtin.Controls.Kyluat" %>
<div class="content">
    <h1 class="title">
        Kỷ luật
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Hình thức kỷ luật
                </td>
                <td>
                    Năm KL
                </td>
                <td>
                    Năm xóa
                </td>
                <td>
                    Lý do kỷ luật
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("kl") %>
                        </td>
                        <td>
                            <%# Eval("nkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nkl")).ToString("yyyy")) : "" %>
                        </td>
                        <td>
                            <%# Eval("nxkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nxkl")).ToString("yyyy")) : ""%>
                        </td>
                        <td>
                            <%# Eval("ldkl")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkl")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("kl") %>
                        </td>
                        <td>
                            <%# Eval("nkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nkl")).ToString("yyyy")) : "" %>
                        </td>
                        <td>
                            <%# Eval("nxkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nxkl")).ToString("yyyy")) : ""%>
                        </td>
                        <td>
                            <%# Eval("ldkl")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkl")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
