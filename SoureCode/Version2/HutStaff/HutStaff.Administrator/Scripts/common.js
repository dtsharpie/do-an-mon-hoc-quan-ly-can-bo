function loadControl(ele, params, isSync) {
    $.ajax({ url: "/services/text.ashx",
        type: "POST",
        data: (params),
        dataType: "html",
        async: !isSync,
        success: function (response) {
            $(ele).html(response);
        }
    });
}

function execution(params, isSync) {
    $.ajax({ url: "/services/js.ashx",
        type: "POST",
        data: (params),
        dataType: "script",
        async: !isSync,
        success: function (response) {
            response;
        }
    });
}

function getAlias() {
    return location.hash.replace("#", "");
}

function loadContentView(params, isSysnc) {
    $('#divBody').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 600px;"><img src="/images/processing.gif" /></td></tr></table>');
    loadControl("#divBody", params, isSysnc);
}


function loadContent(params, isSysnc) {
    loadControl("#divMainContent > .content", params, isSysnc);
}

function selectAll(ele) {
    if (ele.is(':checked')) {
        $('input:checkbox.chkId').attr('checked', 'checked');
    } else {
        $('input:checkbox.chkId').removeAttr("checked");
    }

    $('input:checkbox.chkId').change(function () {
        if ($(this).not(':checked')) {
            $('#chkAll').removeAttr("checked");
        }
    });
}


function nextPage(tblPagerId, totalItem) {
    var pager = $(tblPagerId);
    var pageIndex = parseInt(pager.find('input[id$="txtPageIndex"]').val());
    var pageSize = parseInt(pager.find('select[id$="ddlPageSize"]').val());
    var htmlId = pager.find('input#hdControlId').val();
    var uId = pager.find('input#hdUniqueId').val();
    var params = unescape(pager.find('#hdControlParams').val());
    params = params.replace(/\+/g, '');
    if ((pageIndex) * pageSize < totalItem) {
        loadPaging(uId, htmlId, pageIndex + 1, pageSize, JSON.parse(params));
        pager.find('input[id$="txtPageIndex"]').val(pageIndex + 1);

        var info = (totalItem > 0 ? (pageIndex * pageSize + 1) : 0).toString() + " đến " + ((pageSize * (pageIndex + 1) < totalItem) ? pageSize * (pageIndex + 1) : totalItem).toString() + " của " + totalItem.toString();
        pager.find('span[id$="lblInfo"]').html(info);

    }
    else
        alert('Đây là trang cuối!'); ;
}

function prePage(tblPagerId) {
    var pager = $(tblPagerId);
    var pageIndex = parseInt(pager.find('input[id$="txtPageIndex"]').val());
    var pageSize = parseInt(pager.find('select[id$="ddlPageSize"]').val());
    var htmlId = pager.find('input#hdControlId').val();
    var uId = pager.find('input#hdUniqueId').val();

    var params = unescape(pager.find('#hdControlParams').val());
    params = params.replace(/\+/g, '');

    if (pageIndex > 1) loadPaging(uId, htmlId, pageIndex - 1, pageSize, JSON.parse(params));
    else alert('Đây là trang đầu tiên!');
}


function prePage(tblPagerId, totalItem) {
    var pager = $(tblPagerId);
    var pageIndex = parseInt(pager.find('input[id$="txtPageIndex"]').val());
    var pageSize = parseInt(pager.find('select[id$="ddlPageSize"]').val());
    var htmlId = pager.find('input#hdControlId').val();
    var uId = pager.find('input#hdUniqueId').val();

    var params = unescape(pager.find('#hdControlParams').val());
    params = params.replace(/\+/g, '');

    if (pageIndex > 1) {
        loadPaging(uId, htmlId, pageIndex - 1, pageSize, JSON.parse(params));
        pager.find('input[id$="txtPageIndex"]').val(pageIndex - 1);
        var info = (totalItem > 0 ? ((pageIndex - 2) * pageSize + 1) : 0).toString() + " đến " + ((pageSize * (pageIndex - 1) < totalItem) ? pageSize * (pageIndex - 1) : totalItem).toString() + " của " + totalItem.toString();
        pager.find('span[id$="lblInfo"]').html(info);
    }
    else alert('Đây là trang đầu tiên!');
}

function changePageIndex(tblPagerId, totalItem) {
    try {
        var pager = $(tblPagerId);

        var pageIndex = parseInt(pager.find('input[id$="txtPageIndex"]').val());
        var pageSize = parseInt(pager.find('select[id$="ddlPageSize"]').val());
        var htmlId = pager.find('input#hdControlId').val();
        var uId = pager.find('input#hdUniqueId').val();

        var params = unescape(pager.find('#hdControlParams').val());
        params = params.replace(/\+/g, '');

        /* Validate Page Index */
        if (pageIndex > 0 && ((pageIndex - 1) * pageSize < totalItem)) {
            loadPaging(uId, htmlId, pageIndex, pageSize, JSON.parse(params));

            var info = (totalItem > 0 ? ((pageIndex - 1) * pageSize + 1) : 0).toString() + " đến " + ((pageSize * pageIndex < totalItem) ? pageSize * pageIndex : totalItem).toString() + " của " + totalItem.toString();
            pager.find('span[id$="lblInfo"]').html(info);

        }
        else {
            alert('Số trang không hợp lệ!');
        }
    }
    catch (err) {
        alert('Số trang không hợp lệ! - ' + err);
    }
}

function changePageSize(tblPagerId) {
    var pager = $(tblPagerId);
    var pageIndex = 1;
    var pageSize = parseInt(pager.find('select[id$="ddlPageSize"]').val());
    var htmlId = pager.find('input#hdControlId').val();
    var params = unescape(pager.find('#hdControlParams').val());
    var uId = pager.find('input#hdUniqueId').val();
    params = params.replace(/\+/g, '');

    loadPaging(uId, htmlId, pageIndex, pageSize, JSON.parse(params));
}

function loadPaging(uId, htmlId, pageIndex, pageSize, params) {
    var agrs = (typeof params === 'string') ? params : $.param(params);
    agrs += agrs != '' ? '&' + 'uId=' + uId : 'uId=' + uId;
    agrs += '&' + uId + 'pi=' + pageIndex;
    agrs += '&' + uId + 'ps=' + pageSize;

    loadControl(htmlId, agrs, false);
}

function loadPager(ele, params) {
    if (params == null) params = {};
    params.alias = 'pager';

    loadControl(ele, params);
}