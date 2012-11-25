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

function getPager(href)
{
    return href.split("page=")[1];
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
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