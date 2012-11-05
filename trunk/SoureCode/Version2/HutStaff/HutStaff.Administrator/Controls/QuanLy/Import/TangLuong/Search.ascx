<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="HutStaff.Administrator.Controls.QuanLy.Import.TangLuong.Search" %>
<asp:GridView ID="grdData" runat="server" AutoGenerateColumns="False" Height="20px"
    Width="100%" CssClass="table-result">
    <AlternatingRowStyle CssClass="even" />
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
                <%# Container.DisplayIndex + 1 + PageSize * (PageIndex - 1) %>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Họ tên">
            <ItemTemplate>
                <a href="javascript:void(0)" shcc="<%# Eval("shcc") %>">
                    <%# Eval("hodem").ToString() + " " + Eval("ten") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số hiệu">
            <ItemTemplate>
                <%# Eval("shcc") %></ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bậc lương">
            <ItemTemplate>
                <%# Eval("bl_dbl") %>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hệ số lương">
            <ItemTemplate>
                <%# Eval("hsl") %></ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mã ngạch">
            <ItemTemplate>
                <%# Eval("ma_ngach")%></ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian bắt đầu">
            <ItemTemplate>
                <%# Convert.ToDateTime(Eval("tgbd_dbl")).ToString("dd/MM/yyyy")%>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-CssClass="hspctn" ItemStyle-CssClass="hspctn" HeaderText="Hệ số phụ cấp thâm niên">
            <ItemTemplate>
                <%# Eval("hspctn")%>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thông tin khác">
            <ItemTemplate>
                <%# Eval("ttk_qtdbl")%>
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
            <ItemStyle HorizontalAlign="Center" Width="12px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xóa">
            <ItemTemplate>
                <a href="javascript:void(0)" class="delete-row" shcc="<%# Eval("shcc") %>">Xóa </a>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<script type="text/javascript">
    $(document).ready(function () {
        $('#chkAll').change(function () {
            selectAll($(this));
        });

        if ($("#ddlLuaChonBang").val() != "3") {
            $('.table-result .hspctn').hide();
        }

        $('.header-table .btnXoa,.footer-table .btnXoa').click(function () {
            $("input:checkbox.chkId:checked").each(function (i) {
                deletes.push($(this).val());
            });

            $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
            loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, false);
        });

        $(".delete-row").click(function () {
            $(this).closest("tr").remove();
            deletes.push($(this).attr("shcc"));

            $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');
            loadControl(".pagerLoad",
                {
                    alias: 'pager-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tang-luong',
                    loaiHanNgach: $('#ddlLoaiHanNgach').val(),
                    loaiBang: $('#ddlLuaChonBang').val(),
                    thoiGian: $("#txtDate").val(),
                    deletes: deletes.join(","),
                    ps: $(".ddlPageSize").val(),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, false);
        });
    });
</script>
