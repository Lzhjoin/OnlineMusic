using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin_Controls_AlterPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAlterPassword_Click(object sender, EventArgs e)
    {
        //判断验证是否通过
        if (Page.IsValid)
        {
            Model.CManeger Manger = new Model.CManeger();
            BLL.CManger manger = new BLL.CManger();

            Manger.MangerName = Session["MangerUserName"].ToString();
            Manger.MangerPassword = txtPassword.Text;
            Manger.MangerNewPassword = txtNewPassword1.Text;

            if (manger.AlterPassword(Manger))
            {
                Page.RegisterStartupScript("", "<script>alert('密码修改成功！请重新登录')</script>");

                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                lbMessage.Text = "密码错误，请重新输入！";

                txtPassword.Text = "";
                txtNewPassword.Text = "";
                txtNewPassword1.Text = "";
            }

        }
    }
}