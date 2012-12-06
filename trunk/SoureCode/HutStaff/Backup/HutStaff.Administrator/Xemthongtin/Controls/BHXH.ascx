<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BHXH.ascx.cs" Inherits="HutStaff.Administrator.Xemthongtin.Controls.BHXH" %>
<div class="content">
    <h1 class="title">
        Thông tin BHXH
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td rowspan="2">
                    Thời gian
                </td>
                <td rowspan="2">
                    Chức danh, chức vụ, ngạch lương và đơn vị công tác
                </td>
                <td rowspan="2">
                    HSL cơ bản
                </td>
                <td rowspan="2">
                    Các khoản phụ cấp
                </td>
                <td rowspan="2">
                    Số tháng đóng bảo hiểm
                </td>
                <td rowspan="2">
                    Phụ cấp thâm niên vượt khung
                </td>
                <td colspan="5">
                    Số tiền đóng BHXH 1 tháng<br />
                    (Lương cơ bản)
                </td>
            </tr>
            <tr class="title">
                <td style="border-top: 2px solid #FFFFFF;">
                    BHXH
                </td>
                <td style="border-top: 2px solid #FFFFFF;">
                    BHYT
                </td>
                <td style="border-top: 2px solid #FFFFFF;">
                    BHTN
                </td>
                <td style="border-top: 2px solid #FFFFFF;">
                    Tổng tiền
                </td>
            </tr>
            <asp:Repeater runat="server" ID="grdData">
                <ItemTemplate>
                    <tr>
                        <td align="center">
                        </td>
                        <td>
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td align="center">
                        </td>
                        <td>
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                        <td align="center">
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
