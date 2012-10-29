<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="HutStaff.Administrator.Controls.QuanLy.Import.TangLuong.View" %>
<h1 class="title">
    Xét nâng lương</h1>
<hr class="fw" />
<br />
<div>
    <form id="formSearch">
    <div>
        <label>
            Loại hạn ngạch:</label>
        <select style="width:85px;" id="ddlLoaiHanNgach">
            <option value="2">2 năm</option>
            <option value="3">3 năm</option>
        </select>
        <label style="margin-left: 15px">
            Lựa chọn bảng:</label>
        <select id="ddlLuaChonBang">
            <option value="1">Danh sách đến hạn nhận lương</option>
            <option value="2">Danh sách xét duyệt 5%</option>
            <option value="2">Danh sách vượt khung</option>
        </select>
        <label style="margin-left: 15px">
            Tính đến:</label>
        <input class="datepicker" value="<%= DateTime.Now.ToString("dd/MM/yyyy") %>" readonly="readonly" type="text" id="txtDate" />
        <input style="margin-left: 15px; font-weight: normal; padding: 0;" type="button"
            id="btnOk" class="button" value="Hiện thông tin" />
    </div>
    </form>
</div>
<div>
    <div class="footer-table2">
        <div class="fl">
            <a class="button-link" href="javascript:void(0);">Xác nhận tăng lương</a><a class="button-link"
                href="javascript:void(0);">Xóa bỏ</a><a class="button-link" href="javascript:void(0);">Tải
                    về</a>
        </div>
        <div class="fr pagerLoad">
        </div>
    </div>
    <div class="main-table">
    </div>
    <div class="footer-table2">
        <div class="fl">
            <a class="button-link" href="javascript:void(0);">Xác nhận tăng lương</a><a class="button-link"
                href="javascript:void(0);">Xóa bỏ</a><a class="button-link" href="javascript:void(0);">Tải
                    về</a>
        </div>
        <div class="fr pagerLoad">
        </div>
    </div>
</div>
<script type="text/javascript">
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
                    thoiGian: $("#txtDate").val()
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val()
                }, false);
        });
    });
</script>
