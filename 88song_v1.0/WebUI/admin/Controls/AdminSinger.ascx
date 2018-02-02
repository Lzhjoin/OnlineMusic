<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSinger.ascx.cs" Inherits="admin_Controls_AdminSinger" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 19px;
        text-align: center;
    }
    .style3
    {
        height: 23px;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" 
    UpdateMode="Conditional">
<ContentTemplate>
<asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="400px" Width="1000px" 
        onactivetabchanged="TabContainer1_ActiveTabChanged" AutoPostBack="True"><asp:TabPanel runat="server" HeaderText="添加歌手" ID="TabPanel_AddSinger"><ContentTemplate><table 
        class="style1"><tr><td>歌手姓名：</td><td><asp:TextBox ID="txtSingerName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtSingerName" ErrorMessage="歌手名称不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
            </td></tr><tr>
        <td class="style3">歌手性别：</td><td class="style3">
        <asp:DropDownList 
        ID="ddlSingerSex" runat="server"><asp:ListItem Selected="True" Value="0">男</asp:ListItem><asp:ListItem 
        Value="1">女</asp:ListItem></asp:DropDownList></td></tr><tr><td>歌手头像：</td><td>
            <asp:FileUpload 
            ID="FUpSingerPhoto" runat="server" /></td></tr><tr><td>歌手类型：</td><td>
            <asp:DropDownList 
            ID="ddlSingerType" runat="server"></asp:DropDownList></td></tr><tr><td 
            class="style2" colspan="2">
            <asp:Button ID="btnAddSinger" runat="server" 
            Text="添加" onclick="btnAddSinger_Click" /><asp:Button ID="btnCancel" runat="server" Text="取消" />
            <asp:Label ID="lbMessage" runat="server" ForeColor="Red"></asp:Label>
            </td></tr></table></ContentTemplate></asp:TabPanel>
       <asp:TabPanel ID="TabPanel_AlterSinger" runat="server" HeaderText="修改歌手">
        <ContentTemplate>
        请输入歌手姓名：<asp:TextBox ID="txtSingerName1" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtSingerName1_AutoCompleteExtender" 
                runat="server" DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1" 
                ServicePath="~/admin/WebService_AutoComplete.asmx" TargetControlID="txtSingerName1" ServiceMethod="GetSingerName">
            </asp:AutoCompleteExtender>
            <asp:Button ID="btnSearchSinger" runat="server" Text="搜索" 
                onclick="btnSearchSinger_Click" />
&nbsp;<table>
                <tr>
                    <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                GridLines="None" DataKeyNames="SingerID" 
                onrowcommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging" 
                            PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="歌手ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SingerID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SingerID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌手姓名">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sex" HeaderText="歌手性别" />
                    <asp:BoundField DataField="SingerTypeName" HeaderText="歌手类型" />
                    <asp:BoundField DataField="SingerOnclickNum" HeaderText="歌手点击量" />
                    <asp:TemplateField HeaderText="歌手头像路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" Text="选择"></asp:LinkButton>
                            <asp:LinkButton ID="LinkBtnDelete" runat="server" CausesValidation="False" 
                                CommandName="Del" Text="删除" OnClientClick="LinkBtnDelete_onclick()"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </td>
            <td>
            <asp:DetailsView ID="DetailsView_SingerInfo" runat="server" CellPadding="4" 
                ForeColor="#333333" GridLines="None" Height="50px" Width="481px" 
                AutoGenerateRows="False" DataSourceID="ObjectDataSource_DetailsSingerInfo" 
                onitemupdated="DetailsView_SingerInfo_ItemUpdated" 
                    onitemcommand="DetailsView_SingerInfo_ItemCommand">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#00CCFF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:TemplateField HeaderText="歌手ID">
                        <EditItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("SingerID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SingerID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("SingerID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌手姓名">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SingerName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SingerName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌手性别">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                SelectedValue='<%# Bind("Sex") %>'>
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Sex") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌手类型">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_AlterSingerType" runat="server" 
                                DataSource="<%# ddl_AlterSingerType() %>" DataTextField="SingerTypeName" 
                                DataValueField="SingerTypeID" SelectedValue='<%# Bind("SingerTypeID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SingerTypeName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SingerTypeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SingerOnclickNum" HeaderText="歌手点击量" />
                    <asp:TemplateField HeaderText="歌手头像路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSingerPhotoPath" runat="server" 
                                Text='<%# Bind("PhotoPath") %>'></asp:TextBox>
                            <asp:FileUpload ID="FileUpload1" runat="server" 
                                ondatabinding="FileUpload1_DataBinding" Width="69px" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" 
                                CommandName="Update" onclick="lbtnUpdate_Click" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="编辑"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            </td>
            </tr>
            </table>
            <asp:ObjectDataSource ID="ObjectDataSource_DetailsSingerInfo" runat="server" 
                DataObjectTypeName="Model.CSinger" SelectMethod="SelectSingerInfo" 
                TypeName="BLL.CSinger" UpdateMethod="UpdateSingerInfo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="SingerID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource_SearchSinger" runat="server" 
                SelectMethod="SearchSinger" TypeName="BLL.CSinger">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSingerName1" DefaultValue="0" 
                        Name="SingerName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource_AlterSinger" runat="server" 
                SelectMethod="SelectSingerInfo" TypeName="BLL.CSinger">
            </asp:ObjectDataSource>
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <asp:Panel CssClass="Panel1" ID="Panel1" runat="server" BackColor="#507CD1">
                警告
            <div id="MessageDiv">
            您确定删除该歌手吗？这样将会删除他所有歌曲！<br /> 
            <asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click" OnClientClick="PanelHide()" />&nbsp;&nbsp;
            <asp:Button ID="btnNo" runat="server" OnClientClick="PanelHide()" Text="取消" />
            <br />
            </div>
            </asp:Panel>
            
            
            <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
                Enabled="True" TargetControlID="Panel1" Radius="6" BorderColor="Black">
            </asp:RoundedCornersExtender>
            <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="Label7" BackgroundCssClass="bg" BehaviorID="Panel1" PopupControlID="Panel1">
            </asp:ModalPopupExtender>
            
            
          </ContentTemplate>


    </asp:TabPanel></asp:TabContainer>
    </ContentTemplate>
        <Triggers>
        <asp:PostBackTrigger ControlID="TabContainer1$TabPanel_AddSinger$btnAddSinger" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AddSinger$btnCancel" EventName="Click" />
        <%--<asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$DetailsView_SingerInfo" 
            EventName="ItemCommand" />--%>
        <asp:PostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$DetailsView_SingerInfo" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$GridView1" 
            EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$GridView1" 
            EventName="SelectedIndexChanging" />
            <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$GridView1" 
            EventName="PageIndexChanging" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$btnOK" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$btnNO" EventName="Click" />
        <asp:PostBackTrigger ControlID="TabContainer1" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSinger$btnSearchSinger" EventName="Click" />
    </Triggers>
    </asp:UpdatePanel>

