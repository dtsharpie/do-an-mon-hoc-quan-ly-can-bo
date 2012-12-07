<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="KyLuat.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.KyLuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $('#divSideBar ul > li > a').eq(7).addClass('active');
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
<div>
        <asp:Image ID="FaceImage" runat="server" alt="Smiley face" height="100" width="100"/>
<%--        <asp:Label ID="sohieu_canbo" runat="server" Text=""/>
        <asp:Label ID="hoten_canbo" runat="server" Text=""/>
        <asp:Label ID="gioitinh_canbo" runat="server" Text=""/>
        <asp:Label ID="ngaysinh_canbo" runat="server" Text=""/>--%>

    </div>
  <ul>
    <li><a href="/Pages/TimKiem/ThongTinChiTiet.aspx?id=<%= iShcc %>">Thông tin chung</a></li>
    <li><a href="/Pages/TimKiem/TrinhDoNgoaiNgu.aspx?id=<%= iShcc %>">Trình độ ngoại ngữ</a></li>
    <li><a href="/Pages/TimKiem/CacChucDanh.aspx?id=<%= iShcc %>">Các chức danh</a></li>
    <li><a href="/Pages/TimKiem/ChucVuChinhQuyen.aspx?id=<%= iShcc %>">Chức vụ chính quyền</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDang.aspx?id=<%= iShcc %>">Chức vụ Đảng</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDoanThe.aspx?id=<%= iShcc %>">Chức vụ đoàn thể</a></li>
    <li><a href="/Pages/TimKiem/KhenThuong.aspx?id=<%= iShcc %>">Khen thưởng</a></li>
    <li><a>Kỷ luật</a></li>
    <li><a href="/Pages/TimKiem/DienBienLuong.aspx?id=<%= iShcc %>">Diễn biến lương</a></li>
    <li><a href="/Pages/TimKiem/QuanHeGiaDinh.aspx?id=<%= iShcc %>">Quan hệ gia đình</a></li>
    <li><a href="/Pages/TimKiem/NuocNgoaiDaDen.aspx?id=<%= iShcc %>">Nước ngoài đã đến</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhDaoTao.aspx?id=<%= iShcc %>">Quá trình đào tạo</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhBoiDuong.aspx?id=<%= iShcc %>">Quá trình bồi dưỡng</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhCongTac.aspx?id=<%= iShcc %>">Quá trình công tác</a></li>
    <br/>
    <li><a href="/Pages/TimKiem/BaoHiemXaHoi.aspx?id=<%= iShcc %>">Thông tin BHXH</a></li>
    <li><a href="/Pages/TimKiem/DuLieuTruoc1993.aspx?id=<%= iShcc %>">Dữ Liệu Trước 4/1993</a></li>
    <li><a href="">In tờ khai BHXH</a></li>
    <li><a href="">In sổ BHXH</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="content">
    <h1 class="title">
        Kỷ luật
    </h1>
    <hr />
            <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>

    <div class="divInfo" style="margin-top: 10px;">
        <%--<table class="table-result">
            <tr class="title">
                <td>
                    Hình thức kỷ luật
                </td>
                <td>
                    Năm KL
                </td>
                <td>
                    Năm xóa
                </td>
                <td>
                    Lý do kỷ luật
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("kl") %>
                        </td>
                        <td>
                            <%# Eval("nkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nkl")).ToString("yyyy")) : "" %>
                        </td>
                        <td>
                            <%# Eval("nxkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nxkl")).ToString("yyyy")) : ""%>
                        </td>
                        <td>
                            <%# Eval("ldkl")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkl")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("kl") %>
                        </td>
                        <td>
                            <%# Eval("nkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nkl")).ToString("yyyy")) : "" %>
                        </td>
                        <td>
                            <%# Eval("nxkl") != DBNull.Value ? Eval(Convert.ToDateTime(Eval("nxkl")).ToString("yyyy")) : ""%>
                        </td>
                        <td>
                            <%# Eval("ldkl")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkl")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>--%>
        <asp:GridView ID="GridView1" runat="server"  class="table-result" 
            AutoGenerateColumns="False" onrowdeleting="GridViewDeleting" 
            onselectedindexchanged="GridViewChanged">
            <Columns>
                <asp:BoundField DataField="id" />
                <asp:BoundField DataField="kl" HeaderText="Hình thức kỷ luật" />
                <asp:BoundField DataField="nkl" HeaderText="Năm kỷ luật"  DataFormatString="{0:yyyy}" />
                <asp:BoundField DataField="nxkl" HeaderText="Năm xóa kỷ luật"  DataFormatString="{0:yyyy}" />
                <asp:BoundField DataField="ldkl" HeaderText="Lý do kỷ luật" />
                <asp:BoundField DataField="ttk_qtkl" HeaderText="Thông tin khác" />
                <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
            </Columns>
    </asp:GridView>
        <div class="nodata" id="divNodata" runat="server">
        </div>
        <br/><br/>
        <div>
               <table class="table-result">
            <tr class="title">
                <td>
                Bổ sung dữ liệu
                </td>
            </tr>
            <tr>
                <td class="title">
                    Hình thức kỷ luật
                </td>
                <td>
                     <asp:DropDownList ID="DropDownlistHinhThucKyLuat" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Năm kỷ luật
                </td>
                <td>
                <asp:TextBox ID="txtNamKyLuat" runat="server"></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td class="title">
                    Năm xóa kỷ luật
                </td>
                <td>
                <asp:TextBox ID="txtNamXoaKyLuat" runat="server"></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td>
                    Lý do kỷ luật
                </td>
                <td>
                    <asp:TextBox ID="txtLyDo" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="txtThongTinKhac" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID ="saveButton" OnClick="saveButtonClick" runat="server" Text ="Ghi nhận"/>
                    <asp:Button ID ="resetButton" OnClick="resetButtonClick" runat = "server" Text ="Làm lại"/>
                </td>
            </tr>

        </table>      
        </div>
    </div>
    
</div>

</asp:Content>
