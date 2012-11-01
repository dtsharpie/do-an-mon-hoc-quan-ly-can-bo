<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.Common.DatePicker" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= mainTextBox.ClientID %>").datepicker({
            showButtonPanel: true,
            dateFormat: 'dd/mm/yy',
            yearRange: "2000:2030"
        });
    });
</script>
<p>
    <asp:TextBox ID="mainTextBox" runat="server" />
</p>
