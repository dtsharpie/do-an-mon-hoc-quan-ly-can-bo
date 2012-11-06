<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HutStaff.Administrator.Default" %>

<%@ Register Src="/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-table, .footer-table
        {
            padding: 5px 0;
        }
    </style>
    <script type="text/javascript">
        var deletes = [];
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(0).addClass('active');
            $("#txtName").focus();

            $('#divSearchForm').scrollToFixed({
                marginTop: 0
            });

            $(".form-container #btnOk").click(function () {
                if ($("#minage").val() != "" && parseInt($("#minage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#minage").focus();
                    return;
                }

                if ($("#maxage").val() != "" && parseInt($("#maxage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#maxage").focus();
                    return;
                }

                if ($("#maxage").val() != "" && parseInt($("#maxage").val()) > 120) {
                    alert("Tuổi lớn nhất cho phép là 120!");
                    $("#maxage").focus();
                    return;
                }

                if ($("#txtNamVeTruong").val() != "" && parseInt($("#txtNamVeTruong").val()) < 1956) {
                    alert("Năm về trường phải từ 1956");
                    $("#txtNamVeTruong").focus();
                    return;
                }

                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');

                var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
                var tutuoi = $("#minage").val() != "" ? $("#minage").val() : "-1";
                var dentuoi = $("#maxage").val() != "" ? $("#maxage").val() : "-1";
                var nvtruong = $("#txtNamVeTruong").val() != "" ? $("#txtNamVeTruong").val() : "-1";
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(",")
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(",")
                }, false);
            });

            $(".ddlPageSize").change(function () {
                $(".ddlPageSize").val($(this).val());
            });

            $(".form-container #btnRefresh").click(function () {
                if ($("#minage").val() != "" && parseInt($("#minage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#minage").focus();
                    return;
                }

                if ($("#maxage").val() != "" && parseInt($("#maxage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#maxage").focus();
                    return;
                }

                if ($("#maxage").val() != "" && parseInt($("#maxage").val()) > 120) {
                    alert("Tuổi lớn nhất cho phép là 120!");
                    $("#maxage").focus();
                    return;
                }

                if ($("#txtNamVeTruong").val() != "" && parseInt($("#txtNamVeTruong").val()) < 1956) {
                    alert("Năm về trường phải từ 1956");
                    $("#txtNamVeTruong").focus();
                    return;
                }

                deletes = [];

                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');

                var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
                var tutuoi = $("#minage").val() != "" ? $("#minage").val() : "-1";
                var dentuoi = $("#maxage").val() != "" ? $("#maxage").val() : "-1";
                var nvtruong = $("#txtNamVeTruong").val() != "" ? $("#txtNamVeTruong").val() : "-1";
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(",")
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(",")
                }, false);
            });

            $('.header-table .btnXoa,.footer-table .btnXoa').click(function () {
                $("input:checkbox.chkId:checked").each(function (i) {
                    deletes.push($(this).val());
                });

                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');

                var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
                var tutuoi = $("#minage").val() != "" ? $("#minage").val() : "-1";
                var dentuoi = $("#maxage").val() != "" ? $("#maxage").val() : "-1";
                var nvtruong = $("#txtNamVeTruong").val() != "" ? $("#txtNamVeTruong").val() : "-1";
                loadControl(".pagerLoad",
                {
                    alias: 'pager-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(","),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(","),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, false);
            });

            $(".btnExport").click(function () {
                var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
                var tutuoi = $("#minage").val() != "" ? $("#minage").val() : "-1";
                var dentuoi = $("#maxage").val() != "" ? $("#maxage").val() : "-1";
                var nvtruong = $("#txtNamVeTruong").val() != "" ? $("#txtNamVeTruong").val() : "-1";
                var query = "?type=2&ma_dv=" + ma_dv + "&ten=" + $("#txtName").val() + "&gioitinh=" + $("#ddlGender").val() + "&tutuoi=" + tutuoi + "&dentuoi=" + dentuoi
                         + "&diencb=" + $("#ddlDcb").val() + "&khoicb=" + $("#khoicanbo").val() + "&nvtruong=" + nvtruong + "&delete=" + deletes.join(",");
                window.open("/Services/ExportExcel.ashx" + query, "_blank");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideSearch1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="divSearchForm" class="form-container">
        <label>
            Tên cán bộ</label>
        <input style="width: 125px;" type="text" id="txtName" />
        <label style="margin-left: 5px;">
            Giới tính</label>
        <select id="ddlGender" style="width: 80px;">
            <option value="-1">Tất cả</option>
            <option value="1">Nam</option>
            <option value="0">Nữ</option>
        </select>
        <label style="margin-left: 5px;">
            Diện cán bộ</label>
        <asp:DropDownList runat="server" ID="ddlDcb" Width="130px">
        </asp:DropDownList>
        <label style="margin-left: 5px;">
            Khối cán bộ</label>
        <asp:DropDownList runat="server" ID="khoicanbo" Width="100px">
        </asp:DropDownList>
        <label style="margin-left: 5px;">
            Tuổi Từ</label>
        <input id="minage" onkeypress="return isNumberKey(event)" style="width: 15px;" name="tuoi_lonhon"
            type="text" title="Tuổi thấp nhất là 20" />
        <label style="margin-left: 5px;">
            Đến</label>
        <input id="maxage" onkeypress="return isNumberKey(event)" style="width: 15px;" name="tuoi_nhohon"
            type="text" title="Tuổi lớn nhấn là 120" />
        <label style="margin-left: 5px;">
            Năm về trường</label>
        <input onkeypress="return isNumberKey(event)" id="txtNamVeTruong" runat="server"
            style="width: 35px" title="Nhỏ nhất là 1956" />
        <div style="margin-top: 5px;">
            <input style="font-weight: normal; padding: 0;" type="button" id="btnOk" class="button"
                value="Tìm kiếm" />
            <input style="margin-left: 15px; font-weight: normal; padding: 0;" type="button"
                id="btnRefresh" class="button" value="Làm mới" />
            <span>(Hiện lại những người đã xóa)</span> <span class="info"></span>
        </div>
    </div>
    <div class="table-container">
        <div class="header-table">
            <div>
                <input class="button-link btnTangluong" type="button" value="Gửi email" />
                <input class="button-link btnInsocai" type="button" value="In sổ cái" />
                <input class="button-link btnXoa" type="button" value="Xóa" />
                <input class="button-link btnExport" type="button" value="Tải về" />
            </div>
            <div>
                Hiển thị &nbsp;
                <select class="ddlPageSize" style="width: 60px;">
                    <option value="10">10</option>
                    <option value="25" selected="selected">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>&nbsp; dòng&nbsp;&nbsp;
            </div>
            <div class="pagerLoad fr">
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="main-table">
            <div style="text-align: center;">
                Vui lòng chọn các tùy chọn phía trên và ấn nút "Tìm kiếm</div>
        </div>
        <div class="footer-table">
            <div>
                <input class="button-link btnTangluong" type="button" value="Gửi email" />
                <input class="button-link btnInsocai" type="button" value="In sổ cái" />
                <input class="button-link btnXoa" type="button" value="Xóa" />
                <input class="button-link btnExport" type="button" value="Tải về" />
            </div>
            <div>
                Hiển thị &nbsp;
                <select class="ddlPageSize" style="width: 60px;">
                    <option value="10">10</option>
                    <option value="25" selected="selected">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>&nbsp; dòng&nbsp;&nbsp;
            </div>
            <div class="pagerLoad fr">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
