<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="DienBienLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.DienBienLuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $('#divSideBar ul > li > a').eq(8).addClass('active');
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
    <li><a href="/Pages/TimKiem/KyLuat.aspx?id=<%= iShcc %>">Kỷ luật</a></li>
    <li><a>Diễn biến lương</a></li>
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
        Diễn biến lương
    </h1>
    <hr />
        <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>
    <br/>
    <div class="divInfo" style="margin-top: 10px;">
        <%--<table class="table-result">
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
        </table>--%>
        <asp:GridView ID="GridView1" runat="server"  class="table-result" 
            AutoGenerateColumns="False" onrowdeleting="GridViewDeleting" 
            onselectedindexchanged="GridViewChanged">
            <Columns>
                <asp:BoundField DataField="id" />
                <asp:BoundField DataField="thoigian" HeaderText="Thời gian" />
                <asp:BoundField DataField="ten_ngach" HeaderText="Ngạch"/>
                <asp:BoundField DataField="bl_dbl" HeaderText="Bậc"/>
                <asp:BoundField DataField="hsl" HeaderText="Hệ số" />
                <asp:BoundField DataField="phucap" HeaderText = "Phụ cấp"/>
                <asp:BoundField DataField="ttk_qtdbl" HeaderText="Thông tin khác" />
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
                    Ngạch
                </td>
                <td>
                     <asp:DropDownList ID="DropDownlistNgach" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Bậc lương
                </td>
                <td>
                    <asp:DropDownList ID="DropDownlistBacLuong" runat="server">
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
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Hệ số lương
                </td>
                <td>
                    <asp:TextBox ID="txtHeSoLuong1" runat="server" Width="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Hưởng từ
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListNgayHuongTu" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
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
                <asp:DropDownList ID="DropDownListThangHuongTu" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>  
                /
                <asp:TextBox ID="txtNamHuongTu" runat="server" Width="50px"></asp:TextBox>  
                (ngày/tháng/năm)
                </td>
            </tr>
            <tr>
                <td>
                    Mốc lương tính lần sau
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListNgayTinhLanSau" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
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
                <asp:DropDownList ID="DropDownListThangTinhLanSau" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>  
                /
                <asp:TextBox ID="txtNamTinhLanSau" runat="server" Width="50px"></asp:TextBox>  
                 <input id="checkBoxDenNay" type="checkbox" runat="server"/>
                Đến nay
                </td>
            </tr>
            <tr>
                <td>
                    Các loại phụ cấp
                </td>
                <td>
                    Chức vụ
                    <asp:TextBox ID="txtChucVu" runat="server" Width="50px"></asp:TextBox> 
                    Thâm niên
                    <asp:TextBox ID="txtThamNien" runat="server" Width="50px"></asp:TextBox> 
                    Hệ số phụ vượt khung
                    <asp:TextBox ID="txtVuotKhung" runat="server" Width="50px"/>
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
