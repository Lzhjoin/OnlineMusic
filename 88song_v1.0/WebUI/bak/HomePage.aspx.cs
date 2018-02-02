using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class HomePage : System.Web.UI.Page
{
    public DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        BLL.CAlbum album=new BLL.CAlbum();
        ds = album.HotAlbumTop();
        Repeater_HotAlbum.DataSource = ds;
        Repeater_HotAlbum.DataBind();

        ds = album.NewAlbumTop();
        Repeater_NewAlbum.DataSource = ds;
        Repeater_NewAlbum.DataBind();
    }
}