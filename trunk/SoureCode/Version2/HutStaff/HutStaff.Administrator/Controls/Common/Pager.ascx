<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.Pager" %>
<div class="paging fr" pageSize="<%= PageSize %>">
    <span class="first paging_button"><a href="javascript:void(0);" index="1">First</a></span>
    <span class="previous paging_button"><a href="javascript:void(0);">Previous</a></span>
    <span class="next paging_button"><a href="javascript:void(0);">Next</a></span> <span
        class="last paging_button"><a href="javascript:void(0);" index="<%= TotalPage %>">Last</a></span>
</div>