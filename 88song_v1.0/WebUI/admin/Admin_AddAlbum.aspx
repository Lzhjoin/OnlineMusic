<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddAlbum.aspx.cs" Inherits="admin_Admin_AddAlbum" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/AdminAblum.ascx" tagname="AdminAblum" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminAblum ID="AdminAblum1" runat="server" />
</asp:Content>

