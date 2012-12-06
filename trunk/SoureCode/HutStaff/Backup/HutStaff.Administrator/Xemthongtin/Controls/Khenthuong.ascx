<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Khenthuong.ascx.cs" Inherits="HutStaff.Administrator.Xemthongtin.Controls.Khenthuong" %>
<div class="content">
    <h1 class="title">
        Khen thưởng
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Hình thức khen thưởng
                </td>
                <td>
                    Năm khen
                </td>
                <td>
                   Lý do khen thưởng
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
