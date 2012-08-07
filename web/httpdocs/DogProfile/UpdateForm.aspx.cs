using System;
using System.Net;
using System.Xml;
using System.IO;
using System.Web;
using System.Linq;


public partial class DogProfile_UpdateForm : System.Web.UI.Page {
    private static string API_KEY = "f32a953cfc4dafec018dfcb322eca152";
    private static string API_PASSWORD = "32393e842adad17ab23e105ffdd3f9a0";
    private static string userID = "";

    protected void Page_Load(object sender, EventArgs e) {
        userID = Request.QueryString["u"];

        if (!IsPostBack) {
            //get querystring values 
            string dogs_name = Request.QueryString["dogs_name"];
            string dogs_breed = Request.QueryString["dogs_breed"];
            string dogs_weight = Request.QueryString["dogs_weight"];
            string dogs_city = Request.QueryString["dogs_city"];

            //populate form fields
            txtDogsName.Text = dogs_name;
            txtDogsBreed.Text = dogs_breed;
            txtDogsWeight.Text = dogs_weight;
            txtDogsCity.Text = dogs_city;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e) {
        //get all user information user (to put together new XML w/ metafields)
        string URLString = "https://f32a953cfc4dafec018dfcb322eca152:32393e842adad17ab23e105ffdd3f9a0@waggo.myshopify.com/admin/customers/" + userID + "/metafields.xml";
        XmlDocument xml = RetrieveXml(URLString);

        //determine if metafields already exist
        bool hasMetaFields = false;

        if (xml.LastChild.ChildNodes.Count > 0) {
            hasMetaFields = true;
        }

        //either create or update fields
        if (hasMetaFields) {
            UpdateExistingDogProfile(xml);
        } else {
            CreateDogProfile();
        }
    }

    protected void UpdateExistingDogProfile(XmlDocument xml) {
        foreach (XmlNode key in xml.DocumentElement.GetElementsByTagName("key")) { //loop through all <key></key> elements in document
            string newValue = "";
            string id = key.PreviousSibling.PreviousSibling.InnerText;

            switch (key.InnerText) { //set key's value based on key name
                case "dogs_name":
                    newValue = txtDogsName.Text;

                    break;
                case "dogs_breed":
                    newValue = txtDogsBreed.Text;

                    break;
                case "dogs_weight":
                    newValue = txtDogsWeight.Text;

                    break;
                case "dogs_city":
                    newValue = txtDogsCity.Text;

                    break;
            }

            //build new xml to post for metafield update
            string strMetaFieldXml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + Environment.NewLine +
                                     "<metafield>" + Environment.NewLine +
                                     "     <id type=\"integer\">" + id + "</id>" + Environment.NewLine +
                                     "     <value>" + newValue + "</value>" + Environment.NewLine +
                                     "     <value-type>string</value-type>" + Environment.NewLine +
                                     "</metafield>";

            XmlDocument metaFieldXml = new XmlDocument();
            metaFieldXml.LoadXml(strMetaFieldXml);

            //URL to send XML to
            string metaFieldUpdateURL = "https://f32a953cfc4dafec018dfcb322eca152:32393e842adad17ab23e105ffdd3f9a0@waggo.myshopify.com/admin/customers/" + userID + "/metafields/" + id + ".xml";

            bool success = PostXMLTransaction(metaFieldUpdateURL, metaFieldXml);
        }
    }

    protected void CreateDogProfile() {
        string customerDataURL = "https://f32a953cfc4dafec018dfcb322eca152:32393e842adad17ab23e105ffdd3f9a0@waggo.myshopify.com/admin/customers/" + userID + ".xml";
        XmlDocument customerXml = RetrieveXml(customerDataURL);

        XmlDocumentFragment fragMetafields = customerXml.CreateDocumentFragment();
        fragMetafields.InnerXml = "<metafields type=\"array\">" + Environment.NewLine +
                                  "     <metafield>" + Environment.NewLine +
                                  "         <key>dogs_name</key>" + Environment.NewLine +
                                  "         <value>" + txtDogsName.Text + "</value>" + Environment.NewLine +
                                  "         <value-type>string</value-type>" + Environment.NewLine +
                                  "         <namespace>dog_profile</namespace>" + Environment.NewLine +
                                  "     </metafield>" + Environment.NewLine +
                                  "     <metafield>" + Environment.NewLine +
                                  "         <key>dogs_breed</key>" + Environment.NewLine +
                                  "         <value>" + txtDogsBreed.Text + "</value>" + Environment.NewLine +
                                  "         <value-type>string</value-type>" + Environment.NewLine +
                                  "         <namespace>dog_profile</namespace>" + Environment.NewLine +
                                  "     </metafield>" + Environment.NewLine +
                                  "     <metafield>" + Environment.NewLine +
                                  "         <key>dogs_weight</key>" + Environment.NewLine +
                                  "         <value>" + txtDogsWeight.Text + "</value>" + Environment.NewLine +
                                  "         <value-type>string</value-type>" + Environment.NewLine +
                                  "         <namespace>dog_profile</namespace>" + Environment.NewLine +
                                  "     </metafield>" + Environment.NewLine +
                                  "     <metafield>" + Environment.NewLine +
                                  "         <key>dogs_city</key>" + Environment.NewLine +
                                  "         <value>" + txtDogsCity.Text + "</value>" + Environment.NewLine +
                                  "         <value-type>string</value-type>" + Environment.NewLine +
                                  "         <namespace>dog_profile</namespace>" + Environment.NewLine +
                                  "     </metafield>" + Environment.NewLine +
                                  "</metafields>" + Environment.NewLine;

        customerXml.LastChild.AppendChild(fragMetafields);

        bool success = PostXMLTransaction(customerDataURL, customerXml);
    }

    private XmlDocument RetrieveXml(string URLString) {
        WebClient webClient = new WebClient();
        webClient.Credentials = new System.Net.NetworkCredential(API_KEY, API_PASSWORD);
        XmlDocument xml = new XmlDocument();

        using (XmlTextReader xmlTextReader = new XmlTextReader(webClient.OpenRead(URLString))) {
            while (xmlTextReader.Read()) {
                xml.Load(xmlTextReader);
                xmlTextReader.Close();
            }
        }

        return xml;
    }

    public bool PostXMLTransaction(string v_strURL, XmlDocument v_objXMLDoc) {
        //Declare XMLResponse document
        //XmlDocument XMLResponse = null;
        bool success = false;

        //Declare an HTTP-specific implementation of the WebRequest class.
        HttpWebRequest objHttpWebRequest;

        //Declare an HTTP-specific implementation of the WebResponse class
        HttpWebResponse objHttpWebResponse = null;

        //Declare a generic view of a sequence of bytes
        Stream objRequestStream = null;
        //Stream objResponseStream = null;

        //Declare XMLReader
        //XmlTextReader objXMLReader;

        //Creates an HttpWebRequest for the specified URL.
        objHttpWebRequest = (HttpWebRequest)WebRequest.Create(v_strURL);

        try {
            //---------- Start HttpRequest

            //Set HttpWebRequest properties
            byte[] bytes;
            bytes = System.Text.Encoding.ASCII.GetBytes(v_objXMLDoc.InnerXml);
            objHttpWebRequest.Method = "PUT";
            objHttpWebRequest.ContentLength = bytes.Length;
            objHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
            objHttpWebRequest.Credentials = new System.Net.NetworkCredential(API_KEY, API_PASSWORD);

            //Get Stream object
            objRequestStream = objHttpWebRequest.GetRequestStream();

            //Writes a sequence of bytes to the current stream
            objRequestStream.Write(bytes, 0, bytes.Length);

            //Close stream
            objRequestStream.Close();

            //---------- End HttpRequest

            //Sends the HttpWebRequest, and waits for a response.
            objHttpWebResponse = (HttpWebResponse)objHttpWebRequest.GetResponse();

            //---------- Start HttpResponse
            if (objHttpWebResponse.StatusCode == HttpStatusCode.OK) {
                //Get response stream
                //objResponseStream = objHttpWebResponse.GetResponseStream();

                //Load response stream into XMLReader
                //objXMLReader = new XmlTextReader(objResponseStream);

                //Declare XMLDocument
                //XmlDocument xmldoc = new XmlDocument();
                //xmldoc.Load(objXMLReader);

                //Set XMLResponse object returned from XMLReader
                //XMLResponse = xmldoc;

                //Close XMLReader
                //objXMLReader.Close();

                success = true;
            }

            //Close HttpWebResponse
            objHttpWebResponse.Close();
        } catch (WebException we) {
            //TODO: Add custom exception handling
            //throw new Exception(we.Message);
        } catch (Exception ex) {
            //throw new Exception(ex.Message);
        } finally {
            //Close connections
            objRequestStream.Close();
            //objResponseStream.Close();
            //objHttpWebResponse.Close();

            //Release objects
            //objXMLReader = null;
            objRequestStream = null;
            //objResponseStream = null;
            objHttpWebResponse = null;
            objHttpWebRequest = null;
        }

        //Return
        //return XMLResponse;
        return success;
    }
}