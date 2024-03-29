﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.Report" MasterPageFile="~/Master/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder" ID="content1">
    <div class="content" id="content">
        <br/>
        <h1>Báo cáo thống kê</h1>
        <hr width="750px"/>
        <table cellspacing="1" cellpadding="4" border="0" class="forumline report-table">
    	<tbody>
            <tr>
                <th height="55" align="center" colspan="2" class="thHead">
                    <asp:Label ID="lblTitle" runat="server" Text="" />
		        </th>
            </tr>
            <tr>
                <td height="30" align="center" class="Row2">Chọn đơn vị lập báo cáo</td>
                <td height="30" align="left" class="Row1">
                    <span style="text-align:left;"><asp:TreeView ID="treeViewDonVi" runat="server" ShowLines="True" ShowCheckBoxes="All" ExpandDepth="1" BorderWidth="0" /></span>
		        </td>
            </tr>
	         <tr>
	 	        <td valign="top" height="30" class="Row2">Chọn theo diện cán bộ cán bộ</td>
		        <td height="30" class="Row1">                                    		            
                    <asp:CheckBoxList ID="chkboxDienCanBo" runat="server" />
                </td>
            </tr>
	        <tr>
                <td height="30" align="center" colspan="2" class="Row3">
                   <asp:Button Text="Xuất báo cáo để tải về máy" runat="server" ID="btnXuat" 
                        onclick="btnXuat_Click" />
                   <asp:Button Text="Xem trước báo cáo" runat="server" ID="btnXem" 
                        onclick="btnXem_Click" />
                </td>
            </tr>
        </tbody>
    </table>
</div>
</asp:Content>
