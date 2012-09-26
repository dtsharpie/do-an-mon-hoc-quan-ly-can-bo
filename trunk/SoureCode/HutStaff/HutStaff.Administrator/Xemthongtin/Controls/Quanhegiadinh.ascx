<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quanhegiadinh.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quanhegiadinh" %>
<div class="content">
    <h1 class="title">
        Quan hệ gia đình
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Họ và tên
                </td>
                <td>
                    Quan hệ
                </td>
                <td>
                    Năm sinh
                </td>
                <td>
                    Thông tin bổ sung
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
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
