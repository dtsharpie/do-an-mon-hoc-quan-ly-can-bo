<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideSearch.ascx.cs"
    Inherits="HutStaff.Administrator.Controls.Common.SlideSearch" %>
<ul>
    <asp:Repeater ID="rptDepartment" runat="server" 
        onitemdatabound="rptDepartment_ItemDataBound">
        <ItemTemplate>
            <li><input class="cb-tree" type="checkbox" code="<%# Eval("ma_dv") %>"/><a href="javascript:void(0);" code="<%# Eval("ma_dv") %>"><%# Eval("dv") %></a><span><img src="/Images/indicator_down.png"
                width="8px" height="4px" alt="" /></span>
                <ul class="subform">
                    <asp:Repeater ID="rptSub1" runat="server">
                        <ItemTemplate>
                            <li><input class="cb-tree sub1" type="checkbox" code="<%# Eval("ma_dv") %>"/><a href="javascript:void(0);" code="<%# Eval("ma_dv") %>"><%# Eval("dv") %></a>
                                <ul class="subform">
                                    <asp:Repeater ID="rptSub2" runat="server">
                                        <ItemTemplate>
                                            <li><input class="cb-tree sub2" type="checkbox" code="<%# Eval("ma_dv") %>"/><a href="javascript:void(0);" code="<%# Eval("ma_dv") %>"><%# Eval("dv") %></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
