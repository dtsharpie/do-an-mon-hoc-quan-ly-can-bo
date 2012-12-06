<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViduDropdownlist.aspx.cs"
    Inherits="HutStaff.Administrator.ViduDropdownlist" %>

<%@ Register Src="Controls/Common/Dropdownlist.ascx" TagName="Dropdownlist" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/Styles/reset.css" />
    <link href="/Styles/view.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="/Script/common.js" type="text/javascript"></script>
    <script src="/Script/chosen/chosen.jquery.min.js" type="text/javascript"></script>
    <link href="/Script/chosen/chosen.css" rel="stylesheet" type="text/css" /> 
</head>
<body >
    <form id="form1" runat="server">
    <div>
        <uc1:Dropdownlist ID="Dropdownlist1" runat="server" />
        <input id="test1" type="button" value="getvalue" />
        <asp:Button OnClick="abc" runat="server" ID="test2" Text="getvaluesubmit" />
        <script type="text/javascript">
            $(document).ready(function () {
                $("#test1").click(function () {
                    alert($("select[id$='ddlSelectUserControl']").val());
                });

            });
        </script>
    </div>
    </form>
</body>
</html>
