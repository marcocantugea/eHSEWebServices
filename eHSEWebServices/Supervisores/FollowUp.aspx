<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FollowUp.aspx.vb" Inherits="FollowUp" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stop Cards</title>
    <style type="text/css">
        .style1
        {
            background-color: #443e39;
            color: #FFFFFF;
            font-weight: bold;
            font-size: x-small;
            text-indent: 3px;
            text-align: left;
            height: 42px;
        }
        .style2
        {
            background-color: #e2dfdf;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            width: 112px;
        }
        .style3
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 112px;
        }
        #Text1
        {
            font-weight: 700;
        }
    .style22
    {
        color: #800000;
        font-style: italic;
        font-family: Aharoni;
        font-size: xx-small;
    }
        .style23
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 112px;
        }
        .style24
        {
            height: 26px;
        }
        .misEstilos{ 
            background-color:#ffffff; 
            color:#333333; 
            font-weight:700; 
            font-size:small; 
            text-indent:3px;
            height:20px;
	        font-family: Verdana;
            padding-bottom: 5px;

        }
        </style>
    </head>
<body class="estiloError">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; top: 0px; left: 0px;">
            <tr>
                <td class="style1">
                    FOLLOW UP RELEVANT SOC</td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin solid #333333; width:100%;" cellpadding="0" 
                        cellspacing="0">
                        <tr>
                            <td class="estiloRptHD2" 
                                
                                
                                style="border-right: thin solid #333333; font-size: x-small;">
                                SOC
                                ID:</td>
                            <td class="estiloRptHD2">
                                <asp:Label ID="lblId" runat="server" Height="16px" style="font-size: x-small"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                SOC -
                                Name:</td>
                            <td class="misEstilos">
                                <asp:Label ID="Nombre" runat="server" Height="15px" Width="361px" CssClass="misEstilos"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                SOC -
                                Location:</td>
                            <td class="misEstilos">
                                <asp:Label ID="Locacion" runat="server" Height="15px" Width="366px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                SOC - Observation:</td>
                            <td class="misEstilos">
                                <asp:Label ID="Observacion" runat="server" Height="16px" Width="372px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                SOC - Area:</td>
                            <td class="misEstilos">
                                <asp:Label ID="Area" runat="server" Height="15px" Width="372px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                SOC - EMail Sent To:</td>
                            <td class="misEstilos">
                                <asp:Label ID="Distribucion" runat="server" Height="42px" Width="609px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#e2dfdf; border-right-style: solid; border-right-width: thin; border-right-color: #333333"></td>
                            <td style="background-color:#e2dfdf">
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color:#333333; border-right-style: solid; border-right-width: thin; border-right-color: #333333" 
                                class="style24">
                                </td>
                            <td style="background-color:#333333; border-right-style: solid; border-right-width: thin; border-right-color: #333333;
                             border-left-style: solid; border-left-width: thin; border-left-color: #333333"
                                ; class="style24">
                                <asp:Label ID="lblId1" runat="server" Height="15px" 
                                    style="font-size: small; color: #FFCC00; font-weight: 700;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                 style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Date:</td>
                            <td class="misEstilos">
                                <asp:TextBox ID="Fecha" runat="server" 
                                    Height="19px" Width="126px" TabIndex="10" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Comments By:</td>
                            <td class="misEstilos">
                                <asp:DropDownList ID="txtName" runat="server" 
                                    TabIndex="20">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Comment:</td>
                            <td class="misEstilos">
                                <asp:TextBox ID="Comentario" runat="server" 
                                    Height="50px" Width="380px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Action Taken:</td>
                            <td class="misEstilos">
                                <asp:TextBox ID="AccionTomada" runat="server" 
                                    Height="50px" Width="380px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                &nbsp;</td>
                            <td class="misEstilos">
                                <asp:Label ID="UserID" runat="server" Text="UserID" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                &nbsp;</td>
                            <td class="estiloEti2">
                                <asp:Button ID="btnCancel" runat="server" CssClass="button1" Text="Back" 
                                    Width="102px" TabIndex="70" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="button" Text="Follow Up" 
                                    Width="100px" TabIndex="50" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpdate0" runat="server" CssClass="buttonGreen" Text="Close SOC" 
                                    Width="108px" TabIndex="60" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:817px">
                <tr class="estiloRptHD2">
                                    <td >
                                        THIS
                                        SOC HAVE&nbsp;
                                        <asp:Label 
                                            ID="RptTitle" runat="server" Font-Size="Small" style="color: #FFCC00">0</asp:Label>
                                    &nbsp;FOLLOW UP COMMENTS</td>
                </tr>
                </table>
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                
                                <tr class="estiloRptHD">
                                <td align="center">
                                                    <asp:Label ID="Label1" runat="server" Text="Follow ID" Width="75px"></asp:Label>
                                                </td>
                                   <td align="left">
                                            <asp:Label ID="Label3" runat="server" Text="Date" Width="75px"></asp:Label>
                                            
                                   <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Comments By" Width="150px"></asp:Label>
                                    <td align="center">
                                         <asp:Label ID="Label6" runat="server" Text="Comments" Width="250px"></asp:Label>
                                    </td>
                                    <td align="center">
                                         <asp:Label ID="Label4" runat="server" Text="Action" Width="230px"></asp:Label>
                                    </td>
                                            </td>
                                        </td>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" class="repeater">
                                <tr>
                                <td>
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("Idi")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Fecha" runat="server" 
                                            Text='<%#Container.DataItem("Fecha")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Observacion" runat="server" Text='<%#Container.DataItem("Observacion")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Accion")%>' 
                                            Width="230px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                <td>
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("Idi")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Fecha" runat="server" 
                                            Text='<%#Container.DataItem("Fecha")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Observacion" runat="server" Text='<%#Container.DataItem("Observacion")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Accion")%>' 
                                            Width="230px"></asp:Label>
                                    </td>
                                    <td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:817px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo1" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td class="misEstilos">
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                    &nbsp; Powered by Juan Luis Rios © </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>