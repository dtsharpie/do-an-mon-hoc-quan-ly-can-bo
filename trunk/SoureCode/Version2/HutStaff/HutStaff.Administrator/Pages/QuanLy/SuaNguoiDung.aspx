<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Admin.Master" CodeBehind="SuaNguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.SuaNguoiDung" %>
<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
            $(".ddl").chosen({ no_results_text: "Không có kết quả phù hợp" });
        });
    </script>
    <script type="text/javascript">
        function ValidateForm() {
            if (document.forms["form1"]["txtUsername"].value == "") {
                alert("Giá trị username không hợp lệ");
                document.getElementById("lblUsername").style.color = "Red";
                document.getElementById("txtUsername").focus();

                return false;
            }
            else
                document.getElementById("lblUsername").style.color = "Black";

            if (document.forms["form1"]["txtPassword"].value == "" || document.forms["form1"]["txtRePassword"].value == "") {
                alert("Không thể bỏ trống trường mật khẩu");
                document.getElementById("lblPassword").style.color = "Red";
                document.getElementById("lblRePassword").style.color = "Red";
                document.getElementById("txtPassword").focus();

                return false;
            }
            else {
                document.getElementById("lblPassword").style.color = "Black";
                document.getElementById("lblRePassword").style.color = "Black";
            }

            if (document.forms["form1"]["txtPassword"].value != document.forms["form1"]["txtRePassword"].value) {
                alert("Mật khẩu không khớp");
                document.forms["form1"]["txtPassword"].value = "";
                document.forms["form1"]["txtRePassword"].value = "";
                document.getElementById("txtPassword").focus();

                return false;
            }

            return true;
        }
        function Cancel() {
//            alert(document.forms["form1"]["hfAddEdit"].value);
//            if (document.forms["form1"]["hfAddEdit"].value == "add")
//                return window.close();
//            else //if (document.forms["form1"]["hfAddEdit"].value == "edit")
            //                return window.history.go(-1);
            return window.location.href = "NguoiDung.aspx";
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <div class="content" style="height:100%; width:100%;">
    <h1 id="title"></h1>
    <div style="height:100%; width:100%;">
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        <asp:HiddenField runat="server" ID="hfAddEdit" />
        <asp:HiddenField runat="server" ID="hfUserID" />
        <div>
        <table class="table-form" border="0">
            <tr>
                <td><asp:Label runat="server" Text="Tên truy cập" ID="lblUsername" ></asp:Label></td>
                <td><asp:TextBox runat="server" ID="txtUsername" Width="200" align="center"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Mật khẩu" ID="lblPassword"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" 
                        TextMode="Password"  Width="200"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1"><asp:Label runat="server" Text="Gõ lại mật khẩu" ID="lblRePassword"></asp:Label></td>
                <td class="style1"><asp:TextBox runat="server" ID="txtRePassword" TextMode="Password" Width="200"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Đơn vị" ID="lblDonVi"></asp:Label></td>
                <td><asp:DropDownList class="ddl" runat="server" ID="ddlDonVi" ></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Có quyền sửa" ID="lblQuyen"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="chkQuyen" /></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Khóa" ID="lblIsLock"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="chkIsLock" /></td>
            </tr>
            <tr>
                <td><asp:Button CssClass="lnk-button" runat="server" ID="cmdSubmit" Text="Tạo người dùng" UseSubmitBehavior="true" OnClientClick="return ValidateForm()" /></td>
                <td><asp:Button CssClass="lnk-button" runat="server" Text="Quay lại" OnClientClick="return Cancel();" ID="cmdCancel" UseSubmitBehavior="false"/><a id="lnkChangePass" runat="server">Đổi mật khẩu</a></td>
            </tr>
        </table>
        
        </div>
    </div>
    </div>

</asp:Content>