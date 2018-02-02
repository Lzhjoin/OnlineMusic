using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MusicStylePage : System.Web.UI.Page
{
    public DataSet ds_MusicStyle;
    public DataSet ds_HotMusic;
    public DataSet ds_NewMusic;

    BLL.CMusic music = new BLL.CMusic();
    BLL.CMusicStyle musicStyle = new BLL.CMusicStyle();

    Model.CMusicStyle MusicStyle = new Model.CMusicStyle();

    protected void Page_Load(object sender, EventArgs e)
    {
        MusicStyle.MusicStyleID = Convert.ToInt32(Request.QueryString["MusicStyleID"].ToString());

        ds_MusicStyle = musicStyle.MusicStyleList(MusicStyle);
        ds_HotMusic = music.HotMusicTop();
        ds_NewMusic = music.NewMusicTop();
    }
}