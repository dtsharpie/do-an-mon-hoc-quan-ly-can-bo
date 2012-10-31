<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HutStaff.Administrator.Default" %>

<%@ Register Src="/Controls/Common/SlideSearch.ascx" TagName="SlideSearch" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(0).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideSearch ID="SlideSearch1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1 class="title">
        Thông tin tìm kiếm</h1>
    <div id="divSearchForm" class="form-container">
        <form id="formSearch">
            <div> 
             <pan>
                 Chọn đơn vị tìm kiếm
             </pan>
             <pan margin-left="200px">
                <asp:TreeView ID="treeViewDonVi" class="treeView-Timkiem" runat="server" ShowLines="True" ShowCheckBoxes="All" ExpandDepth="1" BorderWidth="0" />
               </pan>
            </div>
          <table class="table-form">
            <tr class="row">
                <td>
                    Tên cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                <asp:TextBox ID="txtName" runat="server" style="width: 300px"></asp:TextBox>
<%--                    <input style="width: 300px" name="hoten" id="hoten" onkeypress="return submitenter(this,event);  "
                        type="text" />--%>
                </td>
                <td class="spacing">
                </td>
                <td>
                    Diện cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                <asp:DropDownList runat="server" ID="dcb" style="width: 300px;">
                    <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr class="row">
                <td>
                    Giới tính
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <asp:CheckBox ID="checkBox_nam" runat="server" OnCheckedChanged="checkBox_nam_Click" AutoPostBack="true" Checked="true" />&nbsp; Nam
                    <asp:CheckBox ID="checkBox_nu" runat="server" OnCheckedChanged="checkBox_nu_Click" AutoPostBack="true" Checked="false" />&nbsp; Nữ
