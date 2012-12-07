<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="QuaTrinhCongTac.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.QuaTrinhCongTac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $('#divSideBar ul > li > a').eq(13).addClass('active');
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
    <li><a href="/Pages/TimKiem/DienBienLuong.aspx?id=<%= iShcc %>">Diễn biến lương</a></li>
    <li><a href="/Pages/TimKiem/QuanHeGiaDinh.aspx?id=<%= iShcc %>">Quan hệ gia đình</a></li>
    <li><a href="/Pages/TimKiem/NuocNgoaiDaDen.aspx?id=<%= iShcc %>">Nước ngoài đã đến</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhDaoTao.aspx?id=<%= iShcc %>">Quá trình đào tạo</a></li>
    <li><a href="/Pages/TimKiem/QuaTrinhBoiDuong.aspx?id=<%= iShcc %>">Quá trình bồi dưỡng</a></li>
    <li><a href="">Quá trình công tác</a></li>
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
        Quá trình công tác
    </h1>
    <br />        
    <h3>
        <asp:Label ID="nameLabel" runat="server" Text=""></asp:Label>
    </h3>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">

     <%--<table class="table-result">
            <tr class="title">
                <td>
                    Thời gian
                </td>
                <td>
                    Biên chế tại đơn vị/<br />
                    Nơi làm việc
                </td>
                <td>
                    Công việc đảm nhận
                </td>
                <td>
                    Diện cán bộ
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# (Eval("tgbd_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_qtct")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_qtct")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("dvct").ToString() + "/<br />" + Eval("nlv")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("dcb")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# (Eval("tgbd_qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgbd_qtct")).ToString("MM/yyyy") : "") + " > " + (Eval("tgkt_ qtct") != DBNull.Value ? Convert.ToDateTime(Eval("tgkt_ qtct")).ToString("MM/yyyy") : "nay")%>
                        </td>
                        <td>
                            <%# Eval("dvct").ToString() + "/<br />" + Eval("nlv")%>
                        </td>
                        <td>
                            <%# Eval("cv")%>
                        </td>
                        <td>
                            <%# Eval("dcb")%>
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
                <asp:BoundField DataField="noilamviec" HeaderText="Biên chế tại đơn vị/Nơi làm việc"/>
                <asp:BoundField DataField="cv" HeaderText="Công việc đảm nhận"/>
                <asp:BoundField DataField="dcb" HeaderText = "Diện cán bộ"/>
                <asp:BoundField DataField="ttk_qtct" HeaderText="Thông tin bổ sung" />
                <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
            </Columns>
    </asp:GridView>
        <div class="nodata" id="divNodata" runat="server">
        </div>
    </div>
</div>
<div>
    <div>
    <br/><br/>
      <table class="table-result">
            <tr class="title">
                <td>
                Bổ sung dữ liệu
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thời gian bắt đầu<td>
                    <asp:DropDownList ID="DropDownListNgayBatDau" runat="server">
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
                <asp:DropDownList ID="DropDownListThangBatDau" runat="server">
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
                <asp:TextBox ID="txtNamBatDau" runat="server" Width="50px"></asp:TextBox>  
                (ngày/tháng/năm)
                </td>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thời gian kết thúc
                     <td>
                    <asp:DropDownList ID="DropDownListNgayKetThuc" runat="server">
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
                <asp:DropDownList ID="DropDownListThangKetThuc" runat="server">
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
                <asp:TextBox ID="txtNamKetThuc" runat="server" Width="50px"></asp:TextBox>  
                 (ngày/tháng/năm)
                </td>
                </td>
            </tr>
            <tr>
                <td>
                    Đơn vị công tác</td>
                <td>
                    <asp:TextBox ID="txtDonViCongTac" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Chức vụ công tác</td>
                <td>
                    &nbsp;<asp:DropDownList ID="DropDownListChucVuCongTac" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Công việc đảm nhận
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCongViecDamNhan" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Biên chế tại đơn vị</td>
                <td>
                   <asp:TextBox ID="txtBienChe" runat="server" Width="335px"/>
                    <br />
                   (Nếu là đơn vị trong trường)
                    <br />
                    <asp:DropDownList ID= "DropDownListDonViTrongTruong" runat="server" 
                        onselectedindexchanged="DropDownListBienCheSeleted" AutoPostBack="true"/>
                 </td>
            </tr>
            <tr>
                <td>
                    Nơi làm việc
                    </td>
                    <td>
                   <asp:TextBox ID="txtNoiLamViec" runat="server" Width="335px"/>
                    <br />
                   (Nếu là đơn vị trong trường)
                    <br />
                    <asp:DropDownList ID= "DropDownListDonViTrongTruong1" runat="server" 
                            onselectedindexchanged="DropdownlistNoiLamViecSeleted" AutoPostBack="true"/>
                 </td>
                
            </tr>
            <tr>
                <td>
                    Diện cán bộ</td>
                <td>
                    <asp:DropDownList ID="DropDownListDienCanBo" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Đánh giá
                </td>
                <td>
                    <asp:TextBox ID="txtDanhGia" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="txtThongTinKhac" runat="server" TextMode="MultiLine" ></asp:TextBox>
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
</asp:Content>
