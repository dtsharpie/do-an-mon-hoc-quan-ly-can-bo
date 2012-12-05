<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="KhenThuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.KhenThuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <li><a href="">Khen thưởng</a></li>
    <li><a href="/Pages/TimKiem/KyLuat.aspx?id=<%= iShcc %>">Kỷ luật</a></li>
    <li><a href="/Pages/TimKiem/DienBienLuong.aspx?id=<%= iShcc %>">Diễn biến lương</a></li>
    <li><a href="/Pages/TimKiem/QuanHeGiaDinh.aspx?id=<%= iShcc %>">Quan hệ gia đình</a></li>
    <li><a href="/Pages/TimKiem/NuocNgoaiDaDen.aspx?id=<%= iShcc %>">Nước ngoài đã đến</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhDaoTao.aspx?id=<%= iShcc %>">Quá trình đào tạo</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhBoiDuong.aspx?id=<%= iShcc %>">Quá trình bồi dưỡng</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhCongTac.aspx?id=<%= iShcc %>">Quá trình công tác</a></li>
    <li><a href="/Pages/TimKiem/DanhGiaCongChuc.aspx?id=<%= iShcc %>">Đánh giá công chức</a></li>
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
        Khen thưởng
    </h1>
    <hr />
        <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>

    <div class="divInfo" style="margin-top: 10px;">
        <%--<table class="table-result">
            <tr class="title">
                <td>
                    Hình thức khen thưởng
                </td>
                <td>
                    Năm khen
                </td>
                <td>
                    Lý do khen thưởng
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("kt")%>
                        </td>
                        <td>
                            <%# Eval("nkt_qtkt")!= DBNull.Value ?  Convert.ToDateTime(Eval("nkt_qtkt")).ToString("yyyy") : ""%>
                        </td>
                        <td>
                            <%# Eval("soqd_qtkt")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkt")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("kt")%>
                        </td>
                        <td>
                            <%# Eval("nkt_qtkt")!= DBNull.Value ?  Convert.ToDateTime(Eval("nkt_qtkt")).ToString("yyyy") : ""%>
                        </td>
                        <td>
                            <%# Eval("soqd_qtkt")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtkt")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>--%>
        
        <asp:GridView ID="GridView1" runat="server" class="table-result" 
            AutoGenerateColumns="False" onrowdeleting="GridViewDeleting" 
            onselectedindexchanged="GridViewChanged">
            <Columns>
                <asp:BoundField DataField="id" />
                <asp:BoundField HeaderText="Hình thức khen thưởng" DataField="kt" />
                <asp:BoundField HeaderText="Năm khen" DataField="nkt_qtkt" 
                        DataFormatString="{0:yyyy}" />
                <asp:BoundField HeaderText="Lý do " DataField="soqd_qtkt" />
                <asp:BoundField HeaderText="Thông tin khác " DataField="ttk_qtkt" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
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
                    Hình thức khen thưởng
                </td>
                <td>
                     <asp:DropDownList ID="DropDownlistHinhThucKhenThuong" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Năm khen thưởng
                </td>
                <td>
                <asp:TextBox ID="txtNamKhenThuong" runat="server"></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td>
                    Lý do khen
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
