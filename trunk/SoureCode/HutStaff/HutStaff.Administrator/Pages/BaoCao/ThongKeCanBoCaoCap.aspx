<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongKeCanBoCaoCap.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.ThongKeCanBoCaoCap" MasterPageFile="~/Master/Admin.Master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="MainContentPlaceHolder">
     <div class="content" id="content">
        <br/>
        <h1>Thống kê khen thưởng</h1>
        <hr width="750px"/>
        <table cellspacing="1" cellpadding="4" border="0" class="forumline report-table">            
			<tbody>
                <tr>
					<th class="thHead" height="55" align="center" colspan="3">
                        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                    </th>
				</tr>
				<tr>
					<td class="row1" colspan="3" style="line-height:20px;">
						<span class="p-title">Chọn đơn vị lập báo cáo</span> &nbsp;&nbsp;&nbsp;
						<asp:DropDownList ID="ddlDonVi" size="1" runat="server" CssClass ="ddl"/>
					</td>
				</tr>
				<tr>
					<td class="row2" align="left" valign="top">
						<span class="p-title">Diện cán bộ</span> <br/>
						<asp:CheckBoxList ID="chkboxDienCanBo" runat="server" />	
					</td>
				</tr>
				<tr>
					<td class="row1">Năm làm báo cáo</td>
					<td class="row2"><asp:TextBox ID="txtNamBaoCao" runat="server" Text=""  maxlength="4" CssClass="textbox"/></td>
				</tr>
				<tr>
					<td class="row1">Tháng thay đổi mức lương cơ bản</td>
					<td class="row2"><asp:TextBox ID="txtThayDoiLuongCoBan" runat="server"  Value="" maxlength="2" CssClass="textbox"/></td>
				</tr>
				<tr>
					<td class="row1">Mức lương cơ bản cũ</td>
					<td class="row2"><asp:TextBox ID="txtLuongCoBanCu" runat="server"  Value="" maxlength="10"  CssClass="textbox"/></td>
				</tr>
				<tr>
					<td class="row1">Mức lương cơ bản mới</td>
					<td class="row2"><asp:TextBox ID="txtLuongCoBanMoi" runat="server"  Value="" maxlength="10"  CssClass="textbox"/></td>
				</tr>
				<tr>
					<td class="row1" colspan="2" align="center">
						
						<asp:Button runat="server" Text="Xuất báo cáo để tải về máy" ID="btnXuat" 
                            onclick="btnXuat_Click"/>
						<asp:Button runat="server" Text="Xem trước báo cáo" ID="btnXem" 
                            onclick="btnXem_Click" />
					</td>
				</tr>
			</tbody>
        </table>
    </div>
    
</asp:Content>