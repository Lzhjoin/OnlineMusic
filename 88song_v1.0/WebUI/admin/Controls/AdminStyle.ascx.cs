using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

public partial class admin_Controls_AdminStyle : System.Web.UI.UserControl
{
    Model.CMusicStyle MusicStyle = new Model.CMusicStyle();
    BLL.CMusicStyle musicStyle = new BLL.CMusicStyle();
    static int StyleID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //存储曲风名称
        MusicStyle.MusicStyleName = txtStyleName.Text.Trim();

        if (musicStyle.AddMusicStyle(MusicStyle))
        {
            lbMessage.ForeColor = System.Drawing.Color.Lime;
            lbMessage.Text = "添加成功！";
            GridView1.DataBind();
        }
        else
        {
            lbMessage.ForeColor = System.Drawing.Color.Red;
            lbMessage.Text = "添加失败！该曲风已存在";
        }
    }
    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        if (TabContainer1.ActiveTabIndex == 1)
        {
            RequiredFieldValidator1.Enabled = false;
        }
        else
        {
            RequiredFieldValidator1.Enabled = true;
        }

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        MusicStyle.MusicStyleID=StyleID;

        int count = musicStyle.AlterMusicStyleID(MusicStyle);

        GridView1.DataBind();

        Page.RegisterStartupScript("", "<script>alert('已将" + count + "首歌曲曲风修改为其它！')</script>");
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            LinkButton lbtn = (LinkButton)e.CommandSource;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            Label lb = (Label)gvr.FindControl("Label1");
            StyleID = Convert.ToInt32(lb.Text.Trim());
        }
    }
}