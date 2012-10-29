<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="HutStaff.Administrator.Controls.QuanLy.Import.TangLuong.Search" %>
<asp:GridView ID="grdData" runat="server" AutoGenerateColumns="False" Height="20px"
    Width="100%" CssClass="table-result">
    <AlternatingRowStyle CssClass="even" />
    <Columns>
        <asp:TemplateField HeaderText="Số thứ tự">
            <ItemTemplate>
                <%# Container.DisplayIndex + 1 + PageSize * (PageIndex - 1) %>
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
        <asp:TemplateField HeaderText="Họ tên">
            <ItemTemplate>
                <a href="javascript:void(0)" shcc="<%# Eval("shcc") %>">
                    <%# Eval("hodem").ToString() + " " + Eval("ten") %></a>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số hiệu">
            <ItemTemplate>
                <%# Eval("shcc") %></ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Diễn biến lương">
            <ItemTemplate>
                <%# Eval("bl_dbl") %>
            </ItemTemplate>
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
        <asp:TemplateField HeaderText="Thời gian bắt đầu diễn biến lương">
            <ItemTemplate>
                <%# Convert.ToDateTime(Eval("tgbd_dbl")).ToString("dd/MM/yyyy")%>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField ControlStyle-CssClass="hspctn" HeaderText="Hệ số phụ cấp thâm niên">
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
        <asp:TemplateField HeaderText="Xóa">
            <ItemTemplate>
                <a href="javascript:void(0)" class="delete-row" shcc="<%# Eval("shcc") %>">Xóa </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<script type="text/javascript">
    $(document).ready(function () {
        $('#chkAll').change(function () {
            selectAll($(this));
        });

        if ($("#ddlLuaChonBang").val() == "3") {
            $(".hspctn").css("display", "block");
        }
        else {
            $(".hspctn").css("display", "none");
        }

        $(".delete-row").click(function () {
            $(this).closest("tr").remove();

        });
    });
</script>
