<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongKeCanBoCaoCap.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.ThongKeCanBoCaoCap" MasterPageFile="~/Master/Admin.Master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="MainContentPlaceHolder">
     <div class="content" id="content">
        <br/>
        <h1>Thống kê khen thưởng</h1>
        <hr width="750px"/>
        <table cellspacing="1" cellpadding="4" border="0" class="forumline report-table">            
			<tbody>
                <tr>
					<th class="thHead" height="55" align="center" colspan="3">Thống kê nâng lương hằng năm thuộc ngach cao cấp</th>
				</tr>
				<tr>
					<td class="row1" colspan="3" style="line-height:20px;">
						<span class="p-title">Chọn đơn vị lập báo cáo</span> &nbsp;&nbsp;&nbsp;
						<asp:DropDownList runat="server" size="1" ID="ddlDonVi">
							<asp:ListItem Value="002">Trường Đại học Bách khoa Hà Nội</asp:ListItem>
							<asp:ListItem Value="00203">Khoa</asp:ListItem>
							<asp:ListItem Value="0020301">Viện Cơ khí</asp:ListItem>
							<asp:ListItem Value="0020302">Viện Kỹ thuật Hoá học</asp:ListItem>
							<asp:ListItem Value="0020303">Viện Điện</asp:ListItem>
							<asp:ListItem Value="0020304">Viện Điện tử - Viễn thông</asp:ListItem>
							<asp:ListItem Value="0020305">Viện Công nghệ Thông tin và Truyền thông</asp:ListItem>
							<asp:ListItem Value="0020306">Viện Khoa học và Kỹ thuật vật liệu</asp:ListItem>
							<asp:ListItem Value="0020307">Viện Kinh tế và Quản lý</asp:ListItem>
							<asp:ListItem Value="0020308">Viện Dệt may-Da giầy và Thời trang</asp:ListItem>
							<asp:ListItem Value="0020309">Viện Toán ứng dụng và Tin học</asp:ListItem>
							<asp:ListItem Value="0020310">Khoa Lý luận chính trị</asp:ListItem>
							<asp:ListItem Value="0020B24">Phòng Thí nghiệm trọng điểm Vật liệu Polyme và Compozit</asp:ListItem>
							<asp:ListItem Value="0020311">Viện Ngoại ngữ</asp:ListItem>
							<asp:ListItem Value="0020312">Viện Sư phạm Kỹ thuật</asp:ListItem>
							<asp:ListItem Value="0020313">Viện Đào tạo liên tục</asp:ListItem>
							<asp:ListItem Value="00204">Phòng</asp:ListItem>
							<asp:ListItem Value="0020401">Phòng Tổ chức Cán bộ</asp:ListItem>
							<asp:ListItem Value="0020402">Phòng Đào tạo Đại học</asp:ListItem>
							<asp:ListItem Value="0020403">Phòng Hành chính tổng hợp</asp:ListItem>
							<asp:ListItem Value="0020404">Phòng Kế hoạch -Tài vụ</asp:ListItem>
							<asp:ListItem Value="0020405">Phòng Hợp tác Quốc tế</asp:ListItem>
							<asp:ListItem Value="0020406">Phòng Khoa học - Công nghệ</asp:ListItem>
							<asp:ListItem Value="0020407">Phòng Công tác Chính trị và Công tác sinh viên</asp:ListItem>
							<asp:ListItem Value="0020408">Phòng Quản trị</asp:ListItem>
							<asp:ListItem Value="0020409">Phòng Bảo vệ</asp:ListItem>
							<asp:ListItem Value="0020410">Phòng Thiết bị</asp:ListItem>
							<asp:ListItem Value="0020411">Ba văn phòng</asp:ListItem>
							<asp:ListItem Value="0020412">Trung tâm Y tế Bách khoa</asp:ListItem>
							<asp:ListItem Value="00205">Ban</asp:ListItem>
							<asp:ListItem Value="0020501">Trung tâm Đảm bảo chất lượng</asp:ListItem>
							<asp:ListItem Value="0020502">Thư viện Tạ Quang Bửu</asp:ListItem>
							<asp:ListItem Value="0020510">Trung tâm Mạng thông tin</asp:ListItem>
							<asp:ListItem Value="0020503">Ban Quản lý Công trình</asp:ListItem>
							<asp:ListItem Value="0020505">Ban Xây dựng và Quản lý Dự án</asp:ListItem>
							<asp:ListItem Value="0020507">Ban Quản trị các tòa nhà cao tầng</asp:ListItem>
							<asp:ListItem Value="00206">Bộ môn</asp:ListItem>
							<asp:ListItem Value="0020315">Khoa Giáo dục Thể chất</asp:ListItem>
							<asp:ListItem Value="00209">Viện</asp:ListItem>
							<asp:ListItem Value="0020901">Viện Khoa học và Công nghệ Môi trường</asp:ListItem>
							<asp:ListItem Value="0020902">Viện Vật lý kỹ thuật</asp:ListItem>
							<asp:ListItem Value="0020903">Viện Công nghệ Sinh học và Thực phẩm</asp:ListItem>
							<asp:ListItem Value="0020904">Viện Khoa học và Công nghệ Nhiệt Lạnh</asp:ListItem>
							<asp:ListItem Value="0020905">Viện Đào tạo Quốc tế về Khoa học Vật liệu (ITIMS)</asp:ListItem>
							<asp:ListItem Value="0020906">Viện Cơ khí Động lực</asp:ListItem>
							<asp:ListItem Value="0020B">Trung tâm</asp:ListItem>
							<asp:ListItem Value="0020909">Viện Kỹ thuật Hạt nhân và Vật lý Môi trường</asp:ListItem>
							<asp:ListItem Value="0020B04">Trung tâm Nghiên cứu vật liệu Polyme</asp:ListItem>
							<asp:ListItem Value="0020B07">Trung tâm Quản lý Ký túc xá</asp:ListItem>
							<asp:ListItem Value="0020B09">Trung tâm nghiên cứu triển khai công nghệ cao</asp:ListItem>
							<asp:ListItem Value="0020B12">Trung tâm tiếng Pháp</asp:ListItem>
							<asp:ListItem Value="0020B14">Trung tâm trao đổi KHKT Việt Đức</asp:ListItem>
							<asp:ListItem Value="0020B15">Trung tâm Điện tử  - Y sinh học</asp:ListItem>
							<asp:ListItem Value="0020B16">Trung tâm tính toán hiệu năng cao</asp:ListItem>
							<asp:ListItem Value="0020B17">Trung tâm PT và UD Công nghệ phần mềm</asp:ListItem>
							<asp:ListItem Value="0020B18">Trung tâm phần mềm và giải pháp an ninh mạng</asp:ListItem>
							<asp:ListItem Value="0020B19">Trung tâm hợp tác QT về ĐT&amp;CGCN</asp:ListItem>
							<asp:ListItem Value="0020B22">Trung tâm Quốc tế Nghiên cứu và Phát triển công nghệ định vị sử dụng vệ tinh (NAVIS)</asp:ListItem>
							<asp:ListItem Value="0020B23">Viện Nghiên cứu quốc tế về Thông tin đa phương tiện, truyền thông và ứng dụng (MICA)</asp:ListItem>
							<asp:ListItem Value="0020B26">Trung tâm Đào tạo Tài năng và Chất lượng cao</asp:ListItem>
							<asp:ListItem Value="0020B27">Trung tâm Đào tạo Bảo dưỡng công nghiệp</asp:ListItem>
							<asp:ListItem Value="0020B30">Trung tâm Thể thao-Văn hoá</asp:ListItem>
							<asp:ListItem Value="0020B31">Viện Đào tạo quốc tế</asp:ListItem>
							<asp:ListItem Value="0020E">Các đơn vị Sản xuất - Dịch vụ</asp:ListItem>
							<asp:ListItem Value="0020E01">Công ty TNHH MTV Tư vấn và CGCN Bách khoa</asp:ListItem>
							<asp:ListItem Value="0020E03">Nhà xuất bản Bách Khoa Hà Nội</asp:ListItem>
							<asp:ListItem Value="0020E04">Trung tâm Phục vụ Bách khoa</asp:ListItem>
							<asp:ListItem Value="0020314">Khoa Giáo dục Quốc phòng</asp:ListItem>
							<asp:ListItem Value="0020907">Viện Tiên tiến Khoa học và Công nghệ (AIST)</asp:ListItem>
							<asp:ListItem Value="0020908">Viện Đào tạo Sau đại học</asp:ListItem>
							<asp:ListItem Value="0020E05">Bách khoa Hà Nội-Holdings</asp:ListItem>
							<asp:ListItem Value="0020920">Viện Kỹ thuật điều khiển và Tự động hóa</asp:ListItem>
							<asp:ListItem Value="0020B32">Trung tâm Nghiên cứu Quốc tế về Khoa học vật liệu tính toán</asp:ListItem>
							<asp:ListItem Value="0020B33">Trung tâm Nghiên cứu ứng dụng và Sáng tạo công nghệ </asp:ListItem>
							<asp:ListItem Value="0020508">Trung tâm Ngoại ngữ</asp:ListItem>
							<asp:ListItem Value="0020910">Viện Nghiên cứu và Phát triển ứng dụng các hợp chất thiên nhiên</asp:ListItem>
							<asp:ListItem Value="0020B34">Chương trình Hợp tác đào tạo Quốc tế Genetic Bách khoa</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="row2" align="left" valign="top">
						<span class="p-title">Diện cán bộ</span> <br/>
						<asp:CheckBox runat="server" ID="chkdcb1" Value="1" />Biên chế<br/>
                        <asp:CheckBox runat="server" ID="chkdcb2" Value="2" />Hợp đồng dài hạn<br/>
                        <asp:CheckBox runat="server" ID="CheckBox1" Value="3" />Hợp đồng ngắn hạn<br/>
                        <asp:CheckBox runat="server" ID="CheckBox2" Value="4" />Nghiên cứu khoa học<br/>
                        <asp:CheckBox runat="server" ID="CheckBox3" Value="2" />Hợp đồng chờ biên chế<br/>
                        <asp:CheckBox runat="server" ID="CheckBox4" Value="2" />Đã rời biên chế<br/>
                        <asp:CheckBox runat="server" ID="CheckBox5" Value="2" />Tuyển dụng 2003<br/>
                        <asp:CheckBox runat="server" ID="CheckBox6" Value="2" />Gửi lương<br/>
                        <asp:CheckBox runat="server" ID="CheckBox7" Value="2" />Tuyển dụng 10/2004<br/>
                        <asp:CheckBox runat="server" ID="CheckBox8" Value="2" />Tuyển dụng 2005<br/>
                        <asp:CheckBox runat="server" ID="CheckBox9" Value="2" />Tuyển dụng 2006<br/>
                        <asp:CheckBox runat="server" ID="CheckBox10" Value="2" />Tuyển dụng 2007<br/>
                        <asp:CheckBox runat="server" ID="CheckBox11" Value="2" />Biệt phái<br/>
                        <asp:CheckBox runat="server" ID="CheckBox12" Value="2" />Tuyển dụng 2008<br/>
                        <asp:CheckBox runat="server" ID="CheckBox13" Value="2" />Tuyển dụng 2009<br/>
                        <asp:CheckBox runat="server" ID="CheckBox14" Value="2" />Tuyển dụng 2010<br/>
                        <asp:CheckBox runat="server" ID="CheckBox15" Value="2" />Tuyển dụng 2011<br/>
                        <asp:CheckBox runat="server" ID="CheckBox16" Value="2" />Tuyển dụng 2012<br/>		
					</td>
					<td class="row2" align="left" valign="top"><span class="p-title">Tình trạng hiện tại</span><br/>
						
	                    <asp:CheckBox runat="server" ID="CheckBox17" Value="2" /> Hiện đang công tác<br/>
	                    <asp:CheckBox runat="server" ID="CheckBox18" Value="2" /> Đã nghỉ hưu<br/>
	                    <asp:CheckBox runat="server" ID="CheckBox19" Value="2" /> Đã mất<br/>
	                    <asp:CheckBox runat="server" ID="CheckBox20" Value="2" /> Đã chuyển cơ quan khác<br/>
	                    <asp:CheckBox runat="server" ID="CheckBox21" Value="2" /> Thôi việc<br/>
	                    <asp:CheckBox runat="server" ID="CheckBox22" Value="2" /> Hiện không hưởng lương<br/>	
					</td>
				</tr>
				<tr>
					<td class="row1">Năm làm báo cáo</td>
					<td class="row2"><asp:TextBox ID="txtNamBaoCao" runat="server" Text="2012"  maxlength="4"/></td>
				</tr>
				<tr>
					<td class="row1">Tháng thay đổi mức lương cơ bản</td>
					<td class="row2"><asp:TextBox ID="tgtdlcban" runat="server"  Value="10" maxlength="2"/></td>
				</tr>
				<tr>
					<td class="row1">Mức lương cơ bản cũ</td>
					<td class="row2"><asp:TextBox ID="lcbancu" runat="server"  Value="350000" maxlength="10"/></td>
				</tr>
				<tr>
					<td class="row1">Mức lương cơ bản mới</td>
					<td class="row2"><asp:TextBox ID="lcbanmoi" runat="server"  Value="450000" maxlength="10"/></td>
				</tr>
				<tr>
					<td class="row1" colspan="2" align="center">
						
						<asp:Button runat="server" Text="Xuất báo cáo để tải về máy" ID="btnXuat"/>
						<asp:Button runat="server" Text="Xem trước báo cáo" ID="btnXem" />
					</td>
				</tr>
			</tbody>
        </table>
    </div>
    
</asp:Content>