<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewMenu.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.ViewMenu" %>
<div id="divNav">
    <ul class="mainNav">
        <li class="ml active"><a href="/Default.aspx">Thông tin cán bộ</a></li>
        <li>
            <ul class="subNav">
                <asp:Repeater ID="rptBoxes" runat="server">
                    <ItemTemplate>
                        <li alias="<%# Eval("alias") %>"><a href="javascript:void(0)">
                            <%# Eval("name") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        loadContentView({ 'alias': '<%= sDefaultMenu %>' }, false);

        $('.mainNav .ml').click(function () {
            $('.mainNav .ml').removeClass("active");
            $('.subNav > li').removeClass("active");

            $(this).addClass("active");
        });

        $('.subNav > li').click(function () {
            $('.subNav > li').removeClass("active");
            $(this).addClass("active");
            $('.mainNav .ml').removeClass("active");
            $(this).parent().parent().prev().addClass("active");

            defaultMenu = $(this).attr('alias');
            loadContentView({ 'alias': defaultMenu }, false);
            $("html, body").animate({ scrollTop: "0px" }, 'fast');
        });
    });
</script>
