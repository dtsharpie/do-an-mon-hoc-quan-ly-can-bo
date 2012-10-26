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

function loadContentView(params, isSysnc) {
    $('#divBody').html('<table  width="100%"><tr><td style="text-align: center; vertical-align: middle; height: 400px;"><img src="/images/processing.gif" /></td></tr></table>');
    loadControl("#divContentView", params, isSysnc);
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

    if ($('#txtSearch') != undefined) {
        agrs += '&search=' + $('#txtSearch').val();
    }

    if ($('#ddlCategories') != undefined) {
        agrs += '&filter=' + $('#ddlCategories').val();
    }

    if ($('#ddlStatus') != undefined) {
        agrs += '&status=' + $('#ddlStatus').val();
    }

    loadControl(htmlId, agrs, false);
}

function loadPager(ele, params) {
    if (params == null) params = {};
    params.alias = 'pager';

    loadControl(ele, params);
}

function getParams() {
    var result = '';
    if ($.trim(location.hash) != '') {
        result = $.trim(location.hash).substring(1);
        result = replaceAll(result, '/', '&');
    }
    return result;
}

function getValueFromParam(key) {
    var qs = getParams();

    if (qs.length == 0) return null;
    qs = qs.replace(/\+/g, ' ');
    var args = qs.split('&');

    for (var i = 0; i < args.length; i++) {
        var pair = args[i].split('=');
        var name = decodeURIComponent(pair[0]);
        if (name == key)
            return (pair.length == 2) ? decodeURIComponent(pair[1]) : '';
    }

    return null;
}

function setValueFromParam(key, value) {
    if (containParam(key)) removeParam(key);

    appendParam({ key: value });
}

function removeParam(key) {
    var result = '';
    var qs = getParams();

    if (qs.length != 0) {
        qs = qs.replace(/\+/g, ' ');
        var args = qs.split('&');

        for (var i = 0; i < args.length; i++) {
            var pair = args[i].split('=');
            var name = decodeURIComponent(pair[0]);

            if (key != name) result += result != '' ? '&' + args[i] : args[i];
        }
    }
    location.hash = replaceAll(result, '&', '/');
}

function appendParam(params) {

    var qs = (typeof params === 'string') ? params : $.param(params);
    if (qs.length != 0) {
        qs = qs.replace(/\+/g, ' ');
        var args = qs.split('&');

        for (var i = 0; i < args.length; i++) {
            var pair = args[i].split('=');
            var name = decodeURIComponent(pair[0]);
            if (containParam(name)) removeParam(name);
            if (name.toLowerCase() != 'alias') {
                var result = getParams();
                result += result != '' ? '&' + args[i] : args[i];
                location.hash = replaceAll(result, '&', '/');
            }
        }
    }
}

function emptyParam() {
    location.hash = '';
}

function containParam(key) {
    var qs = getParams();
    if (qs.length == 0) return false;

    qs = qs.replace(/\+/g, ' ');
    var args = qs.split('&');

    for (var i = 0; i < args.length; i++) {
        var pair = args[i].split('=');
        var name = decodeURIComponent(pair[0]);
        if (name == key)
            return true;
    }

    return false;
}

function replaceAll(val, oldChar, newChar) {
    if (val != '') {
        while (val.indexOf(oldChar) >= 0)
            val = val.replace(oldChar, newChar);
    }

    return val;
}


function getParams() {
    var result = '';
    if ($.trim(location.hash) != '') {
        result = $.trim(location.hash).substring(1);
        result = replaceAll(result, '/', '&');
    }
    return result;
}

function getValueFromParam(key) {
    var qs = getParams();

    if (qs.length == 0) return null;
    qs = qs.replace(/\+/g, ' ');
    var args = qs.split('&');

    for (var i = 0; i < args.length; i++) {
        var pair = args[i].split('=');
        var name = decodeURIComponent(pair[0]);
        if (name == key)
            return (pair.length == 2) ? decodeURIComponent(pair[1]) : '';
    }

    return null;
}

function setValueFromParam(key, value) {
    if (containParam(key)) removeParam(key);

    appendParam({ key: value });
}

function removeParam(key) {
    var result = '';
    var qs = getParams();

    if (qs.length != 0) {
        qs = qs.replace(/\+/g, ' ');
        var args = qs.split('&');

        for (var i = 0; i < args.length; i++) {
            var pair = args[i].split('=');
            var name = decodeURIComponent(pair[0]);

            if (key != name) result += result != '' ? '&' + args[i] : args[i];
        }
    }
    location.hash = replaceAll(result, '&', '/');
}

function appendParam(params) {

    var qs = (typeof params === 'string') ? params : $.param(params);
    if (qs.length != 0) {
        qs = qs.replace(/\+/g, ' ');
        var args = qs.split('&');

        for (var i = 0; i < args.length; i++) {
            var pair = args[i].split('=');
            var name = decodeURIComponent(pair[0]);
            if (containParam(name)) removeParam(name);
            if (name.toLowerCase() != 'alias') {
                var result = getParams();
                result += result != '' ? '&' + args[i] : args[i];
                location.hash = replaceAll(result, '&', '/');
            }
        }
    }
}

function emptyParam() {
    location.hash = '';
}

function containParam(key) {
    var qs = getParams();
    if (qs.length == 0) return false;

    qs = qs.replace(/\+/g, ' ');
    var args = qs.split('&');

    for (var i = 0; i < args.length; i++) {
        var pair = args[i].split('=');
        var name = decodeURIComponent(pair[0]);
        if (name == key)
            return true;
    }

    return false;
}

function replaceAll(val, oldChar, newChar) {
    if (val != '') {
        while (val.indexOf(oldChar) >= 0)
            val = val.replace(oldChar, newChar);
    }

    return val;
}



//---------- Toan's scripts begin -----------//

function hintTextBox_onFocus(control, hintMessage) {
    if (control.value === hintMessage) {
        control.value = "";
        control.style.color = "#000000";
    }
}

function hintTextBox_onBlur(control, hintMessage) {
    if (control.value === "") {
        control.value = hintMessage;
        control.style.color = "#C0C0C0";
    }
}

//---------- Toan's scripts end -------------//