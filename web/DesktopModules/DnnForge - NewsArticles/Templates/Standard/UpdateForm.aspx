<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="UpdateForm.aspx.cs" Inherits="DogProfile_UpdateForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: auto;
        }
        .formFieldArea {
            padding-bottom: 6px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            padding-top: 8px;
            font-size: 16px;
            margin-bottom: 8px;
            font-weight: 600;
            color: #009DDC;
        }
        .text {
            width: 293px;
            height: 33px;
            outline: none;
            padding: 0px;
        }
        h1 {
            font-size: 30px;
            color: #009BDC;
            font-weight: normal;
            font-family: BodoniEgyptianPro-Bold;
            margin: 0px;
            padding-bottom: 20px;
            padding-top: 20px;
        }
        .btn {
            text-transform: uppercase;
            color: #ffffff;
            font-size: 16px;
            font-weight: 700;
            background-color: #009ddc;
            padding: 12px 34px;
            border: 0px;
            line-height: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 299px;">
            <h1>Update Dog Profile</h1>
            <div class="formFieldArea">
                <asp:Label runat="server" AssociatedControlID="txtDogsName" ID="lblDogsName" Text="Dog's Name" />
                <asp:TextBox runat="server" ID="txtDogsName" CssClass="text" />
            </div>
            <div class="formFieldArea">
                <asp:Label runat="server" AssociatedControlID="txtDogsBreed" ID="lblDogsBreed" Text="Dog's Breed" />
                <asp:TextBox runat="server" ID="txtDogsBreed" CssClass="text" />
            </div>
            <div class="formFieldArea">
                <asp:Label runat="server" AssociatedControlID="txtDogsWeight" ID="lblDogsWeight" Text="Dog's Weight" />
                <asp:TextBox runat="server" ID="txtDogsWeight" CssClass="text" />
            </div>
            <div class="formFieldArea">
                <asp:Label runat="server" AssociatedControlID="txtDogsCity" ID="lblCity" Text="City" />
                <asp:TextBox runat="server" ID="txtDogsCity" CssClass="text" />
            </div>
            <div class="formFieldArea" style="text-align: right;">
                <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Update" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>
