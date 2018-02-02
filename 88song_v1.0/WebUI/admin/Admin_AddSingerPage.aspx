<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddSingerPage.aspx.cs" Inherits="admin_Admin_AddSinger" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/AdminSinger.ascx" tagname="AdminSinger" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminSinger ID="AdminSinger1" runat="server" />
</asp:Content>

