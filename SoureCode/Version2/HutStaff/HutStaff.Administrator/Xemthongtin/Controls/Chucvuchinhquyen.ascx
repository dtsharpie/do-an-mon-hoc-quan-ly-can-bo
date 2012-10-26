<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Chucvuchinhquyen.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Chucvuchinhquyen" %>
<div class="content">
    <h1 class="title">
        Chức vụ chính quyền
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Chức vụ kiêm nhiệm
                </td>
                <td>
                    Đơn vị quản lý
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# ((Eval("nbncvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvkn")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvkn")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("donvi")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtct")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# ((Eval("nbncvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvkn")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvkn")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("donvi")%>
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
