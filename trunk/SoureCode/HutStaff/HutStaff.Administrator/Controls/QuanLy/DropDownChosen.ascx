<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropDownChosen.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.QuanLy.DropDownChosen" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= mainDropDownList.ClientID %>").chosen({
            placeholder_text: "<%= PlaceHolder %>"
        });
    });
</script>
<asp:DropDownList ID="mainDropDownList" runat="server" />