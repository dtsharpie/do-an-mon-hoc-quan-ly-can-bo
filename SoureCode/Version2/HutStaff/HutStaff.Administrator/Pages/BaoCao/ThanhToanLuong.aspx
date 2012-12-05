<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThanhToanLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.ThanhToanLuong" MasterPageFile="~/Master/Admin.Master" %>
<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">   
    <script type="text/javascript">
        function CheckAll(bvalue) {
            $('.cbkitem').attr("checked", bvalue);
        }        
    </script>    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder" ID="content1">
    <div class="content" id="content">        
   		<br>
        <h1>Báo cáo thống kê</h1>
        <hr width="750px"/>
			
			<table width="750" cellspacing="1" cellpadding="4" border="0" class="forumline">
				<tbody>
                    <tr>
                        <th class="thHead" height="55" align="center" colspan="2">
                            <span id="lblTitle"></span>
                        </th>
                    </tr>
				    <tr>
					    <td class="Row1" height="30" align="left">Chọn đơn vị lập báo cáo</td>
                        <td class="Row2">
                            <asp:DropDownList runat="server" ID="ddlDonVi">
                                <asp:ListItem Text="Bm Đường lối cách mạng của Đảng Cộng sản Việt Nam" Value="Trường ĐHBKHN"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
				    </tr>				
				    <tr>
					    <td class="Row1">Tháng tính lương</td>
					    <td class="Row2"><asp:Textbox runat="server" maxlength="2" size="2" value="12" ID="thangbaocao"/></td>
				    </tr>
				    <tr>
					    <td class="Row1">Năm</td>
					    <td class="Row2"><asp:Textbox runat="server" maxlength="4" size="4" value="2012" ID="nambaocao"/></td>
				    </tr>
				    <tr>
					    <td class="Row1">Mức lương cơ bản hiện tại</td>
					    <td class="Row2"><asp:Textbox runat="server" maxlength="10" size="10" value="450000" ID="lcban"/></td>
				    </tr>				
				    <tr>
					    <td align="center" colspan="2" class="Row1">						
						    <asp:Button runat="server" Text="Xuất báo cáo để tải về máy" ID="btnXuatBC"  />
                            <asp:Button runat="server" Text="Xem trước báo cáo" ID="btnXemTruoc"  />						
					    </td>
				    </tr>
			    </tbody>
            </table>
			<div style="text-align:center">
            <br/>
    </div>
</asp:Content>