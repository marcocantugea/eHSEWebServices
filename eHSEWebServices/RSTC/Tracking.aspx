<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tracking.aspx.vb" Inherits="Tracking" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Tracking a SOC</title>
    <style type="text/css">
        .style1
        {
            background-color: #443e39;
            color: #FFFFFF;
            font-weight: bold;
            font-size: x-small;
            text-indent: 3px;
            text-align: left;
            height: 39px;
        }
        .style5
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 217px;
        }
        .style6
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 235px;
        }
        .style7
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 156px;
        }
    .style22
    {
        color: #800000;
        font-style: italic;
        font-family: Aharoni;
        font-size: xx-small;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:79%;">
            <tr>
                <td class="style1">
                    TRACKING SOC</td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style7">
                                SOC ID:</td>
                            <td class="style6">
                                <asp:TextBox ID="tId" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                To:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style7">
                                Status:</td>
                            <td class="style6">
                                <asp:DropDownList ID="dStatus" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="163px">
                                    <asp:ListItem Value="o">All</asp:ListItem>
                                    <asp:ListItem>Open</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                    <asp:ListItem>Follow Up</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style6">
                                <asp:Button ID="btnExport0" runat="server" CssClass="Button2" Text="Search" 
                                    Width="73px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:706px">
                <tr class="estiloRptHD2">
                                    <td >
                                        TOTAL SOC FIND IT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                                            ID="Label7" runat="server" style="font-size: small; color: #FFCC00"></asp:Label>
                                    </td>
                </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD">
                                <td align="center">
                                        <asp:Label ID="Label1" runat="server" Text="SOC ID" Width="50px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Name" Width="150px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label3" runat="server" Text="Date" Width="75px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label4" runat="server" Text="Hour" Width="75px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label6" runat="server" Text="Computer" Width="150px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label5" runat="server" Text="Location" Width="150px"></asp:Label>
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
                                        <asp:Label ID="Label8" runat="server" 
                                            Text='<%#Container.DataItem("Hora")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text='<%#Container.DataItem("Computer")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Ubicacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
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
                                        <asp:Label ID="Label8" runat="server" 
                                            Text='<%#Container.DataItem("Hora")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text='<%#Container.DataItem("Computer")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion" runat="server" Text='<%#Container.DataItem("Ubicacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:695px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="5">
                                        <asp:Label ID="TagNo1" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td class="estiloEtiquetasA">
                                <br /></td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
