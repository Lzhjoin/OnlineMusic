<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuperAlterPassword.ascx.cs" Inherits="admin_Controls_SuperAlterPassword" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>

<asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="350px" Width="1000px" 
    onactivetabchanged="TabContainer1_ActiveTabChanged">
    <asp:TabPanel runat="server" HeaderText="添加管理员" ID="TabPanel_AddManger">
        <ContentTemplate>
            &nbsp;&nbsp; 请输入用户名：<asp:TextBox ID="txtMangerName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtMangerName" ErrorMessage="用户名不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br /><br />&nbsp;&nbsp; 请输入密码：<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="密码不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br /><br />请再次输入密码：<asp:TextBox ID="txtPassword1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="密码不能为空！" ForeColor="Red" ControlToValidate="txtPassword1"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPassword" ControlToValidate="txtPassword1" 
                ErrorMessage="两次密码输入不一致!" ForeColor="Red"></asp:CompareValidator>
            <br />
            <br />
            <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnAddManger" runat="server" Text="添加" 
                onclick="btnAddManger_Click" />
            <asp:Button ID="btnReset" runat="server" Text="重置" />
        <asp:Label ID="lbMessage" runat="server"></asp:Label></ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel_AlterManger" runat="server" HeaderText="修改管理员">
    <ContentTemplate><table class="style1"><tr><td>
        <asp:GridView ID="GridView1" 
            runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="ObjectDataSource_MangerInfo" ForeColor="#333333" GridLines="None" 
            DataKeyNames="MangerID"><AlternatingRowStyle 
            BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="MangerID" HeaderText="管理员ID" />
                <asp:BoundField DataField="MangerName" HeaderText="管理员用户名" />
                <asp:BoundField DataField="MangerLoginDate" HeaderText="管理员上次登录时间" />
                <asp:BoundField DataField="Remark" HeaderText="备注" />
                <asp:BoundField DataField="RelationWay" HeaderText="联系方式" />
            </Columns>
            <EditRowStyle 
            BackColor="#2461BF" /><FooterStyle BackColor="#507CD1" Font-Bold="True" 
            ForeColor="White" /><HeaderStyle BackColor="#507CD1" Font-Bold="True" 
            ForeColor="White" /><PagerStyle BackColor="#2461BF" ForeColor="White" 
            HorizontalAlign="Center" /><RowStyle BackColor="#EFF3FB" /><SelectedRowStyle 
            BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle 
            BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle 
            BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" /></asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource_MangerInfo" runat="server" 
            DataObjectTypeName="Model.CManeger" DeleteMethod="DeleteManger" 
            SelectMethod="SelectManger" TypeName="BLL.CManger"></asp:ObjectDataSource>
        </td><td>
            <asp:DetailsView 
                ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataSourceID="ObjectDataSource_DetailInfo" ForeColor="#333333" 
                GridLines="None" Height="38px" Width="368px" 
                onitemupdated="DetailsView1_ItemUpdated"><AlternatingRowStyle 
                BackColor="White" /><CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle 
                BackColor="#507CD1" /><FieldHeaderStyle BackColor="#DEE8F5" 
                Font-Bold="True" />
                <Fields>
                    <asp:TemplateField HeaderText="管理员ID">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MangerID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MangerID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MangerID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MangerName" HeaderText="管理员用户名" />
                    <asp:BoundField DataField="MangerPassword" HeaderText="管理员密码" />
                    <asp:BoundField DataField="Remark" HeaderText="备注" />
                    <asp:BoundField DataField="RelationWay" HeaderText="联系方式" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle 
                BackColor="#507CD1" Font-Bold="True" ForeColor="White" /><HeaderStyle 
                BackColor="#507CD1" Font-Bold="True" ForeColor="White" /><PagerStyle 
                BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                BackColor="#EFF3FB" /></asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource_DetailInfo" runat="server" 
                DataObjectTypeName="Model.CManeger" SelectMethod="SelectManger" 
                TypeName="BLL.CManger" UpdateMethod="AlterManger">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="MangerID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td></tr></table></ContentTemplate></asp:TabPanel>
</asp:TabContainer>

