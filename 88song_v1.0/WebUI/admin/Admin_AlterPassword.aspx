<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AlterPassword.aspx.cs" Inherits="admin_Admin_AlterPassword" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/AlterPassword.ascx" tagname="AlterPassword" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AlterPassword ID="AlterPassword1" runat="server" />
</asp:Content>

