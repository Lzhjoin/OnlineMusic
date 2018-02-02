<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SingerType.ascx.cs" Inherits="admin_Controls_SingerType" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" 
    UpdateMode="Conditional">
    <ContentTemplate>
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
            Width="1000px" Height="350px">
            <asp:TabPanel ID="TabPanel_AddSingerType" runat="server" HeaderText="添加歌手类型名" 
                Height="100%">
                <ContentTemplate>
                    <div style="height: 207px; width: 389px">
                        歌手类型名：<asp:TextBox ID="txtSingerType" runat="server"></asp:TextBox>
                        <asp:Button ID="btnAddSingerType" runat="server" 
                            onclick="btnAddSingerType_Click" Text="添加" />
                        <asp:Label ID="lbMessage" runat="server" ForeColor="Lime"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel_AlterSingerType" runat="server" HeaderText="歌手类型名修改">
                <ContentTemplate>
                    <asp:GridView ID="grdAlterSingerType" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SingerTypeID" 
                        DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" 
                        onrowcommand="grdAlterSingerType_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="更新"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkBtnEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Visible='<%#Eval("IsDelete").ToString()=="false" %>' Text="编辑">
                                        </asp:LinkButton>
                                    &nbsp;&nbsp;<asp:LinkButton ID="LinkBtnDelete" runat="server"  
                                        OnClientClick="LinkBtnDelete_onclick()" Visible='<%#Eval("IsDelete").ToString()=="false" %>' CommandName="Del">删除</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="歌手类型ID" InsertVisible="False" 
                                SortExpression="SingerTypeID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SingerTypeID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbSingerTypeID" runat="server" Text='<%# Bind("SingerTypeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SingerTypeName" HeaderText="歌手类型名" 
                                SortExpression="SingerTypeName" />
                        </Columns>
                        <EditRowStyle BackColor="#00CCFF" />
                        <EmptyDataTemplate>
                            什么类型也没有，快
                        </EmptyDataTemplate>
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
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                        ContextTypeName="DataClassesDataContext" EnableDelete="True" 
                        EnableInsert="True" EnableUpdate="True" EntityTypeName="" 
                        TableName="SingerType">
                    </asp:LinqDataSource>
                    <asp:Panel CssClass="Panel1" ID="Panel1" runat="server" BackColor="#507CD1">
                            警告
                         <div id="MessageDiv">
                        您确定要删除该歌手类型名吗?那样会将该类型的歌手类型名变为其它类型。<br /> 
                        <asp:Button ID="btnOK" runat="server" Text="确定" CommandName="Delete" 
                            onclick="btnOK_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="取消" />
                        <br />
                        </div>
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
                        Enabled="True" TargetControlID="Panel1" Radius="6" BorderColor="Black">
                    </asp:RoundedCornersExtender>
                    <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                        DynamicServicePath="" Enabled="True" TargetControlID="Label2" BackgroundCssClass="bg"
                         BehaviorID="Panel1" PopupControlID="Panel1">
                    </asp:ModalPopupExtender>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </ContentTemplate>

    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AddSingerType$btnAddSingerType" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSingerType$grdAlterSingerType" 
            EventName="RowEditing" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSingerType$grdAlterSingerType" 
            EventName="RowUpdating" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSingerType$btnOK" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSingerType$btnCancel" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="TabContainer1$TabPanel_AlterSingerType$grdAlterSingerType" 
            EventName="RowCancelingEdit" />
    </Triggers>

</asp:UpdatePanel>



