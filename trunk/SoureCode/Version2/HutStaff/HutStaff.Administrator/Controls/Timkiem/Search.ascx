<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="HutStaff.Administrator.Controls.Timkiem.Search" %>
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
                    <%# Eval("hoten") %></a>
            </ItemTemplate>
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
                <%# Eval("email") %>
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

       

        $(".delete-row").click(function () {
            $(this).closest("tr").remove();
            deletes.push($(this).attr("shcc"));

            $('.main-table').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 500px;"><img src="/images/processing.gif" /></td></tr></table>');

            var ma_dv = $(".cb-tree:checked").length > 0 ? $(".cb-tree:checked").attr("code") : "0";
            var tutuoi = $("#minage").val() != "" ? $("#minage").val() : "-1";
            var dentuoi = $("#maxage").val() != "" ? $("#maxage").val() : "-1";
            var nvtruong = $("#txtNamVeTruong").val() != "" ? $("#txtNamVeTruong").val() : "-1";
            loadControl(".pagerLoad",
                {
                    alias: 'pager-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(","),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, true);


            loadControl(".main-table",
                {
                    alias: 'danh-sach-tim-kiem',
                    ma_dv: ma_dv,
                    ten: $("#txtName").val(),
                    gioitinh: $("#ddlGender").val(),
                    tuTuoi: tutuoi,
                    denTuoi: dentuoi,
                    diencb: $("#ddlDcb").val(),
                    khoicb: $("#khoicanbo").val(),
                    nvtruong: nvtruong,
                    ps: $(".ddlPageSize").val(),
                    deletes: deletes.join(","),
                    pi: getPager($(".paging .active").find("a").attr("href"))
                }, false);
        });
    });
</script>
