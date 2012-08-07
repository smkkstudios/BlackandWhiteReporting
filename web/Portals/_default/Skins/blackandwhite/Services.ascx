<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LEFTMENU" Src="~/Admin/Skins/LeftMenu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:STYLES runat="server" ID="StylesIE7" Name="IE7Minus" StyleSheet="ie7skin.css" Condition="LT IE 8" UseSkinPath="true"/>
<script runat="server" language="vbscript">
    Protected _loggedInClass As String = "logoff_hidden"
    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)
        If IsEditMode() Then
            _loggedInClass = "logoff_visible"
        Else
        
        End If
    End Sub
</script> 

<div id="ControlPanelWrapper">
    <dnn:CONTROLPANEL runat="server" ID="cp" IsDockable="True" />
</div>
<div class="contentHolder">
    <!-- Begin Header -->
    <div class="header_wrapper">
    <div id="header" class="header" runat="server">
    <a href="/" id="logo">
        <img class="svgimg" src="/portals/_default/skins/blackandwhite/Images/site_logo.png" />
  </a>
    <div class="siteNav">
      <dnn:MENU ID="MENU1" MenuStyle="DNNMega" runat="server"></dnn:MENU>
   </div>
    </div>
    <</div>
    <!-- End Header -->
    <!-- Begin Page Content -->
    <div class="content">
    <div id="hero_wrapper">
    <div id="hero_title_container"><div class="hero_title" id="hero_title" runat="server"></div></div>
    </div>
     
        <div class="ContentPane">
            <div runat="server" class="cta" id="cta"></div>
            <div runat="server" class="ContentPane_holder" id="ContentPane"></div>
           
              <div class="clear"></div>
        </div>
       
        <div class="clear"></div>
         <div class="push">
    </div>
    </div>
    <!-- End Page Content -->
   
</div>
<div  class="footer_wrapper <%=_loggedInClass%>">
    <div runat="server" id="footer" class="footer">
    </div>
   
</div>
<!-- End Header -->


<dnn:DnnJsInclude ID="DnnJsInclude2" runat="server" FilePath="DNNMega/jquery.dnnmega.js" PathNameAlias="SkinPath" />
<script type="text/javascript" src="//use.typekit.net/qso3chu.js"></script>
<script type="text/javascript">    try { Typekit.load(); } catch (e) { }</script>
<script runat="server">
    'for mega menu we need to register hoverIntent plugin, but avoid duplicate registrations
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Page.ClientScript.RegisterClientScriptInclude("hoverintent", ResolveUrl("~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js"))
        Page.ClientScript.RegisterClientScriptInclude("debug", ResolveUrl("~/js/debug.js"))
        Page.ClientScript.RegisterClientScriptInclude("cycle", ResolveUrl("~/js/jquery.cycle.min.js"))
    
    End Sub
</script>

