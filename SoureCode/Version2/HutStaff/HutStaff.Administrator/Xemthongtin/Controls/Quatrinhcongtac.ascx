<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quatrinhcongtac.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quatrinhcongtac" %>
<div class="content">
    <h1 class="title">
        Quá trình công tác
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Biên chế tại đơn vị/<br />
                    Nơi làm việc
                </td>
                <td>
                    Công việc đảm nhận
                </td>
                <td>
                    Diện cán bộ/<br />
                    Tình trạng công tác
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