<%--                    <input name="gt_nam" value="1" type="checkbox" />&nbsp; Nam
                    <input name="gt_nu" value="0" type="checkbox" />&nbsp;Nữ--%>
                </td>
                <td class="spacing">
                </td>
               <td>
                    Khối cán bộ
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="khoicanbo" style="width: 300px;">
                        <asp:ListItem Text="Đơn vị cấp 1" Value="111111"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
               
                        
                </td>
            </tr>
            <tr class="row">
                <td>
                    Tuổi
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    Từ&nbsp;
                    <asp:TextBox ID="txtTuTuoi" runat="server" style="width: 30px"></asp:TextBox>
                    <%--<input style="width: 30px" name="tuoi_lonhon" type="text" />--%>
                    Đến&nbsp;
                    <asp:TextBox ID="txtDenTuoi" runat="server" style="width: 30px"></asp:TextBox>
                        
                    <%--<input style="width: 30px" name="tuoi_nhohon" type="text" />--%>
                     <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="txtTuTuoi" 
                        ErrorMessage="Tuổi tối thiểu là 20 tối đa 120" 
                        MinimumValue="20" MaximumValue="120" Type="Integer"></asp:RangeValidator>
                </td>
                <td class="spacing">
                </td>
                
            </tr>
            <tr class="row">
                <td>
                    Năm về trường
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <asp:TextBox ID="txtNamVeTruong" runat="server" style="width: 40px"></asp:TextBox>
                     <font size="1"><i>(Nhỏ nhất: 1956) </i></font>
                       <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtNamVeTruong" 
                        ErrorMessage="Bạn phải nhập số nguyên nhỏ nhất là 1956" 
                        MinimumValue="1956" MaximumValue="2112" Type="Integer"></asp:RangeValidator>
                    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" 
                        Operator="DataTypeCheck" Type="Integer" 
                        ControlToValidate="txtNamVeTruong" 
                        ErrorMessage="Bạn phải nhập số nguyên nhỏ nhất là 1956" />--%>
                </td>
                <td class="spacing">
                </td>
                <td>
                </td>
                <td class="short-spacing">
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" class="button fr" Text="Tìm kiếm" OnClick="Search_click" />
                    <%--<input type="button" class="button fr" value="Tìm kiếm" />--%>
                    <div class="clear">
                    </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <asp:Panel runat="server" ID="panelResult" Visible="false">
    <div class="sub-title">
        <h2>
            Kết quả</h2>
    </div>
    <div class="div-tool">
        <a href="javascript:void(0);" class="lnk-button">Xuất dữ liệu</a><a href="javascript:void(0);"
            class="lnk-button margin-left-10">In sổ cái</a><a href="javascript:void(0);" class="lnk-button margin-left-10">Gửi
                email</a>
    </div>
    <div id="divSearchResult" class="table-container">
        <div class="header-table">
            <div>
                Hiển thị &nbsp;
                    <asp:DropDownList runat="server" ID="numberResultDropDownList" style="width: 60px;" 
                    onselectedindexchanged="numberResultChange" AutoPostBack="true">
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text ="25" Value="25"></asp:ListItem>
                        <asp:ListItem Text ="50" Value="50"></asp:ListItem>
                        <asp:ListItem Text ="100" Value="100"></asp:ListItem>
                    </asp:DropDownList>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;<asp:Label ID="numberResultLabel" runat="server" Text="Đang hiện 1 đến 10 trên 51 kết quả tìm được"></asp:Label>
            </div>
           <%-- <div class="paging fr">
                <span class="first paging_button">First</span> <span class="previous paging_button disable">
                    Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                        2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                        <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
                <span class="last paging_button">Last</span>
            </div>--%>
            <div class="clear">
            </div>
        </div>
        <asp:GridView Visible=False class="table-result" ID="GridView1" runat="server" 
            CellPadding="4" AllowPaging="True"  
            onpageindexchanging="gvResultSearch_PageIndexChanging" ForeColor="Black" 
            GridLines="Vertical"  AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="STT" DataField="shcc">
                <HeaderStyle Height="36px" />
                <ItemStyle Width="20px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Họ và tên" DataField="hoten" >
                <ItemStyle Width="230px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Đơn vị công tác" DataField="dv" >
                <ItemStyle Width="230px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Điện thoại" DataField="tel" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Email" DataField="email" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Xóa" CommandName="Delete" OnClientClick='return confirm("Bạn thực sự muốn xóa?");'>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="30px" />
                    </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />

        </asp:GridView>
     <%--   <table class="table-result">
            <tr class="header">
                <td>
                    STT
                </td>
                <td>
                    Họ và tên
                </td>
                <td>
                    Số hiệu
                </td>
                <td>
                    Đơn vị công tác
                </td>
                <td>
                    Điện thoại
                </td>
                <td>
                    Email
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
                </td>
                <td width="70px">
                    002.002.00954
                </td>
                <td width="230px">
                    Bm Công nghệ các chất vô cơ
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
                </td>
                <td width="70px">
                    002.006.00473
                </td>
                <td width="230px">
                    Bm Vật liệu học, xử lý nhiệt và bề mặt
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
                </td>
                <td width="70px">
                    002.002.00954
                </td>
                <td width="230px">
                    Bm Công nghệ các chất vô cơ
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
                </td>
                <td width="70px">
                    002.006.00473
                </td>
                <td width="230px">
                    Bm Vật liệu học, xử lý nhiệt và bề mặt
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    1
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Trần Viết Vượng</a></b>
                </td>
                <td width="70px">
                    002.002.00954
                </td>
                <td width="230px">
                    Bm Công nghệ các chất vô cơ
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=322">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
            <tr>
                <td align="center" width="20px">
                    3
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Nguyễn Minh Vượng</a></b>
                </td>
                <td width="70px">
                    002.006.00473
                </td>
                <td width="230px">
                    Bm Vật liệu học, xử lý nhiệt và bề mặt
                </td>
                <td class="rong" width="50px">
                </td>
                <td class="rong" width="100px">
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=762">Xóa</a>
                </td>
            </tr>
            <tr class="even">
                <td align="center" width="20px">
                    2
                </td>
                <td width="230">
                    <b><a href="/Xemthongtin/Xemthongtin.aspx" class="link-view">Vũ Đức Vượng</a></b>
                </td>
                <td width="70px">
                    002.005.00389
                </td>
                <td width="230px">
                    Bm Công nghệ phần mềm
                </td>
                <td class="rong" width="50px">
                    0984753061
                </td>
                <td class="rong" width="100px">
                    vuongvd@gmail.com, vuongvd@soict.hut.edu.vn
                </td>
                <td class="xoa" align="center" width="70px">
                    <a href="huyhoso.php?sh=692">Xóa</a>
                </td>
            </tr>
        </table>--%>
      <%--  <div class="footer-table">
            <div>
                Hiển thị &nbsp;
                <select style="width: 60px;">
                    <option selected="selected" value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>&nbsp; dòng&nbsp;&nbsp;-&nbsp;&nbsp;Đang hiện 1 đến 10 trên 51 kết quả
                tìm được
            </div>
            <div class="paging fr">
                <span class="first paging_button">First</span> <span class="previous paging_button disable">
                    Previous</span> <span><span class="paging_button active">1</span> <span class="paging_button">
                        2</span> <span class="paging_button">3</span> <span class="paging_button">4</span>
                        <span class="paging_button">5</span> </span><span class="next paging_button">Next</span>
                <span class="last paging_button">Last</span>
            </div>
            <div class="clear">
            </div>
        </div>--%>
    </div>
    <div class="clear">
    </div>
    <div class="div-tool">
        <a href="javascript:void(0);" class="lnk-button">Xuất dữ liệu</a><a href="javascript:void(0);"
            class="lnk-button margin-left-10">In sổ cái</a><a href="javascript:void(0);" class="lnk-button margin-left-10">Gửi
                email</a>
    </div>
    </asp:Panel>
</asp:Content>
