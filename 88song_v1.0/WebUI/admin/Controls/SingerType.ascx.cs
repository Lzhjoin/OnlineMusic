using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

public partial class admin_Controls_SingerType : System.Web.UI.UserControl
{
    Model.CSingerType SingerType = new Model.CSingerType();
    BLL.CSingerType singerType = new BLL.CSingerType();
    static string TypeID;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //添加歌手类型名
    protected void btnAddSingerType_Click(object sender, EventArgs e)
    {
        if (txtSingerType.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('歌手类型名不能为空！')", true);
        }
        else
        {
            SingerType.SingerTypeName = txtSingerType.Text;

            bool InsertSingerType = singerType.AddSingerType(SingerType);
            if (InsertSingerType)
            {
                lbMessage.Text = "添加成功！";
                grdAlterSingerType.DataBind();
            }
            else
            {
                
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "updateScript", "alert('输入的歌手类型名已存在！')", true);
            }
        }
    }

    //通过静态变量TypeID的值进行类型的删除
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SingerType.SingerTypeID = TypeID;
        singerType.DeleteSingerType(SingerType);
        grdAlterSingerType.DataBind();
    }
    protected void grdAlterSingerType_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //当生成的事件明为Del时，获取类型ID的值赋值给静态变量TypeID
        if (e.CommandName == "Del")
        {
            GridViewRow row = null;
            Control cmdControl = (Control)e.CommandSource;
            row = (GridViewRow)cmdControl.NamingContainer;
            Label lb = (Label)row.FindControl("lbSingerTypeID");
            TypeID = lb.Text;
        }
    }
}