<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaNguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.SuaNguoiDung" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript">
        function ValidateForm() {
            if (document.forms["frmUserInfo"]["txtUsername"].value == ""){
                alert("Giá trị username không hợp lệ");
                document.getElementById("lblUsername").style.color = "Red";
                document.getElementById("txtUsername").focus();

                return false;
            }
            else
                document.getElementById("lblUsername").style.color = "Black";

            if (document.forms["frmUserInfo"]["txtPassword"].value == "" || document.forms["frmUserInfo"]["txtRePassword"].value == "") {
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

            if (document.forms["frmUserInfo"]["txtPassword"].value != document.forms["frmUserInfo"]["txtRePassword"].value) {
                alert("Mật khẩu không khớp");
                document.forms["frmUserInfo"]["txtPassword"].value = "";
                document.forms["frmUserInfo"]["txtRePassword"].value = "";
                document.getElementById("txtPassword").focus();

                return false;
            }

            return true;
        }
        function Cancel() {
            if (document.forms["frmUserInfo"]["hfAddEdit"].value == "add")
                return window.close();
            else //if (document.forms["frmUserInfo"]["hfAddEdit"].value == "edit")
                return window.history.go(-1);
        }
    </script>
</head>
<body>
    <div class="content" style="height:100%; width:100%;">
    <h1 id="title"></h1>
    <div align = "center" style="height:100%; width:100%;">
    <form id="frmUserInfo" runat="server" defaultbutton="cmdSubmit" align="center"
        action="SuaNguoiDung.aspx" method="post" onsubmit="return ValidateForm();" 
        style="background-color: #f2f2f2; height:100%; width:100%;">
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        <asp:HiddenField runat="server" ID="hfAddEdit" />
        <asp:HiddenField runat="server" ID="hfUserID" />
        <div>
        <table class="table-form" border="0"  align ="center">
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
                <td><asp:Button runat="server" ID="cmdSubmit" Text="Tạo người dùng" UseSubmitBehavior="true"/></td>
                <td><asp:Button runat="server" Text="Cancel" OnClientClick="return Cancel();" ID="cmdCancel" UseSubmitBehavior="false"/></td>
            </tr>
        </table>
        <a id="lnkChangePass" runat="server">Đổi mật khẩu</a>
        </div>
    </form>
    </div>
    </div>
</body>
</html>
