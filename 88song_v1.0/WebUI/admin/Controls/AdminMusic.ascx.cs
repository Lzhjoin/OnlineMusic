using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class admin_Controls_AdminMusic : System.Web.UI.UserControl
{
    BLL.CSinger singer = new BLL.CSinger();
    BLL.CMusicStyle musicStyle = new BLL.CMusicStyle();
    BLL.CAlbum album = new BLL.CAlbum();
    BLL.CMusic music = new BLL.CMusic();
    Model.CMusic Music = new Model.CMusic();
    Model.CAlbum Album = new Model.CAlbum();
    static string MusicPath = null;
    static string LyricPath = null;
    static string MusicID = null;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindData();
        }
    }

    public void BindData()
    {
        //为ddlSingerName绑定歌手姓名和ID
        ddlSingerName.DataSource = singer.Select().Tables[0];
        ddlSingerName.DataTextField = "SingerName";
        ddlSingerName.DataValueField = "SingerID";
        ddlSingerName.DataBind();

        //为ddlAlbum绑定歌曲专辑和ID
        ddlAlbum.DataSource = album.Select(Album).Tables[0];
        ddlAlbum.DataTextField = "AlbumName";
        ddlAlbum.DataValueField = "AlbumID";
        ddlAlbum.DataBind();

        //为ddlMusicStyle绑定歌曲风格和ID
        ddlMusicStyle.DataSource = musicStyle.Select().Tables[0];
        ddlMusicStyle.DataTextField = "MusicStyleName";
        ddlMusicStyle.DataValueField = "MusicStyleID";
        ddlMusicStyle.DataBind();
    }
    protected void btnAddMusic_Click(object sender, EventArgs e)
    {
        UpLoad();
    }

    private void UpLoad()
    {
        bool fileOK = false;
        string MusicPath = Server.MapPath("~/File/Music/");
        string LyricPath = Server.MapPath("~/File/Lyric/");

        if ((FUpMusic.HasFile) && (FUpLyric.HasFile))
        {
            //获取上传音乐文件及歌词文件的扩展名并将其转化为小写
            string MusicExtender = Path.GetExtension(FUpMusic.FileName).ToLower();
            string LyricExtender = Path.GetExtension(FUpLyric.FileName).ToLower();

            //判断文件扩展名是否正确 
            if (MusicExtender == ".mp3" && LyricExtender == ".lrc")
            {
                fileOK = true;
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('歌曲或歌词格式不正确！');</script>");
            }

            if (fileOK)
            {
               string fileID=music.Select_AutoID();

                //获取文件名称，从文件名开始直至最后的扩展名之前结束
                Music.MusicName = txtMusicName.Text;
                Music.MusicPath = @"File/Music/" + fileID+MusicExtender;
                Music.LyricPath = @"File/Lyric/" + fileID+LyricExtender;
                Music.SingerID = Convert.ToInt32(ddlSingerName.SelectedValue);
                Music.MusicStyleID = Convert.ToInt32(ddlMusicStyle.SelectedValue);
                Music.AlbumID = Convert.ToInt32(ddlAlbum.SelectedValue);
                Music.PublishDate = txtPublicDate.Text;


                //歌曲及歌词上传到服务器
                FUpMusic.PostedFile.SaveAs(MusicPath + fileID + MusicExtender);
                FUpLyric.PostedFile.SaveAs(LyricPath + fileID + LyricExtender);

                //判断歌曲是否上传成功
                if (music.AddMusic(Music))
                {
                    Page.RegisterStartupScript("", "<script>alert('上传成功！');</script>");
                    //Response.Write("<script>alert('上传成功！');</script>");
                    GV_MusicInfo.DataBind();
                }
                else
                {
                    Page.RegisterStartupScript("", "<script>alert('该歌曲已存在！');</script>");
                    //Response.Write("<script>alert('上传失败！');</script>");
                }

            }

        }
        else
        {
            Page.RegisterStartupScript("", "<script>alert('歌曲或歌词文件为空！');</script>");
            // Response.Write("<script>alert('歌曲或歌词文件为空！');</script>");
        }


    }

    //为ddl_alterSinger绑定数据源
    public DataSet ddl_alterSingerBind()
    {
        return singer.Select();
    }


    //为ddl_alterAlbum绑定数据源
    public DataSet ddl_alterAlbumBind()
    {
        return album.Select(Album);
    }

    //为ddl_alterStyle绑定数据源
    public DataSet ddl_alterStyleBind()
    {
        return musicStyle.Select();
    }

    protected void ddlSingerName_DataBound(object sender, EventArgs e)
    {
        Album.SingerID = Convert.ToInt32(ddlSingerName.SelectedValue);
    }

    protected void ddlSingerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Album.SingerID = Convert.ToInt32(ddlSingerName.SelectedValue);


        ddlAlbum.DataSource = album.Select(Album).Tables[0];
        ddlAlbum.DataTextField = "AlbumName";
        ddlAlbum.DataValueField = "AlbumID";
        ddlAlbum.DataBind();
    }




    //protected void ddl_alterSinger_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //DropDownList ddl1 = (DropDownList)sender;
    //    //Album.SingerID = Convert.ToInt32(ddl1.SelectedValue);
    //}
    //protected void ddl_alterSinger_DataBound(object sender, EventArgs e)
    //{
    //    DropDownList ddl = (DropDownList)sender;
    //    Album.SingerID = Convert.ToInt32(ddl.SelectedValue);

    //    GridViewRow gvr = (GridViewRow)ddl.NamingContainer;
    //    DropDownList ddlAlbum = (DropDownList)gvr.FindControl("ddl_alterAlbum");



    //    ddlAlbum.DataTextField = "AlbumName";
    //    ddlAlbum.DataValueField = "AlbumID";
    //    Literal1.Text = ddlAlbum.SelectedValue;

    //    ListItem itmSelected = ddlAlbum.Items.FindByValue(Literal1.Text);
    //    if (itmSelected!= null)
    //        itmSelected.Selected = true;

    //    ddlAlbum.DataSource = album.Select(Album).Tables[0];
    //    ddlAlbum.DataBind();
    //}
    //protected void ddl_alterSinger_TextChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddl = (DropDownList)sender;
    //    GridViewRow gvr = (GridViewRow)ddl.NamingContainer;
    //    DropDownList ddlAlbum = (DropDownList)gvr.FindControl("ddl_alterAlbum");



    //    ddlAlbum.DataTextField = "AlbumName";
    //    ddlAlbum.DataValueField = "AlbumID";
    //    Literal1.Text = ddl.SelectedValue;

    //    ListItem itmSelected = ddlAlbum.Items.FindByValue(Literal1.Text);
    //    if (itmSelected != null)
    //        itmSelected.Selected = true;

    //    ddlAlbum.DataSource = album.Select(Album).Tables[0];
    //    ddlAlbum.DataBind();


    //}

    //protected void ddl_alterAlbum_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddl = (DropDownList)sender;
    //    Literal1.Text = ddl.SelectedValue;
    //    ddl.SelectedValue = Literal1.Text;
    //    //ListItem itmSelected = ddl.Items.FindByValue(Literal1.Text);
    //    //if (itmSelected != null)
    //    //    itmSelected.Selected = true;
    //}
    //protected void GV_MusicInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
        
    //    //DropDownList ddl = (DropDownList)GV_MusicInfo.Rows[e.RowIndex].FindControl("ddl_alterAlbum");
    //    //ddl.SelectedValue = Literal1.Text;
    //    //ddl.DataBind();
    //}

    #region 没有实现联动功能，无效
    protected void ddl_alterSinger_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        Album.SingerID =Convert.ToInt32(ddl.SelectedValue);
    }

    //没有实现联动功能，无效
    protected void ddl_alterSinger_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        Album.SingerID = Convert.ToInt32(ddl.SelectedValue);
        GridViewRow gvr = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlAlbum = (DropDownList)gvr.FindControl("ddl_alterAlbum");
    }
