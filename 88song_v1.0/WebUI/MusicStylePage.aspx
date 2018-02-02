<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="MusicStylePage.aspx.cs" Inherits="MusicStylePage" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Detail_ListBorder">
    <div class="title"><span class="Detail_ListFont">歌曲曲风-<%=ds_MusicStyle.Tables[0].Rows[0]["MusicStyleName"]%></span></div>
    <div class="Detail_ListEntrety">
    <%if (ds_MusicStyle.Tables[1].Rows.Count == 0)
      {%>
        <div class="sky">该曲风暂无歌曲收录，请与管理员联系</div>
    <%}
      else
      {
          
      }
      {
          for (int i = 0; i < ds_MusicStyle.Tables[1].Rows.Count; i++)
          {%>

        <div class="Detail_List">
        <span class="Detail_ListName">第<%=i + 1%>名：</span>
        <span class="Detail_ListName">歌曲名称：<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_MusicStyle.Tables[1].Rows[i]["MusicID"] %>"><%=ds_MusicStyle.Tables[1].Rows[i]["MusicName"]%></a>-<a href="DetailSingerPage.aspx?SingerID=<%=ds_MusicStyle.Tables[1].Rows[i]["SingerID"]%>"><%=ds_MusicStyle.Tables[1].Rows[i]["SingerName"]%></a></span>
        <span class="Detail_ListName">歌曲发布日期：<%=ds_MusicStyle.Tables[1].Rows[i]["PublishDate"]%></span>
        </div>
        <%}
      } %>
    </div>
    </div>
    <div class="hotMusic">
        <div class="title">热门歌曲<span class="more"><a href="HotMusicPage.aspx">更多>></a></span></div>
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
         <div class="title">最新歌曲<span class="more"><a href="NewMusicPage.aspx">更多>></a></span></div>
         <%if (ds_NewMusic.Tables[0].Rows.Count == 0)
                  { %>
                  该类型音乐暂时不存在！<%}
                  else
                  { %>
                  <form method="post" action="">
                <%for (int i = 0; i < ds_NewMusic.Tables[0].Rows.Count; i++)
                  {%>
                    <div class="Detail_Music">
                    <span class="Music_Select"><input class="hotMusic_sel" name="checkbox" type="checkbox" value="<%=ds_NewMusic.Tables[0].Rows[i]["MusicID"] %>" /></span>
                    <span class="MusicName"><%=i + 1%>.<a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_NewMusic.Tables[0].Rows[i]["MusicID"] %>"><%=ds_NewMusic.Tables[0].Rows[i]["MusicName"]%></a></span>
                    <span class="Music_SingerName"><a href="DetailSingerPage.aspx?SingerID=<%=ds_NewMusic.Tables[0].Rows[i]["SingerID"]%>"><%=ds_NewMusic.Tables[0].Rows[i]["SingerName"]%></a></span>
                    <span class="Music_Play"><a target="_blank" href="cmp/MusicPlayer_Page.aspx?MusicID=<%=ds_NewMusic.Tables[0].Rows[i]["MusicID"] %>"><img src="Images/playbg.jpg" /></a></span>
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

