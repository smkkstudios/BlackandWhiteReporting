<%@ Control language="vb" Inherits="Modules.ContactForm.View" CodeFile="View.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<div class="contact-form">
<h3>Schedule a deposition or reserve a reporter:</h3>
<table >
<!-- Row 1-->
<tr>
<td  valign="bottom">    <div class="field-row">

        <span class="label">
            First Name *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" 
                ControlToValidate="txtName" 
                ErrorMessage=" Required" 
                CssClass="validator" 
                Display="Dynamic"
                ValidationGroup="contactForm"
            />
            <span class="required"></span>
          
        </span>
        <asp:textbox runat="server" ID="txtName" CssClass=" txtName field"/>
    </div>
   </td>
   <td  valign="bottom">    <div class="field-row">
        <span class="label">
            Last Name *<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" 
                ControlToValidate="txtLName" 
                ErrorMessage=" Required" 
                CssClass="validator" 
                Display="Dynamic"
                ValidationGroup="contactForm"
            />
            <span class="required"></span>
          
        </span>
        <asp:textbox runat="server" ID="txtLName" CssClass=" txtLName field"/>
    </div>
   </td>
   </tr>
   <!-- End Row 1-->
   <!-- Row 2-->
   <tr>
   <td>
    <div class="field-row">
        <span class="label">
            Company *<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" 
                ControlToValidate="txtCompany" 
                ErrorMessage=" Required" 
                CssClass="validator" 
                Display="Dynamic"
                ValidationGroup="contactForm"
            />
               <span class="required"></span>
            
        </span>
        <asp:textbox runat="server" ID="txtCompany" CssClass=" txtCompany field"/>
    </div>
   </td>
   <td>
  <div class="field-row">
        <span class="label">
             Title *<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtTitle" 
                    ErrorMessage=" Required" 
                    CssClass="validator" 
                    Display="Dynamic"
                    ValidationGroup="contactForm"
                />        
        <span class="required"></span> 
        </span>
        <asp:textbox runat="server" ID="txtTitle" CssClass=" txtTitle field"/>
    </div></td> </tr>
       <!-- End Row 2-->
       <!-- Row 3-->
   <tr>
      
   <td>
    <div class="field-row">
        <span class="label">
            Email *<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage=" Required" 
                CssClass="validator" 
                Display="Dynamic"
                ValidationGroup="contactForm"
            />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage=" Invalid" 
                CssClass="validator" 
                Display="Dynamic" 
                ValidationExpression="[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+"
                ValidationGroup="contactForm"
            />
            <span class="required"></span>
            
        </span>
        <asp:textbox runat="server" ID="txtEmail" CssClass=" txtEmail field"/>
    </div>
   </td>
   <td>
  <div class="field-row">
        <span class="label">
             Phone *<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtPhone" 
                    ErrorMessage=" Required" 
                    CssClass="validator" 
                    Display="Dynamic"
                    ValidationGroup="contactForm"
                />        
        <span class="required"></span> 
        </span>
        <asp:textbox runat="server" ID="txtPhone" CssClass=" txtPhone field"/>
    </div></td>
    </tr>
    <!-- End Row 3-->
    <!-- Row 4-->
  <tr>
  <td>
  <div class="field-row">
        <span class="label">
             Address *<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtAddy" 
                    ErrorMessage=" Required" 
                    CssClass="validator" 
                    Display="Dynamic"
                    ValidationGroup="contactForm"
                />        
        <span class="required"></span> 
        </span>
        <asp:textbox runat="server" ID="txtAddy" CssClass=" txtAddy field"/>
    </div>
    </td>
  <td>
  <div class="field-row">
        <span class="label">
             Address Line 2       
        </span>
        <asp:textbox runat="server" ID="txtAddy2" CssClass=" txtAddy2 field"/>
    </div>
    </td>
    </tr>
      <!-- End Row 4-->
      <!-- Row 5-->
        <tr>
        <td><div class="field-row">
        <span class="label">
             City *<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtCity" 
                    ErrorMessage=" Required" 
                    CssClass="validator" 
                    Display="Dynamic"
                    ValidationGroup="contactForm"
                />        
        <span class="required"></span> 
        </span>
        <asp:textbox runat="server" ID="txtCity" CssClass=" txtCity field"/>
    </div></td>
        <td>
        <div class="field-row floatedcontainer">
        <span class="label">
             Zip Code 
        </span>
        <asp:textbox runat="server" ID="txtZip" CssClass=" txtZip field"/>
    </div>
     <div class="ddlcontainer floatedcontainer" >
     
    <asp:DropDownList ID="ddlState" CssClass="textbox ddl" runat="server" >
