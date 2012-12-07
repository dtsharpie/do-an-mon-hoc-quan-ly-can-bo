<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quatrinhdaotao.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quatrinhdaotao" %>
<div class="content">
    <h1 class="title">
        Quá trình đào tạo
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
                    Chuyên ngành
                </th>
                <th>
                    Thông tin bổ sung
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_dtcm") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dtcm")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dtcm") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dtcm")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("vbdt")%>
                        </td>
                        <td>
                            <%# Eval("cn")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdt")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_dtcm") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dtcm")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dtcm") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dtcm")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("vbdt")%>
                        </td>
                        <td>
                            <%# Eval("cn")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdt")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
