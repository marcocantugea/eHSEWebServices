<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SOC_Been_Close.aspx.vb" Inherits="SOC_Been_Close" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stop Card Had Been Sent</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 671px;" border="0">
        <tr>
        <td class="estiloRptHD">
        
            &nbsp; SAFETY OBSERVATION CARD BEEN CLOSE SUCCESSFULLY</td>
        </tr>
        <tr>
        <td class="style1">
        
            <asp:Label ID="Label1" runat="server" CssClass="Identificadores" 
                Width="450px" Height="16px"></asp:Label>
            <br />
        
            <asp:Label ID="Label2" runat="server" CssClass="Identificadores" 
                Width="450px" Height="16px"></asp:Label>
            <br />
            </td>
        </tr>
        <tr>
        <td class="style3">
        
        <asp:Button ID="btnBack" runat="server" Text="Follow Up - Index" CssClass="Button2" 
                Height="25px" style="font-size: x-small" 
                Width="174px" />
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="UserID" runat="server" 
                Text="UserID" Visible="False"></asp:Label>
                            </td>
        </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
