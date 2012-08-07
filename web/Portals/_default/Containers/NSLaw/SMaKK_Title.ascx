<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<div class="clear"></div>
<div class="c_DNN6">
    <h2 class="Title Grey"><dnn:TITLE runat="server" id="dnnTITLE" /><img src="<%=ContainerPath%>/Images/Title-BG-Grey2.png" class="TitleBar" alt="" /></h2>
    <div id="ContentPane" runat="server"></div>
</div>