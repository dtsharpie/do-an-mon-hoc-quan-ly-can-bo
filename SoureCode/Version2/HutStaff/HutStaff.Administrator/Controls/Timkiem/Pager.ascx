<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.Timkiem.Pager" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="Pager1" runat="server" />
<script type="text/javascript">
    $(document).ready(function () {
        var totalItem = parseInt("<%= iCount %>");
        var pageIndex = parseInt("<%= iPageIndex %>");
        var pageSize = parseInt("<%= iPageSize %>");
        var info = "-  Hiển thị " + (totalItem > 0 ? ((pageIndex - 1) * pageSize + 1) : 0).toString() + " đến " + ((pageSize * pageIndex < totalItem) ? pageSize * pageIndex : totalItem).toString() + " trên " + totalItem.toString() + " kết quả tìm được";
        $(".info").html(info);

        $(".pagerLoad .paging span").click(function () {
            if ($("#minage").val() != "" && parseInt($("#minage").val()) < 20) {
                alert("Tuổi nhỏ nhất cho phép là 20!");
                $("#minage").focus();
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
                    deletes: deletes.join(","),
                    pi: getPager($(this).find("a").attr("href"))
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
                    pi: getPager($(this).find("a").attr("href"))
                }, false);
        });

        $(".pagerLoad .paging a").click(function () {
            if ($("#minage").val() != "" && parseInt($("#minage").val()) < 20) {
                alert("Tuổi nhỏ nhất cho phép là 20!");
                $("#minage").focus();
                return false;
            }

            if ($("#maxage").val() != "" && parseInt($("#maxage").val()) > 120) {
                alert("Tuổi lớn nhất cho phép là 120!");
                $("#maxage").focus();
                return false;
            }

            if ($("#txtNamVeTruong").val() != "" && parseInt($("#txtNamVeTruong").val()) < 1956) {
                alert("Năm về trường phải từ 1956");
                $("#txtNamVeTruong").focus();
                return false;
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
                    deletes: deletes.join(","),
                    pi: getPager($(this).attr("href"))
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
                    pi: getPager($(this).attr("href"))
                }, false);

            return false;
        });
    });
</script>
