<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Thongtinchung.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Thongtinchung" %>
<div class="content">
    <form action="" id="frmComonInfo">
    <h1 class="title">
        Thông tin chung
    </h1>
    <hr />
    <div class="divInfo">
        <asp:Repeater ID="rptData" runat="server">
            <ItemTemplate>
                <table class="table-result">
                    <tr>
                        <td colspan="3">
                            <label>
                                Số hiệu:<span><%# Eval("shcc") %></span></label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Diện cán bộ:<span><%# Eval("dcb") %></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Hiện nay:</label>
                        </td>
                        <td>
                            <label>
                                Trạng thái:</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Đơn vị:<span><%# Eval("dv") %></span>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Họ tên:<span><%# Eval("hodem").ToString() + " " + Eval("ten").ToString() %></span></label>
                        </td>
                        <td colspan="2">
                            <label>
                                Giới tính:<span><%# (Eval("gt") == DBNull.Value) ? "" : (Convert.ToInt32(Eval("gt")) == 1 ? "Nam" : "Nữ") %></span></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Tên thường dùng:<span><%# Eval("ttd") %></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Học hàm học vị:<span></span></label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Ngày sinh:<span><%# (Eval("ntns") == DBNull.Value) ? "" : Convert.ToDateTime(Eval("ntns")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Hôn nhân:<span><%# Eval("tthn")%></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Nơi sinh:<span><%# Eval("noisinh") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Quê quán:<span><%# Eval("quequan") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Chi tiết:<span><%# Eval("ctqq") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Hộ khẩu thường trú:<span><%# Eval("hktt") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Chi tiết:<span><%# Eval("hktt") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Chỗ ở hiện nay:<span><%# Eval("dctt") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Điện thoại:<span><%# Eval("tel") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Email:<span><%# Eval("email") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Số CMND:<span><%# Eval("scmnd") %></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Nơi cấp:
                            </label>
                        </td>
                        <td>
                            <label>
                                Ngày cấp:
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Dân tộc:<span><%# Eval("dt") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Tôn giáo:<span><%# Eval("tg") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Thành phần xuất thân:<span><%# Eval("tpxt")%></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Gia đình chính sách:<span><%# Eval("gdcs")%></span>
                            </label>
                        </td>
                        <td>
                            <label>
                                Diện ưu tiên:<span></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Ngày hợp đồng:
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Ngày thi tuyển viên chức:
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Cơ quan tiếp nhận làm việc:
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td colspan="3">
                            <label>
                                Công việc được giao:<span><%# Eval("vdpc")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Ngày về cơ quan:<span><%# Eval("nvcqhn")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Khối cán bộ:<span><%# Eval("kcb")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td colspan="3">
                            <label>
                                Công việc hiện nay:<span><%# Eval("cvdn")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Sổ BHXH:<span><%# Eval("sbh")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Ngày bắt đầu đóng BHXH:<span><%# Eval("ndbh") == DBNull.Value ? "" : Convert.ToDateTime(Eval("ndbh")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Ngày vào Đảng:<span><%# Eval("nvd") == DBNull.Value ? "" : Convert.ToDateTime( Eval("nvd")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Ngày chính thức:<span><%# Eval("nct") == DBNull.Value ? "" : Convert.ToDateTime(Eval("nct")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Ngày nhập ngũ:<span><%# Eval("nnn") == DBNull.Value ? "" : Convert.ToDateTime(Eval("nnn")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Ngày xuất ngũ:<span><%# Eval("nxn") == DBNull.Value ? "" : Convert.ToDateTime(Eval("nxn")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Trình độ LLCT:<span><%# Eval("tdll") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Trình độ QLNN:<span><%# Eval("tdql") %></span></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Trình độ học vấn phổ thông:<span><%# Eval("tdhv") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Trình độ tin học:<span><%# Eval("tdth") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Sức khỏe:<span><%# Eval("ma_ttsk") %></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Nhóm máu:<span><%# Eval("ma_nm") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Ngày kết thúc hợp đồng:<span><%# Eval("ngay_kthd") == DBNull.Value ? "" : Convert.ToDateTime(Eval("ngay_kthd")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Lý do:<span><%# Eval("ld_kthd") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Ngày bắt đầu thâm niên:<span><%# Eval("ngaybh") == DBNull.Value ? "" : Convert.ToInt32(Eval("ngaybh")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Số tháng gián đoạn:<span><%# Eval("thanggd") %></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Sở trường, năng khiếu:<span><%# Eval("nlstnk")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td colspan="3">
                            <label>
                                Lịch sử bản thân:<span><%# Eval("ddlsbt")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Thông tin khác:<span><%# Eval("ttk") %></span>
                            </label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="margin-top: 10px;">
        <input class="button" type="submit" value="Cập nhật" id="btnUpdate" />
        <input class="button" type="reset" value="Khởi tạo lại" id="btnReset" />
    </div>
    </form>
</div>
