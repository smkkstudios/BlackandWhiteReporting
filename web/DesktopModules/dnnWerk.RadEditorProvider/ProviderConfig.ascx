<%@ Control language="vb" Inherits="dnnWerk.Providers.RadEditorProvider.ProviderConfig" AutoEventWireup="false" Explicit="True" Codebehind="ProviderConfig.ascx.vb" %>
<%@ Register TagPrefix="Telerik" Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<style type="text/css">
    .NormalTextBox{width: 200px;}
    .pnlFrm {padding:12px;height:1400px;overflow: auto;}
    .pnlFrm table td {font-size:10px !important;}
    .RadEditorConfig ul, .RadEditorConfig ul li{list-style-type: none !important;}
</style>
<div class="RadEditorConfig">
<Telerik:RadAjaxPanel runat="server" ID="ctlAjax" LoadingPanelID="lpDefault" RestoreOriginalRenderDelegate="false">
    
    <p>
        <asp:Label ID="infoLabel" runat="server" CssClass="Subhead"></asp:Label>
    </p>
    
    <asp:Panel ID="panelInstall" runat="server" Visible="false">
        <p>
            <asp:Label ID="editorState" runat="server" CssClass="Normal"></asp:Label>
        </p>
        <div style="width:200px;float:left;padding-top:5px;">
            <asp:DropDownList ID="editorList" runat="server" />
        </div>
        <div style="width:200px;float:left;padding-top:4px;">
            <asp:Button ID="btnEnable" runat="server" Text="Enable This Editor" />
        </div>
        <div style="clear:both;height:20px;"></div>
             
    </asp:Panel>
    
    <asp:Panel ID="pnlConfig" runat="server" Visible="false">

        <Telerik:RadSplitter ID="radSplitter" runat="server" Width="880" height="1500px">
            
            <Telerik:RadPane runat="server" Id="pane_Left" Width="212px">

                <asp:Panel ID="pnlLeft" runat="server">
                    <Telerik:RadTreeView Runat="server" Id="treeTools" AllowNodeEditing="true" MultipleSelect="false" SingleExpandPath="true"></Telerik:RadTreeView>        
                </asp:Panel>
                
            </Telerik:RadPane>
            
            <Telerik:RadSplitBar ID="RadSplitBar1" Runat="server" />
            
            <Telerik:RadPane Runat="server" Id="Pane_Template">                      
                     
                <asp:Panel ID="pnlRight" runat="server">
                    <table style="width:660px;height:835px;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="height:35px;">
                                <Telerik:RadToolBar Runat="server" id="TemplateTools" skin="Default" width="100%">
                                    <collapseanimation duration="200" type="OutQuint" />
                                    <Items>                           
                                        <Telerik:RadToolBarButton runat="server" Text="Save File" CommandName="Save" Enabled="false">
                                        </Telerik:RadToolBarButton>
                                        <Telerik:RadToolBarButton runat="server" Text="Copy Selected" CommandName="Create" Enabled="false">
                                        </Telerik:RadToolBarButton>
                                        <Telerik:RadToolBarButton runat="server" Text="Delete Selected" CommandName="Delete" Enabled="false">
                                        </Telerik:RadToolBarButton>                                                               
                                        <Telerik:RadToolBarButton runat="server" Text="Cancel" CommandName="Cancel" Enabled="false">
                                        </Telerik:RadToolBarButton>   
                                           
                                    </Items>
                                </Telerik:RadToolBar>                    
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">                                      
                                                                    
                                <asp:Panel ID="pnlEditor" runat="server" CssClass="pnlFrm"> 
                                    
                                    <Telerik:RadTabStrip ID="ctlTabstrip" runat="server" MultiPageID="ctlTabs" 
                                        SelectedIndex="0" CssClass="tabs" Skin="Sunset" style="overflow:hidden;">
                                        <Tabs>
                                            <Telerik:RadTab Text="Editor Configuration" PageViewID="tabBody"></Telerik:RadTab>                                                                    
                                            <Telerik:RadTab Text="Toolbar Configuration" PageViewID="tabSummary"></Telerik:RadTab>                        
                                        </Tabs>
                                    </Telerik:RadTabStrip>   
                                                                     
                                    <Telerik:RadMultiPage ID="ctlTabs" runat="server" SelectedIndex="0" style="background-color:#fff;">                                        
                                        
                                        <Telerik:RadPageView ID="tabBody" runat="server">                                                                                        
                                            <asp:PlaceHolder ID="plhConfig" runat="server"></asp:PlaceHolder>
                                        </Telerik:RadPageView>                                                        
                                        
                                        <Telerik:RadPageView ID="tabSummary" runat="server">                                            
                                            <asp:TextBox ID="txtTools" runat="server" Width="610px" Height="1350" TextMode="MultiLine" Visible="true"></asp:TextBox>                                                 
                                        </Telerik:RadPageView>
                                        
                                    </Telerik:RadMultiPage>                                                                       
                                
                                </asp:Panel>
                                
                                <asp:Panel ID="pnlForm" runat="server">
                                    <table style="width:100%" cellpadding="5">
                                        <tr>
                                            <td colspan="2"><asp:Label ID="lblCopy" runat="server" Text="You may create a new configuration based on the selected configuration. You may bind the configuration to a set of predefined security roles and also to the current portal or a given page in your portal."></asp:Label></td>
                                        </tr>                                
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblMode" runat="server" Text="Bind to Role:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblMode" RepeatDirection="Horizontal" runat="server" AutoPostBack="false" RepeatColumns="2">
                                                    <asp:ListItem Value="" Text="Everyone"></asp:ListItem>
                                                    <asp:ListItem Value="Registered" Text="Registered Users"></asp:ListItem>                                                                                                                                           
                                                    <asp:ListItem Value="Admin" Text="Administrators"></asp:ListItem>
                                                    <asp:ListItem Value="Host" Text="Host Users"></asp:ListItem>                                                                                                                                                            
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr> 
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPortal" runat="server" Text="Bind to current Portal:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkPortal" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr> 
                                        <tr id="rowTabs" runat="server">
                                            <td style="vertical-align:top;">
                                                <asp:Label ID="lblTabs" runat="server" Text="Special Tab:"></asp:Label>
                                            </td>
                                            <td>
                                                <Telerik:RadTreeView Runat="server" Id="treePages" AllowNodeEditing="false" MultipleSelect="false" SingleExpandPath="false"></Telerik:RadTreeView>
                                            </td>
                                        </tr>                                   
                                        <tr>
                                            <td colspan="2">
                                                <asp:LinkButton ID="cmdCreate" runat="server" CssClass="cmdCreate">Create</asp:LinkButton>
                                            </td>
                                        </tr>            
                                    </table>        
                                </asp:Panel> 
                                                    
                            </td>
                        </tr>                
                    </table>                 
                </asp:Panel> 
                      
            </Telerik:RadPane>
        </Telerik:RadSplitter>      
                 
    </asp:Panel>
    
</Telerik:RadAjaxPanel>

</div>

<Telerik:RadAjaxLoadingPanel ID="lpDefault" runat="server" style="border: 1px solid #999;" Transparency="0">
    <br /><br /><br /><br /><br /><br />
    <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>'
        style="border: 0px;" />
</Telerik:RadAjaxLoadingPanel>

<Telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" />
