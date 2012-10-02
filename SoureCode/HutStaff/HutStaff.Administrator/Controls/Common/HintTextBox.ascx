<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HintTextBox.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.HintTextBox" %>
<script type="text/javascript">
    $(document).ready(function () {
        var tb = $("#<%= mainTextBox.ClientID %>");

        $(tb).focus(function () {
            if ($(this).val() === "<%= HintText %>") {
                $(this).val("");
                $(this).css('color', '#000000');
            }
        });

        $(tb).blur(function () {
            if ($(this).val() === "") {
                $(this).val("<%= HintText %>");
                $(this).css('color', '#C0C0C0');
            }
        });
    });
</script>
<asp:TextBox ID="mainTextBox" runat="server" CssClass="hintTextBox" />