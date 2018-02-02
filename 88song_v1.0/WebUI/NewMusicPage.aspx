<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="NewMusicPage.aspx.cs" Inherits="NewMusicPage" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Detail_ListBorder">
    <div class="title"><span class="Detail_ListFont">最新歌曲</span></div>
    <div class="Detail_ListEntrety">
    <%if (ds_NewMusic.Tables[0].Rows.Count == 0)
      {%>
        <div class="sky">暂无歌曲收录，请与管理员联系</div>
    <%}
      else
      {
          for (int i = 0; i < ds_NewMusic.Tables[0].Rows.Count; i++)
          {%>

        <div class="Detail_List">
        <span class="Detail_ListName">第<%=i + 1%>名：</span>
        <span class="Detail_ListName">专辑名称：<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_NewMusic.Tables[0].Rows[i]["MusicID"]%>"><%=ds_NewMusic.Tables[0].Rows[i]["MusicName"]%></a>-<a href="DetailSingerPage.aspx?SingerID=<%=ds_NewMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_NewMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
        <span class="Detail_ListName">专辑发布日期：<%=ds_NewMusic.Tables[0].Rows[i]["PublishDate"]%></span>
        </div>
        <%}
      } %>
    </div>
    </div>
    <div class="hotMusic">
        <div class="title">热门专辑<span class="more"><a href="HotAlbumPage.aspx">更多>></a></span></div>
        <%if (ds_HotAlbum.Tables[0].Rows.Count == 0)
                  { %>
                  尚未加入任何专辑，请与网站管理员联系！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < 10 & i < ds_HotAlbum.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="MusicName"><%=i + 1%>.<a href="DetailAlbumPage.aspx?AlbumID=<%=ds_HotAlbum.Tables[0].Rows[i]["AlbumID"]%>"><%=ds_HotAlbum.Tables[0].Rows[i]["AlbumName"]%></a></span>
                    <span class="Music_SingerName">——<a href="DetailSingerPage.aspx?SingerID=<%=ds_HotAlbum.Tables[0].Rows[i]["SingerID"]%>"><%=ds_HotAlbum.Tables[0].Rows[i]["SingerName"]%></a></span>
                    </div>
                    <%} %>
                    </form>
                    <%} %>
    </div>
    <div class="AlbumHeng4"></div>
    <div class="SingerHotMusic">
         <div class="title">最新专辑<span class="more"><a href="NewAlbumPage.aspx">更多>></a></span></div>
         <%if (ds_NewAlbum.Tables[0].Rows.Count == 0)
                  { %>
                  尚未加入任何专辑，请与网站管理员联系！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_NewAlbum.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="MusicName"><%=i + 1%>.<a href="DetailAlbumPage.aspx?AlbumID=<%=ds_NewAlbum.Tables[0].Rows[i]["AlbumID"]%>"><%=ds_NewAlbum.Tables[0].Rows[i]["AlbumName"]%></a></span>
                    <span class="Music_SingerName">——<a href="DetailSingerPage.aspx?SingerID=<%=ds_NewAlbum.Tables[0].Rows[i]["SingerID"]%>"><%=ds_NewAlbum.Tables[0].Rows[i]["SingerName"]%></a></span>
                    </div>
                    <%} %>
                    </form>
                    <%} %>
    </div>
    <div class="AlbumHeng3"></div>
</asp:Content>

