<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="KhenThuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.KhenThuong" %>

<%@ Register Src="/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var searchCurrenPage = 1;
            var searchTotalPage = parseInt("<%= Pager1.TotalPage %>");
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');

            function loadPage(pageIndex) {
                var pageSize = parseInt(" <%= Pager1.PageSize %>");
                $('.table-result tr.row').not('.hide').addClass('hide');
                for (var i = ((pageIndex - 1) * pageSize); i < (pageIndex * pageSize); i++) {
                    $('.table-result tr.row').eq(i).removeClass('hide');
                }
            }

            function GenPaging() {
                var html = '';
                html += '<span class="first paging_button"><a href="javascript:void(0);" index="1">First</a></span><span class="previous paging_button"><a href="javascript:void(0);">Previous</a></span>';
                if (searchCurrenPage < 4) {
                    if (searchTotalPage > searchCurrenPage) {
                        var range = searchTotalPage - searchCurrenPage;
                        if (range > 2) range = 2;
                        for (var i = 1; i <= searchCurrenPage + range; i++) {
                            if (i == searchCurrenPage)
                                html += '<span class="paging_button active"><a href="javascript:void(0);" title="Current page" index="' + i + '">' + i + '</a></span>';
                            else
                                html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                        }
                        if (searchTotalPage > 3) {
                            html += '<span class="paging_dot">...</span>';
                        }
                    }
                    else {
                        for (var i = 1; i <= searchCurrenPage; i++) {
                            if (i == searchCurrenPage)
                                html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page"  index="' + i + '">' + i + '</a></span>';
                            else
                                html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                        }
                    }
                }
                else if (searchCurrenPage > searchTotalPage - 3) {
                    html += '<span class="paging_dot">...</span>';
                    for (var i = searchTotalPage - 4; i <= searchTotalPage; i++) {
                        if (i != 0) {
                            if (i == searchCurrenPage)
                                html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page" index="' + i + '">' + i + '</a></span>';
                            else
                                html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                        }
                    }
                }
                else {
                    html += '<span class="paging_dot">...</span>';
                    for (var i = searchCurrenPage - 2; i <= searchCurrenPage + 2; i++) {
                        if (i != 0) {
                            if (i == searchCurrenPage)
                                html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page"  index="' + i + '">' + i + '</a></span>';
                            else
                                html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                        }
                    }
                    html += '<span class="paging_dot">...</span>';
                }
                html += '<span class="next paging_button"><a href="javascript:void(0);">Next</a></span> <span class="last paging_button"><a href="javascript:void(0);" index="<%= Pager1.TotalPage %>">Last</a></span>';

                $('.paging').html(html);

                $('.paging_button a').click(function () {
                    if ($(this).parent().hasClass('previous')) {
                        searchCurrenPage--;
                        if (searchCurrenPage < 1)
                            searchCurrenPage = 1;
                        loadPage(searchCurrenPage);
                        GenPaging();
                    } else if ($(this).parent().hasClass('next')) {
                        searchCurrenPage++;
                        if (searchCurrenPage > parseInt($('.paging_button.last a').eq(0).attr('index')))
                            searchCurrenPage = parseInt($('.paging_button.last a').eq(0).attr('index'));
                        loadPage(searchCurrenPage);
                        GenPaging();
                    } else {
                        searchCurrenPage = parseInt($(this).attr('index'));
                        loadPage(searchCurrenPage);
                        GenPaging();
                    }
                });
            }

            $('.paging_button a').click(function () {
                if ($(this).parent().hasClass('previous')) {
                    searchCurrenPage--;
                    if (searchCurrenPage < 1)
                        searchCurrenPage = 1;
                    loadPage(searchCurrenPage);
                } else if ($(this).parent().hasClass('next')) {
                    searchCurrenPage++;
                    if (searchCurrenPage > parseInt($('.paging_button.last').attr('index')))
                        searchCurrenPage = parseInt($('.paging_button.last').attr('index'));
                    loadPage(searchCurrenPage);
                } else {
                    searchCurrenPage = parseInt($(this).attr('index'));
                    loadPage(searchCurrenPage);
                    GenPaging();
                }
            });

            $('.paging_button.first a').click();

            $(".ddlPageSize").change(function () {
                $(".ddlPageSize").val($(this).val());
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1>
        Tìm kiếm thông tin khen thưởng</h1>
    <div id="divSearchForm" class="form-container">
        <label>
            Hình thức khen thưởng:</label>
        <asp:DropDownList ID="ddlHinhThucKhenThuong" runat="server" CssClass="ddl" />
        <label style="margin-left: 40px;">
            Từ năm</label><asp:TextBox ID="tbFrom" runat="server" Width="50px" /><label>
                đến năm</label>
        <asp:TextBox ID="tbTo" runat="server" Width="50px" />
        <br />
        <label>
            Đơn vị:</label>
        <asp:DropDownList ID="ddlUnit123" runat="server" CssClass="ddl">
        </asp:DropDownList>
        <br />
        <label>
            Diện cán bộ:</label>
        <asp:DropDownList ID="ddlDienCanBo" runat="server" CssClass="ddl" />
        <label>
            Khối cán bộ:</label>
        <asp:DropDownList ID="ddlKhoiCb" runat="server" CssClass="ddl">
        </asp:DropDownList>
        <asp:Button runat="server" Style="font-weight: normal; padding: 0;" ID="btnOk" CssClass="button"
            Text="Tìm kiếm" OnClick="btnOk_Click" />
    </div>
    <div class="table-container">
        <div class="header-table">
            <div>
                <asp:Button runat="server" CssClass="button-link btnExport" ID="btnDownload1" Text="Tải về"
                    OnClick="btnDownload1_Click" />
            </div>
            <div>
                Hiển thị &nbsp;
                <select id="ddPs" runat="server" class="ddlPageSize" style="width: 60px;">
                    <option value="10">10</option>
                    <option value="25">25</option>
                    <option value="50" selected="selected">50</option>
                    <option value="100">100</option>
                    <option value="200">200</option>
                    <option value="300">300</option>
                </select>&nbsp; dòng&nbsp;&nbsp; <span runat="server" id="spInfo1" class="info">
                </span>
            </div>
            <div runat="server" id="divPager" class="pagerLoad fr">
                <uc2:Pager Visible="false" ID="Pager1" runat="server" />
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="main-table">
            <div runat="server" id="divEmpty" style="text-align: center;">
                Vui lòng chọn các tùy chọn phía trên và ấn nút "Tìm kiếm</div>
            <asp:GridView ShowHeaderWhenEmpty="false" ID="grdData" runat="server" AutoGenerateColumns="False"
                Height="20px" Width="100%" CssClass="table-result">
                <AlternatingRowStyle CssClass="row even hide" />
                <RowStyle CssClass="row hide" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Họ tên" ControlStyle-Width="400px">
                        <ItemTemplate>
                            <a href="javascript:void(0)" onclick="showUrl('/Pages/Timkiem/ThongTinChiTiet.aspx?id=<%# Eval("shcc") %>','<%# Eval("hoten") %>')"
                                shcc="<%# Eval("shcc") %>">
                                <%# Eval("hodem").ToString() + " " + Eval("ten")%></a>
                        </ItemTemplate>
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số hiệu">
                        <ItemTemplate>
                            <%# Eval("shcc") %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn vị">
                        <ItemTemplate>
                            <%# Eval("dv") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hình thức khen thưởng">
                        <ItemTemplate>
                            <%# Eval("kt") %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Năm khen thưởng">
                        <ItemTemplate>
                            <%# Eval("nkt_qtkt") == DBNull.Value ? "" : Convert.ToDateTime(Eval("nkt_qtkt")).Year.ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="footer-table">
            <div>
                <asp:Button runat="server" CssClass="button-link btnExport" ID="btnDownload2" Text="Tải về"
                    OnClick="btnDownload2_Click" />
            </div>
            <div>
                Hiển thị &nbsp;
                <select class="ddlPageSize" style="width: 60px;">
                    <option value="10">10</option>
                    <option value="25">25</option>
                    <option value="50" selected="selected">50</option>
                    <option value="100">100</option>
                    <option value="200">200</option>
                    <option value="300">300</option>
                </select>&nbsp; dòng&nbsp;&nbsp;<span runat="server" id="spInfo2" class="info"></span>
            </div>
            <div class="pagerLoad fr">
                <uc2:Pager Visible="false" ID="Pager2" runat="server" />
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
