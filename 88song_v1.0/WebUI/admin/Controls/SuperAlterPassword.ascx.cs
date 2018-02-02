using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Controls_SuperAlterPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddManger_Click(object sender, EventArgs e)
    {
        Model.CManeger Manger = new Model.CManeger();
        BLL.CManger manger = new BLL.CManger();

        if (Page.IsValid)
        {
            Manger.MangerName = txtMangerName.Text;
            Manger.MangerPassword = txtPassword1.Text;

            if (manger.AddManger(Manger))
            {
                lbMessage.ForeColor = System.Drawing.Color.Lime;
                lbMessage.Text = "添加成功！";
                GridView1.DataBind();
            }
            else
            {
                lbMessage.ForeColor = System.Drawing.Color.Red;
                lbMessage.Text = "该用户名已存在，请更换！";
            }

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        RequiredFieldValidator1.Enabled = !RequiredFieldValidator1.Enabled;
        RequiredFieldValidator3.Enabled = !RequiredFieldValidator3.Enabled;
        RequiredFieldValidator4.Enabled = !RequiredFieldValidator4.Enabled;
        CompareValidator1.Enabled = !CompareValidator1.Enabled;
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
}