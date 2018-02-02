using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DetailAlbumPage : System.Web.UI.Page
{
    Model.CAlbum Album = new Model.CAlbum();
    Model.CMusic Music = new Model.CMusic();
    BLL.CAlbum album = new BLL.CAlbum();
    BLL.CMusic music = new BLL.CMusic();
    public int SingerID = 0;
    public DataSet ds_Album;
    public DataSet ds_HotMusic;
    public DataSet ds_SingerHotMusic;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form.Get("MusicID") != null)
        {
            Session["MusicID"] += Request["MusicID"].ToString() + ",";
        }
        Album.AlbumID = Convert.ToInt32(Request.QueryString["AlbumID"]);
        ds_Album= album.DetailAlbum(Album);
        ds_HotMusic = music.HotMusicTop();
        SingerID = Convert.ToInt32(ds_Album.Tables[0].Rows[0]["SingerID"]);
        Music.SingerID = SingerID;
        ds_SingerHotMusic = music.SingerHotMusicTop(Music);
        
    }
}