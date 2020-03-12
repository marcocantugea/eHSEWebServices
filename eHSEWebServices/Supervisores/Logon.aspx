<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logon.aspx.vb" Inherits="Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authority Responsible - Logon Page</title>
        <link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>
    <style type="text/css">
.rcorners1 {
    border-radius: 25px;
    background: #333333;
    padding: 20px; 
    width: 200px;
    height: 150px; 
}

    </style>
</head>
<body>
<form id="Login" method="post" runat="server">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="3" class="rcorners1">
  <tr>
    <td colspan="3" align="center">
                                        <img alt="" src="images/LogoRSTC.png" /></td>
  </tr>
  <tr>
    <td><img src="Images/LogOn_AD.png" width="26" height="26" /></td>
    <td><asp:TextBox ID="txtDomain" Runat="server" Text="GRM4" Width="200px" CssClass="estiloSubTituBorder" Enabled="False"></asp:TextBox></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/LogOn_User.png" width="26" height="26" /></td>
    <td><asp:TextBox ID="txtUsername" Runat="server" Width="200px" CssClass="estiloSubTituBorder"></asp:TextBox></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/LogOn_Password.png" width="26" height="26" /></td>
    <td><asp:TextBox ID="txtPassword" Runat="server" TextMode="Password" Width="200px" CssClass="estiloSubTituBorder"></asp:TextBox></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><asp:Button ID="btnLogin" Runat="server" Text="Login" OnClick="Login_Click" CssClass="button" Height="35px" Width="200px"></asp:Button></td>
      <td></td>
  </tr>
    <tr>
    <td></td>
    <td><asp:Label ID="errorLabel" Runat="server" ForeColor="#ff3300"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td></td>
    <td><asp:CheckBox ID="chkPersist" Runat="server" Text="Persist Cookie" CssClass="estiloRptHD" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
		</form>
</body>
</html>
