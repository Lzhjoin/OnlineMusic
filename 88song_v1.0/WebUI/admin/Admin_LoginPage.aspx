<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_LoginPage.aspx.cs" Inherits="admin_Admin_LoginPage" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/AdminLoginStyle.css" rel="Stylesheet" rev="Stylesheet" type="text/css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div>
        <div align="center">
            <table width="50%" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="3" height="50">
                    </td>
                </tr>
                <tr>
                    <td width="15" align="right">
                        <img alt="" src="images/ileft.gif" /></td>
                    <td height="43" background="images/i_topbg2.gif" align="left">
                        <img alt="" src="images/i_top1.gif" /></td>
                    <td width="15">
                        <img alt="" src="images/iright.gif" /></td>
                </tr>
                <tr>
                    <td background="images/ileftbg.gif">
                        &nbsp;</td>
                    <td height="400" background="images/bg.gif" align="center">
                        <table cellpadding="0" cellspacing="0" width="80%">
                            <tr>
                                <td rowspan="5">
                                    <img alt="" src="images/logo.jpg" /></td>
                                <td colspan="2">
                                    <img alt="" src="images/adminsyteam.gif" /></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    用户名：</td>
                                <td>
                                    <asp:TextBox ID="txtAdminUserName" onmouseover="this.focus()"  runat="server"></asp:TextBox><font color="red">*</font>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" 
                                        ControlToValidate="txtAdminUserName" ErrorMessage="用户名不能为空！" 
                                        ForeColor="Red" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidatorUserName_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" 
                                        TargetControlID="RequiredFieldValidatorUserName"
                                        WarningIconImageUrl="~/admin/images/9.ico">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    密码：</td>
                                <td>
                                    <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"></asp:TextBox><font color="red">*</font>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
                                        ControlToValidate="txtAdminPassword" ErrorMessage="密码不能为空！" 
                                        ForeColor="Red" Display="None">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidatorPassword_ValidatorCalloutExtender" 
                                        runat="server"  Enabled="True" 
                                        TargetControlID="RequiredFieldValidatorPassword" 
                                        WarningIconImageUrl="~/admin/images/9.ico">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageBtnLogin" runat="server" 
                                        ImageUrl="~/admin/images/b_login.gif" onclick="ImageBtnLogin_Click" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageBtnClear" runat="server" 
                                        ImageUrl="~/admin/images/b_clean.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lbErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td background="images/irightbg.gif">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td height="15">
                        <img alt="" src="images/i_bottom_left.gif" /></td>
                    <td background="images/i_bottom_bg.gif">
                        &nbsp;</td>
                    <td>
                        <img alt="" src="images/i_bottom_right.gif" /></td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
