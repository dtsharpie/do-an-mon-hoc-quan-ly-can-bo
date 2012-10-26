<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaNguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.SuaNguoiDung" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript">
        function ValidateForm() {
            if (document.forms["frmUserInfo"]["txtUsername"].value == ""){
                alert("Giá trị username không hợp lệ");
                document.getElementById("txtUsername").focus();

                return false;
            }
            //alert(document.forms["frmUserInfo"]["txtPassword"].value);
            if (document.forms["frmUserInfo"]["txtPassword"].value == "" || document.forms["frmUserInfo"]["txtRePassword"].value == "") {
                alert("Không thể bỏ trống trường mật khẩu");
                document.getElementById("lblPassword").style.color = "Red";
                document.getElementById("lblPassword").style.color = "Red";
                document.getElementById("txtPassword").focus();

                return false;
            }
            if (document.forms["frmUserInfo"]["txtPassword"].value != document.forms["frmUserInfo"]["txtRePassword"].value) {
                alert("Mật khẩu không khớp");
                document.forms["frmUserInfo"]["txtPassword"].value = "";
                document.forms["frmUserInfo"]["txtRePassword"].value = "";
                document.getElementById("txtPassword").focus();

                return false;
            }
            else
                return true;
        }
    </script>
</head>
<body>
    <div class="content">
    <h1 id="title"></h1>
    <form id="frmUserInfo" runat="server" defaultbutton="cmdSubmit" action="SuaNguoiDung.aspx" method="post" onsubmit="return ValidateForm();">
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        <asp:HiddenField runat="server" ID="hfAddEdit" />
        <table border="1">
            <tr>
                <td><asp:Label runat="server" Text="Tên truy cập:"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="txtUsername"></asp:TextBox></td>
                <td><asp:HiddenField runat="server" ID="hfUserID" /></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Mật khẩu" ID="lblPassword"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" 
                        TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Gõ lại mật khẩu" ID="lblRePassword"></asp:Label></td>
                <td class="style1"><asp:TextBox runat="server" ID="txtRePassword" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Đơn vị"></asp:Label></td>
                <td><asp:DropDownList runat="server" ID="ddlDonVi" DataSourceID="SqlDataSource_ListDV" 
                        DataTextField="dv" DataValueField="ma_dv"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_ListDV" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:QLCB %>" 
                        SelectCommand="SELECT [dv], [ma_dv] FROM [dm_dv]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Có quyền sửa"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="chkQuyen" /></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Khóa"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="chkIsLock" /></td>
            </tr>
            <tr>
                <td><asp:Button runat="server" ID="cmdSubmit" Text="Tạo người dùng" /></td>
                <td><asp:Button runat="server" Text="Cancel" OnClientClick="window.close();"/></td>
            </tr>
        </table>
    </form>
    </div>
</body>
</html>
