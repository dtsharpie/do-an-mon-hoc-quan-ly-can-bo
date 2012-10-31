<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Tanngluong.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Xetduyet.Tanngluong" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy" TagPrefix="uc1" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var deletes = [];
        $(document).ready(function () {
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
                return false;
            });

            $(".btnExport").click(function () {
                var query = "?type=1&loaihanngach=" + $('#ddlLoaiHanNgach').val() + "&loaibang=" + $('#ddlLuaChonBang').val() + "&thoigian=" + $("#txtDate").val() + "&delete=" + deletes.join(",");
                window.open("/Services/ExportExcel.ashx" + query, "_blank");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy ID="SlideQuanLy1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1 class="title">
        Xét nâng lương</h1>
    <hr class="fw" />
    <br />
    <div class="form-container">
        <div>
            <label>
                Loại hạn ngạch:</label>
            <select style="width: 85px;" id="ddlLoaiHanNgach">
                <option value="2">2 năm</option>
                <option value="3">3 năm</option>
            </select>
            <label style="margin-left: 15px">
                Lựa chọn bảng:</label>
            <select id="ddlLuaChonBang">
                <option value="1">Danh sách đến hạn nhận lương</option>
                <option value="2">Danh sách xét duyệt 5%</option>
                <option value="3">Danh sách vượt khung</option>
            </select>
            <label style="margin-left: 15px">
                Tính đến:</label>
            <input style="text-align: center; width: 80px;" class="datepicker" value="<%= DateTime.Now.ToString("dd/MM/yyyy") %>"
                readonly="readonly" type="text" id="txtDate" />
            <input style="margin-left: 15px; font-weight: normal; padding: 0;" type="button"
                id="btnOk" class="button" value="Hiện thông tin" />
            <input style="margin-left: 15px; font-weight: normal; padding: 0;" type="button"
                id="btnRefresh" class="button" value="Làm mới" />
            <span>(Hiện lại những người đã xóa)</span>
        </div>
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
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="main-table">
            <div style="text-align: center;">
                Vui lòng chọn các tùy chọn phía trên và ấn nút "Hiện thông tin"</div>
        </div>
        <div class="footer-table">
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
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