<asp:ListItem Value="AL" Text="Alabama"></asp:ListItem>
<asp:ListItem Value="AK" Text="Alaska"></asp:ListItem>
<asp:ListItem Value="AZ" Text="Arizona"></asp:ListItem>
<asp:ListItem Value="AR" Text="Arkansas"></asp:ListItem>
<asp:ListItem Value="CA" Text="California"></asp:ListItem>
<asp:ListItem Value="CO" Text="Colorado"></asp:ListItem>
<asp:ListItem Value="CT" Text="Connecticut"></asp:ListItem>
<asp:ListItem Value="DE" Text="Delaware"></asp:ListItem>
<asp:ListItem Value="DC" Text="District of Columbia"></asp:ListItem>
<asp:ListItem Value="FL" Text="Florida"></asp:ListItem>
<asp:ListItem Value="GA" Text="Georgia"></asp:ListItem>
<asp:ListItem Value="HI" Text="Hawaii"></asp:ListItem>
<asp:ListItem Value="ID" Text="Idaho"></asp:ListItem>
<asp:ListItem Value="IL" Text="Illinois"></asp:ListItem>
<asp:ListItem Value="IN" Text="Indiana"></asp:ListItem>
<asp:ListItem Value="IA" Text="Iowa"></asp:ListItem>
<asp:ListItem Value="KS" Text="Kansas"></asp:ListItem>
<asp:ListItem Value="KY" Text="Kentucky"></asp:ListItem>
<asp:ListItem Value="LA" Text="Louisiana"></asp:ListItem>
<asp:ListItem Value="ME" Text="Maine"></asp:ListItem>
<asp:ListItem Value="MD" Text="Maryland"></asp:ListItem>
<asp:ListItem Value="MA" Text="Massachusetts"></asp:ListItem>
<asp:ListItem Value="MI" Text="Michigan"></asp:ListItem>
<asp:ListItem Value="MN" Text="Minnesota"></asp:ListItem>
<asp:ListItem Value="MS" Text="Mississippi"></asp:ListItem>
<asp:ListItem Value="MO" Text="Missouri"></asp:ListItem>
<asp:ListItem Value="MT" Text="Montana"></asp:ListItem>
<asp:ListItem Value="NE" Text="Nebraska"></asp:ListItem>
<asp:ListItem Value="NV" Text="Nevada"></asp:ListItem>
<asp:ListItem Value="NH" Text="New Hampshire"></asp:ListItem>
<asp:ListItem Value="NJ" Text="New Jersey"></asp:ListItem>
<asp:ListItem Value="NM" Text="New Mexico"></asp:ListItem>
<asp:ListItem Value="NY" Text="New York"></asp:ListItem>
<asp:ListItem Value="NC" Text="North Carolina"></asp:ListItem>
<asp:ListItem Value="ND" Text="North Dakota"></asp:ListItem>
<asp:ListItem Value="OH" Text="Ohio"></asp:ListItem>
<asp:ListItem Value="OK" Text="Oklahoma"></asp:ListItem>
<asp:ListItem Value="OR" Text="Oregon"></asp:ListItem>
<asp:ListItem Value="PA" Text="Pennsylvania"></asp:ListItem>
<asp:ListItem Value="RI" Text="Rhode Island"></asp:ListItem>
<asp:ListItem Value="SC" Text="South Carolina"></asp:ListItem>
<asp:ListItem Value="SD" Text="South Dakota"></asp:ListItem>
<asp:ListItem Value="TN" Text="Tennessee"></asp:ListItem>
<asp:ListItem Value="TX" Text="Texas"></asp:ListItem>
<asp:ListItem Value="UT" Text="Utah"></asp:ListItem>
<asp:ListItem Value="VT" Text="Vermont"></asp:ListItem>
<asp:ListItem Value="VA" Text="Virginia"></asp:ListItem>
<asp:ListItem Value="WA" Text="Washington"></asp:ListItem>
<asp:ListItem Value="WV" Text="West Virginia"></asp:ListItem>
<asp:ListItem Value="WI" Text="Wisconsin"></asp:ListItem>
<asp:ListItem Value="WY" Text="Wyoming"></asp:ListItem>
</asp:DropDownList>
</div>
<div class="clear"></div>
 </td>
        </tr>
      <!-- End Row 5-->
      <!-- Row 6-->  
      <%--<tr><td colspan="2"><span class="requiredMessage">* required fields</span></td></tr>--%>
         <tr><td colspan="2"><span class="AdditionalInfoMessage">Preferred Date</span></td></tr>
      <tr><td>
      <div class="field-row ddlcontainer">
    <asp:UpdatePanel ID="updpnlMonth" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="Month" CssClass="ddl" runat="server" AutoPostBack="true" DataTextField="MonthName"
                            DataValueField="MonthNumber" OnSelectedIndexChanged="Month_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
</div>
<div class="field-row ddlcontainer">
  <asp:UpdatePanel ID="updpnlDay" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="Days"  CssClass="ddl "  runat="server">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Month" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
</div>
      </td></tr>
       <tr><td colspan="2"><span class="AdditionalInfoMessage">Please provide additional details:</span></td></tr>
      <tr>
   <td colspan="2"> <div class="field-row">
    
             <asp:textbox runat="server" ID="txtMessage" TextMode="MultiLine" CssClass=" txtMessage field message"/>
    </div>    <div class="clear"></div></td></tr>
      <!-- End Row 6-->
    <tr><td colspan="2"><div class="button_wrapper">
    <div class="relativity_button">
        <asp:LinkButton runat="server" ID="btnSubmit" cssclass="submit btn" ValidationGroup="contactForm"><img alt="Submit" class="svgimg" src="/portals/_default/skins/blackandwhite/images/contact/submit_btn.png" /></asp:LinkButton>
       
    </div>
    <%--<div class="relativity_button">
     <asp:LinkButton runat="server" ID="btnClear" cssclass="clear btn" >Clear</asp:LinkButton>
     </div>--%>
     </div>
    <div class="clear"></div></td></tr></table>

   

    
</div>
<script runat="server" language="vbscript">
Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)
        Page.ClientScript.RegisterClientScriptInclude("contact_us_script", ResolveUrl("~/DesktopModules/ContactForm/scripts/contact_us.js"))
    End Sub    
</script>