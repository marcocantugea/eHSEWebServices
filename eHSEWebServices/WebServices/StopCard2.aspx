<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StopCard.aspx.vb" Inherits="StopCard" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        .style10
        {
            width: 37px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server" style="font-family:Verdana; font-size:small ">
    <div style="font-family:Verdana; font-size:small ">
    
        <table style="width: 671px; font-family:Verdana; font-size:small" border="0">
        <tr>
        <td class="style3">
        
            STOP CARDS - TARJETAS STOP<br />
            </td>
        </tr>
            <tr>
                <td class="style2">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="style16">
                                Crew:</td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="dlCrews" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="144px" AutoPostBack="True" TabIndex="5">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                    <asp:ListItem>G</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="estiloEtiquetasA">
                                Week:</td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="Semana" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Name:</td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="txtName" runat="server" CssClass="estiloEtiquetasA" 
                                    TabIndex="9">
                                </asp:DropDownList>
                                <asp:Button ID="Button1" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="17px" Text=".." />
                            </td>
                            <td class="estiloEtiquetasA">
                                Date:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
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
                            <td>
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
                                Action Require/<br />
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
                            <td class="style10">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    Text="Unsafe Action / Acto Inseguro" TabIndex="40" />
                            </td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox6" runat="server" 
                                    Text="Unsafe Condition / Condición Inseguro" TabIndex="46" />
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="PPE / EPP" TabIndex="41" />
                            </td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox7" runat="server" 
                                    Text="Procedures / Procedimientos" TabIndex="47" />
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox3" runat="server" 
                                    Text="Body Position/Posición de la gente" TabIndex="42" />
                            </td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox8" runat="server" 
                                    Text="Tools &amp; Equip. / Herramientas y Equipos" TabIndex="48" />
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox4" runat="server" 
                                    Text="Housekeeping / Orden y Limpieza" TabIndex="44" />
                            </td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox9" runat="server" 
                                    Text="Safe/ Positive Observation / Observación Positiva / Segura" 
                                    TabIndex="49" />
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="estiloEtiquetasA">
                                <asp:CheckBox ID="CheckBox5" runat="server" Text="Other / Otros" 
                                    TabIndex="45" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="lblRespuesta" runat="server" CssClass="normalBold"></asp:Label>
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
            </table>
    
    </div>
    <div id="divBusqueda" runat=server style="border: thin solid #37332F; position: absolute; top: 66px; left: 172px; height: 98px; width: 385px; visibility: visible;" 
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
                    <asp:GridView ID="gvEmpleados" runat="server" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        Font-Names="Verdana" Font-Size="7pt" ForeColor="#333333" Height="16px" 
                        Width="250px">
                        <RowStyle ForeColor="#000066" />
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style18" align="center">
                    <asp:Button ID="btnClose" runat="server" CssClass="estiloRojo" Text="Close" 
                        Width="97px" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
