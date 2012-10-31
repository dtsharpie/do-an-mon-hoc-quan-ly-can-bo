<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.QuanLy.Import.TangLuong.Pager" %>
<%@ Register Src="/Controls/Common/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<uc1:Pager ID="Pager1" runat="server" />
<script type="text/javascript">
    $(document).ready(function () {
        var totalItem = parseInt("<%= iCount %>");
        var pageIndex = parseInt("<%= iPageIndex %>");
        var pageSize = parseInt("<%= iPageSize %>");
        var info = "-  Hiển thị " + (totalItem > 0 ? ((pageIndex -1) * pageSize + 1) : 0).toString() + " đến " + ((pageSize *pageIndex < totalItem) ? pageSize*pageIndex : totalItem).toString() + " trên " + totalItem.toString() + " kết quả tìm được";
        $(".header-table .info").html(info);
    });
</script>