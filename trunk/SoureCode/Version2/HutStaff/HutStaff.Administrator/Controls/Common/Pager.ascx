<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.Pager" %>
<div class="paging fr">
    <span <%= CurrentPage <= 1 ? "style='display:none'" : String.Empty %> class="first paging_button"><a  href="page1">First</a></span>
    <span <%= CurrentPage <= 1 ? "style='display:none'" : String.Empty %> class="previous paging_button"><a href="page<%= CurrentPage - 1 %>">Previous</a></span>
    <%= GenPaging() %>
    <span <%= CurrentPage == TotalPage ? "style='display:none'" : String.Empty %> class="next paging_button"><a href="page<%= CurrentPage + 1 %>">Next</a></span>
    <span <%= CurrentPage == TotalPage ? "style='display:none'" : String.Empty %> class="last paging_button"><a href="page<%= TotalPage %>">Last</a></span>
</div>
