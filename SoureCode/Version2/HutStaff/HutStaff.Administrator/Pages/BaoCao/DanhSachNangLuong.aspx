<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachNangLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.DanhSachNangLuong"  MasterPageFile="~/Master/Admin.Master" %>
<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
    <script type="text/javascript">
        function CheckAll(bvalue) {
            j = parseInt(myform.num.value) + 4;
            for (i = 4; i < j; i++)
                if (myform.elements[i].type == 'checkbox')
                    myform.elements[i].checked = bvalue;
                else
                    alert(myform.elements[i].type);
        }

        function myformsubmit() {
            j = parseInt(myform.num.value) + 4;
            myform.listofshcc.value = '';
            for (i = 4; i < j; i++) {
                if (myform.elements[i].type == 'checkbox')
                    if (myform.elements[i].checked)
                        myform.listofshcc.value += myform.elements[i].name + ';';
            }
            //myform.submit();
            window.open(myform.action + '?listofshcc=' + myform.listofshcc.value, "xlnl", "width=790,height=540,top=0,left=0,resizable=yes,scrollbars=yes");
        }
    </script>
    <link href="../../Styles/default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder" ID="content1">
    <div class="content" id="content">
        <asp:Label ID="lblHtmlContent" runat="server" Text="Label"></asp:Label>
       
    </div>
</asp:Content>