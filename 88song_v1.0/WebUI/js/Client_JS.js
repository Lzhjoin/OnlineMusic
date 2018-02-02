var timeout = 500;
var closetimer = 0;
var ddmenuitem = 0;
$(document).ready(function () {

    function nav_cancelTime() {
        if (closetimer) {
            window.clearTimeout(closetimer);
            closetimer = null;
        }
    }
    function nav_hidden() {
        if (ddmenuitem) {
            ddmenuitem.css("visibility", "hidden");
        }
    }
    function nav_setTime() {
        closetimer = window.setTimeout(nav_hidden, timeout);
    }
    function nav_show() {
        nav_cancelTime();
        nav_hidden();
        ddmenuitem = $(this).find("div").eq(0).css("visibility", "visible");
    }
    $('#menuArea>ul>li').bind("mouseover", nav_show);
    $('#menuArea>ul>li').bind("mouseout", nav_setTime);

    //    function jsddm_open() {
    //        jsddm_canceltimer();
    //        jsddm_close();
    //        ddmenuitem = $(this).find('div').eq(0).css('visibility', 'visible');
    //    }

    //    function jsddm_close()
    //    { if (ddmenuitem) ddmenuitem.css('visibility', 'hidden'); }

    //    function jsddm_timer()
    //    { closetimer = window.setTimeout(jsddm_close, timeout); }

    //    function jsddm_canceltimer() {
    //        if (closetimer) {
    //            window.clearTimeout(closetimer);
    //            closetimer = null;
    //        } 
    //    }

    //    
    //        $('#menuArea>ul>li').bind('mouseover', jsddm_open);
    //        $('#menuArea>ul>li').bind('mouseout', jsddm_timer);

    //    document.onclick = jsddm_close;


    $("#hotMusicTitle").click(function () {
        $("#hotMusic").show();
        $("#newMusic").hide();
        $("#hotMusicTitle").removeClass("noSelect").addClass("select");
        $("#newMusicTitle").removeClass("select").addClass("noSelect");
    });
    $("#newMusicTitle").click(function () {
        $("#hotMusic").hide();
        $("#newMusic").show();
        $("#hotMusicTitle").removeClass("select").addClass("noSelect");
        $("#newMusicTitle").removeClass("noSelect").addClass("select");
    });
    $("#ChinaMusicTitle").click(function () {
        $("#ChinaMusic").show();
        $("#OccidentMusic").hide();
        $("#KoreaMusic").hide();
        $("#ChinaMusicTitle").removeClass("noSelect").addClass("select");
        $("#OccidentMusicTitle").removeClass("select").addClass("noSelect");
        $("#KoreaMusicTitle").removeClass("select").addClass("noSelect");
    });
    $("#KoreaMusicTitle").click(function () {
        $("#KoreaMusic").show();
        $("#ChinaMusic").hide();
        $("#OccidentMusic").hide();
        $("#KoreaMusicTitle").removeClass("noSelect").addClass("select");
        $("#ChinaMusicTitle").removeClass("select").addClass("noSelect");
        $("#OccidentMusicTitle").removeClass("select").addClass("noSelect");
    });
    $("#OccidentMusicTitle").click(function () {
        $("#OccidentMusic").show();
        $("#ChinaMusic").hide();
        $("#KoreaMusic").hide();
        $("#OccidentMusicTitle").removeClass("noSelect").addClass("select");
        $("#ChinaMusicTitle").removeClass("select").addClass("noSelect");
        $("#KoreaMusicTitle").removeClass("select").addClass("noSelect");
    });

    $("#hotMusic_allSel").click(function () {
        $(".hotMusic_sel").attr("checked", "true");
    });
    $("#hotMusic_noSel").click(function () {
        $(".hotMusic_sel").each(function () {
            if ($(this).attr("checked")) {
                $(this).removeAttr("checked");
            }
            else {
                $(this).attr("checked", "true");
            }
        })
    });

    $("#newMusic_allSel").click(function () {
        $(".newMusic_sel").attr("checked", "true");
    });

    $("#newMusic_noSel").click(function () {
        $(".newMusic_sel").each(function () {
            if ($(this).attr("checked")) {
                $(this).removeAttr("checked");
            }
            else {
                $(this).attr("checked", "true");
            }
        })
    });
    $("#ChinaMusic_allSel").click(function () {
        $(".ChinaMusic_sel").attr("checked", "true");
    });
    $("#ChinaMusic_noSel").click(function () {
        $(".ChinaMusic_sel").each(function () {
            if ($(this).attr("checked")) {
                $(this).removeAttr("checked");
            }
            else {
                $(this).attr("checked", "true");
            }
        })
    });
    $("#KoreaMusic_allSel").click(function () {
        $(".KoreaMusic_sel").attr("checked", "true");
    });
    $("#KoreaMusic_noSel").click(function () {
        $(".KoreaMusic_sel").each(function () {
            if ($(this).attr("checked")) {
                $(this).removeAttr("checked");
            }
            else {
                $(this).attr("checked", "true");
            }
        })
    });
    $("#OccidentMusic_allSel").click(function () {
        $(".OccidentMusic_sel").attr("checked", "true");
    });
    $("#OccidentMusic_noSel").click(function () {
        $(".OccidentMusic_sel").each(function () {
            if ($(this).attr("checked")) {
                $(this).removeAttr("checked");
            }
            else {
                $(this).attr("checked", "true");
            }
        });
    });

});

function addlist(addlist_form) {
    var temp = "";
    for (var i = 0; i < addlist_form.musicid.length; i++) {
        if (addlist_form.musicid[i].checked)
            temp +=addlist_form.musicid[i].value+ ",";
    }
    $.post("", { MusicID: temp }, function () { alert("加入列表成功！"); });
}


