<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewMenu.ascx.cs" Inherits="HutStaff.Administrator.Controls.Common.ViewMenu" %>
<ul>
    <%= GenMenu() %>
</ul>
<script type="text/javascript">
    $(document).ready(function () {
        var active;
        var menuAlias;
        CheckAlias();
        active = $(".active");

        $("#menu a").click(function () {
            if (location.hash == $(this).attr("href")) {
                $(".active").removeClass("active");
                CheckAlias();
                active = $(".active");
            }
        });


        $("#menu > ul > li").mouseover(function () {
            $(".active").removeClass("active");
            $(this).find("a").first().addClass("active");
            $(this).find("ul").css('display', 'block');
        });
        $("#menu").mouseout(function () {
            $(".active").removeClass("active");
            active.addClass("active");
            $("#menu ul li").find("ul").css('display', 'none');
        });

        $("#menu ul li a").click(function () {
            $("#menu ul li").find("ul").css('display', 'none');
        });

        window.onhashchange = function () {
            $(".active").removeClass("active");
            CheckAlias();
            active = $(".active");
        }
    });

    function addActive(menuAlias) {
        if (menuAlias.attr("parrent") == null || menuAlias.attr("parrent") == "") {
            menuAlias.addClass("active");
        }
        else {
            $("#menu a[href='#" + menuAlias.attr("parrent") + "']").addClass("active");
        }
    }
    function CheckAlias() {
        if (getAlias() == "") {
            loadContentView({ 'alias': '<%= sDefaultMenu %>' }, false);
            menuAlias = $("#menu a[href='#" + "<%= sDefaultMenu %>" + "']");
        }
        else {
            loadContentView({ 'alias': getAlias() }, true);
            menuAlias = $("#menu a[href='#" + getAlias() + "']");
        }
        addActive(menuAlias);
    }
</script>
