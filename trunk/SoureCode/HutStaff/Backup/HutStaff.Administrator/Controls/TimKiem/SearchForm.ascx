<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchForm.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.TimKiem.SearchForm" %>
<form id="formSearch">
<div id="divSearch" class="main blue-bg">
    <table class="table-form">
        <tr>
            <td>
                Đơn vị cấp 1,2,3:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlDonViCha" Width="650px">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="row">
            <td>
                Đơn vị cấp 4:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlDonViCap4" width="650px">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="row">
            <td>
                Mã cán bộ:
            </td>
            <td>
                <asp:TextBox runat="server" ID="macanbo" />
            </td>
        </tr>
        <tr class="row">
            <td>
                Tên cán bộ:
            </td>
            <td>
                <asp:TextBox runat="server" style="width: 300px" ID="hoten" />
            </td>
        </tr>
        <tr class="row">
            <td>
                Giới tính:
            </td>
            <td>
                <asp:CheckBox runat="server" ID="gt_nam" value="1" Text="Nam" />
                
                <asp:CheckBox runat="server" ID="gt_nu" value="0" Text="Nữ"/>
            </td>
        </tr>
        <tr class="row">
            <td>
                Tuổi:
            </td>
            <td>
                Từ
                <asp:TextBox runat="server" style="width: 30px" ID="tuoi_lonhon" />
                Đến
                <asp:TextBox runat="server" style="width: 30px" ID="tuoi_nhohon" />
            </td>
        </tr>
        <tr class="row">
            <td>
                Diện cán bộ:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="dcb" style="width: 200px;">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="row">
            <td>
                Hiện nay:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="hiennay" style="width: 200px;">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="row">
            <td>
                Khối cán bộ:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="khoicanbo" style="width: 200px;">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="row">
            <td>
                Năm về trường:
            </td>
            <td>
                <asp:TextBox runat="server" style="width: 40px" ID="namvetruong" />
                <font size="1"> <i> (Nhỏ nhất: 1956) </i></font>
            </td>
        </tr>
    </table>
    <p align="center">
        <a href="../../Pages/TimKiem/AdvancedSearch.aspx" style="margin-left: 500px;"><font size="+0.5">Trang tìm kiếm mở rộng</font>
        </a>
    </p>
</div>
<a id="lnkSearch" href="javascript:void(0);" class="link-button lnk-search" style="margin-left: 650px;"></a>
</form>
