<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quatrinhcongtac.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quatrinhcongtac" %>
<div class="content">
    <h1 class="title">
        Quá trình công tác
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Thời gian
                </th>
                <th>
                    Biên chế tại đơn vị/<br />
                    Nơi làm việc
                </th>
                <th>
                    Công việc đảm nhận
                </th>
                <th>
                    Diện cán bộ
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_qtct")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_qtct")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("dvct").ToString() + "/<br />" + Eval("nlv")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("dcb")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_qtct")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_qtct")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("dvct").ToString() + "/<br />" + Eval("nlv")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("dcb")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
