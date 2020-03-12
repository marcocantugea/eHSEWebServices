<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SOC - Summary.aspx.vb" Inherits="SOC___Summary" %>

<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SOC Cards || SUMARY</title>
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
        .style23
        {
            height: 79px;
        }
        .style24
        {
            width: 494px;
        }
        .style25
        {
            font-weight: normal;
        }
        .auto-style1 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 256px;
        }
        .auto-style2 {
            width: 245px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    WORKERS PARTICIPATION&nbsp;&nbsp;&nbsp;&nbsp;
                                <div id="divBusqueda" 
                                    runat="server" class="estiloEtiquetasA" 
                                    
                                    
                                    
                        
                        
                        
                        
                        
                        style="border: thin solid #37332F; position: absolute; top: 158px; left: 11px; height: 98px; width: 556px; visibility: visible;">
                                    <table id="tblBusquedas" 
                                        style="border: thin ridge #808080; width: 98%; height: 44px;" bgcolor="#FFE4CA">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                <asp:Label 
                                            ID="Nombre" runat="server" Font-Size="X-Small"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="estiloEtiquetasA">
                                                <table class="estiloRptHD2" style="width:100%;">
                                                    <tr>
                                                        <td class="style25">
                                                            Position:</td>
                                                        <td class="auto-style2">
                                                            <asp:Label 
                                            ID="Position" runat="server" Font-Size="X-Small" style="font-size: 8pt"></asp:Label>
                                                        </td>
                                                        <td rowspan="4">
                                                            <asp:Image ID="Image1" runat="server" Height="110px" Width="99px" />
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style25">
                                                            Department:</td>
                                                        <td class="auto-style2">
                                                            <asp:Label 
                                            ID="Department" runat="server" Font-Size="X-Small" style="font-size: 8pt"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style25">
                                                            Crew:</td>
                                                        <td class="auto-style2">
                                                            <asp:Label 
                                            ID="Crew" runat="server" Font-Size="X-Small" style="font-size: 8pt"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style25">
                                                            Company:</td>
                                                        <td class="auto-style2">
                                                            <asp:Label 
                                            ID="Company" runat="server" Font-Size="X-Small" style="font-size: 8pt"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
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
                                                    <asp:Label ID="Label9" runat="server" Text="Fecha" Width="75px"></asp:Label>
                                                </td>
                                   <td align="left">
                                        <asp:Label ID="Label10" runat="server" Text="Ubicacion" Width="150px"></asp:Label>
                                        <td align="left">
                                            <asp:Label ID="Label11" runat="server" Text="Observacion" Width="200px"></asp:Label>
                                            <td align="left">
                                                <asp:Label ID="Label12" runat="server" Text="Accion" Width="200px"></asp:Label>
                                               
                                            </td>
                                        </td>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" class="repeater">
                                <tr>
                                <td align="right">
                                        <asp:Label ID="Fecha1" runat="server" Text='<%#Container.DataItem("Fecha")%>' 
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
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                <td align="right">
                                        <asp:Label ID="Fecha1" runat="server" Text='<%#Container.DataItem("Fecha")%>' 
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
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnClose" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Close" Width="97px" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
            </tr>
            <tr>
                <td class="style23">
                    <table style="border: thin ridge #808080; width: 655px;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="auto-style1">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style7">
                                To:</td>
                            <td class="style6">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                Department:</td>
                            <td class="auto-style1">
                                <asp:DropDownList ID="dDpt" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="163px">
                                </asp:DropDownList>
                            </td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                &nbsp;</td>
                            <td class="auto-style1">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Search by Day" 
                                    Width="146px" />
                            &nbsp;&nbsp;&nbsp;
                                </td>
                            <td class="style7">
                                <asp:Button ID="btnTotal" runat="server" CssClass="button" Text="SOC Total" 
                                    Width="127px" />
                            </td>
                            <td class="style6">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:612px">
                <tr class="estiloRptHD2">
                                    <td >
                                        &nbsp;SOC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                                            ID="Label7" runat="server" Font-Size="Small"></asp:Label>
                                        &nbsp;<br />
                                        &nbsp;Crew without Participation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                                            ID="RptNull" runat="server" Font-Size="Small"></asp:Label>
                                    &nbsp;of&nbsp;
                                        <asp:Label 
                                            ID="CrewTotal" runat="server" Font-Size="Small"></asp:Label>
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
                                                    <asp:Label ID="Label1" runat="server" Text="ID" Width="50px"></asp:Label>
                                                </td>
                                   <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Date" Width="75px"></asp:Label>
                                        <td align="left">
                                            <asp:Label ID="Label3" runat="server" Text="Name" Width="350px"></asp:Label>
                                            <td align="left">
                                                <asp:Label ID="Label5" runat="server" Text="Qty" Width="50px"></asp:Label>
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
                                <td align="center">
                                        <asp:Label ID="Idi" runat="server" Text='<%#Container.DataItem("Idi")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Label ID="Fecha" runat="server" Text='<%#Container.DataItem("Fecha")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre0" runat="server" 
                                            Text='<%#Container.DataItem("Nombre")%>' Width="350px"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="Cantidad" runat="server" 
                                            Text='<%#Container.DataItem("Qty")%>' Width="50px"></asp:Label>
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
                                <td align="center">
                                        <asp:Label ID="Idi0" runat="server" Text='<%#Container.DataItem("Idi")%>' 
                                            Width="50px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Label ID="Fecha0" runat="server" Text='<%#Container.DataItem("Fecha")%>' 
                                            Width="75px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Nombre1" runat="server" 
                                            Text='<%#Container.DataItem("Nombre")%>' Width="350px"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="Cantidad0" runat="server" 
                                            Text='<%#Container.DataItem("Qty")%>' Width="50px"></asp:Label>
                                    </td>
                                                                        <td>
                                        <asp:Button ID="btnGuardar1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Boton")%>' CommandName="btnGuardar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td class="estiloEtiquetasA">
                                <br /></td>
            </tr>
        </table>
        &nbsp;</div>
    </form>
</body>
</html>

