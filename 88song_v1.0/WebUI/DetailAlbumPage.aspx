<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="DetailAlbumPage.aspx.cs" Inherits="DetailAlbumPage" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Detail_Album">
        <div id="Detail_AlbumSummary">
            <span class="AlbumPhoto"><img class="SingerPhoto" src="<%=ds_Album.Tables[0].Rows[0]["AlbumPhotoPath"] %>" /></span>
            <span class="AlbumData">专辑名：<%=ds_Album.Tables[0].Rows[0]["AlbumName"] %></span>
            <span class="AlbumData">我的评分：</span>
            <span class="AlbumData">歌手：<a href="DetailSingerPage.aspx?SingerID=<%=ds_Album.Tables[0].Rows[0]["SingerID"] %>"><%=ds_Album.Tables[0].Rows[0]["SingerName"] %></a></span>
            <span class="AlbumData">5分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">歌手类型：<a href="SingerTypePage.aspx?SingerTypeID=<%=ds_Album.Tables[0].Rows[0]["SingerTypeID"] %>"><%=ds_Album.Tables[0].Rows[0]["SingerTypeName"] %></a></span>
            <span class="AlbumData">4分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">发行时间：<%=ds_Album.Tables[0].Rows[0]["PublishDate"] %></span>
            <span class="AlbumData">3分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">人气：<%=ds_Album.Tables[0].Rows[0]["AlbumOnclickNum"] %></span>
            <span class="AlbumData">2分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">标签：暂无</span>
            <span class="AlbumData">1分：<img src="Images/scorebg.jpg" />0人</span>
        </div>
        <div class="AlbumHeng"></div>
        <div id="AlbumMusic">
            <span id="AlbumTitle"><img src="Images/playtag.gif" /> <%=ds_Album.Tables[0].Rows[0]["AlbumName"] %>的曲目</span>
            <span class="AlbumHeng2"></span>
            <div id="AlbumList">
                <%if (ds_Album.Tables[1].Rows.Count == 0)
                  {%>
                <span class="noMusic">该专辑暂时无歌曲收录！</span>
                <%}
                  else
                  { %>
                  <form method="post" action="">
                  <div id="AlbumListTitle">
                    <span id="AlbumMusicNameTitle">歌曲名</span>
                    <span id="AlbumSingerNameTitle">歌手</span>
                    <span id="AlbumListenTitle">试听</span>
                </div>
                  <%for (int i = 0; i < ds_Album.Tables[1].Rows.Count; i++)
                    {%>
                    <div class="AlbumMusicList">
                        <span class="AlbumOption"><input type="checkbox" name="musicid" value="<%=ds_Album.Tables[1].Rows[i]["MusicID"] %>" /></span><span class="Number"><%=i+1 %>.</span>
                        <span class="AlbumMusicName"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_Album.Tables[1].Rows[i]["MusicID"] %>"><%=ds_Album.Tables[1].Rows[i]["MusicName"] %></a></span>
                        <span class="AlbumSingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_Album.Tables[1].Rows[i]["SingerID"] %>"><%=ds_Album.Tables[1].Rows[i]["SingerName"] %></a></span>
                        <span class="AlbumMusicListen"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_Album.Tables[1].Rows[i]["MusicID"] %>"><img src="Images/bluep.gif" /></a></span>
                    </div>
                <%} %>
                <div id="AlbumOperate"><a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/play1.jpg" /></a><input type="image" src="Images/play2.jpg" onclick="addlist(this.form);" /></div>
                </form>
                <%} %>
            </div>
        </div>
    </div>
    <div class="hotMusic">
        <div class="title">热门歌曲<span class="more"><a href="">更多>></a></span></div>
        <%if (ds_HotMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_HotMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="hotMusic_sel" name="musicid" type="checkbox" value="<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"]%>"><%=ds_HotMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_HotMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_HotMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"]%>"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="musicOperate">
                        <a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=0"><img src="Images/play1.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/play2.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
    </div>
    <div class="AlbumHeng4"></div>
    <div class="SingerHotMusic">
         <div class="title"><%=ds_Album.Tables[0].Rows[0]["SingerName"]%>的热门歌曲</div>
         <%if (ds_SingerHotMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_SingerHotMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="hotMusic_sel" name="checkbox" type="checkbox" value="<%=ds_SingerHotMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_SingerHotMusic.Tables[0].Rows[i]["MusicID"] %>"><%=ds_SingerHotMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=SingerID %>"><%=ds_SingerHotMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_SingerHotMusic.Tables[0].Rows[i]["MusicID"] %>"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="musicOperate">
                        <a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=0"><img src="Images/play1.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/play2.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
    </div>
    <div class="AlbumHeng3"></div>
</asp:Content>

