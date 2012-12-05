<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="CacChucDanh.aspx.cs" Inherits="HutStaff.Administrator.Pages.TimKiem.CacChucDanh" %>
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
    <li><a>Các chức danh</a></li>
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
        Các chức danh
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
                    Chức danh
                </td>
                <td>
                    Ngày tháng năm phong
                </td>
                <td>
                    Thông tin khác
                </td>
            </tr>
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("dhdp")%>
                        </td>
                        <td>
                            <%# Convert.ToDateTime(Eval("ntnpdh")).ToString("dd/MM/yyyy")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtcd")%>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="even">
                        <td>
                            <%# Eval("dhdp")%>
                        </td>
                        <td>
                            <%# Convert.ToDateTime(Eval("ntnpdh")).ToString("dd/MM/yyyy")%>
                        </td>
                        <td>
                            <%# Eval("ttk_qtcd")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:Repeater>
        </table>--%>
                <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        class="table-result" onrowdeleting="deleteData" 
                        onselectedindexchanged="updateData">
                <Columns>
                    <asp:BoundField DataField="id" />
                    <asp:BoundField HeaderText="Chức danh" DataField="dhdp" />
                    <asp:BoundField HeaderText="Ngày tháng phong" DataField="ntnpdh" 
                        DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="nodata" id="divNodata" runat="server" ></div>

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
                    Chức danh
                </td>
                <td>
                     <asp:DropDownList ID="cacchudanhdownList" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="title">
                    Ngày tháng năm phong
                </td>
                <td>
                <asp:DropDownList ID="DropDownListNgayBoNhiem" runat="server">
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
                <asp:DropDownList ID="DropDownListThangBoNhiem" runat="server">
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
                <asp:TextBox ID="txtNamBoNhiem" runat="server"></asp:TextBox>  
                (ngày/tháng/năm)
                </td>
            </tr>
            <tr>
                <td>
                    Chức danh cao nhất
                </td>
                <td>
                    <input id="Checkbox1" type="checkbox" name ="chucdanhcaonhat" runat="server"/>
                </td>
            </tr>
            <tr>
                <td>
                    Thông tin khác
                </td>
                <td>
                    <asp:TextBox ID="thongtinkhacTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
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
