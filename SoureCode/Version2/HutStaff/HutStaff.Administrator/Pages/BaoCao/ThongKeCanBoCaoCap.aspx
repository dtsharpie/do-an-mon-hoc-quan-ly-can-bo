<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongKeCanBoCaoCap.aspx.cs"
    Inherits="HutStaff.Administrator.Pages.BaoCao.ThongKeCanBoCaoCap" MasterPageFile="~/Master/Admin.Master" %>

<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
    <style type="text/css">
        .button
        {
            margin-left: 650px;
        }
        .timkiem
        {
            background-color: Green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="content" id="content">
        <br />
        <h1>
            Thống kê khen thưởng</h1>
        <hr width="750px" />
        <table cellspacing="1" cellpadding="4" border="0" class="forumline report-table">
            <tbody>
                <tr>
                    <th class="thHead" height="55" align="center" colspan="3">
                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td class="row1" colspan="3" style="line-height: 20px;">
                        <span class="p-title">Chọn đơn vị lập báo cáo</span> &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlDonVi" size="1" runat="server" CssClass="ddl" />
                    </td>
                </tr>
                <tr>
                    <td class="row2" align="left" valign="top">
                        <span class="p-title">Diện cán bộ</span>
                        <br />
                        <asp:CheckBoxList ID="chkboxDienCanBo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="row1">
                        Năm làm báo cáo
                    </td>
                    <td class="row2">
                        <asp:TextBox ID="txtNamBaoCao" runat="server" Text="" MaxLength="4" CssClass="textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="row1">
                        Tháng thay đổi mức lương cơ bản
                    </td>
                    <td class="row2">
                        <asp:TextBox ID="txtThayDoiLuongCoBan" runat="server" Value="" MaxLength="2" CssClass="textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="row1">
                        Mức lương cơ bản cũ
                    </td>
                    <td class="row2">
                        <asp:TextBox ID="txtLuongCoBanCu" runat="server" Value="" MaxLength="10" CssClass="textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="row1">
                        Mức lương cơ bản mới
                    </td>
                    <td class="row2">
                        <asp:TextBox ID="txtLuongCoBanMoi" runat="server" Value="" MaxLength="10" CssClass="textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="row1" colspan="2" align="center">
                        <asp:Button runat="server" Text="Xuất báo cáo để tải về máy" ID="btnXuat" OnClick="btnXuat_Click" />
                        <asp:Button runat="server" Text="Xem trước báo cáo" ID="btnXem" OnClick="btnXem_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
