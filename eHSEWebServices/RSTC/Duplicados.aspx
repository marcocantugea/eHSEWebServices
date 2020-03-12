<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Duplicados.aspx.vb" Inherits="Duplicados" %>
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
        #Text1
        {
            font-weight: 700;
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
        .style23
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            text-align: left;
            width: 298px;
        }
        .style24
        {
            width: 298px;
        }
        .style25
        {
            width: 256px;
        }
        .style26
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            text-align: left;
            width: 70px;
        }
        .style28
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            text-align: left;
            width: 603px;
        }
    </style>
    </head>
<body class="estiloError">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:108px; top: 0px; left: 0px;">
            <tr>
                <td class="style1">
                    TARJETAS DUPLICADAS</td>
            </tr>
            <tr >
                <td align="left">
                    <table style="border: thin ridge #808080; width: 847px;">
                        <tr>
                            <td class="misEtiquetas">
                                Del:</td>
                            <td class="misEtiquetas">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style23">
                                &nbsp;</td>
                            <td class="style25">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="misEtiquetas">
                                A:</td>
                            <td class="misEtiquetas">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style23">
                                &nbsp;</td>
                            <td class="style25">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style26">
                                &nbsp;</td>
                            <td class="style5">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Buscar" 
                                    Width="135px" />
                            </td>
                            <td class="style24">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr >
                <td align="left">
                    <asp:Label ID="Mensajes" runat="server" CssClass="estiloEtiquetasTitulos" Text="Label" 
                        Width="850px" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:850px">
                <tr class="estiloRptHD2">
                                    <td >
                                        TARJETAS
                                        SOC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label 
                                            ID="RptTitle" runat="server" Font-Size="Small"></asp:Label>
                                    </td>
                </tr>
                </table>
                    <asp:Repeater ID="rptFiles" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD">
                                <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Nombre" Width="150px"></asp:Label>
                                <td align="left">
                                            <asp:Label ID="Label3" runat="server" Text="Date" Width="75px"></asp:Label>
                                            <td align="left">
                                                <asp:Label ID="Label5" runat="server" Text="Ubicación" Width="150px"></asp:Label>
                              <td align="center">
                                   <asp:Label ID="Label6" runat="server" Text="Observación" Width="250px"></asp:Label>
                              </td>
                              <td align="center">
                                   <asp:Label ID="Label4" runat="server" Text="Cant." Width="50px"></asp:Label>
                              </td>
                              <td align="center">
                                 <asp:Label ID="Label1" runat="server" Text="Sel." Width="80px"></asp:Label>
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
                                            Width="250px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Totales" runat="server" Text='<%#Container.DataItem("Totales")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton_")%>' CommandName="Detalle" 
                                            Text="Detalle" Width="80px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton")%>' CommandName="Borrar" 
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
                                            Width="250px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Totales" runat="server" Text='<%#Container.DataItem("Totales")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnGuardar" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton_")%>' CommandName="Detalle" 
                                            Text="Detalle" Width="80px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton")%>' CommandName="Borrar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:850px">
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
                <td>
                    &nbsp;<tr>
                <td class="style28">
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                    &nbsp; <div id="divBusqueda" 
                                    runat="server" class="estiloEtiquetasA" 
                                    
                                    
                                    
                        
                        
                        
                        
                        
                        
                        
                        
                        style="border: thin solid #37332F; position: absolute; top: 174px; left: 10px; height: 98px; width: 556px; visibility: visible;" 
                        visible="False">
                                    <table id="tblBusquedas" 
                                        style="border: thin ridge #808080; width: 98%; height: 44px;" bgcolor="#FFE4CA">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3" align="center">
                                                <asp:Button ID="btnClose" runat="server" CssClass="button1" TabIndex="101" 
                                                    Text="Cerrar" Width="129px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18" bgcolor="White">
                    <asp:Repeater ID="gvTarjetas" runat="server">
                        <HeaderTemplate>
                            <table>
                                
                                <tr class="estiloRptHD">
                                <td align="center">
                                                    <asp:Label ID="Label13" runat="server" Text="SOC ID" Width="75px"></asp:Label>
                                                </td>
                                   <td align="left">
                                        <asp:Label ID="Label10" runat="server" Text="Ubicacion" Width="150px"></asp:Label>
                                   </td>
                                   <td align="left">
                                            <asp:Label ID="Label11" runat="server" Text="Observacion" Width="200px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label12" runat="server" Text="Accion" Width="200px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label7" runat="server" Text="Hora" Width="80px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label14" runat="server" Text="PC" Width="80px"></asp:Label>
                                   </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" class="repeater">
                                <tr>
                                <td align="right">
                                        <asp:Label ID="Fecha1" runat="server" Text='<%#Container.DataItem("SOCID")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    
                                    <td align="left">
                                        <asp:Label ID="Ubicacion2" runat="server" Text='<%#Container.DataItem("Ubicacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Observacion2" runat="server" 
                                            Text='<%#Container.DataItem("Observacion")%>' Width="200px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Accion2" runat="server" 
                                            Text='<%#Container.DataItem("Accion")%>' Width="200px"></asp:Label>
                                    </td> 
                                    <td align="left">
                                        <asp:Label ID="Label15" runat="server" 
                                            Text='<%#Container.DataItem("Hora")%>' Width="80px"></asp:Label>
                                    </td> 
                                    <td align="left">
                                        <asp:Label ID="Label16" runat="server" 
                                            Text='<%#Container.DataItem("PC")%>' Width="80px"></asp:Label>
                                    </td>                             
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                <td align="right">
                                        <asp:Label ID="Fecha2" runat="server" Text='<%#Container.DataItem("SOCID")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    
                                    <td align="left">
                                        <asp:Label ID="Ubicacion3" runat="server" Text='<%#Container.DataItem("Ubicacion")%>' 
                                            Width="150px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Observacion3" runat="server" 
                                            Text='<%#Container.DataItem("Observacion")%>' Width="200px"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Accion3" runat="server" 
                                            Text='<%#Container.DataItem("Accion")%>' Width="200px"></asp:Label>
                                    </td>       
                                    <td align="left">
                                        <asp:Label ID="Label15" runat="server" 
                                            Text='<%#Container.DataItem("Hora")%>' Width="80px"></asp:Label>
                                    </td> 
                                    <td align="left">
                                        <asp:Label ID="Label16" runat="server" 
                                            Text='<%#Container.DataItem("PC")%>' Width="80px"></asp:Label>
                                    </td>                      
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center">
                                                &nbsp;</td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
            </tr>
        </table>
        &nbsp;</div>
    </form>
</body>
</html>