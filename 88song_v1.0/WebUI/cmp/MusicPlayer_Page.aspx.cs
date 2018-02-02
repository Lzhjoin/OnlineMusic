using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Xml;
using System.Text;

public partial class cmp_Default : System.Web.UI.Page
{
    Model.CMusic Music = new Model.CMusic();
    BLL.CMusic music = new BLL.CMusic();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        string List_MusicID = "";
        if (Request.QueryString["MusicID"] == "0")
        {
            List_MusicID = Session["MusicID"].ToString()+"0";
        }
        else if (Session["MusicID"].ToString() =="")
        {
            List_MusicID = Request.QueryString["MusicID"].ToString();
        }
        else
        {
            List_MusicID = Session["MusicID"].ToString()+ Request.QueryString["MusicID"].ToString();
        }

        Music.List_MusicID = List_MusicID;

       ds=music.Music_Player(Music);

       //CDataToXmlFile(ds.Tables[0], "~/list.xml");
    }

    public string getMusicList()
    {
        string Music_List = "<?xml version='1.0' encoding='UTF-8'?><list>";
        foreach (DataRow dr in ds.Tables[0].Rows)
            Music_List += "<m type='' src='../" + dr["MusicPath"] + "' lrc='../" + dr["LyricPath"] + "' label='" + dr["MusicName"] + "-" + dr["SingerName"] + "' />";
        return  Music_List += "</list>";
    }
}