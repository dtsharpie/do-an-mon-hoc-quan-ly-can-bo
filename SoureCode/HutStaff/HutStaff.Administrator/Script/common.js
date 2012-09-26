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