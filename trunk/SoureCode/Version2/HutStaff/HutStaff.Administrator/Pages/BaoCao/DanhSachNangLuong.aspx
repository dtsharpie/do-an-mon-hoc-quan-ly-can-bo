<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachNangLuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.DanhSachNangLuong"  MasterPageFile="~/Master/Admin.Master" %>
<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">   
    <script type="text/javascript">
        function CheckAll(bvalue) {
            $('.cbkitem').attr("checked",bvalue);             
        }        
    </script>
    <link href="../../Styles/default.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContentPlaceHolder" ID="content1">
    <div class="content" id="content">
<form action="" name="myform" method="POST" id="formID">
    <center>
        <table width="100%" height="100%" bordercolor="#111111" border="0" cellspacing="1" cellpadding="4" style="border-collapse: collapse">
            <tbody>
                <tr>
                    <td valign="top" align="center" class="bodyline">
	                    <br />
	                      <h2>BÁO CÁO THỐNG KÊ</h2>
	                      <h5>Danh sách cán bộ đến kỳ nâng lương</h5>
	                      <br><br>
		                <asp:Button ID="btnSubmit" runat="server" Text="Xử lý"/>
		                <input type="button" onclick="CheckAll(true);" value="Chọn tất cả"/>
		                <input type="button" onclick="CheckAll(false);" value="Huỷ chọn tất cả"/>		
	                <br><br>
	                <table border="0" width="95%" cellspacing="1" cellpadding="4" class="forumline">
		                <tbody>
                            <tr>
		                        <th>Số TT</th>
		                        <th>Họ và tên</th>
		                        <th>Đơn vị</th>
		                        <th>Mã ngạch</th>
		                        <th>Bậc lương</th>
		                        <th>Lương hưởng từ  </th>
	  	                        <th>Nâng</th>
		                    </tr>
                            <tr>
		                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
		                        <b>NGẠCH CAO CẤP VÀ TƯƠNG ĐƯƠNG</b></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 1 </p> </td>
	                            <td class="Row2"><p class="Text">Trần Văn Địch</p></td>
	                            <td class="Row1"><p class="Text">Viện Cơ khí</p></td>
	                            <td class="Row2"><p class="Text">15109</p></td>
	                            <td class="Row1"><p class="Text">3</p></td>
	                            <td class="Row2"><p class="Text">01/05/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="77"/> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 2 </p> </td>
	                            <td class="Row2"><p class="Text">Hoàng Đình Hòa</p></td>
	                            <td class="Row1"><p class="Text">Viện Công nghệ Sinh học và Thực phẩm</p></td>
	                            <td class="Row2"><p class="Text">15109</p></td>
	                            <td class="Row1"><p class="Text">3</p></td>
	                            <td class="Row2"><p class="Text">01/04/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="1159"> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 3 </p> </td>
	                            <td class="Row2"><p class="Text">Nguyễn Đức Chiến</p></td>
	                            <td class="Row1"><p class="Text">Viện Vật lý kỹ thuật</p></td>
	                            <td class="Row2"><p class="Text">15109</p></td>
	                            <td class="Row1"><p class="Text">3</p></td>
	                            <td class="Row2"><p class="Text">01/04/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="895"> </p></td>
	                        </tr>
                            <tr>
		                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
		                            <b>NGẠCH CHÍNH VÀ TƯƠNG ĐƯƠNG</b>
                                </td>
	                       </tr>	
                           <tr>
	                            <td class="Row1"><p class="Text"> 4 </p> </td>
	                            <td class="Row2"><p class="Text">Nguyễn Việt Thành</p></td>
	                            <td class="Row1"><p class="Text"></p></td>
	                            <td class="Row2"><p class="Text">13095</p></td>
	                            <td class="Row1"><p class="Text">6</p></td>
	                            <td class="Row2"><p class="Text">01/10/2002</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="1761"> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 5 </p> </td>
	                            <td class="Row2"><p class="Text">Ngô Đình Hòa</p></td>
	                            <td class="Row1"><p class="Text">Ba văn phòng</p></td>
	                            <td class="Row2"><p class="Text">01003</p></td>
	                            <td class="Row1"><p class="Text">3</p></td>
	                            <td class="Row2"><p class="Text">01/12/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="1969"> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 6 </p> </td>
	                            <td class="Row2"><p class="Text">Nguyễn Long Giang</p></td>
	                            <td class="Row1"><p class="Text">Khoa Giáo dục Thể chất</p></td>
	                            <td class="Row2"><p class="Text">15111</p></td>
	                            <td class="Row1"><p class="Text">3</p></td>
	                            <td class="Row2"><p class="Text">01/04/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="1502"> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 7 </p> </td>
	                            <td class="Row2"><p class="Text">Lê Văn Kiện</p></td>
	                            <td class="Row1"><p class="Text">Khoa Lý luận chính trị</p></td>
	                            <td class="Row2"><p class="Text">15111</p></td>
	                            <td class="Row1"><p class="Text">4</p></td>
	                            <td class="Row2"><p class="Text">01/09/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="969"> </p></td>
	                        </tr>	
                            <tr>	
		                        <td valign="middle" align="CENTER" class="Row3" colspan="7">
		                        <b>NGẠCH CÒN LẠI</b></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 231 </p> </td>
	                            <td class="Row2"><p class="Text">Nghiêm Xuân Thúc</p></td>
	                            <td class="Row1"><p class="Text">Khoa Giáo dục Thể chất</p></td>
	                            <td class="Row2"><p class="Text">15110</p></td>
	                            <td class="Row1"><p class="Text">4</p></td>
	                            <td class="Row2"><p class="Text">01/07/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="1111"> </p></td>
	                        </tr>	
                            <tr>
	                            <td class="Row1"><p class="Text"> 232 </p> </td>
	                            <td class="Row2"><p class="Text">Đinh Thanh Xuân</p></td>
	                            <td class="Row1"><p class="Text">Khoa Lý luận chính trị</p></td>
	                            <td class="Row2"><p class="Text">15110</p></td>
	                            <td class="Row1"><p class="Text">1</p></td>
	                            <td class="Row2"><p class="Text">01/01/2009</p></td>
	                            <td class="Row1"><p class="Text"><input type="checkbox" class="cbkitem" name="968"> </p></td>
	                        </tr>
	                    </tbody>
                    </table>                    
                    <br>
                    <asp:Button ID="Button1" runat="server" Text="Xử lý"/>
                    <input type="button" onclick="CheckAll(true);" value="Chọn tất cả">
                    <input type="button" onclick="CheckAll(false);" value="Huỷ chọn tất cả">
               <br>	
               &nbsp;
                </tbody>
            </table>
       </center>
</form>
</asp:Content>