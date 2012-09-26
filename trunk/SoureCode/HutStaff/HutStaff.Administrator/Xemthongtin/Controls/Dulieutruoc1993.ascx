<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dulieutruoc1993.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Dulieutruoc1993" %>
<div class="content">
    <h1 class="title">
        Dữ liệu trước 1993
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Chức danh, chức vụ, ngạch lương, đơn vị công tác
                </td>
                <td>
                    HSL
                </td>
                <td>
                    Phụ cấp
                </td>
                <td>
                    Số tháng
                </td>
                <td>
                    Tổng tiền
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
