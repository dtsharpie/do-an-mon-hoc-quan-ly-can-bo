<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLCB_BK.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>QLCB</title>
    <link rel="stylesheet" type="text/css" href="/Styles/reset.css" />
    <link rel="stylesheet" type="text/css" href="/Styles/login.css" />
    <script src="/Script/jquery-1.8.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <div id="logo"></div>
    </div>
    <div id="content">
        <div id="divLogin">
            <div id="divSwitch">
                <a id="lnkAdminPage" href="javascript:void(0);" class="lnkSwitchButton left">
                    <img src="/Images/tql2.png" alt="trang_quan_ly" /></a>
                <a id="lnkViewPage" href="/xemthongtin/Login.aspx" class="lnkSwitchButton left">
                    <img src="/Images/xtt.png" alt="trang_xem_thong_tin" /></a>
            </div>
            <div id="divLoginTitle"></div>
            <table id="tblLoginForm">
                <tr>
                    <td class="tdLabel">Tên đăng nhập</td>
                    <td class="tdField"><asp:TextBox ID="txtUsername" runat="server" CssClass="loginTextBox" /></td>
                </tr>
                <tr>
                    <td class="tdLabel">Mật khẩu</td>
                    <td class="tdField"><asp:TextBox ID="txtPassword" runat="server" CssClass="loginTextBox" TextMode="Password" /></td>
                </tr>
            </table>
            <div id="divAlert">Tài khoản không tồn tại hoặc sai mật khẩu.</div>
            <a href="/Default.aspx" runat="server" id="lnkLogin" />
            <a href="/Pages/TaiKhoan/ChangePass.aspx" id="lnkForgotPass" >Quên mật khẩu ?</a>

        </div>
    </div>
    <div id="footer">
        <font size="2">
            <p>
                Phát triển bởi
                <a href="http://www.hut.edu.vn/web/vi/home">Phòng tổ chức cán bộ & Trung tâm thông tin Mạng</a>
            </p>
            <p>Hoàn thiện và phát triển bởi "VĐV và cộng sự"</p>
            <p>Trường Đại học Bách Khoa Hà Nội số 1 Đại Cồ Việt Hà Nội Việt Nam.</p>
        </font>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnkViewPage').hover(function () {
                $('#lnkViewPage img').attr('src', '/Images/xtt1.png')
            });

            $('#lnkViewPage').mouseout(function () {
                $('#lnkViewPage img').attr('src', '/Images/xtt.png')
            });

            $('#lnkLogin').hover(function () {
                $(this).css('background', 'url("/Images/nutdn2.png") no-repeat');
            });

            $('#lnkLogin').mouseout(function () {
                $(this).css('background', 'url("/Images/nutdn.png") no-repeat');                
            });
        });
    </script>
</body>
</html>