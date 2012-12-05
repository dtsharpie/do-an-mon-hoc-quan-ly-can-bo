<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="TinhTrangHonNhan.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
            $(".ddl").chosen({ no_results_text: "Không có kết quả phù hợp" });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="content" class="form-container">
        <br />
        <h1>DANH MỤC TÌNH TRẠNG HÔN NHÂN</h1>
        <table class=”table-form” width="100%">
            <tr >
                <td colspan="2" class=”td-header”>Bổ sung dữ liệu</td>
            </tr>
            <tr>
                <td>Mã tình trạng</td>
                <td width = "80%">
                    <asp:TextBox ID="txtMaTinhTrang" runat="server" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Tình trạng hôn nhân</td>
                <td width = "80%">
                    <asp:TextBox ID="txtTinhTrangHonNhan" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
        </table> <!-- End table 1 -->
        <br />
        <br />
        <h2>Bảng danh mục tình trạng hôn nhân</h2>
        <asp:Button ID="btnTaoMoiTinhTrangHonNhan" runat="server" Text="Tạo mới" CssClass="button"/>
        <asp:GridView ID="GridViewTinhTrangHonNhan" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Mã trạng thái" />
                <asp:BoundField HeaderText="Trạng thái (còn hạn/quá hạn)"/>
                <asp:CommandField DeleteText="Xóa" EditText="Sửa" InsertText="Thêm" 
                    NewText="Tạo mới" SelectText="Chọn" ShowDeleteButton="True" 
                    UpdateText="Cập nhật" />
                <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div> <!-- End content-->
</asp:Content>
