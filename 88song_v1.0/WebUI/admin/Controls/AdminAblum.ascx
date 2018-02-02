<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminAblum.ascx.cs" Inherits="admin_Controls_AdminAblum" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" 
    UpdateMode="Conditional">
<ContentTemplate>
<asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="350px" Width="1000px" 
        onactivetabchanged="TabContainer1_ActiveTabChanged" AutoPostBack="True">
    <asp:TabPanel runat="server" HeaderText="添加专辑" ID="TabPanel_AddAlbum">
        
    <ContentTemplate>专辑名称：&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAlbumName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtAlbumName" ErrorMessage="专辑名称不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
        <br /><br />
        <br />
        歌手名称：&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlSingerName" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        专辑封面：&nbsp;&nbsp;&nbsp; <asp:FileUpload ID="FileUpload_AlbumPhoto" runat="server" />
        <br />
        <br />
        <br />
        专辑发布时间：&nbsp;
        <asp:TextBox ID="txtPublicDate" runat="server"></asp:TextBox>
        <asp:CalendarExtender ID="txtPublicDate_CalendarExtender" runat="server" 
            Enabled="True" Format="yyyy-MM-dd" TargetControlID="txtPublicDate">
        </asp:CalendarExtender>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnAddAlbum" runat="server" onclick="btnAddAlbum_Click" 
            Text="添加" />
        &nbsp;
        <asp:Button ID="btnReset" runat="server" Text="重置" />
        <asp:Label ID="lbMessage" runat="server"></asp:Label>
        </ContentTemplate></asp:TabPanel>
    <asp:TabPanel ID="TabPanel_AlterAlbum" runat="server" HeaderText="修改专辑">
        
        <ContentTemplate>
        专辑名称：<asp:TextBox ID="txtAlbumName1" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtAlbumName1_AutoCompleteExtender" 
                runat="server" DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1" 
                ServicePath="~/admin/WebService_AutoComplete.asmx" TargetControlID="txtAlbumName1" ServiceMethod="GetAlbumName">
            </asp:AutoCompleteExtender>
            <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" Text="搜索" />
&nbsp;<table class="style1">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AlbumID" ForeColor="#333333" 
                            GridLines="None" onrowcommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="专辑ID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AlbumID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AlbumID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="AlbumName" HeaderText="专辑名称" />
                                <asp:BoundField DataField="SingerName" HeaderText="演唱歌手" />
                                <asp:TemplateField HeaderText="专辑封面路径">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AlbumPhotoPath") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AlbumPhotoPath") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="选择"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Del" OnClientClick="LinkBtnDelete_onclick()" Text="删除"></asp:LinkButton>
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
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                        <asp:Panel ID="Panel1" runat="server" BackColor="#507CD1">
                            警告<div ID="MessageDiv">
                                您确定删除该专辑吗？这样将会删除该专辑下的所有歌曲<br /> 
                                <asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click" OnClientClick="PanelHide()" />
                                <asp:Button ID="btnCancel" runat="server" OnClientClick="PanelHide()" Text="取消" />
                            </div>
                        </asp:Panel>
                        <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
                            BorderColor="Black" Enabled="True" Radius="6" TargetControlID="Panel1">
                        </asp:RoundedCornersExtender>
                        <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="Label5" BehaviorID="Panel1" PopupControlID="Panel1" BackgroundCssClass="bg">
                        </asp:ModalPopupExtender>
                        <asp:ObjectDataSource ID="ObjectDataSource_SelectAlbum" runat="server" 
                            SelectMethod="SelectAlbum" TypeName="BLL.CAlbum"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ObjectDataSource_SearchAlbum" runat="server" 
                            SelectMethod="SearchAlbum" TypeName="BLL.CAlbum">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtAlbumName1" DefaultValue="0" 
                                    Name="AlbumName" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="326px" 
                            AutoGenerateRows="False" CellPadding="4" 
                            DataSourceID="ObjectDataSource_DetailAlbum" ForeColor="#333333" 
                            GridLines="None" onitemupdated="DetailsView1_ItemUpdated">
                            <AlternatingRowStyle BackColor="White" />
                            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                            <EditRowStyle BackColor="#00CCFF" />
                            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                            <Fields>
                                <asp:TemplateField HeaderText="专辑ID">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AlbumID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AlbumID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AlbumID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="专辑名称">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AlbumName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("AlbumName") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AlbumName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="演唱歌手">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSource="<%# ddl_AlterSingerName() %>" DataTextField="SingerName" 
                                            DataValueField="SingerID" SelectedValue='<%# Bind("SingerID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SingerName") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="专辑封面路径">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAlbumPhotoPath" runat="server" 
                                            Text='<%# Bind("AlbumPhotoPath") %>'></asp:TextBox>
                                        <asp:FileUpload ID="FileUpload1" runat="server" 
                                            ondatabinding="FileUpload1_DataBinding" Width="69px" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AlbumPhotoPath") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("AlbumPhotoPath") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="专辑发布时间">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PublishDate") %>'></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                Enabled="True" Format="yyyy-MM-dd" TargetControlID="TextBox2"></asp:CalendarExtender>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PublishDate") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                            CommandName="Update" onclick="LinkButton1_Click" Text="更新"></asp:LinkButton>
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
                        <asp:ObjectDataSource ID="ObjectDataSource_DetailAlbum" runat="server" 
                            DataObjectTypeName="Model.CAlbum" SelectMethod="SelectAlbum" 
                            TypeName="BLL.CAlbum" UpdateMethod="UpdateAlbum">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="AlbumID" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        
    </asp:TabPanel>
</asp:TabContainer>
</ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Tabcontainer1$TabPanel_AlterAlbum$btnOK" EventName="Click" />
        <asp:PostBackTrigger ControlID="TabContainer1$TabPanel_AddAlbum$btnAddAlbum"  />
        <asp:PostBackTrigger ControlID="TabContainer1"  />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AddAlbum$btnReset" EventName="Click" />
        <asp:PostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$DetailsView1"/>
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$GridView1" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$GridView1" EventName="SelectedIndexChanging" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$GridView1" EventName="PageIndexChanging" />
        <%--<asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$GridView1" EventName="PageIndexChanging" />--%>
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$btnCancel" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterAlbum$btnSearch" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>

