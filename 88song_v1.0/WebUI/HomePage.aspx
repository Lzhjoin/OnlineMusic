<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            
            <div id="hotAlbum">
                <div class="title">热门专辑<span class="more"><a href="HotAlbumPage.aspx">更多>></a></span></div>
                <div class="albumDetail">
                <%if (ds_HotAlbum.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                <%for (int i = 0; i < ds_HotAlbum.Tables[0].Rows.Count; i++)
                  { %>
                        <div class="hotAlbumUnit">
                            <div class="Photo"><a href="DetailAlbumPage.aspx?AlbumID=<%=ds_HotAlbum.Tables[0].Rows[i]["AlbumID"] %>"><img class="imgFrame" src="<%=ds_HotAlbum.Tables[0].Rows[i]["AlbumPhotoPath"]%>" /></a></div>
                            <div class="singerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_HotAlbum.Tables[0].Rows[i]["SingerID"] %>"><%=ds_HotAlbum.Tables[0].Rows[i]["SingerName"]%></a></div>
                            <div class="albumName"><a href="DetailAlbumPage.aspx?AlbumID=<%=ds_HotAlbum.Tables[0].Rows[i]["AlbumID"] %>"><%=ds_HotAlbum.Tables[0].Rows[i]["AlbumName"]%></a></div>
                        </div>
                <%} %>
                <%} %>
                </div>
            </div>
            <div id="jiange1"></div>
            <div id="newAlbum">
                <div class="title">最新专辑<span class="more"><a href="NewAlbumPage.aspx">更多>></a></span></div>
                <div class="albumDetail">
                <%if (ds_NewAlbum.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                   <%for (int i = 0; i < 3 & i < ds_NewAlbum.Tables[0].Rows.Count; i++)
                     {%>
                        <div class="newAlbum">
                            <div class="newPhoto"><a href="DetailAlbumPage.aspx?AlbumID=<%=ds_NewAlbum.Tables[0].Rows[i]["AlbumID"] %>"><img class="imgFrame" src="<%=ds_NewAlbum.Tables[0].Rows[i]["AlbumPhotoPath"] %>" /></a></div>
                            <div class="newMusicContent">
                                <div class="newAlbumName">专辑名：<a href="DetailAlbumPage.aspx?AlbumID=<%=ds_NewAlbum.Tables[0].Rows[i]["AlbumID"] %>"><%=ds_NewAlbum.Tables[0].Rows[i]["AlbumName"]%></a></div>
                                <div class="newSingerName">歌手名：<a href="DetailSingerPage.aspx?SingerID=<%=ds_NewAlbum.Tables[0].Rows[i]["SingerID"]%>"><%=ds_NewAlbum.Tables[0].Rows[i]["SingerName"]%></a></div>
                                <div class="publish">专辑发布时间：<%=ds_NewAlbum.Tables[0].Rows[i]["PublishDate"]%></div>
                            </div>
                        </div>
                        <%} %>
                        <%} %>
                    
                </div>
            </div>
            <div class="heng"></div>
            <div class="music">
                <div class="titles"><span class="select" id="hotMusicTitle">热门歌曲</span><span class="noSelect" id="newMusicTitle">最新歌曲</span><span class="more"><a href="#">更多>></a></span></div>
                <div id="hotMusic">
                <%if (ds_HotMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_HotMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="hotMusic_sel"  name="musicid" type="checkbox" value="<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><%=ds_HotMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_HotMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_HotMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="selectMusic">
                        <input type="button" id="hotMusic_allSel" value="全选"/>
                        <input type="button" id="hotMusic_noSel" value="反选" />
                    </span>
                    <span class="musicOperate">
                        <a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/playAllBt.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/allAddList.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
                    
                </div>
                <div id="newMusic">
                <%if (ds_NewMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_NewMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="newMusic_sel" type="checkbox" name="musicid" value="<%=ds_NewMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><%=ds_NewMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_NewMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_NewMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="selectMusic">
                        <input type="button" id="newMusic_allSel" value="全选"/>
                        <input type="button" id="newMusic_noSel" value="反选" />
                    </span>
                    <span class="musicOperate">
                        <a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/playAllBt.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/allAddList.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
                </div>
            </div>
            <div class="jiange2"></div>
            <div class="music">
                <div class="titles"><span class="select" id="ChinaMusicTitle">华语推荐</span><span class="noSelect" id="KoreaMusicTitle">日韩推荐</span><span class="noSelect" id="OccidentMusicTitle">欧美推荐</span><span class="more"><a href="#">更多>></a></span></div>
                <div id="ChinaMusic">
                <%if (ds_ChinaMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_ChinaMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="ChinaMusic_sel" name="musicid" type="checkbox" value="<%=ds_ChinaMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><%=ds_ChinaMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_ChinaMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_ChinaMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="selectMusic">
                        <input type="button" id="ChinaMusic_allSel" value="全选"/>
                        <input type="button" id="ChinaMusic_noSel" value="反选" />
                    </span>
                    <span class="musicOperate">
                        <a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/playAllBt.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/allAddList.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
                </div>
                <div id="KoreaMusic">
                <%if (ds_KoreaMusic.Tables[0].Rows.Count == 0)
                    { %>
                  该类型音乐暂时不存在！<%}
                    else
                    { %>
                    <form method="post" action="">
                <%for (int i = 0; i < ds_KoreaMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="KoreaMusic_sel" name="musicid" type="checkbox" value="<%=ds_KoreaMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><%=ds_KoreaMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_KoreaMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_KoreaMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="selectMusic">
                        <input type="button" id="KoreaMusic_allSel" value="全选"/>
                        <input type="button" id="KoreaMusic_noSel" value="反选" />
                    </span>
                    <span class="musicOperate">
                        <a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/playAllBt.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/allAddList.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
                </div>
                
                <div id="OccidentMusic">
                <%if (ds_OccidentMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i =0; i < ds_OccidentMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="OccidentMusic_sel" name="musicid" type="checkbox" value="<%=ds_OccidentMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i+1 %>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><%=ds_OccidentMusic.Tables[0].Rows[i]["MusicName"] %></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_OccidentMusic.Tables[0].Rows[i]["SingerID"] %>"><%=ds_OccidentMusic.Tables[0].Rows[i]["SingerName"] %></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_HotMusic.Tables[0].Rows[i]["MusicID"] %>" target="_blank"><img src="Images/playbg.jpg" /></a></span>
                    </div>
                    <%} %>
                    <div>
                    <span class="selectMusic">
                        <input type="button" id="OccidentMusic_allSel" value="全选"/>
                        <input type="button" id="OccidentMusic_noSel" value="反选" />
                    </span>
                    <span class="musicOperate">
                        <a href="cmp/MusicPlayer_Page.aspx?MusicID=0" target="_blank"><img src="Images/playAllBt.jpg" /></a>&nbsp;&nbsp;&nbsp;
                        <input type="image" src="Images/allAddList.jpg" onclick="addlist(this.form);" />
                    </span>
                    </div>
                    </form>
                    <%} %>
                </div>
            </div>
            <div class="jiange2"></div>
            <div id="news">
                <div class="newsTitle"><span class="newsfont">节日音乐包</span><span class="more"><a href="#">更多>></a></span></div>
                <div class="newsDetail">
                    <div id="newsPic"><img src="Images/specPic.jpg" /></div>
                    <div id="newsNotic"><span><a href="#" class="newsTitle">千年之恋——七夕情人节专题</a></span></div>
                    <div class="newsDetail"><span id="newsContent">七夕节是我国传统节日中最具浪漫色彩的一个节 日，七夕坐看牵牛织女星，是民间的习俗。相传，在 每年的这个夜晚，是天上织女与牛郎在鹊桥相。[</span><a id="contentDetail" href="#">详细</a>]</div>
                    <div id="newsbottom">
                        <div id="newsboImg"><img src="Images/specnews.jpg" /></div>
                        <div id="newsboContent">
                            <div id="newsboTitle">
                                <a class="Pink" href="#">BY2《勇敢》面对明天公益活</a>
                            </div>
                            <div id="newsbocontent">为爱，你够勇敢吗？为生活，你够勇敢吗？为明天，你够勇敢.为爱，你够勇敢吗!!为爱，你够勇敢吗!!</div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="heng"></div>
</asp:Content>

