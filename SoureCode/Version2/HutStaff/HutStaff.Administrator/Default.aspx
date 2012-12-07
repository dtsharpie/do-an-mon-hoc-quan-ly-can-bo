<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HutStaff.Administrator.Default" %>

<%@ Register Src="/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var CKEDITOR_BASEPATH = '/Scripts/ckeditor/';
    </script>
    <script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="/Scripts/ckeditor/adapters/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var searchCurrenPage = 1;
            var searchTotalPage = parseInt("<%= Pager1.TotalPage %>");
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(0).addClass('active');

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
                if (confirm("Gửi yêu cầu xóa ?")) {
                    execution({ _fn: "HutStaff.BO.PagesBO.TimKiem.SearchBO.Huyhoso_Insert", shcc: $(this).attr("shcc") }, false);
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

                        execution({ _fn: 'HutStaff.BO.PagesBO.TimKiem.SearchBO.Huyhoso_Inserts',
                            shccs: results.join(",")
                        }, false);
                    }
                    else {
                        alert('Bạn phải chọn mục cần xóa!');
                    }
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


            $('#divSearchForm').scrollToFixed({
                marginTop: 0
            });

            $(".ddlPageSize").change(function () {
                $(".ddlPageSize").val($(this).val());
            });

            $('#chkAll').change(function () {
                selectAll($(this));
            });

            $("#<%= btnOk %>").click(function () {
                if ($("#<%= minage.ClientID %>").val() != "" && parseInt($("#minage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#<%= minage.ClientID %>").focus();
                    return false;
                }

                if ($("#<%= maxage.ClientID %>").val() != "" && parseInt($("#maxage").val()) < 20) {
                    alert("Tuổi nhỏ nhất cho phép là 20!");
                    $("#<%= maxage.ClientID %>").focus();
                    return false;
                }

                if ($("#<%= maxage.ClientID %>").val() != "" && parseInt($("#maxage").val()) > 120) {
                    alert("Tuổi lớn nhất cho phép là 120!");
                    $("#<%= maxage.ClientID %>").focus();
                    return false;
                }

                if ($("#<%= txtNamVeTruong.ClientID %>").val() != "" && parseInt($("#txtNamVeTruong").val()) < 1956) {
                    alert("Năm về trường phải từ 1956");
                    $("#<%= txtNamVeTruong %>").focus();
                    return false;
                }

                var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
                $("<%= hdMadv.ClientID %>").val(ma_dv);
            });

            $('textarea.editor').ckeditor(function (e) {
                delete CKEDITOR.instances[$(e).attr('name')];
            },
    {
        height: 500,
        filebrowserUploadUrl: '/Services/Upload.ashx'
    });

            $(".btnSendEmail").click(function () {
                var lstEmail = [];
                $(".table-result .chkId:checked").each(function () {
                    var shcc = $(this).val();
                    var email = $(".table-result .email[shcc='" + shcc + "']").text().trim();
                    if (email != '' && validateEmail(email)) {
                        lstEmail.push(email);
                    }
                });

                $("#<%= txtReceiver.ClientID %>").val(lstEmail.join(","));
                $("#divSendEmail").fadeToggle("slow", "linear");
                $("#divSearchInfo").fadeToggle("slow", "linear");
                return false;
            });

            $("#btnCancel").click(function () {
                $("#divSearchInfo").fadeToggle("slow", "linear");
                $("#divSendEmail").fadeToggle("slow", "linear");
                return false;
            });

            $("#<%= btnSend.ClientID %>").click(function () {
                $("#spSending").show(0);
                execution({ _fn: "HutStaff.BO.PagesBO.TimKiem.SearchBO.SendEmail",
                    Receiver: $("#<%= txtReceiver.ClientID %>").val(),
                    Title: $("#<%= txtTitle.ClientID %>").val(),
                    Content: encodeURIComponent($("#<%= txtContent.ClientID %>").val())
                }, false);

                return false;
            });
        });
    </script>
    <style type="text/css">
        div.form-container
        {
            padding: 5px 0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideSearch1" runat="server" />
    <asp:HiddenField ID="hdMadv" runat="server" Value="0" />
    <asp:HiddenField ID="hdDeletes" runat="server" Value="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="divSearchInfo">
        <div id="divSearchForm" class="form-container">
            <label>
                Tên cán bộ</label>
            <input runat="server" style="width: 125px;" type="text" id="txtName" />
            <label style="margin-left: 5px;">
                Giới tính</label>
            <select runat="server" id="ddlGender" style="width: 80px;">
                <option value="-1">Tất cả</option>
                <option value="1">Nam</option>
                <option value="0">Nữ</option>
            </select>
            <label style="margin-left: 5px;">
                Diện cán bộ</label>
            <asp:DropDownList runat="server" ID="ddlDcb" Width="120px">
            </asp:DropDownList>
            <label style="margin-left: 5px;">
                Khối cán bộ</label>
            <asp:DropDownList runat="server" ID="khoicanbo" Width="100px">
            </asp:DropDownList>
            <label style="margin-left: 5px;">
                Tuổi Từ</label>
            <input runat="server" id="minage" onkeypress="return isNumberKey(event)" style="width: 15px;"
                name="tuoi_lonhon" type="text" title="Tuổi thấp nhất là 20" />
            <label style="margin-left: 5px;">
                Đến</label>
            <input runat="server" id="maxage" onkeypress="return isNumberKey(event)" style="width: 15px;"
                name="tuoi_nhohon" type="text" title="Tuổi lớn nhấn là 120" />
            <label style="margin-left: 5px;">
                Năm về trường</label>
            <input runat="server" onkeypress="return isNumberKey(event)" id="txtNamVeTruong"
                runat="server" style="width: 35px" title="Nhỏ nhất là 1956" />
            <asp:Button runat="server" Style="font-weight: normal; padding: 0;" ID="btnOk" CssClass="button"
                Text="Tìm kiếm" OnClick="btnOk_Click" />
        </div>
        <div class="table-container">
            <div class="header-table">
                <div>
                    <input class="button-link btnSendEmail" type="button" value="Gửi email" />
                    <input class="button-link btnInsocai" type="button" value="In sổ cái" />
                    <input class="button-link btnXoa" type="button" value="Xóa" />
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
                        <asp:TemplateField HeaderText="Điện thoại">
                            <ItemTemplate>
                                <%# Eval("tel") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <a class="email" shcc="<%# Eval("shcc") %>" href="mailto:<%# Eval("email") %>">
                                    <%# Eval("email") %>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <input id="chkAll" name="firstColumn" type="checkbox" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input shcc="chkFirstColumn<%# Eval("shcc") %>" class="chkId" name="firstColumn"
                                    type="checkbox" value="<%# Eval("shcc") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Xóa">
                            <ItemTemplate>
                                <a href="javascript:void(0)" class="delete-row" shcc="<%# Eval("shcc") %>">Xóa </a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="footer-table">
                <div>
                    <input class="button-link btnSendEmail" type="button" value="Gửi email" />
                    <input class="button-link btnInsocai" type="button" value="In sổ cái" />
                    <input class="button-link btnXoa" type="button" value="Xóa" />
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
    </div>
    <div id="divSendEmail" style="display: none;">
        <div class="detail-edit">
            <div class="subdivEdit">
                <label class="label">
                    Tiêu đề</label>
                <input runat="server" type="text" id="txtTitle" style="width: 98%;" />
            </div>
            <div class="subdivEdit">
                <label class="label">
                    Danh sách người nhận</label>
                <asp:TextBox ID="txtReceiver" runat="server" Width="1038px" Height="180px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <hr style="margin-top: 5px; margin-bottom: 5px; margin-left: 20px;" />
            <div class="subdivEdit" style="margin-top: 15px;">
                <label class="label" style="width: 55px;">
                    Nội dung:</label><span class="inputtip">(Ấn Shift + Enter để xuống dòng, enter để bắt
                        đầu 1 đoạn mới)</span>
                <textarea runat="server" id="txtContent" cols="127" runat="server" rows="50" class="areaContent editor"></textarea>
            </div>
        </div>
        <div style="padding-top: 10px; padding-left: 10px;">
            <asp:Button ID="btnSend" CssClass="button update-user" runat="server" Text="Gửi" />
            &nbsp;
            <input id="btnCancel" type="button" class="button cancel" value="Quay lại" />
            <span id="spSending" style="display: none;">
                <img src="/Images/processing.gif" style="vertical-align: middle;" />Đang gửi</span>
        </div>
    </div>
</asp:Content>
