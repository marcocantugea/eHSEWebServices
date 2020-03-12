<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRA_Enviar_A_Seguridad.aspx.vb" Inherits="TRA_TRA_Enviar_A_Seguridad" %>
<link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>e-TRA System
    </title>
    <style type="text/css">
        td a
        {
            padding: 10px;
        }
    
        .style3
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: x-small;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            height: 40px;
            width: 700px;
        }
    
td { 
    font-family:verdana,arial; 
    font-size:8pt;
	}
        td { 
    font-family:verdana,arial; 
    font-size:8pt;
	}
        .style2
        {
            width: 700px;
        }
        .style16
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 153px;
        }
        .estiloEtiquetasA{ 
    background-color:#ffffff; 
    color:#333333; 
    font-weight:700; 
    font-size:7pt; 
    text-indent:3px;
    font-family: Verdana;
}
        .style20
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 117px;
        }
        .style21
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 147px;
        }
        .style15
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 150px;
        }
        .hdDirectorio
{
background-color:#443e39;
color:#FFFFFF;
font-weight:bold;
font-size:x-small;
text-indent:3px;
            text-align: center;
        }
.hdDirectorio
{
    background-color: #333333;
color: #FFF;
font-weight: bold;
font-size: xx-small;
text-indent: 3px;
 padding: 0px 0px 0px 5px;
height: 8px;
 }

        .style12
        {
            width: 37px;
            height: 28px;
        }
        .style24
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 184px;
        }
        .normalBold
{
font:Verdana, Arial, Helvetica, sans-serif;
color:#000000;
font-size:12px;
font-weight:bold;
}
        .style14
        {
            height: 28px;
        }
            	
.Button2
{
	background: #2580a2;
	color: #fff;
	font-size: x-small;
	font-weight: 700;
}
    	
.Button2
{
	background: #2580a2;
	color: #fff;
	font-size: x-small;
	font-weight: 700;
}
        .style25
        {
            width: 37px;
        }
        .style26
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            margin-left: 0px;
            vertical-align: middle ;
            }
        .style22
        {
            color: #800000;
            font-style: italic;
            font-family: Aharoni;
            font-size: xx-small;
        }
        .estiloRptHD2
{
background-color:#009FC2;
color:#FFF;
font-weight:bold;
font-size:16px;
text-indent:3px;
padding: 0px 0px 0px 5px;
/*border-bottom:double;*/
}

.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
        .auto-style11 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 190px;
        }
        .estiloRojo
{
background-color:#810000; /*443e39*/
color: #fff;
font-size: xx-small;
font-weight: 700;
}
        .auto-style29 {
            color: #FFF;
            font-weight: bold;
            font-size: xx-small;
            text-indent: 3px;
            height: 20px;
            text-align: center;
            padding-left: 5px;
            padding-right: 0px;
            padding-top: 0px;
            padding-bottom: 0px;
            background-color: #333333;
            width: 990px;
        }
        .auto-style38 {
            height: 46px;
        }
    </style>
    
</head>
<body style="margin:0px 0px 0px 0px;font-family: verdana; font-size: x-small; font-weight: bold; font-style: italic; font-variant: normal; color: #990000">
    <form  id="form2" runat="server" style="font-family:Verdana; font-size:small ">
    <div style="font-family:Verdana; font-size:small ">
    
        <table style="width: 828px; font-family:Verdana; font-size:xx-small; " border="0" 
            align="center">
        <tr>
        <td class="auto-style38" style="border-bottom-style: solid; border-bottom-width: thick; border-bottom-color: #000000;"><asp:Image ImageAlign="Top" ID="Image1" runat="server" ImageUrl="~/Images/tra_Header.png" />
            </td>
        </tr>
        <tr>
        <td>
            <table style="width:100%;" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                                <asp:Label ID="lEnviarRev_Filed" runat="server" Text="The TRA is been filed successful." Font-Names="Arial" style="font-size: small; font-weight: 700;" Width="500px" ForeColor="Black"></asp:Label>
                            </td>
                  &nbsp;</td>
                    <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Right" ImageUrl="~/Images/btnHome.jpg" PostBackUrl="~/TRA/main.aspx" />
                    </td>
                </tr>
            </table>
            </td>
        </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 905px;">
                        <tr>
                            <td class="auto-style11">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                &nbsp;</td>
                                                    </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="lEnviarRev_Success0" runat="server" Text="Your document is been sent to Safety Department to be approved to become official." Font-Names="Arial" style="font-size: small" Width="595px"></asp:Label>
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="auto-style11">
                          &nbsp;</td>
                           
                        </tr>
                        <tr>
                            <td class="auto-style11">
            <asp:Label ID="ltraId" runat="server" Text="ID" Visible="False"></asp:Label>
            <asp:Label ID="lDepartamento" runat="server" Text="ID" Visible="False"></asp:Label>
                            </td>
                           
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 901px;">
                        <tr>
                            <td class="auto-style29">
                                Powered by Bicentenario IT Servicesrvicesrvices</td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td align=center>
                
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
        
    </form>
</body>
</html>