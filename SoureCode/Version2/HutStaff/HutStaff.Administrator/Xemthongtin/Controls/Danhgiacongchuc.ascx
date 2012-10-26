<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Danhgiacongchuc.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Danhgiacongchuc" %>
<div class="content">
    <h1 class="title">
        Đánh giá công chức
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Năm
                </td>
                <td>
                    Xếp loại
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
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
