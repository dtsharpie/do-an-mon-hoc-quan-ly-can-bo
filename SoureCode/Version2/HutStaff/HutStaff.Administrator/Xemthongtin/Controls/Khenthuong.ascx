﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Khenthuong.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Khenthuong" %>
<div class="content">
    <h1 class="title">
        Khen thưởng
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Hình thức khen thưởng
                </th>
                <th>
                    Năm khen
                </th>
                <th>
                    Lý do khen thưởng
                </th>
                <th>
                    Thông tin khác
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("kt")%>
                        </td>
                        <td>
                            <%# Eval("nkt_qtkt")!= DBNull.Value ?  Convert.ToDateTime(Eval("nkt_qtkt")).ToString("yyyy") : ""%>
                        </td>
                        <td>
                            <%# Eval("soqd_qtkt")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkt")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("kt")%>
                        </td>
                        <td>
                            <%# Eval("nkt_qtkt")!= DBNull.Value ?  Convert.ToDateTime(Eval("nkt_qtkt")).ToString("yyyy") : ""%>
                        </td>
                        <td>
                            <%# Eval("soqd_qtkt")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkt")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
