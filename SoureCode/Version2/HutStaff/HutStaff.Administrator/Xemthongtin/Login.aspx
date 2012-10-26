<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HutStaff.Administrator.Xemthongtin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/Styles/loginview.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="login">
        <div id="divLogin">
            <div id="divLoginForm">
                <div>
                    <h1>
                        Xem thông tin</h1>
                    <div class="login-form">
                        <input runat="server" type="text" id="txtUsername" class="textbox" />
                        <input runat="server" type="password" id="txtPassword" class="textbox" style="margin-left: 15px" />
                    </div>
                    <asp:Button ID="btnLogin" OnClick="btnLogin_Click" Text="Đăng nhập" CssClass="button"
                        runat="server" />
                    <a href="javascript:void(0);" style="margin-left: 15px">Quên mật khẩu</a>&nbsp;|&nbsp;
                    <a href="/">HutStaff</a>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>
                Phát triển bởi <a href="http://www.hut.edu.vn/web/vi/home">Phòng tổ chức cán bộ & Trung
                    tâm thông tin Mạng</a>
            </p>
            <p>
                Hoàn thiện và phát triển bởi "VĐV và cộng sự"</p>
            <p>
                Trường Đại học Bách Khoa Hà Nội số 1 Đại Cồ Việt Hà Nội Việt Nam.</p>
        </div>
    </div>
    </form>
</body>
</html>
