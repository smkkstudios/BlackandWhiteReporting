using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Xml;
using System.IO;
using Waggo;



public partial class WholeSale_wholesaleupdate : System.Web.UI.Page 
{
    protected WaggoWholesaleSync WaggoSync = new WaggoWholesaleSync();
    //private WaggoLogger logger;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["instanceobject"] != null)
        {
            
            WaggoSync = (WaggoWholesaleSync)ViewState["instanceobject"];
        }
        WaggoSync.WaggoEvent += this.WaggoEventHandler;
      //  logger = new WaggoLogger();
        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        // Save ViewState
        ViewState.Add("instanceobject", WaggoSync);
    }
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        try
        {
            btnrun.Visible = false;
           // logger.Log("Sync Started - " + DateTime.Now.ToString());
            success.Visible = true;
            success.InnerHtml += "Pre-Sync Has Started";
            WaggoSync.waggoproductupdates(false,false);

            if (success.InnerHtml !="\r\n    \r\n    Pre-Sync Has Started<br/>Pre-Sync has completed")
            {
                btncommit.Visible = true;
            }
            else {
                success.InnerHtml += "<br/>All Product Variants are Synced";
            }
            
           
          //  logger.Log("Sync Complete - " + DateTime.Now.ToString());
          //  logger.close();
        }
        catch(Exception ex)
        {
            error.InnerHtml = ex.Message;
            error.Visible = true;
          //  logger.Log("Sync Error - " + ex.Message);
          //  logger.close();
        }
        finally { 
        
        }
       
    }
    protected void Button2_Click(object sender, System.EventArgs e) {
        success.InnerHtml += "<br/>#############################################################################################<br/> Sync Commit Has Started";
        btncommit.Visible = false;
        WaggoSync.waggoproductupdates(true,false);
        
    }
    protected void WaggoEventHandler(WaggoEventArgs e)
    {
        success.InnerHtml += "<br/>" + e.message;
      // logger.Log(e.message);   
        Console.WriteLine(e.message);
    }

    public class WaggoLogger
    {
        const string sPathName = "waggo-sync-log.txt";

        private StreamWriter sw = new StreamWriter(HttpRuntime.AppDomainAppPath + sPathName);

        public void close() { sw.Close(); }
        public void Log(string message)
        {
            sw.WriteLine(message);
            sw.Flush();
        }
    }
}