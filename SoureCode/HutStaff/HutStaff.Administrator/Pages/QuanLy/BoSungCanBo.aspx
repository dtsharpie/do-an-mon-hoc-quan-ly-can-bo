<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BoSungCanBo.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BoSungCanBo" %>
<%@ Register src="/Controls/QuanLy/ThongTinCanBoControl.ascx" tagname="ThongTinCanBoControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mainNav .ml').removeClass("active");
            $('.mainNav .ml').eq(1).addClass('active');
            $('.subNav > li').removeClass("active");
            $('.subNav > li').eq(0).addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <div class="">
        <ul>
            <li><h2>Thông tin cán bộ</h2></li>
            <li><asp:LinkButton ID="lbtThongtinchung" runat="server">Thông tin chung</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton1" runat="server">Trình độ ngoại ngữ</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton2" runat="server">Chức danh</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton3" runat="server">Chức vụ chính quyền</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton4" runat="server">Chức vụ Đảng</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton5" runat="server">Chức vụ Đoàn thể</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton6" runat="server">Khen thưởng</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton7" runat="server">Kỉ luật</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton8" runat="server">Diễn biến lương</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton9" runat="server">Quan hệ gia đình</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton10" runat="server">Nước ngoài đã đến</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton11" runat="server">Quá trình đào tạo</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton12" runat="server">Quá trình bồi dưỡng</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton13" runat="server">Quá trình công tác</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton14" runat="server">Đánh giá công chức</asp:LinkButton></li>
        </ul>
        <ul>
            <li><h2>Bảo hiểm xã hội</h2></li>
            <li><asp:LinkButton ID="LinkButton15" runat="server">Thông tin BHXH</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton16" runat="server">Dữ liệu trước 4/1993</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton17" runat="server">in tờ khai BHXH</asp:LinkButton></li>
            <li><asp:LinkButton ID="LinkButton18" runat="server">In sổ BHXH</asp:LinkButton></li>
        </ul>
        <ul>
            <li><h2>In hồ sơ cán bộ</h2></li>
        </ul>
    </div>
    <div class="">        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">\
    <div >
        <h1>Bổ sung cán bộ</h1>
    </div>
    <div>
        <table id="tb1" runat="server">
            <tr>
                <td>Số hiệu </td> <td><asp:TextBox ID="tbSohieu" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Diện cán bộ </td> <td><asp:DropDownList ID="ddlDiencanbo" runat="server" 
                    onselectedindexchanged="ddlDiencanbo_SelectedIndexChanged"></asp:DropDownList></td>
                <td>Hiện nay  <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                <td>Trạng thái <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Đơn vị </td> <td> <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList><br />
                </td>
            </tr>
            <tr>
                <td>Họ tên </td> <td> <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                <td>Giới tính <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem Text="Nam"></asp:ListItem>
                    <asp:ListItem Text="Nữ"></asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Tên thường dùng </td> <td> <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                <td>Học hàm - Học vị:  <asp:Label ID="lbHocham" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Ngày sinh</td>
                <td><asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList6" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td>Hôn nhân <asp:DropDownList ID="DropDownList7" runat="server"></asp:DropDownList></td>
                <td>Nơi sinh <asp:DropDownList ID="DropDownList8" runat="server">
                    <asp:ListItem Text="Hà Nội"></asp:ListItem>
                    <asp:ListItem Text="Bắc Ninh"></asp:ListItem>
                    <asp:ListItem Text="Cao Bằng"></asp:ListItem>
                    <asp:ListItem Text="Lạng Sơn"></asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Quê quán</td>
                <td><asp:DropDownList ID="DropDownList9" runat="server">
                    <asp:ListItem Text="Hà Nội"></asp:ListItem>
                    <asp:ListItem Text="Bắc Ninh"></asp:ListItem>
                    <asp:ListItem Text="Cao Bằng"></asp:ListItem>
                    <asp:ListItem Text="Lạng Sơn"></asp:ListItem>
                </asp:DropDownList></td>
                <td>Chi tiết <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Hộ khẩu thường trú</td>
                <td><asp:DropDownList ID="DropDownList10" runat="server">
                    <asp:ListItem Text="Hà Nội"></asp:ListItem>
                    <asp:ListItem Text="Bắc Ninh"></asp:ListItem>
                    <asp:ListItem Text="Cao Bằng"></asp:ListItem>
                    <asp:ListItem Text="Lạng Sơn"></asp:ListItem>
                </asp:DropDownList></td>
                <td>Chi tiết <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Chỗ ở hiện nay</td> <td> <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Điện thoại</td> <td> <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                <td>Email <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Số CMND </td> <td> <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                <td>Nơi cấp <asp:DropDownList ID="DropDownList11" runat="server"></asp:DropDownList></td>
                <td>Ngày cấp <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Dân tộc</td>
                <td><asp:DropDownList ID="DropDownList12" runat="server"></asp:DropDownList></td>
                <td>Tôn giáo <asp:DropDownList ID="DropDownList14" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Thành phần xuất thân</td>
                <td><asp:DropDownList ID="DropDownList18" runat="server"></asp:DropDownList></td>
                <td>Gia đình chính sách <asp:DropDownList ID="DropDownList19" runat="server"></asp:DropDownList></td>
                <td>Diện ưu tiên <asp:DropDownList ID="DropDownList20" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Ngày hợp đồng</td>
                <td><asp:DropDownList ID="DropDownList13" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList15" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                 <td>Ngày thi tuyển viên chức<asp:DropDownList ID="DropDownList16" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList17" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Cơ quan tiếp nhận làm việc</td>
                <td><asp:DropDownList ID="ddlCoquantiepnhan" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Công việc được giao</td>
                <td><asp:DropDownList ID="DropDownList21" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Ngày về cơ quan</td>
                <td><asp:DropDownList ID="DropDownList22" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList23" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                <td>Khối cán bộ <asp:DropDownList ID="DropDownList24" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Công việc hiện nay</td>
                <td><asp:DropDownList ID="DropDownList25" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Số BHXH</td>
                <td><asp:TextBox ID="tbBHXH" runat="server"></asp:TextBox></td>
                <td>Ngày bắt đầu đóng BHXH 
                    <asp:DropDownList ID="DropDownList26" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList27" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Ngày vào Đảng</td>
                <td><asp:DropDownList ID="DropDownList28" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList29" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
                 <td>Ngày chính thức <asp:DropDownList ID="DropDownList30" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList31" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Ngày nhập ngũ</td>
                <td><asp:DropDownList ID="DropDownList32" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList33" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></td>
                 <td>Ngày xuất ngũ<asp:DropDownList ID="DropDownList34" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList35" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Trình độ LLCT</td>
                <td><asp:DropDownList ID="DropDownList36" runat="server"></asp:DropDownList></td>
                <td>Trình độ QLNN <asp:DropDownList ID="DropDownList37" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Trình độ học vấn phổ thông</td>
                <td><asp:DropDownList ID="DropDownList38" runat="server"></asp:DropDownList></td>
                <td>Trình độ tin học <asp:DropDownList ID="DropDownList39" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Sức khỏe</td>
                <td><asp:DropDownList ID="DropDownList40" runat="server"></asp:DropDownList></td>
                <td>Nhóm máu <asp:DropDownList ID="DropDownList41" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Ngày kết thúc HĐ</td>
                <td><asp:DropDownList ID="DropDownList42" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList43" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
                <td>Lí do <textarea id="taLido" runat="server"></textarea></td>
            </tr>
            <tr>
                <td>Ngày bắt đầu tính thâm niên</td>
                <td><asp:DropDownList ID="DropDownList44" runat="server"></asp:DropDownList> /
                    <asp:DropDownList ID="DropDownList45" runat="server"></asp:DropDownList> /
                    <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></td>
                <td>Số tháng gián đoạn <asp:TextBox ID="tbThanggiandoan" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Lịch sử bản thân</td>
                <td><textarea id="taLichsubanthan" runat="server"></textarea></td>
            </tr>
            <tr>
                <td>Thông tin khác</td>
                <td><textarea id="taThongtinkhac" runat="server"></textarea></td>
            </tr>
        </table><br /><br />
        Nhập ảnh mới: <asp:FileUpload ID="fuAnh" runat="server"/><br /><br />

        <asp:Button ID="btSave" runat="server" Text="Lưu"/>&nbsp
        <asp:Button ID="btReset" runat="server" Text="Làm lại"/>
    </div>
</asp:Content>

