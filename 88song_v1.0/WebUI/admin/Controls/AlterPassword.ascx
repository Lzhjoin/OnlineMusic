<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AlterPassword.ascx.cs"
    Inherits="admin_Controls_AlterPassword" %>
<p>
    请输入您的原始密码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="密码不能为空！" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    &nbsp;&nbsp; 请输入您的新密码：<asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
        ErrorMessage="新密码不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    &nbsp;&nbsp; 请再次输入新密码：<asp:TextBox ID="txtNewPassword1" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPassword1"
        ErrorMessage="新密码不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
        ControlToValidate="txtNewPassword1" ErrorMessage="两次密码输入不一致！" ForeColor="Red"></asp:CompareValidator>
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAlterPassword" runat="server" OnClick="btnAlterPassword_Click"
        Text="修改" />
    <asp:Label ID="lbMessage" runat="server" ForeColor="Red"></asp:Label>
</p>
