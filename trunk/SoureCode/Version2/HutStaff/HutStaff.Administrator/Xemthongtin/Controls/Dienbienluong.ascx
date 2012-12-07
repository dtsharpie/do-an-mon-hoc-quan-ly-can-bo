<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dienbienluong.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Dienbienluong" %>
<div class="content">
    <h1 class="title">
        Diễn biến lương
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Thời gian
                </th>
                <th>
                    Ngạch
                </th>
                <th>
                    Bậc
                </th>
                <th>
                    Hệ số
                </th>
                <th>
                    Phụ cấp
                </th>
                <th>
                    Thông tin khác
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dbl")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dbl")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("ten_ngach")%>
                        </td>
                        <td>
                            <%# Eval("bl_dbl")%>
                        </td>
                        <td>
                            <%# Eval("hsl")%>
                        </td>
                        <td>
                            <%# (Eval("hspccv") != DBNull.Value && !String.IsNullOrEmpty( Eval("hspccv").ToString())) ? "Chức vụ: "+  Eval("hspccv").ToString() + "<br />" : ""%>
                            <%# (Eval("hspctn") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspctn").ToString())) ? "Thâm niên: " + Eval("hspctn").ToString() + "<br />" : ""%>
                            <%# (Eval("hspckv") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspckv").ToString())) ? "Vượt khung: " + Eval("hspckv").ToString() : ""%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdbl")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dbl")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dbl")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("ten_ngach")%>
                        </td>
                        <td>
                            <%# Eval("bl_dbl")%>
                        </td>
                        <td>
                            <%# Eval("hsl")%>
                        </td>
                        <td>
                            <%# (Eval("hspccv") != DBNull.Value && !String.IsNullOrEmpty( Eval("hspccv").ToString())) ? "Chức vụ: "+  Eval("hspccv").ToString() + "<br />" : ""%>
                            <%# (Eval("hspctn") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspctn").ToString())) ? "Thâm niên: " + Eval("hspctn").ToString() + "<br />" : ""%>
                            <%# (Eval("hspckv") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspckv").ToString())) ? "Vượt khung: " + Eval("hspckv").ToString() : ""%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdbl")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
