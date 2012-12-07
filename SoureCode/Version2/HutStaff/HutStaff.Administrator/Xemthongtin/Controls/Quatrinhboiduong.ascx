<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quatrinhboiduong.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quatrinhboiduong" %>
<div class="content">
    <h1 class="title">
        Quá trình bồi dưỡng
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Thời gian
                </th>
                <th>
                    Văn bằng
                </th>
                <th>
                    Nội dung
                </th>
                <th>
                    Thông tin bổ sung
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_bd") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_bd")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_bd") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_bd")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("vbbd")%>
                        </td>
                        <td>
                            <%# Eval("ndbd")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtbd")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_bd") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_bd")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_bd") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_bd")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("vbbd")%>
                        </td>
                        <td>
                            <%# Eval("ndbd")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtbd")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
