<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FollowUpList.aspx.vb" Inherits="FollowUpList" %>
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
    .misEstilos{ 
    background-color:#ffffff; 
    color:#333333; 
    font-weight:700; 
    font-size:small; 
    text-indent:3px;
    height:20px;
	font-family: Verdana;
}
    </style>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>

    </head>
<body class="estiloError">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:720px; top: 0px; left: 0px;">
            <tr>
                <td class="style1" colspan="2">
                    RELEVANT SOC CARDS 
                                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table style="border: thin ridge #808080; width: 827px;">
                        <tr>
                            <td class="misEstilos">
                                From:</td>
                            <td>
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="misEstilos" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="misEstilos">
                                SOC Id:</td>
                            <td class="style6">
                                <asp:TextBox ID="tID" runat="server" CssClass="misEstilos" 
                                    Height="19px" Width="161px" TabIndex="500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos">
                                To:</td>
                            <td>
                                <asp:TextBox ID="tDateA" runat="server" CssClass="misEstilos" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="misEstilos">
                                Status:</td>
                            <td class="style6">
                                <asp:DropDownList ID="dStatus" runat="server" CssClass="misEstilos" 
                                    Width="163px">
                                    <asp:ListItem Value="Follow Up">Follow Up</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="misEstilos">
                                &nbsp;</td>
                            <td>
                                <asp:DropDownList ID="dDptos" runat="server" CssClass="misEstilos" 
                                    Width="163px" Enabled="False">
                                    <asp:ListItem Value="Follow Up">Follow Up</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="UserID" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style6">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Search" 
                                    Width="103px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:826px">
                <tr class="estiloRptHD2">
                                    <td >
                                        SOC CARDS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                                            ID="RptTitle" runat="server" Font-Size="Small"></asp:Label>
                                    </td>
                </tr>
                </table>
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                
                                <tr class="estiloRptHD">
                                <td align="center">
                                                    <asp:Label ID="Label1" runat="server" Text="SOC ID" Width="50px"></asp:Label>
                                                </td>
                                   <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Name" Width="150px"></asp:Label>
                                        <td align="left">
                                            <asp:Label ID="Label3" runat="server" Text="Date" Width="75px"></asp:Label>
                                            <td align="left">
                                                <asp:Label ID="Label5" runat="server" Text="Location" Width="150px"></asp:Label>
                                                <td align="center">
                                                    <asp:Label ID="Label6" runat="server" Text="Observation" Width="150px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label4" runat="server" Text="Action" Width="150px"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="Label8" runat="server" Text="Sel." Width="50px"></asp:Label>
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
                                            Width="50px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Fecha" runat="server" 
                                            Text='<%#Container.DataItem("Fecha")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Ubicacion" runat="server" 
                                            Text='<%#Container.DataItem("Ubicacion")%>' Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Observacion" runat="server" Text='<%#Container.DataItem("Observacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Accion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnGuardar0" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton")%>' CommandName="btnGuardar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                <td>
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("Idi")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Fecha" runat="server" 
                                            Text='<%#Container.DataItem("Fecha")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Ubicacion" runat="server" 
                                            Text='<%#Container.DataItem("Ubicacion")%>' Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Observacion" runat="server" Text='<%#Container.DataItem("Observacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Accion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnGuardar0" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton")%>' CommandName="btnGuardar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:826px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo1" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="misEstilos">
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>