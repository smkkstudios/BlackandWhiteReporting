<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wholesaleupdate.aspx.cs" Inherits="WholeSale_wholesaleupdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Button1").click(function () {
                $(this).hide();
                $(this).siblings("p").html("One moment while the Sync Initializes...");
            });

        });
    </script>
    <style type="text/css">
    #logo{display:block; height:89; width:264px; margin:0 auto;}
    #form1{width:1024px; margin:0 auto;}
    #btnrun,#error,#success,#btncommit{text-align:center;}
   
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <a id="logo" href="wholesaleupdate.aspx">
    <img  alt="Waggo" src="http://cdn.shopify.com/s/files/1/0155/5001/t/2/assets/logo.png?2947"></a>
    <div id="success"  runat="server" visible="false" >
    
    </div>
    <div id="error"  runat="server" visible="false" >
    The Sync could not be completed at this time.
    </div>
    <div id="btnrun" runat="server">
    <p>Click the link below to Pre-Sync All Product Variants</p>
    <asp:Button ID="Button1" runat="server" Text="Pre-Sync" onclick="Button1_Click" /></div>
     <div id="btncommit" runat="server" visible="false">
    <p>Click to Approve the Updated Quantities</p>
    <asp:Button ID="Button2" runat="server" Text="Sync" onclick="Button2_Click" /> -or- <a  href="wholesaleupdate.aspx">Discard</a></div>
    </form>
</body>
</html>
