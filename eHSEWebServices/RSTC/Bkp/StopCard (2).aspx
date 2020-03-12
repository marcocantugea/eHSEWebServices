<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StopCard.aspx.vb" Inherits="StopCard" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stop Card - Tarjetas Stop</title>
    <style type="text/css">

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
        .style2
        {
            width: 700px;
        }
        .estiloPregunta
{
background-color:#810000; /*443e39*/
color:#FFFFFF;
font-size:x-small;
text-indent:3px;
            font-family: Verdana;
        }
    	
.Button2
{
	background: #2580a2;
	color: #fff;
	font-size: x-small;
	font-weight: 700;
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
.repeater
{
background-color:#e2dfdf;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
.repeaterAlterno
{
background-color:#FFFFFF;
vertical-align:middle;
color: #444;
font: normal 10px arial, sans-serif;
height: 18px;
padding: 0px 0px 0px 5px;
}
        .style12
        {
            width: 37px;
            height: 28px;
        }
        .style14
        {
            height: 28px;
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
        .style17
        {
        }
        .style18
        {
            width: 309px;
        }
        .style19
        {
            width: 34px;
        }
        .style20
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 354px;
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
            width: 118px;
        }
    </style>
</head>
<body class="estiloError">
    <form id="form1" runat="server" style="font-family:Verdana; font-size:small ">
    <div style="font-family:Verdana; font-size:small ">
    
        <table style="width: 671px; font-family:Verdana; font-size:small" border="0">
        <tr>
        <td class="style3">
        
            SOC CARDS - TARJETAS DE OBSERVACIÓN<br />
            </td>
        </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="style16">
                                Name:</td>
                            <td class="style20">
                                <asp:DropDownList ID="txtName" runat="server" CssClass="estiloEtiquetasA" 
                                    TabIndex="9">
                                </asp:DropDownList>
                    <asp:Button ID="btnClose0" runat="server" CssClass="Button2" Text="SRC" 
                        Width="36px" TabIndex="101" Font-Size="XX-Small" />
                            </td>
                            <td class="style23">
                                Week:</td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="Semana" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Date:</td>
                            <td class="style20">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                                </td>
                            <td class="style23">
                                IP:</td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="lblIP" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                Location/Locación:
                                </td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="txtUbica" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="276px" TabIndex="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Observation/<br />
                                Observación:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="txtObserva" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="50px" Width="451px" TextMode="MultiLine" TabIndex="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Action Required/<br />
                                Acción Requerida:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="txtAccion" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="50px" Width="451px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="hdDirectorio" colspan="3">
                                JOB RISKS OBSERVET / RIESGOS DEL TRABAJO OBSERVADOS<br />
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA" colspan="2">
                                <asp:RadioButtonList ID="rbList" runat="server" CssClass="estiloEtiquetasA" 
                                    Font-Bold="False" Font-Overline="False" TabIndex="49" Width="426px">
                                    <asp:ListItem Value="Radio1">Unsafe Action /Acto Inseguro</asp:ListItem>
                                    <asp:ListItem Value="Radio2">PPE /EPP</asp:ListItem>
                                    <asp:ListItem Value="Radio3">Body Position /Posición de la gente</asp:ListItem>
                                    <asp:ListItem Value="Radio4">Housekeeping /Orden y Limpieza</asp:ListItem>
                                    <asp:ListItem Value="Radio5">Usafe Condition /Condición Inseguro</asp:ListItem>
                                    <asp:ListItem Value="Radio6">Procedures /Procedimientos</asp:ListItem>
                                    <asp:ListItem Value="Radio7">Tools &amp; Equip. /Herramientas y Equipos</asp:ListItem>
                                    <asp:ListItem Value="Radio8">Safe/Positive Observation /Observación Positiva</asp:ListItem>
                                    <asp:ListItem Value="Radio9">Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="lblRespuesta" runat="server" Text="Label" CssClass="normalBold" 
                                    Visible="False"></asp:Label>
                                <asp:Label ID="lblId" runat="server" Height="15px" Visible="False"></asp:Label>
                            </td>
                            <td class="style14">
                                <asp:Button ID="btnPhoneSrc" runat="server" Text="Save / Guardar" CssClass="Button2" 
                                    Height="25px" Width="129px" TabIndex="50" />
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD2">
                                    <td colspan="6">
                                        <asp:Label ID="TagNo0" runat="server" 
                                            Text="STOP CARDS"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="estiloRptHD">
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
                            <table style="width:770px">
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
                <td class="estiloEtiquetasA">
                    Powered by <span class="style22">Jhonny Rivers</span></td>
            </tr>
        </table>
    
    </div>
    <div id="divBusqueda" runat=server style="border: thin solid #37332F; position: absolute; top: 110px; left: 145px; height: 98px; width: 385px; visibility: visible;" 
        class="estiloEtiquetasA">
        <table style="width: 98%; height: 44px;" id="tblBusquedas">
            <tr>
                <td class="hdDirectorio" colspan="3">
                    SEARCH NAMES</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td align="center" class="style18">
                    <asp:TextBox ID="Busqueda" runat="server" TabIndex="100" Width="253px" 
                        CssClass="estiloEtiquetasA"></asp:TextBox>
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td align="center" class="style18">
                    
                    <asp:Repeater ID="gvEmpleados" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD2">
                                    <td colspan="6">
                                        <asp:Label ID="TagNo2" runat="server" 
                                            Text="STOP CARDS"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="estiloRptHD">
                                   <td align="left">
                                        <asp:Label ID="Label9" runat="server" Text="Nombre" Width="250px"></asp:Label>
                                        
                                                <td align="center">
                                                    <asp:Label ID="Label14" runat="server" Text="Sel." Width="50px"></asp:Label>
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
                                        <asp:Label ID="Nombre0" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Button ID="btnGuardar1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nombre")%>' CommandName="btnGuardar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre1" runat="server" Text='<%#Container.DataItem("Nombre")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                                                        <td>
                                        <asp:Button ID="btnGuardar2" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nombre")%>' CommandName="btnGuardar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:315px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo3" runat="server" Text="IT services"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18" align="center">
                    <asp:Button ID="btnClose" runat="server" CssClass="estiloRojo" Text="Close" 
                        Width="97px" TabIndex="101" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
