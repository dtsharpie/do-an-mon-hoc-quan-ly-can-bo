<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BHXH.ascx.cs" Inherits="HutStaff.Administrator.Xemthongtin.Controls.BHXH" %>
<div class="content">
    <h1 class="title">
        Thông tin BHXH
    </h1>
    <hr />
    <div class="divInfo" style="margin-top: 10px;">
        <asp:GridView ID="GridView1" runat="server" CssClass="table-result" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="id" Visible="false" />
                <asp:BoundField DataField="thoigian" HeaderText="Thời gian" />
                <%--<asp:BoundField DataField="tgbd_dbl" Visible="false" />
                            <asp:BoundField DataField="tgkt_dbl" Visible="false" />--%>
                <asp:BoundField DataField="mota" HeaderText="Chức danh, chức vụ, ngạch lương và đơn vị công tác" />
                <asp:BoundField DataField="hsl" HeaderText="Hệ số lương cơ bản" />
                <asp:BoundField DataField="hspccv" HeaderText="Phụ cấp chức vụ" />
                <asp:BoundField DataField="hspckv" HeaderText="Phụ cấp vượt khung" />
                <asp:BoundField DataField="hspctn" HeaderText="Phụ cấp thâm niên giáo dục" />
                <asp:BoundField DataField="tonghsl" HeaderText="Tổng hệ số lương" />
                <asp:BoundField DataField="sothangdongbh" HeaderText="Số tháng đóng bảo hiểm" />
                <asp:BoundField DataField="tongtienbhxh" HeaderText="Tổng số tiền đóng BHXH" />
                <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</div>
