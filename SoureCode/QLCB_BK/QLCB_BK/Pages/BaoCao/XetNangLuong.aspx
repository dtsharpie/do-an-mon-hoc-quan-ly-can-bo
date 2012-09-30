<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="XetNangLuong.aspx.cs" Inherits="QLCB_BK.Pages.BaoCao.XetNangLuong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="content">
        <h1 class="title">
            Xét nâng lương</h1>
        <hr width="700px" />
        <br />
        <div>
            <table border="1">
                <tr>
                    <td>
                        <p>Loại hạn ngạch: </p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLoaiHanNgach" runat="server">
                            <asp:ListItem Value="2">2 năm</asp:ListItem>
                            <asp:ListItem Value="3">3 năm</asp:ListItem>
                    </asp:DropDownList>
                    </td> 
                </tr>
                <tr>
                    <td>
                        <p>Lựa chọn bảng: </p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLuaChonBang" runat="server">
                        <asp:ListItem Value="1">Danh sách đến hạn nhận lương</asp:ListItem>
                        <asp:ListItem Value="2">Danh sách xét duyệt 5%</asp:ListItem>
                        <asp:ListItem Value="3">Danh sách vượt khung</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Tính đến tháng / năm: &nbsp;&nbsp;&nbsp;&nbsp;</p>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlThoiHan" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12" Selected="True">12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtNam" runat="server">2012</asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                       <asp:Button ID="btnOk" runat="server" Text="OK" onclick="btnOk_Click" /> 
                    </td>
                    <td>       
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
    
        <asp:GridView ID="salaryIncrementListDataGridView" runat="server">
        </asp:GridView>
    
    </div>
</asp:Content>
