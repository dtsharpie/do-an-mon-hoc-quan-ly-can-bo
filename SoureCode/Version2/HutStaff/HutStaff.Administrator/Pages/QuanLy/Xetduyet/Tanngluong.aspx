<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Tanngluong.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Xetduyet.Tanngluong" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagName="SlideQuanLy"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </div>
</div>
<div class="table-container">
    <div class="header-table">
        <div>
            Hiển thị &nbsp;
            <select style="width: 60px;">
                <option selected="selected" value="10">10</option>
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;Đang hiện 1 đến 10 trên 51 kết quả
            tìm được
        </div>
        <div class="paging fr">
            <span class="first paging_button">First</span> <span class="previous paging_button disable">
                Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                    2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                    <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
            <span class="last paging_button">Last</span>
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
            Hiển thị &nbsp;
            <select style="width: 60px;">
                <option selected="selected" value="10">10</option>
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;Đang hiện 1 đến 10 trên 51 kết quả
            tìm được
        </div>
        <div class="paging fr">
            <span class="first paging_button">First</span> <span class="previous paging_button disable">
                Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                    2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                    <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
            <span class="last paging_button">Last</span>
        </div>
        <div class="clear">
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

        $(".export-excel").click(function () {
            var query = "?type=1&loaihanngach=" + $('#ddlLoaiHanNgach').val() + "&loaibang=" + $('#ddlLuaChonBang').val() + "&thoigian=" + $("#txtDate").val() + "&delete=";
            window.open("/Services/ExportExcel.ashx" + query, "_blank");
        });
    });
</script>

</asp:Content>
