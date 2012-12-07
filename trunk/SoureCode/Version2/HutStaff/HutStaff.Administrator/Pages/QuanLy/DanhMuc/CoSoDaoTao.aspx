<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="CoSoDaoTao.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.DanhMuc.CoSoDaoTao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2>DANH SÁCH CƠ SỞ ĐÀO TẠO CHUYÊN MÔN</h2>
    <div>
        <br />
        <hr />
        <br />
        <div align="center">
            <asp:Label ID="PageInfoLabel" runat="server" />
            <asp:HiddenField ID="PageNumberHiddenField" runat="server" />
            <asp:Button ID="FirstButton" runat="server" Text="|<<" 
                onclick="FirstButton_Click" Width="55px" />
            <asp:Button ID="PrevButton" runat="server" Text="<<" 
                onclick="PrevButton_Click" Width="55px" />
            <asp:Button ID="NextButton" runat="server" style="margin-left: 22px" 
                Text=">>" onclick="NextButton_Click" Width="55px" />
            <asp:Button ID="LastButton" runat="server" Text=">>|" 
                onclick="LastButton_Click" Width="55px" />
        </div>
        <br />
        <div align="center">
            <asp:GridView ID="CSDTGridView" runat="server" AutoGenerateColumns="False" Width="80%" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Số thứ tự" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên cơ sở đào tạo chuyên môn">
                        <ItemTemplate>
                            <asp:HiddenField ID="OldCSDTName" runat="server" Value='<%# Bind("csdtcm") %>' />
                            <asp:TextBox ID="NewCSDTName" runat="server" Text='<%# Bind("csdtcm") %>' Columns="70"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng trùng lặp" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="ProductPrice" runat="server" Text='<%# Bind("num") %>'></asp:Label>
                        </ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="SaveButton" runat="server" Text="Ghi lại" OnClick="SaveButton_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
