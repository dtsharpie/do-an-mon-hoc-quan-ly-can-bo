﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Duyethuyhoso.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.Duyethuyhoso" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var searchCurrenPage = 1;
            var searchTotalPage = parseInt("<%= Pager1.TotalPage %>");
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');

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

            $(".delete-row").click(function () {
                if ($(this).attr("userid") == "<%= iUserId %>") {
                    alert("Bạn không được phép xóa người dùng do mình yêu cầu!")
                    return;
                }
                if (confirm("Bạn có chắc chắn muốn xóa?")) {
                    execution({ _fn: "HutStaff.BO.PagesBO.QuanLy.Huyhoso.Xoa", shcc: $(this).attr("shcc") }, false);
                    var sdeletes = $("#<%= hdDeletes.ClientID %>").val();
                    if (sdeletes != '') {
                        $("#<%= hdDeletes.ClientID %>").val(sdeletes + "," + $(this).attr("shcc"));
                    }
                    else {
                        $("#<%= hdDeletes.ClientID %>").val($(this).attr("shcc"));
                    }
                    $(this).closest("tr").remove();
                    $(".table-result tr").not(':first').each(function (i) {
                        $(this).find("td").first().text(i + 1);
                    });
                }
            });

            $(".btnXoa").click(function () {
                if (confirm("Gửi yêu cầu xóa ?")) {
                    var results = [];
                    $("input:checkbox.chkId:checked").each(function (i) {
                        if ($(this).attr("userid") == "<%= iUserId %>") {
                            alert("Bạn không được phép xóa người dùng do mình yêu cầu!");
                            return;
                        }
                    });

                    $("input:checkbox.chkId:checked").each(function (i) {
                        results[i] = $(this).val();
                        $(this).closest("tr").remove();
                    });

                    if (results.length > 0) {
                        var sdeletes = results.join(",");
                        if ($("#<%= hdDeletes.ClientID %>").val() != '') {
                            $("#<%= hdDeletes.ClientID %>").val(sdeletes + "," + $("#<%= hdDeletes.ClientID %>").val());
                        }
                        else {
                            $("#<%= hdDeletes.ClientID %>").val(sdeletes);
                        }

                        $(".table-result tr").not(':first').each(function (i) {
                            $(this).find("td").first().text(i + 1);
                        });

                        execution({ _fn: 'HutStaff.BO.PagesBO.QuanLy.Huyhoso.Xoas',
                            shccs: results.join(",")
                        }, false);
                    }
                    else {
                        alert('Bạn phải chọn mục cần xóa!');
                    }
                }
            });


            $(".undelete-row").click(function () {
                if (confirm("Bạn có chắc chắn hủy yêu cầu xóa?")) {
                    execution({ _fn: "HutStaff.BO.PagesBO.QuanLy.Huyhoso.KhongXoa", shcc: $(this).attr("shcc") }, false);
                    $(this).closest("tr").remove();
                    $("#<%= hdDeletes %>").val($("#<%= hdDeletes %>").val() + "," + $(this).val());
                    $(".table-result tr").not(':first').each(function (i) {
                        $(this).find("td").first().text(i + 1);
                    });
                }
            });

            $(".btnKhongXoa").click(function () {
                if (confirm("Bạn chắc chắn xóa ?")) {
                    var results = [];
                    $("input:checkbox.chkId:checked").each(function (i) {
                        $("#<%= hdDeletes %>").val($("#<%= hdDeletes %>").val() + "," + $(this).val());
                        results[i] = $(this).val();
                        $(this).closest("tr").remove();
                    });

                    if (results.length > 0) {
                        $(".table-result tr").not(':first').each(function (i) {
                            $(this).find("td").first().text(i + 1);
                        });

                        execution({ _fn: 'HutStaff.BO.PagesBO.QuanLy.Huyhoso.KhongXoas',
                            shccs: results.join(",")
                        }, false);
                    }
                    else {
                        alert('Bạn phải chọn mục cần xóa!');
                    }
                }
            });

            $(".restore-row").click(function () {
                if (confirm("Bạn có chắc chắn muốn khôi phục?")) {
                    execution({ _fn: "HutStaff.BO.PagesBO.QuanLy.Huyhoso.KhoiPhuc", shcc: $(this).attr("shcc") }, false);
                    $(this).closest("tr").remove();
                    $("#<%= hdDeletes %>").val($("#<%= hdDeletes %>").val() + "," + $(this).val());
                    $(".table-result tr").not(':first').each(function (i) {
                        $(this).find("td").first().text(i + 1);
                    });
                }
            });

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

            $('#chkAll').change(function () {
                selectAll($(this));
            });
        });
    </script>
    <style type="text/css">
    .<%= GenStyle() %>
    {
        display: none;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
    <asp:HiddenField ID="hdDeletes" runat="server" Value="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="divSearchForm" class="form-container">
        <label>
            Danh sánh</label>
        <asp:DropDownList Width="100px" ID="ddlTrangthai" runat="server">
            <asp:ListItem Value="0" Text="Đợi hủy"></asp:ListItem>
            <asp:ListItem Value="1" Text="Đã hủy"></asp:ListItem>
        </asp:DropDownList>
        <label>
            Tìm kiếm theo tên</label>
        <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
        <asp:Button runat="server" Style="font-weight: normal; padding: 0;" ID="btnOk" CssClass="button"
            Text="Tìm kiếm" OnClick="btnOk_Click" />
    </div>
    <div class="table-container">
        <div class="header-table">
            <div>
                &nbsp;
                <input class="button-link btnXoa hosodoihuy" type="button" value="Xóa" />
                <input class="button-link btnKhongXoa hosodoihuy" type="button" value="Không xóa" />
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
                Không có dữ liệu</div>
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
                                <%# Eval("hoten") %></a>
                        </ItemTemplate>
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số hiệu">
                        <ItemTemplate>
                            <%# Eval("shcc") %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn vị">
                        <ItemTemplate>
                            <%# Eval("dv") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="hosodoihuy" HeaderStyle-CssClass="hosodoihuy"
                        HeaderText="Người yêu cầu">
                        <ItemTemplate>
                            <label class="nguoiyeucau" id="<%# Eval("userId") %>">
                                <%# Eval("userName") %></label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-CssClass="hosodoihuy" HeaderStyle-CssClass="hosodoihuy"
                        HeaderText="Ngày yêu cầu">
                        <ItemTemplate>
                            <%# Eval("ngayyeucau") != DBNull.Value ? Convert.ToDateTime(Eval("ngayyeucau")).ToString("dd/MM/yyyy") : ""%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-CssClass="hosodahuy" HeaderStyle-CssClass="hosodahuy"
                        HeaderText="Người duyệt">
                        <ItemTemplate>
                            <label class="nguoiduyet" id="<%# Eval("nguoiduyetid") %>">
                                <%# Eval("nguoiduyetname")%></label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="hosodahuy" HeaderStyle-CssClass="hosodahuy"
                        HeaderText="Ngày duyệt">
                        <ItemTemplate>
                            <%# Eval("ngayduyet") != DBNull.Value ? Convert.ToDateTime(Eval("ngayduyet")).ToString("dd/MM/yyyy") : ""%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input id="chkAll" name="firstColumn" type="checkbox" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input userid="<%# Eval("userId") %>" shcc="chkFirstColumn<%# Eval("shcc") %>" class="chkId"
                                name="firstColumn" type="checkbox" value="<%# Eval("shcc") %>" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="hosodoihuy" HeaderStyle-CssClass="hosodoihuy"
                        HeaderText="Xóa">
                        <ItemTemplate>
                            <a href="javascript:void(0)" userid="<%# Eval("userId") %>" class="delete-row" shcc="<%# Eval("shcc") %>">
                                Xóa </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="hosodoihuy" HeaderStyle-CssClass="hosodoihuy"
                        HeaderText="Không xóa">
                        <ItemTemplate>
                            <a href="javascript:void(0)" class="undelete-row" shcc="<%# Eval("shcc") %>">Không xóa
                            </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="hosodahuy" ItemStyle-CssClass="hosodahuy"
                        HeaderText="Khôi phục">
                        <ItemTemplate>
                            <a href="javascript:void(0)" class="restore-row" shcc="<%# Eval("shcc") %>">Khôi phục</a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="footer-table">
            <div>
                &nbsp;
                <input class="button-link btnXoa hosodoihuy" type="button" value="Xóa" />
                <input class="button-link btnKhongXoa hosodoihuy" type="button" value="Không xóa" />
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
