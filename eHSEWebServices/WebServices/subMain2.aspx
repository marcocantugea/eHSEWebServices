<%@ Page Language="VB" AutoEventWireup="false" CodeFile="subMain2.aspx.vb" Inherits="subMain2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="Styles/CQS.css" rel="stylesheet" type="text/css">

<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="margin:0px 0px 0px 0px">
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
    <td><input type=button id=back onclick='location.href="default.html"' 
            value="Regresar/Go Back" class="Button2"/></td>
    </tr>
    <tr>
    <td>
        <asp:Image ID="Image1" runat="server" ImageUrl="Images/Politicas.jpg" />
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
