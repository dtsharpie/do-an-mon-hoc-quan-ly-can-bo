<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaNguoiDung.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.SuaNguoiDung" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="content">
    <h1 id="title"></h1>
    <form id="form1" runat="server" defaultbutton="submit">
        <table border="1">
            <tr>
                <td><asp:Label runat="server" Text="Tên truy cập:"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="username"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Mật khẩu"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="password" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Gõ lại mật khẩu"></asp:Label></td>
                <td><asp:TextBox runat="server" ID="re_password" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Đơn vị"></asp:Label></td>
                <td><asp:DropDownList runat="server" ID="donvi" DataSourceID="SqlDataSource_ListDV" 
                        DataTextField="dv" DataValueField="ma_dv"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_ListDV" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:QLCB %>" 
                        SelectCommand="SELECT [dv], [ma_dv] FROM [dm_dv]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Có quyền sửa"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="quyen" /></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="Khóa"></asp:Label></td>
                <td><asp:CheckBox runat="server" ID="isLock" /></td>
            </tr>
            <tr>
                <td><asp:Button runat="server" ID="submit" Text="Tạo người dùng"/></td>
                <td><asp:Button runat="server" Text="Cancel" /></td>
            </tr>
        </table>
    </form>
    </div>
</body>
</html>
