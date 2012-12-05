<%@ Page Title="" Language="C#" MasterPageFile="/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="BaoCaoThongKe.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.BaoCaoThongKe" %>

<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="content">
        <br />
        <h1>
            In báo cáo</h1>
        <hr width="750px" />
        <div id="noidung">
            <table class="forumline table-result" width="95%" border="0" cellspacing="1" cellpadding="4">
                <tbody>
                    <tr>
                        <th colspan="2" class="thHead">
                            <b>BÁO CÁO THỐNG KÊ</b>
                        </th>
                    </tr>
                    <tr>
                        <td width="50%" align="left" class="row3">
                            BÁO CÁO LOẠI I
                        </td>
                        <td align="right" class="row3">
                            BÁO CÁO LOẠI II
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=1">Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=13">Danh sách cán bộ đến tuổi nghỉ hưu</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=2">Báo cáo chất lượng cán bộ công chức 1</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=6">Báo cáo ngạch, bậc công chức, viên chức</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=3">Báo cáo chất lượng cán bộ công chức 2</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=15">Báo cáo kỷ luật</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=4">Danh sách cán bộ hưởng lương chức vụ</a>
                        </td>
                        <td align="right" class="row1">
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=5">Thống kê đội ngũ cán bộ khoa học nghiệp vụ</a>
                        </td>
                        <td class="row1">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="row3">
                            BÁO CÁO LOẠI III
                        </td>
                        <td align="right" class="row3">
                            BÁO CÁO BAN HÀNH THEO
                            <br>
                            QUYẾT ĐỊNH SỐ 28/2000/QĐ-BTCCBCP NGÀY 10/6/2000
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=8">Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=21">Báo cáo chất lượng cán bộ công chức chia theo lĩnh vực</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=10">Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=22">Báo cáo chất lượng cán bộ công chức chia theo đơn vị</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=9">Danh sách cán bộ không thuộc ngạch cao cấp và chính đề
                                nghị nâng lương</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=23">Báo cáo số lượng công chức giữ các chức vụ lãnh đạo do
                                bổ nhiệm</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report.aspx?type=14">Danh sách cán bộ có hệ lương tột khung</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=24">Báo cáo danh sách và tiền lương cán bộ công chức</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                            <a href="Report2.aspx">In quyết định đề nghị nâng lương</a>
                        </td>
                        <td align="right" class="row1">
                            <a href="Report.aspx?type=25">Báo cáo tổng hợp ngạch, bậc và phụ cấp công chức</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="row1">
                        </td>
                        <td align="right" class="row1">
                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
            <table width="95%" border="0" cellspacing="1" cellpadding="4" class="table-result">
                <tbody>
                    <tr>
                        <td valign="top" align="center" colspan="2" class="column_title">
                            CÁC BÁO CÁO THỐNG KÊ MỚI
                        </td>
                    </tr>
                    <tr>
                        <td width="50%" class="row1">
                            <a href="ThongKeKhenthuong.aspx">Thống kê Thành tích khen thưởng</a>
                        </td>
                        <td class="row1">
                            <a href="ThongKeCanBoCaoCap.aspx?type=2">Thống kê DS Cán bộ nâng lương không thuộc ngạch
                                cao cấp</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%" class="row1">
                            <a href="ThongKeCanBoCaoCap.aspx?type=1">Thống kê DS Cán bộ nâng lương thuộc ngạch cao
                                cấp</a>
                        </td>
                        <td class="row1">
                            <a href="ThanhToanLuong.aspx">Bảng thanh toán lương hàng tháng</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
