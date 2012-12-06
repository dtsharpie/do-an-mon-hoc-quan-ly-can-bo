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
