<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="DienBienLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.DienBienLuong" %>
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
    <li><a href="/Pages/TimKiem/KhenThuong.aspx?id=<%= iShcc %>">Khen thưởng</a></li>
    <li><a href="/Pages/TimKiem/KyLuat.aspx?id=<%= iShcc %>">Kỷ luật</a></li>
    <li><a href="">Diễn biến lương</a></li>
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
        Diễn biến lương
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Ngạch
                </td>
                <td>
                    Bậc
                </td>
                <td>
                    Hệ số
                </td>
                <td>
                    Phụ cấp
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dbl")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dbl")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("ten_ngach")%>
                        </td>
                        <td>
                            <%# Eval("bl_dbl")%>
                        </td>
                        <td>
                            <%# Eval("hsl")%>
                        </td>
                        <td>
                            <%# (Eval("hspccv") != DBNull.Value && !String.IsNullOrEmpty( Eval("hspccv").ToString())) ? "Chức vụ: "+  Eval("hspccv").ToString() + "<br />" : ""%>
                            <%# (Eval("hspctn") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspctn").ToString())) ? "Thâm niên: " + Eval("hspctn").ToString() + "<br />" : ""%>
                            <%# (Eval("hspckv") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspckv").ToString())) ? "Vượt khung: " + Eval("hspckv").ToString() : ""%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdbl")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_dbl")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_dbl") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_dbl")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("ten_ngach")%>
                        </td>
                        <td>
                            <%# Eval("bl_dbl")%>
                        </td>
                        <td>
                            <%# Eval("hsl")%>
                        </td>
                        <td>
                            <%# (Eval("hspccv") != DBNull.Value && !String.IsNullOrEmpty( Eval("hspccv").ToString())) ? "Chức vụ: "+  Eval("hspccv").ToString() + "<br />" : ""%>
                            <%# (Eval("hspctn") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspctn").ToString())) ? "Thâm niên: " + Eval("hspctn").ToString() + "<br />" : ""%>
                            <%# (Eval("hspckv") != DBNull.Value && !String.IsNullOrEmpty(Eval("hspckv").ToString())) ? "Vượt khung: " + Eval("hspckv").ToString() : ""%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtdbl")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>

</asp:Content>
