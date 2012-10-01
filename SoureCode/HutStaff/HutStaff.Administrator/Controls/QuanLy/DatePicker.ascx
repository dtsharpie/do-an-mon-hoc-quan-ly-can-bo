<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.QuanLy.DatePicker" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= mainTextBox.ClientID %>").datepick({
            dateFormat: 'dd/mm/yyyy',
            yearRange: '1920:2020'
        });
    });
</script>
<asp:TextBox ID="mainTextBox" runat="server" CssClass="DatePickerTextBox" />
