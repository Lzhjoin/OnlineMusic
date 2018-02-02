<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="DetailSingerPage.aspx.cs" Inherits="DetailSinger" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Detail_Album">
        <div id="Detail_AlbumSummary">
            <span class="AlbumPhoto"><img class="SingerPhoto" src="<%=ds_DetailSinger.Tables[0].Rows[0]["PhotoPath"] %>" /></span>
            <span class="AlbumData">歌手：<%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"] %></span>
            <span class="AlbumData">我的评分：</span>
            <span class="AlbumData">歌手类型：<a href="SingerTypePage.aspx?SingerTypeID=<%=ds_DetailSinger.Tables[0].Rows[0]["SingerTypeID"] %>"><%=ds_DetailSinger.Tables[0].Rows[0]["SingerTypeName"] %></a></span>
            <span class="AlbumData">5分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">性别：<%=ds_DetailSinger.Tables[0].Rows[0]["Sex"]%></span>
            <span class="AlbumData">4分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">平均得分：<%=ds_DetailSinger.Tables[0].Rows[0]["SingerMark"]%></span>
            <span class="AlbumData">3分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">人气：<%=ds_DetailSinger.Tables[0].Rows[0]["SingerOnclickNum"]%></span>
            <span class="AlbumData">2分：<img src="Images/scorebg.jpg" />0人</span>
            <span class="AlbumData">标签：暂无</span>
            <span class="AlbumData">1分：<img src="Images/scorebg.jpg" />0人</span>
        </div>
        <div class="AlbumHeng"></div>
        <div id="AlbumMusic">
            <span id="AlbumTitle"><img src="Images/playtag.gif" /> <%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"]%>的曲目</span>
            <span class="AlbumHeng2"></span>
            <div id="AlbumList">
                <%if (ds_DetailSinger.Tables[1].Rows.Count == 0)
                  {%>
                <span class="noMusic">该专辑暂时无歌曲收录！</span>
                <%}
                  else
                  { %>
                  <form method="post" action="">
                  <div id="AlbumListTitle">
                    <span id="AlbumMusicNameTitle">歌曲名</span>
                    <span id="AlbumSingerNameTitle">所属专辑</span>
                    <span id="AlbumListenTitle">试听</span>
                </div>
                  <%for (int i = 0; i < ds_DetailSinger.Tables[1].Rows.Count; i++)
                    {%>
                    <div class="AlbumMusicList">
                        <span class="AlbumOption"><input type="checkbox" name="musicid" value="<%=ds_DetailSinger.Tables[1].Rows[i]["MusicID"] %>" /></span><span class="Number"><%=i+1 %>.</span>
                        <span class="AlbumMusicName"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_DetailSinger.Tables[1].Rows[i]["MusicID"]%>"><%=ds_DetailSinger.Tables[1].Rows[i]["MusicName"]%></a></span>
                        <span class="AlbumSingerName"><a href="DetailAlbumPage.aspx?AlbumID=<%=ds_DetailSinger.Tables[1].Rows[i]["AlbumID"]%>"><%=ds_DetailSinger.Tables[1].Rows[i]["AlbumName"]%></a></span>
                        <span class="AlbumMusicListen"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_DetailSinger.Tables[1].Rows[i]["MusicID"]%>"><img src="Images/bluep.gif" /></a></span>
                    </div>
                <%} %>
                <div id="AlbumOperate"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=0"><img src="Images/play1.jpg" /></a><input type="image" src="Images/play2.jpg" onclick="addlist(this.form);" /></div>
                </form>
                <%} %>
            </div>
        </div>
    </div>
    <div class="hotMusic">
        <div class="title"><%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"]%>的热门歌曲<span class="more"><a href="">更多>></a></span></div>
        <%if (ds_DetailSinger.Tables[2].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0;i<10& i < ds_DetailSinger.Tables[2].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="hotMusic_sel" name="musicid" type="checkbox" value="<%=ds_DetailSinger.Tables[2].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a href="#"><%=ds_DetailSinger.Tables[2].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="#"><%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_DetailSinger.Tables[2].Rows[i]["MusicID"]%>"><img src="Images/playbg.jpg" /></a></span>
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
         <div class="title"><%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"]%>的热门专辑<span class="more"><a href="">更多>></a></span></div>
         <%if (ds_DetailSinger.Tables[3].Rows.Count == 0)
                  { %>
                  尚未加入任何专辑，请与网站管理员联系！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i <10&i<ds_DetailSinger.Tables[3].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="MusicName"><%=i + 1%>.<a href="DetailAlbumPage.aspx?AlbumID=<%=ds_DetailSinger.Tables[3].Rows[i]["AlbumID"]%>"><%=ds_DetailSinger.Tables[3].Rows[i]["AlbumName"]%></a></span>
                    <span class="Music_SingerName">——<a href="#"><%=ds_DetailSinger.Tables[0].Rows[0]["SingerName"]%></a></span>
                    </div>
                    <%} %>
                    </form>
                    <%} %>
    </div>
    <div class="AlbumHeng3"></div>
</asp:Content>

