using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SingerTypePage : System.Web.UI.Page
{
    public DataSet ds_SingerType;
    public DataSet ds_HotMusic;
    public DataSet ds_NewMusic;

    BLL.CMusic music = new BLL.CMusic();
    BLL.CSingerType singerType = new BLL.CSingerType();
    Model.CSingerType SingerType = new Model.CSingerType();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SingerType.SingerTypeID = Request.QueryString["SingerTypeID"].ToString();
        
        ds_SingerType = singerType.SingerTypeList(SingerType);
        ds_HotMusic = music.HotMusicTop();
        ds_NewMusic = music.NewMusicTop();
    }
}