#endregion
    protected void FileUpload2_DataBinding(object sender, EventArgs e)
    {
        FileUpload FupMusic = (FileUpload)sender;
        GridViewRow gvr = (GridViewRow)FupMusic.NamingContainer;

        //在gridview中查找TextBox这个控件
        //FileUpload FUpMusic1 = (FileUpload)gvr.FindControl("FileUpload2");
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtMusicPath");

        //当Fileupload控件中的值发生改变时，TextBox中的值也同样发生改变
        FupMusic.Attributes.Add("onchange", "document.getElementById('" + txtMusicPath.ClientID + "').value = this.value");
    }


    protected void FileUpload3_DataBinding(object sender, EventArgs e)
    {
        FileUpload FupMusic = (FileUpload)sender;
        GridViewRow gvr = (GridViewRow)FupMusic.NamingContainer;

        //在gridview中查找TextBox这个控件
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtLyricPath");

        //当Fileupload控件中的值发生改变时，TextBox中的值也同样发生改变
        FupMusic.Attributes.Add("onchange", "document.getElementById('" + txtMusicPath.ClientID + "').value = this.value");
    }

    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {
        //获取发送指令的控件
        LinkButton lbtn = (LinkButton)sender;

        //获取发送指令控件所在gridview中的行数
        GridViewRow gvr=(GridViewRow)lbtn.NamingContainer;

        //在该数据行中寻找控件ID为Fileupload2控件
        FileUpload FupMusicPath = (FileUpload)gvr.FindControl("FileUpload2");
        FileUpload FupLyricPath = (FileUpload)gvr.FindControl("FileUpload3");
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtMusicPath");
        TextBox txtLyricPath = (TextBox)gvr.FindControl("txtLyricPath");
        Label lbMusicID = (Label)gvr.FindControl("lbMusicID");

        //获取与服务器路径相对应的物理路径
        string MusicPath = Server.MapPath("~/File/Music/");
        string LyricPath = Server.MapPath("~/File/Lyric/");

        //判断歌曲上传控件里面是否有文件
        if (FupMusicPath.HasFile)
        {
            //获取上传歌曲文件扩展名并转化为小写
            string MusicExtender = Path.GetExtension(FupMusicPath.FileName).ToLower();

            if (MusicExtender == ".mp3")
            {
                //string Musicpath = Server.MapPath(MusicPath);
               

                //删除服务器中的歌曲及歌文件
                if (File.Exists(MusicPath+lbMusicID.Text+MusicExtender))
                {
                    File.Delete(MusicPath + lbMusicID.Text + MusicExtender);
                }
                //将上传后的文件地址赋值给txtMusicPath
                txtMusicPath.Text = @"File/Music/" + lbMusicID.Text + MusicExtender;
                //歌曲上传到服务器
                FupMusicPath.PostedFile.SaveAs(MusicPath + lbMusicID.Text + MusicExtender);
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('歌曲格式不正确！');</script>");
                //阻止数据更新
                GV_MusicInfo.DataBind();
            }

        }

        //判断歌词上传控件里面是否有文件
        if (FupLyricPath.HasFile)
        {
            //获取上传歌词文件的扩展名并将其转化为小写
            string LyricExtender = Path.GetExtension(FupLyricPath.FileName).ToLower();

            //判断文件扩展名是否正确 
            if (LyricExtender == ".lrc")
            {
                //string Lyricpath = Server.MapPath(LyricPath);

                //删除服务器中的歌词文件
                if (File.Exists(LyricPath+lbMusicID.Text +LyricExtender))
                {
                    File.Delete(LyricPath + lbMusicID.Text + LyricExtender);
                }

                //将上传后的文件地址赋值给txtLyricPath
                txtLyricPath.Text = @"File/Lyric/" + lbMusicID.Text + LyricExtender;
                //歌词上传到服务器
                FupLyricPath.PostedFile.SaveAs(LyricPath + lbMusicID.Text + LyricExtender);
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('歌词格式不正确！');</script>");
                //阻止数据更新
                GV_MusicInfo.DataBind();
            }

        }

    }


    protected void btnMusicSearch_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView1.Enabled = true;
        GV_MusicInfo.Visible = false;
        GV_MusicInfo.Enabled = false;
       // GV_MusicInfo.DataSourceID = null;
       // GV_MusicInfo.DataSource = ObjectDataSourceSearchMusic;
       //GV_MusicInfo.DataBind();
    }



