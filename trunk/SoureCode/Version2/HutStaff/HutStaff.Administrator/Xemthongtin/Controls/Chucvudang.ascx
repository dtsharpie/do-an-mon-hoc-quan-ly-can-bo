<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Chucvudang.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Chucvudang" %>
<div class="content">
    <h1 class="title">
        Chức vụ đảng
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <th>
                    Thời gian
                </th>
                <th>
                    Chức vụ
                </th>
                <th>
                    Thông tin khác
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# ((Eval("nbncvdt") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvdt")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvdt") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvdt")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cu") %>
                        </td>
                        <td>
                            <%# Eval("ttk_qtct")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# ((Eval("nbncvdt") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvdt")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvdt") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvdt")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cu") %>
                        </td>
                        <td>
                            <%# Eval("ttk_qtct")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
