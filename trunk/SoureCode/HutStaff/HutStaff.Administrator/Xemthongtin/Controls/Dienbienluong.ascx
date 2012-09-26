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
                <td>
                    Thời gian
                </td>
                <td>
                    Ngạch
                </td>
                <td>
                    Bậc
                </td>
                <td>
                    Hệ số
                </td>
                <td>
                    Phụ cấp
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="grdData">
                <ItemTemplate>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
