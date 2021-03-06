﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class NewMusicPage : System.Web.UI.Page
{
    public DataSet ds_NewMusic;
    public DataSet ds_HotAlbum;
    public DataSet ds_NewAlbum;

    BLL.CMusic music = new BLL.CMusic();
    BLL.CAlbum album = new BLL.CAlbum();

    protected void Page_Load(object sender, EventArgs e)
    {
        ds_NewMusic = music.NewMusic();
        ds_HotAlbum = album.HotAlbumTop();
        ds_NewAlbum = album.NewAlbumTop();
    }
}