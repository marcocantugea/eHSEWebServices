<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StopCardSent.aspx.vb" Inherits="StopCardSent" %>

<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stop Card Had Been Sent</title>
    <style type="text/css">
        .style1
        {
            height: 75px;
        }
        .style2
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size:medium;
            text-indent .estiloRptHD { background-color: #333333;
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 671px;" border="0">
        <tr>
        <td class="style2">
        
            &nbsp; SOC CARDS - TARJETAS SOC</td>
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
        
        <asp:Button ID="btnBack" runat="server" Text="New Card / Nueva Tarjeta" CssClass="button" 
                Height="55px" PostBackUrl="~/StopCard.aspx" style="font-size: x-small" 
                Width="317px" />
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
