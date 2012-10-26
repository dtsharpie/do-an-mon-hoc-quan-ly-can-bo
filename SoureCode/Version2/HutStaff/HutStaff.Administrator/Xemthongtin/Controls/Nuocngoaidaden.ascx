<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Nuocngoaidaden.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Nuocngoaidaden" %>
<div class="content">
    <h1 class="title">
        Nước ngoài đã đến
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Nước đã đến
                </td>
                <td>
                    Mục đích đến
                </td>
                <td>
                    Thông tin bổ sung
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("nd_nndd") != DBNull.Value ? Convert.ToDateTime(Eval("nd_nndd")).ToString("MM/yyyy") : "") + " > " + (Eval("nv_nndd") != DBNull.Value ? Convert.ToDateTime(Eval("nv_nndd")).ToString("MM/yyyy") : "")%>
                        </td>
                        <td>
                            <%# Eval("qg") %>
                        </td>
                        <td>
                            <%# Eval("mdnndd")%>
                        </td>
                        <td>
                            <%# Eval("ttk_nndd")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("nd_nndd") != DBNull.Value ? Convert.ToDateTime(Eval("nd_nndd")).ToString("MM/yyyy") : "") + " > " + (Eval("nv_nndd") != DBNull.Value ? Convert.ToDateTime(Eval("nv_nndd")).ToString("MM/yyyy") : "")%>
                        </td>
                        <td>
                            <%# Eval("qg") %>
                        </td>
                        <td>
                            <%# Eval("mdnndd")%>
                        </td>
                        <td>
                            <%# Eval("ttk_nndd")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
