<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.Report2" MasterPageFile="~/Master/Admin.Master" %>
<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
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
                <td height="30" align="left" class="Row2">Chọn đơn vị lập báo cáo</td>
                <td height="30" align="left" class="Row1">
                    <asp:DropDownList ID="ddlDonViLapBaoCao" runat="server" />
		        </td>
            </tr>
	         <tr>
	 	        <td valign="top" height="30" class="Row2">Chọn theo diện cán bộ cán bộ</td>
		        <td height="30" class="Row1">                                    		            
                    <asp:CheckBoxList ID="chkboxDienCanBo" runat="server" />
                </td>
            </tr>
             <tr>
	 	        <td valign="top" height="30" class="Row2">Chọn theo tình trạng hiện tại</td>
		        <td height="30" class="Row1">                                    		            
                    <asp:CheckBoxList ID="chkboxTinhTrangHienTai" runat="server" />
                </td>
            </tr>
	        <tr>
                <td height="30" align="center" colspan="2" class="Row3">
                   <asp:Button Text="Tạo danh sách nâng lương" runat="server" ID="btnBuildList" 
                        onclick="btnBuildList_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    <div>
     <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </div>
       
</div>
</asp:Content>