<%@ Page Title="" Language="C#" MasterPageFile="/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="XetNangLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.XetNangLuong" %>

<%--<%@ Register Src="~/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>--%>
<%@ Register Src="~/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var deletes = [];
        $(document).ready(function () {
            $('.form-container').scrollToFixed({
                marginTop: 0
            });

            $('.header-table').scrollToFixed({
                marginTop: 35
            });
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: 'dd/mm/yy',
                yearRange: "2000:2030"
            });

            $("#btnOk").click(function () {
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    deletes: deletes.join(","),
                    thoiGian: $("#txtDate").val(),
                    ps: $(".ddlPageSize").val()
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val()
                }, false);
            });

            $(".ddlPageSize").change(function () {
                $(".ddlPageSize").val($(this).val());
            });

            $(".form-container #btnRefresh").click(function () {
                deletes = [];
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(".paging .active").find("a").attr("href").replace("page", "")
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(".paging .active").find("a").attr("href").replace("page", "")
                }, false);
            });

            $(".pagerLoad .paging span").live("click", function () {
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(this).find("a").attr("href").replace("page", "")
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(this).find("a").attr("href").replace("page", "")
                }, false);
            });

            $(".pagerLoad .paging a").live("click", function () {
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(this).attr("href").replace("page", "")
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: $(this).attr("href").replace("page", "")
                }, false);
                return false;
            });

            $(".btnExport").click(function () {
                var query = "?type=1&loaihanngach=" + $('#ddlLoaiHanNgach').val() + "&loaibang=" + $('#ddlLuaChonBang').val() + "&thoigian=" + $("#txtDate").val() + "&delete=" + deletes.join(",");
                window.open("/Services/ExportExcel.ashx" + query, "_blank");
            });
        });
        function btnOk_onclick() {

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Xét nâng lương</h1>
        <hr class="fw" />
        <br />
        <div class="form-container">
            <table border="0">
                <tr>
                    <td>
                        <p>
                            <label>
                                Loại hạn ngạch:</label>
                        </p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLoaiHanNgach" runat="server">
                            <asp:ListItem Value="2">2 năm</asp:ListItem>
                            <asp:ListItem Value="3">3 năm</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <label style="margin-left: 0px">
                                Lựa chọn bảng:</label>
                        </p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLuaChonBang" runat="server">
                            <asp:ListItem Value="1">Danh sách đến hạn nhận lương</asp:ListItem>
                            <asp:ListItem Value="2">Danh sách xét duyệt 5%</asp:ListItem>
                            <asp:ListItem Value="3">Danh sách vượt khung</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <label style="margin-left: 15px">
                                Tính đến:</label>
                            (tháng / năm) &nbsp;&nbsp;&nbsp;&nbsp;</p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlThoiHan" runat="server">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtNam" runat="server">2012</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnOk" runat="server" Text="Hiện thông tin" OnClick="btnOk_Click" Width="91px" />
                    </td>
                    <td><div style="text-align: center;">
                    Vui lòng chọn các tùy chọn phía trên và ấn nút "Hiện thông tin"</div>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <br />
            <br />
            <asp:Button ID="btnDownload" runat="server" Text="Xuất báo cáo" OnClick="btnDownload_Click"
                Visible="False" />
            <br />
            <asp:Label ID="lblHeader" runat="server" Visible="False"></asp:Label>
        </div>
        <div class="table-container">
            <div class="header-table">
                <div>
                    <input class="button-link btnTangluong" type="button" value="Tăng lương" />
                    <input class="button-link btnXoa" type="button" value="Xóa" />
                    <input class="button-link btnExport" type="button" value="Tải về" />
                </div>
                <div>
                    Hiển thị &nbsp;
                    <select class="ddlPageSize" style="width: 60px;">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50" selected="selected">50</option>
                        <option value="100">100</option>
                    </select>&nbsp; dòng&nbsp;&nbsp;<span class="info"></span>
                </div>
                <div class="pagerLoad fr">
                    <div runat="server" id="div1" class="pagerLoad fr">
                        <uc2:Pager Visible="false" ID="Pager2" runat="server" />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="main-table">
                
                <br />
                <asp:GridView ID="gvResultSearch" runat="server" CssClass="table-result" Width="100%"
                    PageSize="40" BackColor="White" BorderColor="#3366CC" BorderStyle="Groove" BorderWidth="2px"
                    CellPadding="4" AllowPaging="True" OnPageIndexChanging="gvResultSearch_PageIndexChanging">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
            <div class="nodata" class="footer-table">
                <div>
                    <input class="button-link btnTangluong" type="button" value="Tăng lương" />
                    <input class="button-link btnXoa" type="button" value="Xóa" />
                    <input class="button-link btnExport" type="button" value="Tải về" />
                </div>
                <div>
                    Hiển thị &nbsp;
                    <select class="ddlPageSize" style="width: 60px;">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50" selected="selected">50</option>
                        <option value="100">100</option>
                    </select>&nbsp; dòng&nbsp;&nbsp;<span class="info"></span>
                </div>
                <div runat="server" id="divPager" class="pagerLoad fr">
                    <uc2:Pager Visible="false" ID="Pager1" runat="server" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
