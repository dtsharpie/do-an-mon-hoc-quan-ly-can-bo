<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Thongtinchung.ascx.cs"
    Inherits="HutStaff.Administrator.Xemthongtin.Controls.Thongtinchung" %>
<%@ Register Src="~/Controls/Common/Dropdownlist.ascx" TagPrefix="uc" TagName="dropdownlist" %>
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
                        <td colspan="3">
                            <label>
                                Diện cán bộ:<span><%# Eval("dcb") %></span>
                            </label>
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
                                Hộ khẩu thường trú:&nbsp;&nbsp;&nbsp;<uc:dropdownlist ID="ddlHktt" OnDataBinding="ddlHktt_OnDataBinding"
                                    runat="server" />
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
                                Chỗ ở hiện nay:<span>
                                    <input value="<%# Eval("dctt") %>" style="width: 960px; font-weight: bold;" /></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Điện thoại:<input style="font-weight: bold" value="<%# Eval("tel") %>" />
                            </label>
                        </td>
                        <td colspan="3">
                            <label>
                                Email:<input style="font-weight: bold; width: 395px;" value="<%# Eval("email") %>" />
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                Số CMND:<input style="font-weight: bold;" value="<%# Eval("scmnd") %>" />
                            </label>
                        </td>
                        <td>
                            <label>
                                Nơi cấp:<uc:dropdownlist ID="ddlNoicap" OnDataBinding="ddlNoicap_OnDataBinding" runat="server" />
                            </label>
                        </td>
                        <td>
                            <label>
                                Ngày cấp:<input value="<%# Eval("ndbh") == DBNull.Value ? "" : Convert.ToDateTime(Eval("ndbh")).ToString("dd/MM/yyyy")%>"
                                    style="font-weight:bold;" />
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
                                Ngày hợp đồng:<span><%# (Eval("ntgcm") == DBNull.Value) ? "" : Convert.ToDateTime(Eval("ntgcm")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Ngày vào biên chế:<span><%# (Eval("nvbc") == DBNull.Value) ? "" : Convert.ToDateTime(Eval("nvbc")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Công việc được giao:<span><%# Eval("vdpc")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
                        <td>
                            <label>
                                Ngày về cơ quan:<span><%# (Eval("nvcqhn") == DBNull.Value) ? "" : Convert.ToDateTime(Eval("nvcqhn")).ToString("dd/MM/yyyy")%></span>
                            </label>
                        </td>
                        <td colspan="2">
                            <label>
                                Khối cán bộ:<span><%# Eval("kcb")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Công việc hiện nay:<span><%# Eval("cvdn")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
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
                    <tr>
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
                    <tr class="even">
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
                    <tr>
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
                    <tr class="even">
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
                    <tr>
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
                    <tr class="even">
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
                    <tr>
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
                    <tr class="even">
                        <td colspan="3">
                            <label>
                                Sở trường, năng khiếu:<span><%# Eval("nlstnk")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>
                                Lịch sử bản thân:<span><%# Eval("ddlsbt")%></span>
                            </label>
                        </td>
                    </tr>
                    <tr class="even">
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
<script type="text/javascript">
    $(document).ready(function () {
        $('#ab').datepick({
            dateFormat: 'dd/mm/yyyy',
            yearRange: '1920:2020'
        });
    });
</script>
