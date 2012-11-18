<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongKeKhenthuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.ThongKeKhenthuong" MasterPageFile="~/Master/Admin.Master" %>
<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
    <style type="text/css">
        .button
        {
            margin-left: 650px;
        }
        .timkiem
        {
            background-color: Green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="content" id="content">
        <br/>
        <h1>Thống kê khen thưởng</h1>
        <hr width="750px"/>
        <table cellspacing="1" cellpadding="4" border="0" class="forumline report-table">
			<tbody>
                <tr>
					<th class="thHead" height="55" align="center" colspan="3">Thống kê thành tích khen thưởng</th>
				</tr>
				<tr>
					<td style="line-height:20px;" colspan="3" class="row1">
						<b>Chọn đơn vị lập báo cáo</b> &nbsp;&nbsp;&nbsp;
						<asp:DropDownList ID="ddlDonViLapBaoCao" runat="server" />                         
					</td>
				</tr>
				<tr>
					<td valign="top" align="left" class="row2">
						<span class="p-title">Diện cán bộ</span> <br/>		
						<asp:CheckBoxList ID="chkboxDienCanBo" runat="server" />			
					</td>
					<td valign="top" align="left" class="row2"><span class="p-title">Tình trạng khen thưởng</span><br/>
						<asp:RadioButton runat="server" value="dkt" ID="rdoDuocKhen" GroupName="rdoKhen" /> Đã từng được khen thưởng <br/>
						<asp:RadioButton runat="server" ID="rdoChuaDuoc" GroupName="rdoKhen" /> Chưa từng được khen thưởng
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3" class="row1">						
						<asp:Button Text="Xuất báo cáo để tải về máy" runat="server" ID="btnXuat" 
                            CssClass="button" onclick="btnXuat_Click" />
						<asp:Button Text="Xem trước báo cáo" runat="server" ID="btnXem" 
                            CssClass="button" onclick="btnXem_Click"/>
					</td>
				</tr>
			</tbody>
        </table>
    </div>
</asp:Content>