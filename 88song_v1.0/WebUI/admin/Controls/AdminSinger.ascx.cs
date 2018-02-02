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

public partial class admin_Controls_AdminSinger : System.Web.UI.UserControl
{
    BLL.CSingerType singerType = new BLL.CSingerType();
    BLL.CSinger singer = new BLL.CSinger();
    Model.CSinger Singer = new Model.CSinger();
    static int SingerID=0;
    static string PhotoPath = null;
    static bool Search = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            GridBind();
        }
        
    }


    //为ddlSingerType绑定数据
    public void BindData()
    {
        ddlSingerType.DataSource = singerType.Select().Tables[0];
        ddlSingerType.DataTextField = "SingerTypeName";
        ddlSingerType.DataValueField = "SingerTypeID";
        ddlSingerType.DataBind();
    }


    protected void btnAddSinger_Click(object sender, EventArgs e)
    {
        UpLoad();

        GridBind();
    }


    public void UpLoad()
    {
        bool fileOK = false;
        string PhotoPath = Server.MapPath("~/File/Photo/");
        string SingerID = singer.Select_AutoID();

        if (FUpSingerPhoto.HasFile)
        {
            string PhotoExtender = Path.GetExtension(FUpSingerPhoto.FileName).ToLower();

            if (PhotoExtender == ".jpg")
            {
                fileOK = true;
            }
            else
            {
                Page.RegisterStartupScript("", "<script>alert('图片格式不正确，请重新上传！')</script>");
                //Response.Write("<script>alert('图片格式不正确，请重新上传！')</script>");
            }

            if (fileOK)
            {
                //将要插入的歌手信息存储在Model中
                Singer.SingerName = txtSingerName.Text.Trim();
                Singer.PhotoPath = @"File/Photo/" + SingerID + PhotoExtender;
                Singer.Sex = ddlSingerSex.SelectedItem.Text;
                Singer.SingerTypeID = Convert.ToInt32(ddlSingerType.SelectedValue);

                if (singer.AddSinger(Singer))
                {
                    //将图片上传至服务器
                    FUpSingerPhoto.SaveAs(PhotoPath + SingerID + PhotoExtender);

                    //给lbMessage控件设置字体颜色为绿色
                    lbMessage.ForeColor = System.Drawing.Color.Lime;
                    lbMessage.Text = "歌手添加成功！";

                }
                else
                {
                    //给lbMessage控件设置字体颜色为红色
                    lbMessage.ForeColor = System.Drawing.Color.Red;
                    lbMessage.Text = "该歌手已存在！";
                }
            }


        }
        else
        {
            lbMessage.ForeColor = System.Drawing.Color.Red;
            lbMessage.Text = "上传歌手图片不能为空！";
        }
    }


    protected DataSet ddl_AlterSingerType()
    {
        return singerType.Select();
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            Control control = (Control)e.CommandSource;
            GridViewRow dvr = (GridViewRow)control.NamingContainer;
            Label lb = (Label)dvr.FindControl("Label2");
            Label lbPath = (Label)dvr.FindControl("Label3");

            SingerID =Convert.ToInt32(lb.Text);
            PhotoPath ="~/"+lbPath.Text;
        }
    }


    protected void DetailsView_SingerInfo_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        //当Detailsview中数据更新时，gridview中实时更新
        GridBind();
    }


    protected void FileUpload1_DataBinding(object sender, EventArgs e)
    {
        FileUpload fup = (FileUpload)sender;
        DetailsView dv = (DetailsView)fup.NamingContainer;

        TextBox txtSingerPhtotPath = (TextBox)dv.FindControl("txtSingerPhotoPath");

        //实现textbox与Fileupload联动
        fup.Attributes.Add("onchange", "document.getElementById('" + txtSingerPhtotPath.ClientID + "').value=this.value");
    }

    /// <summary>
    /// 更新按钮单击事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        DetailsView dv = (DetailsView)lbtn.NamingContainer;

        //获取detailsview中的上传控件，显示路径的textbox，显示歌手姓名的textbox控件
        FileUpload fup = (FileUpload)dv.FindControl("FileUpload1");
        TextBox txt = (TextBox)dv.FindControl("txtSingerPhotoPath");
        TextBox txtSingerName=(TextBox)dv.FindControl("TextBox1");
        Label lbSingerID = (Label)dv.FindControl("Label6");

        string PhotoPath = Server.MapPath("~/File/Photo/");

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
                if (File.Exists(PhotoPath + lbSingerID.Text + PhotoExtender))
                {
                    //存在则删除
                    File.Delete(PhotoPath + lbSingerID.Text + PhotoExtender);
                }
                //更改显示路径的textbox
                txt.Text = @"File/Photo/" + lbSingerID.Text + PhotoExtender;
                //将文件上传至服务器指定路径
                fup.PostedFile.SaveAs(PhotoPath + lbSingerID.Text + PhotoExtender);

                GridBind();
                
            }

            else
            {
                //给出错误提示
                Page.RegisterStartupScript("", "<script>alert('上传图片格式不正确！')</script>");
                //阻止更新
                DetailsView_SingerInfo.DataBind();
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Singer.SingerID = SingerID;
        DataSet ds = singer.SelectMusic(Singer);
        DataSet ds1 = singer.SelectAlbum(Singer);

        //删除服务器端所有改歌手演唱的歌曲文件及歌词文件
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string Musicpath = null;
            string Lyricpath = null;
            //获取歌曲及歌词文件的路径
            Musicpath = Server.MapPath("~/" + ds.Tables[0].Rows[i]["MusicPath"].ToString());
            Lyricpath = Server.MapPath("~/" + ds.Tables[0].Rows[i]["LyricPath"].ToString());
            //删除歌曲及歌词文件 
            if (File.Exists(Musicpath))
            {
                File.Delete(Musicpath);
            }

            if (File.Exists(Lyricpath))
            {
                File.Delete(Lyricpath);
            }

            BindData();
            GridBind();
        }

        //删除该歌手的所有专辑图片
        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            string Albumpath = null;
            //获取专辑封面图片的路径
            Albumpath = Server.MapPath("~/" + ds1.Tables[0].Rows[i]["AlbumPhotoPath"].ToString());
            //删除专辑封面文件 
            if (File.Exists(Albumpath))
            {
                File.Delete(Albumpath);
            }
        }

        string Path = Server.MapPath(PhotoPath);
        

        singer.DeleteSinger(Singer);

        //在服务器中查找该文件是否存在
        if (File.Exists(Path))
        {
            //删除该文件
            File.Delete(Path);
        }

        GridBind();
    }


    protected void DetailsView_SingerInfo_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            DetailsView dv = (DetailsView)sender;

            //获取存储歌手头像路径的Label控件
            Label lb = (Label)dv.FindControl("Label3");

            //将路径赋值给静态变量PhotoPath
            PhotoPath ="~/"+lb.Text;
        }
    }
    protected void btnSearchSinger_Click(object sender, EventArgs e)
    {
        if (txtSingerName1.Text.Trim() != "")
        {         

            Search = true;
        }
        else 
        {
            Search = false;
        }
        GridBind();
    }

    public void GridBind()
    {
        if (Search)
        {
            GridView1.DataSource = ObjectDataSource_SearchSinger;
        }
        else
        {
            GridView1.DataSource = ObjectDataSource_AlterSinger;
        }
        GridView1.DataBind();
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