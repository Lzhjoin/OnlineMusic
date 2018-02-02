<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MusicPlayer_Page.aspx.cs" Inherits="cmp_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">
        <head  runat="server">
            <title>

                88song.com音乐播放器

            </title>
            <script src="cmp.js" type="text/javascript"></script>
            <style type="text/css">


                html, body { height:100%; margin:0; padding:0; overflow:hidden; text-align:center; background:#181818; }

            </style>
        </head>
        <body>

            <script type="text/javascript">

                //载入一个cmp，相关设置详情见cmp交流论坛相关专贴
                var flashvars = {
                    name: "88song.com音乐播放器",
                    api: "cmp_loaded",
                    skin_id: 0,
                    auto_play: 0,
                    list_delete: 1,
                    config: 0,
                    lists: "",
                    skins : "skins/huashang.zip",
                    context_menu: 2,
                    plugins:"plugins/snow.swf",
                    snow_num : "2",
                    snow_rest : "false",
                    skin_id:"1"
                };
                 CMP.write("cmp", "100%", "100%", "cmp.swf", flashvars);
                //加载完成
                var player;
                var axml;
                function cmp_loaded(key) {
                    player = CMP.get("cmp");
                    if (player) {
                        //自动播放来源页面需要添加的列表内容
                        //                        if (window.opener.win_ids) {
                        //                            cmp_play(window.opener.win_ids);
                        //
                        axml = "<%=getMusicList() %>";
                        cmp_play(axml);
                    }

                }


                //添加到列表，并播放列表（会将之前的列表放在后面，如果想）
                function cmp_play(xml) {
                    //alert("play:" + ids);
                    if (!player) {
                        return;
                    }
                    //取得配置
                    var config = player.config();
                    //如果状态为正在播放，则先停止播放
                    if (config["state"] == "playing") {
                        player.sendEvent("view_stop");
                    }
                    //                    var play_id = player.list().length + 1;
                    //生成列表xml
                    //                    var xml = makeListXml(ids);
                    //写入新的列表
                    player.list_xml(xml,false);
                    //开始播放
                    //                    player.sendEvent("view_play", play_id);
                    window.focus();
                }

                //添加到列表
                function cmp_add(ids) {
                    //alert("add:" + ids);
                    if (!player) {
                        return;
                    }
                    //生成列表xml
                    var xml = makeListXml(ids);
                    //附加到列表，第2个参数true表示往列表最后附加
                    player.list_xml(xml);
                    window.focus();
                }
                </script>


            <object id="cmp" width="100%" height="100%" data="cmp.swf" type="application/x-shockwave-flash"> … </object>
            <div id="DIV_CMP_338703294750" style="width: 0px; height: 0px; overflow: hidden; visibility: hidden; position: absolute;"></div>
        </body>
    </html>












<%--<html>
<head>
<meta charset="utf-8">
<title>88song.com音乐播放器</title>
<style type="text/css">
html, body { text-align:center; font-size:12px; padding:0; margin:0; font-family:Verdana; }
a, a:visited { color:#000; text-decoration:none; }
.head { height:30px; background:#f5f5f5; }
.head_inner { width:800px; margin:0px auto; text-align:left; line-height:30px; font-weight:bold; font-size:14px; }
.cmp { background:#000000; }
.cmp_inner { width:800px; height:500px; margin:0px auto; background:#181818; }
.main { }
.main_inner { width:800px; margin:0px auto; text-align:left; }
.info { padding:10px 0px; line-height:20px; }
.foot { border-top:1px dashed #eee; margin-top:10px; }
.foot_inner { width:800px; margin:0px auto; text-align:left; color:#999; font-size:11px; padding:5px 0px; }
.foot_inner a { color:#999; }
</style>
<script type="text/javascript" src="cmp.js"></script>
</head>
<body>
<div class="head">
  <div class="head_inner">88song.com音乐播放器</div>
</div>
<div class="cmp">
  <div class="cmp_inner" id="player">loading ...</div>
</div>
<div class="main">
  <div class="main_inner">
    <div class="info">
      <div id="cmpinfo">loading ...</div>
    </div>
  </div>
</div>
<script>
    function cmp_loaded(key) {
        //cmp loaded
        var cmpo = CMP.get("cmp");
        if (cmpo) {
            //cmp callback
            var config = cmpo.config();
            document.title = config.name;
            var arr = [];
            arr.push('<b>CMP name:</b> <a href="' + config.link + '" target="_blank">' + config.name + '</a>');
            arr.push('<b>CMP version:</b> ' + config.version);
            arr.push('<b>flash version:</b> ' + config.flash_version);
            var cmpinfo = arr.join("<br />");
            document.getElementById("cmpinfo").innerHTML = cmpinfo;
        }
    }
    var flashvars = {
        api: "cmp_loaded"
    };
    //id, width, height, swf_url, flashvars, params, attrs
    var htm = CMP.create("cmp", "100%", "100%", "cmp.swf", flashvars);
    document.getElementById("player").innerHTML = htm;
</script>
<div class="foot">
  <div class="foot_inner">© 2012 <a href="http://www.cenfun.com/" target="_blank">CenFun.com</a> All Rights Reserved</div>
</div>
</body>
</html>--%>