//查找歌曲

    protected void FileUpload22_DataBinding(object sender, EventArgs e)
    {
        FileUpload FupMusic = (FileUpload)sender;
        GridViewRow gvr = (GridViewRow)FupMusic.NamingContainer;

        //在gridview中查找TextBox这个控件
        //FileUpload FUpMusic1 = (FileUpload)gvr.FindControl("FileUpload2");
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtMusicPath1");

        //当Fileupload控件中的值发生改变时，TextBox中的值也同样发生改变
        FupMusic.Attributes.Add("onchange", "document.getElementById('" + txtMusicPath.ClientID + "').value = this.value");
    }


    protected void FileUpload33_DataBinding(object sender, EventArgs e)
    {
        FileUpload FupMusic = (FileUpload)sender;
        GridViewRow gvr = (GridViewRow)FupMusic.NamingContainer;

        //在gridview中查找TextBox这个控件
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtLyricPath1");

        //当Fileupload控件中的值发生改变时，TextBox中的值也同样发生改变
        FupMusic.Attributes.Add("onchange", "document.getElementById('" + txtMusicPath.ClientID + "').value = this.value");
    }

    protected void lbtnUpdate1_Click(object sender, EventArgs e)
    {
        //获取发送指令的控件
        LinkButton lbtn = (LinkButton)sender;

        //获取发送指令控件所在gridview中的行数
        GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;

        //在该数据行中寻找控件ID为Fileupload22控件
        FileUpload FupMusicPath = (FileUpload)gvr.FindControl("FileUpload22");
        FileUpload FupLyricPath = (FileUpload)gvr.FindControl("FileUpload33");
        TextBox txtMusicPath = (TextBox)gvr.FindControl("txtMusicPath1");
        TextBox txtLyricPath = (TextBox)gvr.FindControl("txtLyricPath1");
        Label lbMusicID = (Label)gvr.FindControl("lbMusicID1");

        //获取与服务器路径相对应的物理路径
        string MusicPath = Server.MapPath("~/File/Music/");
        string LyricPath = Server.MapPath("~/File/Lyric/");

        //判断歌曲上传控件里面是否有文件
        if (FupMusicPath.HasFile)
        {
            //获取上传歌曲文件扩展名并转化为小写
            string MusicExtender = Path.GetExtension(FupMusicPath.FileName).ToLower();

            if (MusicExtender == ".mp3")
            {
                //string Musicpath = Server.MapPath(MusicPath);


                //删除服务器中的歌曲及歌文件
                if (File.Exists(MusicPath+lbMusicID.Text+MusicExtender))
                {
                    File.Delete(MusicPath + lbMusicID.Text + MusicExtender);
                }
                //将上传后的文件地址赋值给txtMusicPath
                txtMusicPath.Text = @"File/Music/" + lbMusicID.Text + MusicExtender;
                //歌曲上传到服务器
                FupMusicPath.PostedFile.SaveAs(MusicPath + lbMusicID.Text + MusicExtender);
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('歌曲格式不正确！');</script>");
                //阻止数据更新

                GridView1.DataBind();
            }

        }

        //判断歌词上传控件里面是否有文件
        if (FupLyricPath.HasFile)
        {
            //获取上传歌词文件的扩展名并将其转化为小写
            string LyricExtender = Path.GetExtension(FupLyricPath.FileName).ToLower();

            //判断文件扩展名是否正确 
            if (LyricExtender == ".lrc")
            {
                //string Lyricpath = Server.MapPath(LyricPath);

                //删除服务器中的歌词文件
                if (File.Exists(LyricPath+lbMusicID.Text+LyricExtender))
                {
                    File.Delete(LyricPath + lbMusicID.Text + LyricExtender);
                }
                //将上传后的文件地址赋值给txtLyricPath
                txtLyricPath.Text = @"File/Lyric/" + lbMusicID.Text + LyricExtender;
                //歌词上传到服务器
                FupLyricPath.PostedFile.SaveAs(LyricPath + lbMusicID.Text + LyricExtender);
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('歌词格式不正确！');</script>");
                //阻止数据更新
                GridView1.DataBind();
            }

        }

    }
    protected void GV_MusicInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ((e.CommandName =="DelMusic"))
        {
            LinkButton lbtn = (LinkButton)e.CommandSource;

            GridViewRow dvr = (GridViewRow)lbtn.NamingContainer;

            Label lbMusic = (Label)dvr.FindControl("Label7");
            Label lbLyric = (Label)dvr.FindControl("Label8");
            Label lbMusicID = (Label)dvr.FindControl("Label4");
            string MusicPath = Server.MapPath("~/");
            string LyricPath = Server.MapPath("~/");
            //获取存储在数据库中的歌曲和歌词路径，并存储在静态变量中
            MusicPath+=lbMusic.Text;
            LyricPath+=lbLyric.Text;

            MusicID = lbMusicID.Text;

            music.DeleteMusic_ID(MusicID);

            //删除服务器中的歌曲及歌词文件
            if (File.Exists(MusicPath))
            {
                File.Delete(MusicPath);
            }

            if (File.Exists(LyricPath))
            {
                File.Delete(LyricPath);
            }

            GV_MusicInfo.DataBind();
        }
    }

   

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del1")
        {
            LinkButton lbtn = (LinkButton)e.CommandSource;

            GridViewRow dvr = (GridViewRow)lbtn.NamingContainer;

            Label lbMusic = (Label)dvr.FindControl("Label77");
            Label lbLyric = (Label)dvr.FindControl("Label88");
            Label lbMusicID = (Label)dvr.FindControl("Label44");

            string MusicPath = Server.MapPath("~/");
            string LyricPath = Server.MapPath("~/");
            //获取存储在数据库中的歌曲和歌词路径，并存储在静态变量中
            MusicPath += lbMusic.Text;
            LyricPath += lbLyric.Text;

            MusicID = lbMusicID.Text;

            music.DeleteMusic_ID(MusicID);

            //删除服务器中的歌曲及歌词文件
            if (File.Exists(MusicPath))
            {
                File.Delete(MusicPath);
            }

            if (File.Exists(LyricPath))
            {
                File.Delete(LyricPath);
            }

            GridView1.DataBind();
        }
    }
   
}