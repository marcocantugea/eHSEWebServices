<%@ Page Language="VB" AutoEventWireup="false" CodeFile="exportToExcel.aspx.vb" Inherits="exportToExcel" EnableEventValidation="true" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Export to Excel</title>
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
        .misEtiquetas {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            padding-bottom: 5px;
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
            width: 314px;
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
            width: 105px;
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
            width: 120px;
        }
        .style24
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 213px;
        }
        .auto-style1 {
            color: #333333;
            font-weight: 700;
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            width: 119px;
            padding-bottom: 5px;
            background-color: #ffffff;
        }
        .auto-style2 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 119px;
        }
        .auto-style3 {
            color: #333333;
            font-weight: 700;
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            width: 104px;
            padding-bottom: 5px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    EXPORT STOP CARDS TO EXCEL&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin ridge #808080; width: 100%;">
                        <tr>
                            <td class="auto-style3">
                                From:</td>
                            <td class="misEtiquetas">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                Weekly Nominee:</td>
                            <td class="misEtiquetas" style="text-align: left">
                                            <asp:CheckBox ID="cbWeek" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                To:</td>
                            <td class="misEtiquetas">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                Monthy Nominee:</td>
                            <td class="misEtiquetas">
                                            <asp:CheckBox ID="cbMonth" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                Status:</td>
                            <td class="style24">
                                <asp:DropDownList ID="dStatus" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="163px">
                                    <asp:ListItem Value="o">All</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                    <asp:ListItem>Open</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Search" 
                                    Width="93px" />
                            </td>
                            <td class="style6">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                                <asp:Button ID="btnExport" runat="server" CssClass="buttonGreen" Text="Export" 
                                    Width="93px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" CssClass="Identificadores"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD2">
                                    <td colspan="6">
                                        <asp:Label ID="TagNo0" runat="server" 
                                            Text="SOC CARDS | EXPORT RESULTS"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="estiloRptHD">
                                   <td align="left">
                                    <asp:Label ID="Label2" runat="server" Text="Name" Width="150px"></asp:Label>
                                    <td align="left">
                                    <asp:Label ID="Label1" runat="server" Text="Department" Width="100px"></asp:Label>
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
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Depart" runat="server" Text='<%#Container.DataItem("Department")%>' 
                                            Width="100px"></asp:Label>
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
                                            Width="145px"></asp:Label>
                                    </td>
                                    <td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre0" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Depart" runat="server" Text='<%#Container.DataItem("Department")%>' 
                                            Width="100px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Fecha0" runat="server" 
                                            Text='<%#Container.DataItem("Fecha")%>' Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Ubicacion0" runat="server" 
                                            Text='<%#Container.DataItem("Ubicacion")%>' Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Observacion0" runat="server" Text='<%#Container.DataItem("Observacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Accion0" runat="server" Text='<%#Container.DataItem("Accion")%>' 
                                            Width="145px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:820px">
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
