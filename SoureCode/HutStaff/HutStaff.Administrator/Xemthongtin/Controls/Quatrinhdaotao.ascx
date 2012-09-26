<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quatrinhdaotao.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Quatrinhdaotao" %>
<div class="content">
    <h1 class="title">
       Quá trình đào tạo
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Văn bằng
                </td>
                <td>
                    Chuyên ngành
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
