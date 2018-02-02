<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddMusicStyle.aspx.cs" Inherits="admin_Admin_AddMusicStyle" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/AdminStyle.ascx" tagname="AdminStyle" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminStyle ID="AdminStyle1" runat="server" />
</asp:Content>

