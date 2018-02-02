using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class HotAlbumPage : System.Web.UI.Page
{
    public DataSet ds_HotAlbum;
    public DataSet ds_HotMusic;
    public DataSet ds_NewMusic;

    BLL.CMusic music = new BLL.CMusic();
    BLL.CAlbum album = new BLL.CAlbum();
    protected void Page_Load(object sender, EventArgs e)
    {
        ds_HotAlbum = album.Hot_Album();
        ds_HotMusic = music.HotMusicTop();
        ds_NewMusic = music.NewMusicTop();
    }
}