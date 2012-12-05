<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="ChucVuChinhQuyen.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.ChucVuChinhQuyen" %>
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
    <li><a href="">Chức vụ chính quyền</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDang.aspx?id=<%= iShcc %>">Chức vụ Đảng</a></li>
    <li><a href="/Pages/TimKiem/ChucVuDoanThe.aspx?id=<%= iShcc %>">Chức vụ đoàn thể</a></li>
    <li><a href="/Pages/TimKiem/KhenThuong.aspx?id=<%= iShcc %>">Khen thưởng</a></li>
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
<div class="form-container">
    <h1 class="title">
        Chức vụ chính quyền
    </h1>
    <hr />
    <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>
    <%--<div class="divInfo" style="margin-top: 10px;">
        <table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Chức vụ kiêm nhiệm
                </td>
                <td>
                    Đơn vị quản lý
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# ((Eval("nbncvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvkn")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvkn")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("donvi")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtct")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# ((Eval("nbncvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nbncvkn")).ToString("MM/yyyy") : "") + ">" + ((Eval("nktcvkn") != DBNull.Value) ? Convert.ToDateTime(Eval("nktcvkn")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("donvi")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtct")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>--%>
    <asp:GridView ID="GridViewChucVuChinhQuyen" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderText="Khoảng thời gian" />
            <asp:BoundField HeaderText="Chức vụ chính quyền" />
            <asp:BoundField HeaderText="Đơn vị quản lý" />
            <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Nhập mới" CssClass="button"/>
    <table class="table-form" width="100%">
        <tr>
            <td class=”td-header” colspan="2">Bổ sung dữ liệu</td>
        </tr>
        <tr>
            <td>Ngày bổ nhiệm</td>
            <td>
                <asp:DropDownList ID="DropDownListNgayBoNhiem" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                /
                <asp:DropDownList ID="DropDownListThangBoNhiem" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>  
                /
                <asp:TextBox ID="txtNamBoNhiem" runat="server"></asp:TextBox>  
                (ngày/tháng/năm)
            </td>
        </tr>
        <tr>
            <td>Ngày kết thúc</td>
            <td>
                <asp:DropDownList ID="DropDownListNgayKetThuc" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                /
                <asp:DropDownList ID="DropDownListThangKetThuc" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>  
                /
                <asp:TextBox ID="txtNamKetThuc" runat="server"></asp:TextBox>  
                <asp:CheckBox ID="checkBoxDenNayKetThuc" runat="server" Text="Đến nay" />
            </td>
        </tr>
        <tr>
            <td>Chức vụ</td>
            <td>
                <asp:DropDownList ID="DropDownListBoSungDuLieuChucVu" runat="server">
                </asp:DropDownList>    
                HS Phụ cấp
                <asp:TextBox ID="txtBoSungDuLieuChucVuHSPhuCap" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Đơn vị quản lý</td>
            <td>
                <asp:DropDownList ID="DropDownListBoSungDuLieuDonViQuanLy" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Thông tin khác</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="59px" TextMode="MultiLine" 
                    Width="228px"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnGhiLai" runat="server" Text="Ghi lại" CssClass="button"/>
                <asp:Button ID="btnLamLai" runat="server" Text="Làm lại" CssClass="button"/></td>
        </tr>
    </table>
</div>
</asp:Content>
