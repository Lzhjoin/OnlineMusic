using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DetailSinger : System.Web.UI.Page
{
    public DataSet ds_DetailSinger;

    BLL.CSinger singer = new BLL.CSinger();
    Model.CSinger Singer = new Model.CSinger();

    protected void Page_Load(object sender, EventArgs e)
    {
        Singer.SingerID =Convert.ToInt32(Request.QueryString["SingerID"].ToString());

        ds_DetailSinger = singer.Detail_Singer(Singer);
    }
}