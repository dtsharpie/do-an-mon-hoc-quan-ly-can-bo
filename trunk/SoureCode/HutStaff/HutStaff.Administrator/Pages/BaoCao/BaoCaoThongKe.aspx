<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BaoCaoThongKe.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.BaoCaoThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content" id="content">
        <br />
        <h1>In báo cáo</h1>
        <hr width="750px" />
        <div id="noidung">
            <table class="forumline table-form" width="95%" border="0" cellspacing="1" cellpadding="4">
                <tbody>
                    <tr>
                        <th colspan="2" class="thHead"><b>BÁO CÁO THỐNG KÊ</b></th>
                    </tr>
			        <tr>
				        <td width="50%" align="left" class="row3">BÁO CÁO LOẠI I</td>
				        <td align="right" class="row3">BÁO CÁO LOẠI II</td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt01.php');">Phân loại cán bộ công chức theo ngạch độ tuổi,giới tính.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt13.php');">Danh sách cán bộ đến tuổi nghỉ hưu.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt02.php');">Báo cáo chất lượng cán bộ công chức 1.</a></td>
				        <td align="right" class="row1"><a href="javascript: openNew('rpt06.php');">Báo cáo ngạch, bậc công chức, viên chức.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt03.php');">Báo cáo chất lượng cán bộ công chức 2.</a></td>
				        <td align="right" class="row1"><a href="javascript: openNew('rpt15.php');">Báo cáo kỷ luật.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt04.php');">Danh sách cán bộ hưởng lương chức vụ</a></td>
				        <td align="right" class="row1"></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt05.php');">Thống kê đội ngũ cán bộ khoa học nghiệp vụ</a></td>
				        <td class="row1"></td>
			        </tr>
			        <tr>
				        <td align="left" class="row3">BÁO CÁO LOẠI III</td>
				        <td align="right" class="row3">BÁO CÁO BAN HÀNH THEO <br> QUYẾT ĐỊNH SỐ 28/2000/QĐ-BTCCBCP NGÀY 10/6/2000</td>
			        </tr>

			        <tr>
				        <td class="row1"><a href="javascript:openNew('rpt08.php');">Danh sách cán bộ thuộc ngạch cao cấp đề nghị nâng lương.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt21.php');">Báo cáo chất lượng cán bộ công chức chia theo lĩnh vực.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript:openNew('rpt10.php');">Danh sách cán bộ thuộc ngạch chính đề nghị nâng lương.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt22.php');">Báo cáo chất lượng cán bộ công chức chia theo đơn vị.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript:openNew('rpt09.php');">Danh sách cán bộ không thuộc ngạch cao cấp và chính đề nghị nâng lương.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt23.php');">Báo cáo số lượng công chức giữ các chức vụ lãnh đạo do bổ nhiệm.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript:openNew('rpt14.php');">Danh sách cán bộ có hệ lương tột khung.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt24.php');">Báo cáo danh sách và tiền lương cán bộ công chức.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"><a href="javascript: openNew('rpt07.php');">In quyết định đề nghị nâng lương.</a></td>
				        <td align="right" class="row1"><a href="javascript:openNew('rpt25.php');">Báo cáo tổng hợp ngạch, bậc và phụ cấp công chức.</a></td>
			        </tr>
			        <tr>
				        <td class="row1"></td>
				        <td align="right" class="row1"></td>
			        </tr>
		        </tbody>
            </table>
            <br/>
            <table width="95%" border="0" cellspacing="1" cellpadding="4" class="forumline">
		        <tbody>
                    <tr>
		                <td valign="top" align="center" colspan="2" class="column_title">CÁC BÁO CÁO THỐNG KÊ MỚI</td>			
		            </tr>
		            <tr>
		  	            <td width="50%" class="row1"><a href="javascript: openNew('rpt26.php');">Thống kê Thành tích khen thưởng</a></td>
			            <td class="row1"><a href="javascript: openNew('rpt27.php');">Thống kê DS Cán bộ nâng lương không thuộc ngạch cao cấp</a></td>
		            </tr>
		            <tr>
		  	            <td width="50%" class="row1"><a href="javascript: openNew('rpt28.php');">Thống kê DS Cán bộ nâng lương thuộc ngạch cao cấp</a></td>
			            <td class="row1"><a href="javascript: openNew('rpt29.php');">Bảng thanh toán lương hàng tháng</a></td>
		            </tr>
		        </tbody>
            </table>
        </div>
    </div>
</asp:Content>
