using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Music_MasterPage : System.Web.UI.MasterPage
{
    public DataSet ds_SingerType = new DataSet();
    public DataSet ds_MusicStyle = new DataSet();
    BLL.CSingerType singerType = new BLL.CSingerType();
    BLL.CMusicStyle musicStyle = new BLL.CMusicStyle();

    protected void Page_Load(object sender, EventArgs e)
    {
       ds_SingerType = singerType.SingerTypeName();
       ds_MusicStyle = musicStyle.MusicStyle();
    }
}
