<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dropdownlist.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.Common.Dropdownlist" %>
<asp:DropDownList ID="ddlSelectUserControl" runat="server">
</asp:DropDownList>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= ddlSelectUserControl.ClientID %>").chosen({ no_results_text: "Không có kết quả phù hợp" });
    });
</script>
