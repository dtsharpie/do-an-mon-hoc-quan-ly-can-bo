<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.QuanLy.DatePicker" %>
<script src="../../Script/zebra_datepicker.js" type="text/javascript"></script>
<link href="../../Styles/ZebraDatePicker/zebra_datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= mainTextBox.ClientID %>").Zebra_DatePicker();
    });
</script>
<asp:TextBox ID="mainTextBox" runat="server" CssClass="DatePickerTextBox" />
