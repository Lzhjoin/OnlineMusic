using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
using System.IO;
using System.Data;

public partial class admin_Controls_AdminAblum : System.Web.UI.UserControl
{
    BLL.CSinger singer = new BLL.CSinger();
    BLL.CAlbum album = new BLL.CAlbum();
    Model.CAlbum Album = new Model.CAlbum();
    static int AlbumID = 0;
    static string AlbumPhoto = null;
    static bool Search = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            GridBind();
        }
    }

    public void BindData()
    {
        //为ddlSingerName绑定歌手姓名和ID
        ddlSingerName.DataSource = singer.Select().Tables[0];
        ddlSingerName.DataTextField = "SingerName";
        ddlSingerName.DataValueField = "SingerID";
        ddlSingerName.DataBind();
    }

    protected void btnAddAlbum_Click(object sender, EventArgs e)
    {
        UpLoad();
    }

    public void UpLoad()
    {
        string AlbumID = album.Select_AutoID();

        if (FileUpload_AlbumPhoto.HasFile)
        {
            string PhotoPath = Server.MapPath("~/File/AlbumPhoto/");

            bool FileOK = false;

            string PhotoExtender = Path.GetExtension(FileUpload_AlbumPhoto.FileName).ToLower();

            if (PhotoExtender == ".jpg")
            {
                FileOK = true;
            }

            if (FileOK)
            {
                //存储专辑信息
                Album.AlbumName = txtAlbumName.Text;
                Album.SingerID = Convert.ToInt32(ddlSingerName.SelectedValue);
                Album.AlbumPhotoPath = @"File/AlbumPhoto/" + AlbumID + PhotoExtender;
                Album.PublishDate = txtPublicDate.Text;

                if (album.AddAlbum(Album))
                {
                    FileUpload_AlbumPhoto.PostedFile.SaveAs(PhotoPath + AlbumID + PhotoExtender);

                    lbMessage.ForeColor = System.Drawing.Color.Lime;
                    lbMessage.Text = "添加成功！";
                    GridBind();
                }
                else
                {
                    lbMessage.ForeColor = System.Drawing.Color.Red;
                    lbMessage.Text = "该专辑已存在！";
                }

            }
        }
        else
        {
            lbMessage.ForeColor = System.Drawing.Color.Red;
            lbMessage.Text = "上传专辑图片不能为空！";
        }
    }

    /// <summary>
    /// 数据库中查询歌手姓名及ID
    /// </summary>
    /// <returns></returns>
    public DataSet ddl_AlterSingerName()
    {
        return album.SingerName();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            LinkButton lbtn=(LinkButton)e.CommandSource;
            GridViewRow gvr = (GridViewRow)lbtn.NamingContainer;
            Label lb1 = (Label)gvr.FindControl("Label1");
            Label lb2 = (Label)gvr.FindControl("Label2");
            AlbumID =Convert.ToInt32(lb1.Text);
            AlbumPhoto = Server.MapPath("~/");
            AlbumPhoto+= lb2.Text;
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Album.AlbumID = AlbumID;

        DataSet ds = album.DeleteMusic(Album);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string Musicpath = null;
            string Lyricpath = null;

            Musicpath = Server.MapPath("~/" + ds.Tables[0].Rows[i]["MusicPath"].ToString());
            Lyricpath = Server.MapPath("~/" + ds.Tables[0].Rows[i]["LyricPath"].ToString());
            //删除该专辑下的歌曲及歌词文件
            if (File.Exists(Musicpath))
            {
                File.Delete(Musicpath);
            }
            if (File.Exists(Lyricpath))
            {
                File.Delete(Lyricpath);
            }
        }

        string Albumpath = Server.MapPath("~/"+AlbumPhoto);
        //删除专辑封面图片
        if (File.Exists(Albumpath))
        {
            File.Delete(Albumpath);
        }

        album.DeleteAlbum(Album);

        BindData();
        GridBind();


    }
    protected void FileUpload1_DataBinding(object sender, EventArgs e)
    {
        FileUpload fup = (FileUpload)sender;
        DetailsView dv = (DetailsView)fup.NamingContainer;

        TextBox txtSingerPhtotPath = (TextBox)dv.FindControl("txtAlbumPhotoPath");

        //实现textbox与Fileupload联动
        fup.Attributes.Add("onchange", "document.getElementById('" + txtSingerPhtotPath.ClientID + "').value=this.value");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        DetailsView dv = (DetailsView)lbtn.NamingContainer;

        //获取detailsview中的上传控件，显示路径的textbox，显示歌手姓名的textbox控件
        FileUpload fup = (FileUpload)dv.FindControl("FileUpload1");
        TextBox txt = (TextBox)dv.FindControl("txtAlbumPhotoPath");
        TextBox txtAlbumName = (TextBox)dv.FindControl("TextBox1");
        Label lbAlbumID = (Label)dv.FindControl("Label4");
        TextBox txtPublishDate = (TextBox)dv.FindControl("TextBox2");

        string PhotoPath = Server.MapPath("~/File/AlbumPhoto/");

        //判断上传控件中是否有文件
        if (fup.HasFile)
        {
            //获取上传文件的扩展名
            string PhotoExtender = Path.GetExtension(fup.FileName).ToLower();

            //判断扩展名是否符合规范
            if (PhotoExtender == ".jpg")
            {
                //获取原图片在服务器中的地址
                //string path = Server.MapPath(PhotoPath);

                //判断服务器中是否存在该文件
                if (File.Exists(PhotoPath+lbAlbumID.Text+PhotoExtender))
                {
                    //存在则删除
                    File.Delete(PhotoPath + lbAlbumID.Text + PhotoExtender);
                }
                //更改显示路径的textbox
                txt.Text = @"File/Photo/" + lbAlbumID.Text + PhotoExtender;
                //将文件上传至服务器指定路径
                fup.PostedFile.SaveAs(PhotoPath + lbAlbumID.Text + PhotoExtender);

                GridBind();

            }

            else
            {
                //给出错误提示
                Page.RegisterStartupScript("", "<script>alert('上传图片格式不正确！')</script>");
                //阻止更新
                DetailsView1.DataBind();
            }
        }
    }

    public void GridBind()
    {
        if (Search)
        {
            GridView1.DataSource = ObjectDataSource_SearchAlbum;
        }
        else
        {
            GridView1.DataSource = ObjectDataSource_SelectAlbum;
        }
        GridView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtAlbumName1.Text.Trim() == "")
        {
            Search = false;
        }
        else
        {
            Search = true;
        }
        GridBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridBind();
    }
    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        if (TabContainer1.ActiveTabIndex == 0)
        {
            RequiredFieldValidator1.Enabled = true;
        }
        else
        {
            RequiredFieldValidator1.Enabled = false;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridBind();
    }
}