<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.Pager" %>
<div class="paging fr">
    <span class="first paging_button"><a href="javascript:void(0);" index="1">First</a></span>
    <span class="previous paging_button"><a href="javascript:void(0);">Previous</a></span>
    <%--<%= GenPaging() %>--%>
    <span class="next paging_button"><a href="javascript:void(0);">Next</a></span> <span
        class="last paging_button"><a href="javascript:void(0);" index="<%= TotalPage %>">Last</a></span>
</div>
<script type="text/javascript">
    var searchCurrenPage = 1;
    var searchTotalPage = <%= TotalPage %>;
    $(document).ready(function () {
        function loadPage(pageIndex) {
            var pageSize = <%= PageSize %>;
            $('.table-result tr.row').not('.hide').addClass('hide');
            for (var i = ((pageIndex - 1) * pageSize); i < (pageIndex * pageSize); i++) {
                $('.table-result tr.row').eq(i).removeClass('hide');
            }
        }

        function GenPaging()
        {
            var html = '';
            html += '<span class="first paging_button"><a href="javascript:void(0);" index="1">First</a></span><span class="previous paging_button"><a href="javascript:void(0);">Previous</a></span>';
            if (searchCurrenPage < 4)
            {
                if (searchTotalPage > searchCurrenPage)
                {
                    var range = searchTotalPage - searchCurrenPage;
                    if (range > 2) range = 2;
                    for (var i = 1; i <= searchCurrenPage + range; i++)
                    {
                        if (i == searchCurrenPage)
                            html += '<span class="paging_button active"><a href="javascript:void(0);" title="Current page" index="' + i + '">' + i + '</a></span>';
                        else
                            html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                    }
                    if (searchTotalPage > 3)
                    {
                        html += '<span class="paging_dot">...</span>';
                    }
                }
                else
                {
                    for (var i = 1; i <= searchCurrenPage; i++)
                    {
                        if (i == searchCurrenPage)
                            html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page"  index="' + i + '">' + i + '</a></span>';
                        else
                            html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                    }
                }
            }
            else if (searchCurrenPage > searchTotalPage - 3)
            {
                html += '<span class="paging_dot">...</span>';
                for (var i = searchTotalPage - 4; i <= searchTotalPage; i++)
                {
                    if (i != 0)
                    {
                        if (i == searchCurrenPage)
                            html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page" index="' + i + '">' + i + '</a></span>';
                        else
                            html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                    }
                }
            }
            else
            {
                html += '<span class="paging_dot">...</span>';
                for (var i = searchCurrenPage - 2; i <= searchCurrenPage + 2; i++)
                {
                    if (i != 0)
                    {
                        if (i == searchCurrenPage)
                            html += '<span class="paging_button active"><a href="javascript:void(0);" title="Currnet page"  index="' + i + '">'+ i + '</a></span>';
                        else
                            html += '<span class="paging_button"><a href="javascript:void(0);" title="Page ' + i + '" index="' + i + '">' + i + '</a></span>';
                    }
                }
                html += '<span class="paging_dot">...</span>';
            }
            html += '<span class="next paging_button"><a href="javascript:void(0);">Next</a></span> <span class="last paging_button"><a href="javascript:void(0);" index="<%= TotalPage %>">Last</a></span>';
            
            $('.paging').html(html);
            
            $('.paging_button a').click(function () {
            if ($(this).parent().hasClass('previous')){
                searchCurrenPage--;
                if (searchCurrenPage < 1)
                    searchCurrenPage = 1;
                loadPage(searchCurrenPage); 
                GenPaging();
            } else if ($(this).parent().hasClass('next')){
                searchCurrenPage++;
                if (searchCurrenPage > parseInt($('.paging_button.last a').eq(0).attr('index')))
                    searchCurrenPage = parseInt($('.paging_button.last a').eq(0).attr('index'));
                loadPage(searchCurrenPage);   
                GenPaging();
            } else {
                searchCurrenPage = parseInt($(this).attr('index'));
                loadPage(searchCurrenPage);  
                GenPaging();
            }  
        });
        }

        $('.paging_button a').click(function () {
            if ($(this).parent().hasClass('previous')){
                searchCurrenPage--;
                if (searchCurrenPage < 1)
                    searchCurrenPage = 1;
                loadPage(searchCurrenPage); 
            } else if ($(this).parent().hasClass('next')){
                searchCurrenPage++;
                if (searchCurrenPage > parseInt($('.paging_button.last').attr('index')))
                    searchCurrenPage = parseInt($('.paging_button.last').attr('index'));
                loadPage(searchCurrenPage);   
            } else {
                searchCurrenPage = parseInt($(this).attr('index'));
                loadPage(searchCurrenPage);  
                GenPaging();
            }  
        });

        $('.paging_button.first a').click();
    });
</script>
