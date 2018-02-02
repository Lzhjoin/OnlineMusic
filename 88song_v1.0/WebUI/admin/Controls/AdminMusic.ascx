<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminMusic.ascx.cs" Inherits="admin_Controls_AdminMusic" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 282px;
    }
</style>

<asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="350px" Width="1032px">
    <asp:TabPanel runat="server" HeaderText="添加音乐" ID="TabPanel_AddMusic">

    <ContentTemplate>
    <table class="style1">
        <tr>
            <td>
                歌曲名称：&nbsp;
            </td>
            <td class="style2">
                <asp:TextBox ID="txtMusicName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                歌手名称：&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="ddlSingerName" runat="server" 
                    ondatabound="ddlSingerName_DataBound" AutoPostBack="True" 
                    onselectedindexchanged="ddlSingerName_SelectedIndexChanged"></asp:DropDownList>
                <asp:ListSearchExtender ID="ddlSingerName_ListSearchExtender" runat="server" Enabled="True" 
                TargetControlID="ddlSingerName" PromptText="请输入歌手名过滤" 
                    PromptCssClass="listsearch" IsSorted="True"></asp:ListSearchExtender>
            </td>
        </tr>
        <tr>
            <td>
                歌曲专辑：&nbsp;
            </td>
            <td class="style2">
                <asp:DropDownList ID="ddlAlbum" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                歌曲文件：&nbsp;
            </td>
            <td class="style2">
                <asp:FileUpload ID="FUpMusic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                歌词文件：&nbsp;
            </td>
            <td class="style2">
                <asp:FileUpload ID="FUpLyric" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                歌曲曲风：&nbsp;
            </td>
            <td class="style2">
                <asp:DropDownList ID="ddlMusicStyle" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                歌曲发布时间：&nbsp;
            </td>
            <td class="style2">
                <asp:TextBox ID="txtPublicDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtPublicDate_CalendarExtender" runat="server" 
                    Enabled="True" Format="yyyy-MM-dd" TargetControlID="txtPublicDate">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnAddMusic" runat="server" Text="上传" 
                    onclick="btnAddMusic_Click" /><asp:Button ID="btnReset" runat="server" Text="重置" />
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel_alterMusic" runat="server" HeaderText="修改音乐">
        <ContentTemplate>
            歌曲名称搜索：<asp:TextBox runat="server" ID="txtMusicSearch" />
            <asp:AutoCompleteExtender ID="txtMusicSearch_AutoCompleteExtender" 
                runat="server" DelimiterCharacters="" Enabled="True" MinimumPrefixLength="1" 
                ServicePath="~/admin/WebService_AutoComplete.asmx" TargetControlID="txtMusicSearch" ServiceMethod="GetMusicName">
            </asp:AutoCompleteExtender>
            <asp:Button ID="btnMusicSearch" runat="server" onclick="btnMusicSearch_Click" 
                Text="搜索" />
            <asp:GridView ID="GV_MusicInfo" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="ObjectDataSource_MusicInfo" ForeColor="#333333" 
                GridLines="None" Width="1000px" DataKeyNames="MusicID" 
                onrowcommand="GV_MusicInfo_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="歌曲ID">
                        <EditItemTemplate>
                            <asp:Label ID="lbMusicID" runat="server" Text='<%# Bind("MusicID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("MusicID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲名称">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Height="17px" 
                                Text='<%# Bind("MusicName") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("MusicName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="演唱歌手">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_alterSinger" runat="server" 
                                DataSource="<%# ddl_alterSingerBind() %>" 
                                SelectedValue='<%# Bind("SingerID") %>'
                                DataTextField="SingerName" DataValueField="SingerID" 
                                AutoPostBack="True" ondatabound="ddl_alterSinger_DataBound" 
                                onselectedindexchanged="ddl_alterSinger_SelectedIndexChanged" 
                                Enabled="False">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲专辑">
                        <EditItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddl_alterAlbum" runat="server" AutoPostBack="True" 
                                            DataSource="<%# ddl_alterAlbumBind() %>" DataTextField="AlbumName" 
                                            DataValueField="AlbumID" SelectedValue='<%# Bind("AlbumID") %>'>
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("AlbumName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲曲风">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_alterStyle" runat="server"
                            DataSource="<%# ddl_alterStyleBind() %>" 
                            SelectedValue='<%# Bind("MusicStyleID") %>'
                            DataTextField="MusicStyleName" DataValueField="MusicStyleID">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("MusicStyleName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMusicPath" runat="server" Text='<%# Bind("MusicPath") %>'></asp:TextBox>
                            <asp:FileUpload ID="FileUpload2" runat="server" Width="69px" 
                                ondatabinding="FileUpload2_DataBinding" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("MusicPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌词路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLyricPath" runat="server" Text='<%# Bind("LyricPath") %>'></asp:TextBox>
                            <asp:FileUpload ID="FileUpload3" runat="server" 
                                ondatabinding="FileUpload3_DataBinding" Width="69px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("LyricPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲发布时间">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="17px" 
                                Text='<%# Bind("PublishDate") %>' Width="100px"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                Enabled="True" Format="yyyy-MM-dd" TargetControlID="TextBox2">
                            </asp:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbtnUpdate" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新" onclick="lbtnUpdate_Click"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="编辑"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="DelMusic" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#00CCFF" />
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

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="ObjectDataSourceSearchMusic" ForeColor="#333333" 
                GridLines="None" Width="1000px" DataKeyNames="MusicID" 
                Enabled="False" Visible="False" onrowcommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="歌曲ID">
                        <EditItemTemplate>
                            <asp:Label ID="lbMusicID1" runat="server" Text='<%# Bind("MusicID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label44" runat="server" Text='<%# Bind("MusicID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲名称">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="17px" 
                                Text='<%# Bind("MusicName") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label55" runat="server" Text='<%# Bind("MusicName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="演唱歌手">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_alterSinger1" runat="server" 
                                DataSource="<%# ddl_alterSingerBind() %>" 
                                SelectedValue='<%# Bind("SingerID") %>'
                                DataTextField="SingerName" DataValueField="SingerID" 
                                AutoPostBack="True" ondatabound="ddl_alterSinger_DataBound" 
                                onselectedindexchanged="ddl_alterSinger_SelectedIndexChanged" 
                                Enabled="False">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("SingerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲专辑">
                        <EditItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddl_alterAlbum1" runat="server" AutoPostBack="True" 
                                            DataSource="<%# ddl_alterAlbumBind() %>" DataTextField="AlbumName" 
                                            DataValueField="AlbumID" SelectedValue='<%# Bind("AlbumID") %>'>
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label22" runat="server" Text='<%# Bind("AlbumName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲曲风">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_alterStyle1" runat="server"
                            DataSource="<%# ddl_alterStyleBind() %>" 
                            SelectedValue='<%# Bind("MusicStyleID") %>'
                            DataTextField="MusicStyleName" DataValueField="MusicStyleID">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label33" runat="server" Text='<%# Bind("MusicStyleName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMusicPath1" runat="server" Text='<%# Bind("MusicPath") %>'></asp:TextBox>
                            <asp:FileUpload ID="FileUpload22" runat="server" Width="69px" 
                                ondatabinding="FileUpload22_DataBinding" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label77" runat="server" Text='<%# Bind("MusicPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌词路径">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLyricPath1" runat="server" Text='<%# Bind("LyricPath") %>'></asp:TextBox>
                            <asp:FileUpload ID="FileUpload33" runat="server" 
                                ondatabinding="FileUpload33_DataBinding" Width="69px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label88" runat="server" Text='<%# Bind("LyricPath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歌曲发布时间">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox22" runat="server" Height="17px" 
                                Text='<%# Bind("PublishDate") %>' Width="100px"></asp:TextBox>
                            <asp:CalendarExtender ID="TextBox2_CalendarExtender1" runat="server" 
                                Enabled="True" Format="yyyy-MM-dd" TargetControlID="TextBox22">
                            </asp:CalendarExtender>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label66" runat="server" Text='<%# Bind("PublishDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbtnUpdate1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新" onclick="lbtnUpdate1_Click"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton22" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="编辑"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton22" runat="server" CausesValidation="False" 
                                CommandName="Del1" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#00CCFF" />
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
            <asp:ObjectDataSource ID="ObjectDataSource_MusicInfo" runat="server" 
                SelectMethod="MusicInfo" TypeName="BLL.CMusic" 
                DataObjectTypeName="Model.CMusic" UpdateMethod="UpdateMusicInfo">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceSearchMusic" runat="server" 
                DataObjectTypeName="Model.CMusic" SelectMethod="SearchMusic" 
                TypeName="BLL.CMusic" UpdateMethod="UpdateMusicInfo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtMusicSearch" DefaultValue="0" 
                        Name="MusicName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:TabPanel>
</asp:TabContainer>

