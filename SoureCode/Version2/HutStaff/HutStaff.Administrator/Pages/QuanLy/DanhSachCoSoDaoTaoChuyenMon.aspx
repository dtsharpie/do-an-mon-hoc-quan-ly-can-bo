<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachCoSoDaoTaoChuyenMon.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhSachCoSoDaoTaoChuyenMon" %>
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
        <h1>DANH SÁCH CƠ SỞ ĐÀO TẠO CHUYÊN MÔN</h1>
        <table class=”table-form” width="100%">
            <tr >
                <td class=”td-header”>DANH SÁCH CƠ SỞ ĐÀO TẠO CHUYÊN MÔN</td>
            </tr>
            <tr>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField HeaderText="Số thứ tự" />
                    <asp:BoundField HeaderText="Tên cơ sở đào tạo chuyên môn" />
                    <asp:BoundField HeaderText="Số lượng trùng lặp"/>
                    <asp:ButtonField Text="Ghi lại"/>
            </Columns>
        </asp:GridView>
            </tr>
        </table> <!-- End table 1 -->
    </div> <!-- End content-->
</asp:Content>
