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
            font-size: 8pt;
            text-indent: 3px;
            height: 20px;
            width: 150px;
        }
        .style16
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 8pt;
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
        .style22
        {
            color: #800000;
            font-style: italic;
            font-family: Aharoni;
            font-size: xx-small;
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
            width: 184px;
        }
        .auto-style2 {
            height: 116px;
        }
        .auto-style3 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 8pt;
            text-indent: 3px;
            height: 20px;
            width: 81px;
        }
        .auto-style4 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 8pt;
            text-indent: 3px;
            height: 20px;
            width: 91px;
        }
        .auto-style6 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 8pt;
            text-indent: 3px;
            height: 20px;
            width: 209px;
        }
        .auto-style8 {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: x-small;
            text-indent: 3px;
            padding: 0px 0px 0px 5px;
            height: 40px;
            width: 686px;
        }
        .auto-style9 {
            width: 686px;
        }
        .auto-style10 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 8pt;
            text-indent: 3px;
            height: 20px;
            width: 220px;
        }
        .auto-style11 {
            width: 220px;
            height: 28px;
        }
        .auto-style12 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 220px;
        }
    </style>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
</head>
<body style="margin:0px 0px 0px 0px;font-family: verdana; font-size: x-small; font-weight: bold; font-style: italic; font-variant: normal; color: #990000">
    <form  id="form1" runat="server" style="font-family:Verdana; font-size:small ">
    <div style="font-family:Verdana; font-size:small ">
    
        <table style="width: 671px; font-family:Verdana; font-size:small" border="0" 
            align="center">
        <tr>
        <td class="auto-style8">
        
            SOC CARDS - TARJETAS DE OBSERVACIÓN<br />
            </td>
        </tr>
            <tr>
                <td class="auto-style9">
                 <div id="div1" runat=server style="border: thin solid #37332F; position: fixed; top: 131px; left: 806px; height: 150px; width: 385px; visibility: visible;" 
        class="estiloEtiquetasA" visible="False">
                     <table width="100%">
                         <tr>
                             <td class="auto-style2">
                                 <asp:Label ID="Label2" runat="server" Text="Label" CssClass="estiloRespuesta"></asp:Label>
                             </td>
                         </tr>
                         <tr align="center">
                             <td>
                                 <asp:Button ID="Button1" runat="server" Text="Close" CssClass="button2" />
                             </td>
                         </tr>
                     </table>          
    </div>   
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="auto-style6">
                                Name / Nombre:</td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="txtName" runat="server" CssClass="style15" 
                                    TabIndex="9" Width="280px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style3">
                                Week:</td>
                            <td class="auto-style4">
                                <asp:Label ID="Semana" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                Date / Fecha:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="style15" 
                                    Height="19px" Width="168px" TabIndex="500" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style3">
                                IP:</td>
                            <td class="auto-style4">
                                <asp:Label ID="lblIP" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="auto-style6">
                                Location/Locación:
                                </td>
                            <td class="style15">
                                <asp:TextBox ID="txtUbica" runat="server" CssClass="style15" 
                                    Height="19px" Width="276px" TabIndex="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                Observation/<br />
                                Observación:</td>
                            <td class="style15">
                                <asp:TextBox ID="txtObserva" runat="server" CssClass="style15" 
                                    Height="40px" Width="451px" TextMode="MultiLine" TabIndex="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                Was this an unsafe act? /<br />
                                ¿Fué un acto inseguro?:</td>
                            <td class="style15">
                                <asp:RadioButtonList ID="rbAct" runat="server" Font-Overline="False" 
                                    Width="426px" CssClass="style15" Font-Bold="False" TabIndex="30" 
                                    Height="16px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="True">Yes / Si</asp:ListItem>
                                    <asp:ListItem Value="False">NO</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                What was the concern / <br />
                                ¿Cual fué la situación?:</td>
                            <td class="style15">
                                <asp:TextBox ID="tConcern" runat="server" CssClass="style15" 
                                    Height="40px" Width="451px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                Did you STOP the job?/
                                <br />
                                ¿DETUVO usted el trabajo?:</td>
                            <td class="style15">
                                <asp:RadioButtonList ID="rbWorkStop" runat="server" Font-Overline="False" 
                                    Width="426px" CssClass="style15" Font-Bold="False" TabIndex="50" 
                                    Height="16px" RepeatDirection="Horizontal">
                                     <asp:ListItem Value="True">Yes / Si</asp:ListItem>
                                    <asp:ListItem Value="False">NO</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="hdDirectorio" colspan="3">
                                JOB RISKS OBSERVED / RIESGOS DEL TRABAJO OBSERVADOS<br />
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2" class="estiloEtiquetasA ">
                                <asp:RadioButtonList ID="rbList" runat="server" Font-Overline="False" 
                                    Width="326px" CssClass="estiloEtiquetasA" Font-Bold="False" TabIndex="60" 
                                    Height="16px" AutoPostBack="True">
                                    <asp:ListItem Value="Radio1">PPE /EPP</asp:ListItem>
                                    <asp:ListItem Value="Radio2">Pinch Points/Atrapamiento</asp:ListItem>
                                    <asp:ListItem Value="Radio3">Body Position /Posición del Cuerpo</asp:ListItem>
                                    <asp:ListItem Value="Radio4">Poor Planning/Pobre Planeación</asp:ListItem>
                                    <asp:ListItem Value="Radio5">No Barriers/Sin Barreras</asp:ListItem>
                                    <asp:ListItem Value="Radio6">Toxic Environment/Ambiente Toxico</asp:ListItem>
                                    <asp:ListItem Value="Radio7">Crane Work/Trabajo con Grúa</asp:ListItem>
                                    <asp:ListItem Value="Radio8">Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbList2" runat="server" Font-Overline="False" 
                                    Width="326px" CssClass="style15" Font-Bold="False" TabIndex="60" 
                                    Height="16px" AutoPostBack="True">
                                    <asp:ListItem Value="Radio1">Slips/Falls / Resbalón/Caidas</asp:ListItem>
                                    <asp:ListItem Value="Radio2">PTW not in Place / Sin PTD en Sitio</asp:ListItem>
                                    <asp:ListItem Value="Radio3">Communication/Comunicación</asp:ListItem>
                                    <asp:ListItem Value="Radio4">Weather/Condición Meteorológica</asp:ListItem>
                                    <asp:ListItem Value="Radio5">High Pressure/Alta Presión</asp:ListItem>
                                    <asp:ListItem Value="Radio6">Chemicals / Quimicos</asp:ListItem>
                                    <asp:ListItem Value="Radio7">Welding / Soldadura</asp:ListItem>
                                    <asp:ListItem Value="Radio8">Safe/Positive Observation /Observación Positiva</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="auto-style10">
                                Action Taken/<br />
                                Acción Tomada:</td>
                            <td class="style15">
                                <asp:TextBox ID="txtAccion" runat="server" CssClass="style15" 
                                    Height="40px" Width="451px" TextMode="MultiLine" TabIndex="70"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                What can be done to mitigate this risk? / ¿Qué se puede hacer para minimizar este riesgo?:</td>
                            <td class="style15">
                                <asp:TextBox ID="tMinimize" runat="server" CssClass="style15" 
                                    Height="40px" Width="451px" TextMode="MultiLine" TabIndex="80"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                You inform the Supervisor? / ¿Informó al Supervisor?:</td>
                            <td class="style15">
                                <asp:RadioButtonList ID="rbSuper" runat="server" Font-Overline="False" 
                                    Width="426px" CssClass="style15" Font-Bold="False" TabIndex="90" 
                                    Height="16px" RepeatDirection="Horizontal">
                                     <asp:ListItem Value="True">Yes / Si</asp:ListItem>
                                    <asp:ListItem Value="False" Selected="True">NO</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                </td>
                            <td class="style24">
                                <asp:Label ID="lblRespuesta" runat="server" CssClass="normalBold"></asp:Label>
                                <asp:Label ID="lblId" runat="server" Height="15px" Visible="False"></asp:Label>
                                <asp:Button ID="btnPhoneSrc" runat="server" Text="Save / Guardar" CssClass="Button2" 
                                    Height="25px" Width="129px" TabIndex="100"/>                                 
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style12">
                                Powered by Juan Luis Rios ©</td>
                            <td class="style26">
                                </td>
                            <td>
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align=center class="auto-style9">
                
                    <asp:Repeater ID="rptSOCss" runat="server" Visible="False">
                        <HeaderTemplate>
                            <table border="0">
                            <tr>
                                   <td colspan="2" align="left" class="estiloRptHD2" width="550px">
                                        <asp:Label ID="Label1" runat="server" Text="OBSERVATIONS OF THIS WEEK" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                   <td align="left" class="hdDirectorio" width="200px">
                                        <asp:Label ID="lblDesc" runat="server" Text="Location" ></asp:Label>
                                    </td>
                                    <td align="left" class="hdDirectorio" width="350px">
                                        <asp:Label ID="lblExt" runat="server" Text="Observation"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0">
                                <tr>
                                    <td align="left" class="repeater" >
                                        <asp:Label ID="Desc" runat="server" width="200px"
                                            Text='<%#Container.DataItem("Ubicacion")%>' ></asp:Label>
                                    </td>
                                    <td align="left" class="repeater">
                                        <asp:Label ID="Ext" runat="server" width="350px"
                                            Text='<%#Container.DataItem("Observacion")%>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0">
                                <tr>
                                    <td align="left" class="repeater" >
                                        <asp:Label ID="Desc" runat="server" width="200px"
                                            Text='<%#Container.DataItem("Ubicacion")%>' ></asp:Label>
                                    </td>
                                    <td align="left" class="repeater" >
                                        <asp:Label ID="Ext" runat="server" width="350px"
                                            Text='<%#Container.DataItem("Observacion")%>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                
                </td>
            </tr>
            </table>
    
    </div>
    <div id="divBusqueda" runat=server style="border: thin solid #37332F; height: 98px; width: 385px; visibility: visible;" 
        class="estiloEtiquetasA" visible="False">
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
