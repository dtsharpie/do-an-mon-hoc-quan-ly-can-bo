<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Import.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Import" %>
<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<%@ Register Src="/Controls/QuanLy/Import/Search.ascx" TagName="Search" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").submit(function () {
                $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 400px;"><img src="/images/processing.gif" /></td></tr></table>');
                loadControl(".pagerdata",
                {
                    alias: 'pager-danh-sach-can-bo',
                    keyword: $('#txtKeyword').val(),
                    xoahs: 0
                }, true);


                loadControl(".main-table",
                {
                    alias: 'danh-sach-can-bo',
                    keyword: $('#txtKeyword').val(),
                    xoahs: 0
                }, false);
                return false;
            });
        });
    </script>
    <style type="text/css">
        .main
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Import dữ liệu</h1>
        <hr width="750px" />
        <br />
        <div>
            <input type="button" id="btnLuong" value="Lương" class="button-blue active" />
            <input type="button" id="btnKhen" value="Khen thưởng" class="button-blue" />
            <input type="button" id="btnBHXH" value="Sổ BHXH" class="button-blue" />
        </div>
        <br />
        <div class="main clear">
            <form action="" id="formSearch">
            <div class="filterBox">
                <table>
                    <tr>
                        <td style="width: 60px">
                            Tìm kiếm
                        </td>
                        <td>
                            <input type="text" id="txtKeyword" class="textbox" />
                        </td>
                        <td>
                            <input type="submit" id="btnSearch" class="button" value="Tìm kiếm" />
                        </td>
                    </tr>
                </table>
            </div>
            </form>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('.button-blue').click(function () {
                $('.button-blue').removeClass('active');
                $(this).addClass('active');
            });
        });
    </script>
</asp:Content>
