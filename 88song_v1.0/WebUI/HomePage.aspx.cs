using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class HomePage : System.Web.UI.Page
{
    public DataSet ds_HotAlbum = new DataSet();
    public DataSet ds_NewAlbum = new DataSet();
    public DataSet ds_HotMusic = new DataSet();
    public DataSet ds_NewMusic = new DataSet();
    public DataSet ds_ChinaMusic = new DataSet();
    public DataSet ds_KoreaMusic = new DataSet();
    public DataSet ds_OccidentMusic = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form.Get("MusicID")!=null)
        {
            Session["MusicID"]+= Request["MusicID"].ToString()+",";
        }
        BLL.CAlbum album=new BLL.CAlbum();
        BLL.CMusic music=new BLL.CMusic();

        ds_HotAlbum = album.HotAlbumTop();
        ds_NewAlbum = album.NewAlbumTop();
        ds_HotMusic = music.HotMusicTop();
        ds_NewMusic = music.NewMusicTop();
        ds_ChinaMusic = music.LanguageMusic("华语");
        ds_KoreaMusic = music.LanguageMusic("日韩");
        ds_OccidentMusic = music.LanguageMusic("欧美");
    }


}