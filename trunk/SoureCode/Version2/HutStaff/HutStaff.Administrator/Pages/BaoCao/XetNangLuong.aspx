<%@ Page Title="" Language="C#" MasterPageFile="/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="XetNangLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.XetNangLuong" %>

<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');

            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: 'dd/mm/yy',
                yearRange: "1990:2020"
            });

            $("#formSearch").submit(function () {
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 400px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerdata",
                {
                    alias: 'pager-danh-sach-can-bo',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    ps: 10000,
                    pi: 1
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-can-bo',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    ps: 10000,
                    pi: 1
                }, false);
                return false;
            });
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
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Xét nâng lương</h1>
        <hr width="700px" />
        <br />
        <div>
            <form id="formSearch">
            <div>
                <label>
                    Loại hạn ngạch:</label>
                <select id="ddlLoaiHanNgach">
                    <option value="2">2 năm</option>
                    <option value="3">3 năm</option>
                </select>
            </div>
            <div>
                <label>
                    Lựa chọn bảng:</label>
                <select id="ddlLuaChonBang">
                    <option value="1">Danh sách đến hạn nhận lương</option>
                    <option value="2">Danh sách xét duyệt 5%</option>
                    <option value="2">Danh sách vượt khung</option>
                </select>
            </div>
            <div>
                <label>
                    Tính đến:</label>
                <input class="datepicker" type="text" id="txtDate" />
            </div>
            <input type="submit" id="btnOk" value="OK" />
            </form>
        </div>
        <div>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Duyệt / Không duyệt</a>
                </div>
                <div class="right pagerdata">
                </div>
            </div>
            <div class="main-table">
            </div>
            <div class="footer-table">
                <div class="left">
                    <a target="_blank" href="javascript:void(0);" class="link-tool left">Duyệt / Không duyệt</a>
                </div>
                <div class="right pagerdata">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
