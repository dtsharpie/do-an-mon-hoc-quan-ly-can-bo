<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="KhenThuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.KhenThuong" %>

<%@ Register Src="~/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
            $(".ddl").chosen({ no_results_text: "Không có kết quả phù hợp" });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
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
            Đơn vị cấp 1,2,3:</label>
        <asp:DropDownList ID="ddlUnit123" runat="server" CssClass="ddl">
        </asp:DropDownList>
        <br />
        <label>
            Đơn vị cấp 4:
        </label>
        <asp:DropDownList ID="ddlUnit4" runat="server" CssClass="ddl">
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
