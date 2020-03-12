<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRA_Not_Authorized.aspx.vb" Inherits="TRA_TRA_Not_Authorized" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>
    <style type="text/css">
.rcorners1 {
    border-radius: 25px;
    background: #333333;
    padding: 20px; 
    width: 808px;
    height: 150px; 
}
        </style>
</head>
<body>
    <form id="form1" runat="server">
<table border="0" align="center" cellpadding="3" cellspacing="3" class="rcorners1">
  <tr>
    <td width="13">&nbsp;</td>
    <td width="161"><img src="../images/NonAuthorized_Face.png" width="161" height="161" /></td>
    <td width="8">&nbsp;</td>
    <td width="379">
        <asp:Label ID="Label1" runat="server" Text="Sorry User. You are not allowd to see this content" CssClass="button1"></asp:Label></td>
  </tr>
</table>
    </form>
</body>
</html>
