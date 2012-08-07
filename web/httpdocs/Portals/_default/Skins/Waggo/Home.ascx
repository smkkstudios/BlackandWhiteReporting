<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
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
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>

<dnn:STYLES runat="server" ID="StylesIE7" Name="IE7Minus" StyleSheet="ie7skin.css" Condition="LT IE 8" UseSkinPath="true"/>

<div id="ControlPanelWrapper">
    <dnn:CONTROLPANEL runat="server" id="cp"  IsDockable="True" />
</div>



 
  <div class="contentHolder">
  
<!-- Begin Header -->

        <div id="header" class="header">
           
               <iframe src="http://waggo.myshopify.com/pages/header" height="191"width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
      
    </div>
<!-- End Header -->
<!-- Begin Page Content -->
        <div class="content">
        <div class="ContentPane">
       <%--<dnn:BREADCRUMB runat="server" id="breadcrumbs"  class="breadcrumbs" />--%>
       
                           <div runat="server" id="ContentPane">
                           <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
        <a href="/logoff.aspx">Log Out</a>
        </LoggedInTemplate>
        </asp:LoginView>
                           </div>
                           <div class="clear"></div>
                           <a id="infinite_scroll_next_page" href="#">next 10 articles...</a>
                           </div>
                           <div runat="server" id="sidebar" class="sidebar">
                                 
                           </div>
                           <div class="clear"></div>
                 
    </div>
<!-- End Page Content -->
      <div class="push"></div>    
</div>
    <div class="footer_wrapper">
     <%--   <div runat="server" id="footer" class="footer">
        </div>   --%>  
               <iframe src="http://waggo.myshopify.com/pages/footer" height="235"width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                   
    </div>
<!-- End Header -->


 <!-- Start MyFonts -->
     <!--
 * MyFonts Webfont Build ID 2151977, 2012-03-15T17:00:46-0400
 * 
 * The fonts listed in this notice are subject to the End User License
 * Agreement(s) entered into by the website owner. All other parties are 
 * explicitly restricted from using the Licensed Webfonts(s).
 * 
 * You may obtain a valid license at the URLs below.
 * 
 * Webfont: Bodoni Egyptian Pro Bold by ShinnType
 * URL: http://www.myfonts.com/fonts/shinn/bodoni-egyptian-pro/bold/
 * Copyright: Copyright (c) 2010 by Nick Shinn. Published by Shinn Type Foundry. All
 * rights reserved.
 * Licensed pageviews: 10,000
 * 
 * 
 * License: http://www.myfonts.com/viewlicense?type=web&buildid=2151977
 * 
 * © 2012 Bitstream Inc
*/

-->
     <script type="text/javascript">
         //change this to true to enable troubleshooting mode
         var myfont_webfont_test = false;
         // change this to false if you're having trouble with WOFFs
         var woffEnabled = false;
         // to place your webfonts in a custom directory, uncomment this and set it to where your webfonts are.
         //var customPath = "/themes/fonts";
     </script>
     <script src="/webfonts/MyFontsWebfontsOrderM3599689.js" type="text/javascript"></script>

     <!-- End MyFonts -->


<script type="text/javascript" src="http://use.typekit.com/bnz3ner.js"></script>
<script type="text/javascript">    try { Typekit.load(); } catch (e) { }</script>

    


<script runat="server">
  'for mega menu we need to register hoverIntent plugin, but avoid duplicate registrations
  Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Page.ClientScript.RegisterClientScriptInclude("hoverintent", ResolveUrl("~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js"))
       
        Page.ClientScript.RegisterClientScriptInclude("infinatescroll", ResolveUrl("~/js/jquery.infinitescroll.js"))
        Page.ClientScript.RegisterClientScriptInclude("rotate", ResolveUrl("~/js/jQueryRotateCompressed.2.1.js"))
        Page.ClientScript.RegisterClientScriptInclude("debug", ResolveUrl("~/js/debug.js"))
        Page.ClientScript.RegisterClientScriptInclude("blog", ResolveUrl("~/js/blog.js"))
        
        
  End Sub
</script>

        