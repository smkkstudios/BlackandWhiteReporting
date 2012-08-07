<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<div class="clear"></div>
<div class="nslaw_sideNav">

<asp:LoginView ID="LoginView1" runat="server"> 
<AnonymousTemplate>
<div class="login_container">
<h1>Master your claims.</h1>
<p>Resources for Current Clients:</p>

<p><a class="login" href="/employer-advocacy/resources">&nbsp;</a></p>
</div>
</AnonymousTemplate>
<LoggedInTemplate><div class="loged_container">
<div class="login_container">
<h1>Master your claims.</h1>
<p>Resources for Current Clients:</p> <div class="loggedIn">you are logged in as:</div><div class="loginName"><asp:LoginName ID="LoginName1" runat="server"  /></div>
</div></div>
</LoggedInTemplate></asp:LoginView>

    <div id="ContentPane" runat="server"></div>
</div>


