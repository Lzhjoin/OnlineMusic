<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminStyle.ascx.cs" Inherits="admin_Controls_AdminStyle" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="350px"
            Width="1000px" OnActiveTabChanged="TabContainer1_ActiveTabChanged">
            <asp:TabPanel runat="server" HeaderText="添加曲风" ID="TabPanel_AddStyle">
                <ContentTemplate>
                    曲风名称：<asp:TextBox ID="txtStyleName" runat="server"></asp:TextBox><asp:Button ID="btnAdd"
                        runat="server" OnClick="btnAdd_Click" Text="添加" /><asp:Label ID="lbMessage" runat="server"></asp:Label><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStyleName"
                            ErrorMessage="曲风名字不能为空!" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator></ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel_AlterStyle" runat="server" HeaderText="修改曲风">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="MusicStyleID" DataSourceID="LinqDataSource_MusicStyle"
                        ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="更新"></asp:LinkButton>&#160;<asp:LinkButton ID="LinkButton2" runat="server"
                                            CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton></EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                        Visible='<%#Eval("IsDelete").ToString()=="true" %>' Text="编辑"></asp:LinkButton>&#160;<asp:LinkButton
                                            ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Del" OnClientClick="LinkBtnDelete_onclick()"
                                            Visible='<%#Eval("IsDelete").ToString()=="true" %>' Text="删除"></asp:LinkButton></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="曲风ID" InsertVisible="False" SortExpression="MusicStyleID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MusicStyleID") %>'></asp:Label></EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MusicStyleID") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="曲风名称" SortExpression="MusicStyleName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MusicStyleName") %>'></asp:TextBox></EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MusicStyleName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#EFF3FB" />
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
                    <asp:LinqDataSource ID="LinqDataSource_MusicStyle" runat="server" ContextTypeName="DataClassesDataContext"
                        EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="MusicStyle">
                    </asp:LinqDataSource>
                    <asp:Label ID="Label1" runat="server"></asp:Label><asp:Panel ID="Panel1" runat="server"
                        BackColor="#507CD1">
                        警告<div id="MessageDiv">
                            删除该曲风后将会使该曲风下的歌曲变为其它，是否继续？<br />
                            <br />
                            <asp:Button ID="btnOK" runat="server" Text="确定" OnClick="btnOK_Click" />&#160;&#160;
                            <asp:Button ID="btnCancel" runat="server" Text="取消" /></div>
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" Enabled="True"
                        Radius="6" TargetControlID="Panel1">
                    </asp:RoundedCornersExtender>
                    <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" DynamicServicePath=""
                        Enabled="True" TargetControlID="Label1" BehaviorID="Panel1" PopupControlID="Panel1"
                        BackgroundCssClass="bg">
                    </asp:ModalPopupExtender>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterStyle$btnOK" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterStyle$btnCancel"
            EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AddStyle$btnAdd" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterStyle$GridView1"
            EventName="RowEditing" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterStyle$GridView1"
            EventName="RowUpdating" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterStyle$GridView1"
            EventName="RowCancelingEdit" />
    </Triggers>
</asp:UpdatePanel>
