<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.QuanLy.Import.TangLuong.Pager" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="Pager1" runat="server" />
<script type="text/javascript">
    $(document).ready(function () {
        var totalItem = parseInt("<%= iCount %>");
        var pageIndex = parseInt("<%= iPageIndex %>");
        var pageSize = parseInt("<%= iPageSize %>");
        var info = "-  Hiển thị " + (totalItem > 0 ? ((pageIndex - 1) * pageSize + 1) : 0).toString() + " đến " + ((pageSize * pageIndex < totalItem) ? pageSize * pageIndex : totalItem).toString() + " trên " + totalItem.toString() + " kết quả tìm được";
        $(".table-container .info").html(info);

        $(".pagerLoad .paging span").click(function () {
            $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
            loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(this).find("a").attr("href"))
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(this).find("a").attr("href"))
                }, false);
        });

        $(".pagerLoad .paging a").click(function () {
            $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
            loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(this).attr("href"))
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(this).attr("href"))
                }, false);
            return false;
        });
    });
</script>
