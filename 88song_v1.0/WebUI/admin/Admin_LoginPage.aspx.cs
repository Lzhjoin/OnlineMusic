using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Data;
using System.Web.Security;

public partial class admin_Admin_LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //将用户输入的数据保存到Model中
        Model.CManeger Manger = new CManeger();

        Manger.MangerName = txtAdminUserName.Text.Trim();
        Manger.MangerPassword = txtAdminPassword.Text.Trim();
        Manger.MangerLoginDate = DateTime.Now.ToString();

        BLL.CManger manger = new BLL.CManger();

        //调用BLL.CManger中的Login方法
        DataSet ds= manger.Login(Manger);

        //判断是否有符合条件的用户
        if (ds.Tables[0].Rows.Count >0)
        {
            
            //登录成功，将管理员名称和是否是超级管理员存储到Session中
            Session["MangerUserName"] = ds.Tables[0].Rows[0][1].ToString();
            Session["IsSuper"] = ds.Tables[0].Rows[0][4].ToString();

            //以消息框的形式显示用户上次登录的时间
            Response.Write("<script>alert('您上次登录的时间为：");
            Response.Write(ds.Tables[0].Rows[0][3].ToString());
            Response.Write("');</script>");
            
            FormsAuthentication.RedirectFromLoginPage(txtAdminUserName.Text, false);

            Response.Redirect("Admin_HomePage.aspx");
           
        }
        else
        {
            lbErrorMessage.Text="用户名或密码错误，请重新输入！";
        }
    }
}