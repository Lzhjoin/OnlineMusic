<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddSingerTypePage.aspx.cs" Inherits="admin_AddSingerTypePage" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/SingerType.ascx" tagname="SingerType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SingerType ID="SingerType1" runat="server" />
</asp:Content>

