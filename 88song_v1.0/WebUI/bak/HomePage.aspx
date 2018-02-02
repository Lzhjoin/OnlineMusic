<%@ Page Title="" Language="C#" MasterPageFile="~/Music_MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div id="mid">
            <div id="hotAlbum">
                <div class="title">热门专辑</div>
                <div class="albumDetail">
                    <asp:Repeater ID="Repeater_HotAlbum" runat="server">
                    <ItemTemplate>
                        <div class="hotAlbumUnit">
                            <div class="Photo"><img class="imgFrame" src="<%#Eval("AlbumPhotoPath") %>" /></div>
                            <div class="singerName"><a href="#"><%#Eval("SingerName") %></a></div>
                            <div class="albumName"><a href="#"><%#Eval("AlbumName") %></a></div>
                        </div>
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="jiange1"></div>
            <div id="newAlbum">
                <div class="title">最新专辑</div>
                <div class="albumDetail">
                    <asp:Repeater ID="Repeater_NewAlbum" runat="server">
                    <ItemTemplate>
                        <div class="newAlbum">
                            <div class="newPhoto"><img class="imgFrame" src="<%#Eval("AlbumPhotoPath") %>" /></div>
                            <div class="newMusicContent">
                                <div class="newAlbumName">专辑名：<a href="#"><%#Eval("AlbumName") %></a></div>
                                <div class="newSingerName">歌手名：<a href="#"><%#Eval("SingerName") %></a></div>
                                <div class="publish">专辑发布时间：<%#Eval("PublishDate") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="heng"></div>
            <div id="hotMusic">
                <div class="title">热门歌曲</div>
                
            </div>
            <div class="jiange2"></div>
            <div id="newMusic">
                <div class="title">最新歌曲</div>
                
            </div>
            <div class="jiange2"></div>
        </div>
</asp:Content>

