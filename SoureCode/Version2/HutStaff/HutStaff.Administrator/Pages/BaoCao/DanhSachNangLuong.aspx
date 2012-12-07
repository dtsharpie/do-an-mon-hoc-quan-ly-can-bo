<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachNangLuong.aspx.cs"
    Inherits="HutStaff.Administrator.Pages.BaoCao.DanhSachNangLuong" MasterPageFile="~/Master/Admin.Master" %>

<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function CheckAll(bvalue) {
            $('.cbkitem').attr("checked", bvalue);
        }        
    </script>
    <link href="../../Styles/default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder" ID="content1">
    <div class="content" id="content">
        <form action="" name="myform" method="POST" id="formID">
        <center>
            <table width="100%" height="100%" bordercolor="#111111" border="0" cellspacing="1"
                cellpadding="4" style="border-collapse: collapse">
                <tbody>
                    <tr>
                        <td valign="top" align="center" class="bodyline">
                            <br />
                            <h2>
                                BÁO CÁO THỐNG KÊ</h2>
                            <h5>
                                Danh sách cán bộ đến kỳ nâng lương</h5>
                            <br>
                            <br>
                            <asp:Button ID="btnSubmit" runat="server" Text="Xử lý" />
                            <input type="button" onclick="CheckAll(true);" value="Chọn tất cả" />
                            <input type="button" onclick="CheckAll(false);" value="Huỷ chọn tất cả" />
                            <br>
                            <br>
                            <table border="0" width="95%" cellspacing="1" cellpadding="4" class="forumline">
                                <tbody>
                                    <tr>
                                        <th>
                                            Số TT
                                        </th>
                                        <th>
                                            Họ và tên
                                        </th>
                                        <th>
                                            Đơn vị
                                        </th>
                                        <th>
                                            Mã ngạch
                                        </th>
                                        <th>
                                            Bậc lương
                                        </th>
                                        <th>
                                            Lương hưởng từ
                                        </th>
                                        <th>
                                            Nâng
                                        </th>
                                    </tr>
                                    <tr>
                                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
                                            <b>NGẠCH CAO CẤP VÀ TƯƠNG ĐƯƠNG</b>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="Row1">
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Bind("STT")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("hoten")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("dv")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("ma_ngach")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("blcu")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Bind("lht")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <p class="Text">
                                                        <input type="checkbox" class="cbkitem" />
                                                    </p>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                    <tr>
                                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
                                            <b>NGẠCH CHÍNH VÀ TƯƠNG ĐƯƠNG</b>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="Row1">
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Bind("STT")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("hoten")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("dv")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("ma_ngach")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("blcu")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Bind("lht")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <p class="Text">
                                                        <input type="checkbox" class="cbkitem" />
                                                    </p>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <tr>
                                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
                                            <b>NGẠCH CÒN LẠI</b>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="Row1">
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Bind("STT")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("hoten")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("dv")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("ma_ngach")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("blcu")%>'></asp:Label>
                                                </td>
                                                <td class="Row2">
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Bind("lht")%>'></asp:Label>
                                                </td>
                                                <td class="Row1">
                                                    <p class="Text">
                                                        <input type="checkbox" class="cbkitem" />
                                                    </p>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
                            <br>
                            <asp:Button ID="Button1" runat="server" Text="Xử lý" />
                            <input type="button" onclick="CheckAll(true);" value="Chọn tất cả">
                            <input type="button" onclick="CheckAll(false);" value="Huỷ chọn tất cả">
                            <br>
                    &nbsp;
                </tbody>
            </table>
        </center>
        </form>
    </div>
</asp:Content>
