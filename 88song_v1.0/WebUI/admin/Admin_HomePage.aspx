<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="Admin_HomePage.aspx.cs" Inherits="admin_Admin_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <%--设置滚动后台管理说明--%>
        <marquee id="roll" direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" height="100%" width="600px">
            <h1>后台管理说明</h1>
            <h2>1、未经允许不得私自修改密码              </h2>
            <h2>2、修改数据应按章程修改                  </h2>
            <h2>3、上传数据不得损害国家安全              </h2>
            <h2>4、上传数据要符合国家法律                </h2>
            <h2>5、程序异常要及时找技术人员，不得擅自处理</h2>
            <h2>6、保存好密码，不得泄露他人              </h2>
        </marquee>
    </div>
</asp:Content>

