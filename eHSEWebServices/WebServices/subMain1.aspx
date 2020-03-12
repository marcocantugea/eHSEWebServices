<%@ Page Language="VB" AutoEventWireup="false" CodeFile="subMain1.aspx.vb" Inherits="subMain1" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="margin:0px 0px 0px 0px">
    <table>
    <tr>
    <td>
        <input type=button id=back onclick='location.href="default.html"' 
            value="Regresar/Go Back" class="Button2"/></td>
    </tr>
    <tr>
    <td>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Piramide.jpg" />
    </td>
    </tr>
    </form>
</body>
</html>
