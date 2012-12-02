<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="KhenThuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.KhenThuong" %>

<%@ Register Src="~/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
    <style type="text/css">
        .button
        {
            margin-top: 5px;
            margin-left: 600px;
            width: 102px;
            height: 35px;
            padding: initial;
            background-color: initial;
            border: initial;
        }
        .timkiem
        {
            background-color: Green;
            width: 762px;
            height: 240px;
        }
        .error
        {
            color: Red;
            
        }
        hr
        {
            margin: 1px;
            margin-top: 3px;
            display: block;
            border-width: 1px;
            border-style: inherit;
            width: 750px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="content">
        <!-- InstanceBeginEditable name="content" -->
        <br />
        <h1>
            Tìm kiếm thông tin khen thưởng</h1>
        <hr width="800px" />
        <form name="myform" action="" method="post" onsubmit="return false">
        <div id="timkiem" class="timkiem" style="background-color: Aqua; color: Black; border-color: Blue;">
            <div class="hang">
                <h4>
                    Hình thức khen thưởng:</h4>
                <span class="ddl">
                    <asp:DropDownList ID="ddlHinhThucKhenThuong" runat="server" CssClass="ddl" />
                </span>
            </div>
            <div class="hang">
                Năm khen thưởng: Từ năm <span class="textbox">
                    <asp:TextBox ID="tbFrom" runat="server" Width="50px" /></span> đến năm <span class="textbox">
                        <asp:TextBox ID="tbTo" runat="server" Width="50px" /></span>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  <div class="hang">
                    <h4>
                        Đơn vị cấp 1,2,3:</h4>
                        <div class="f_input row-right">
                            <asp:DropDownList ID="ddlUnit123" runat="server" CssClass="ddl" 
                                AutoPostBack="True" onselectedindexchanged="ddlUnit123_SelectedIndexChanged" >
                        

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="hang">
                        <h4>
                            Đơn vị cấp 4:</h4>
                        <div class="row-right">
                            <asp:DropDownList ID="ddlUnit4" runat="server" CssClass="ddl">

                        
                            </asp:DropDownList>
                        </div>
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>
           
            <div class="hang">
                <h4>
                    Diện cán bộ:</h4>
                <div class="row-right">
                    <span class="ddl">
                        <asp:DropDownList ID="ddlDienCanBo" runat="server" CssClass="ddl" />
                    </span>
                </div>
            </div>
            
            <div class="hang">
                <h4>
                    Khối cán bộ:</h4>
                <div class="row-right">
                    <asp:DropDownList ID="ddlKhoiCb" runat="server" CssClass="ddl">
                       
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <asp:ImageButton ID="btnSearch" runat="server" Text="Tìm kiếm" ImageUrl="~/Images/timkiem.png"
            CssClass="button" OnClick="btnSearch_Click" />
        <%--<input type="image" src="../../Images/timkiem.png" style=" margin-left:650px;"  onclick="this.form.submit();"/>  --%>
        <br />
        <hr  />
        </form>
        
        <!-- InstanceEndEditable -->
        <div id="ResultSearch" class="kqtk_kt">
            <asp:Label ID="x" runat="server" Text="Ket qua: co "></asp:Label><asp:Label ID="lbllblResultSearch"
                runat="server"></asp:Label><br />
            <h1>
                <asp:HyperLink ID="xuatdata" Text="Xuat du lieu" CssClass="hpl" runat="server" NavigateUrl="~/Pages/BaoCao/KhenThuong.aspx"></asp:HyperLink></h1>
            <asp:GridView ID="gvResultSearch" runat="server" CssClass="gvResultSearch" Width="100%"
                PageSize="40" BackColor="White" BorderColor="#3366CC" BorderStyle="Groove" BorderWidth="2px"
                CellPadding="4">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
    </div>
    <!--id=content -->
    <asp:Label ID="LabelError" runat="server" Text="" CssClass="error"></asp:Label>

</asp:Content>
