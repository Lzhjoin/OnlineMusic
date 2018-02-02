<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddMusicPage.aspx.cs" Inherits="admin_Admin_AddMusic" %>

<%@ Register src="Controls/AdminMusic.ascx" tagname="AdminMusic" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminMusic ID="AdminMusic1" runat="server" />
</asp:Content>

