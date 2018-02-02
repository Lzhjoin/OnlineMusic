<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_AddManger.aspx.cs" Inherits="admin_Admin_AddManger" %>
<%@ OutputCache CacheProfile="Cache60Seconds" %>
<%@ Register src="Controls/SuperAlterPassword.ascx" tagname="SuperAlterPassword" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SuperAlterPassword ID="SuperAlterPassword1" runat="server" />
</asp:Content>

