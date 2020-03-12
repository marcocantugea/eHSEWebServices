<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" %>

<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stop Card Had Been Sent</title>
    <style type="text/css">
        .style2
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: x-small;            
    }
        .style3
        {
            height: 25px;
        }
        .style5
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            font-family: Verdana;
            width: 329px;
            height: 12px;
        }
        .style6
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: x-small;
            width: 329px;
            height: 45px;
        }
        .style10
        {
            background-color: #333333;
            color: #FFF;
            font-weight: bold;
            font-size: small;
            height: 24px;
        }
        .style15
        {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            width: 329px;
        }
        .style16
        {
            width: 329px;
        }
        .style17
        {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            width: 316px;
            height: 26px;
        }
        .style18
        {
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            width: 329px;
            height: 26px;
        }
        .Button2 {}
    </style>
</head>
<body class="estiloError ">
    <form id="form1" runat="server">
    <div align="CENTER" style="height: 386px">
    
        <table style="width: 337px; height: 557px;" border="0">
        <tr>
        <td class="style10">
        
            Workers Management</td>
        </tr>
        <tr>
        <td align="center">
        
                    <table style="border: thin solid #333333; height: 174px; width: 341px;" cellpadding="3" 
                        cellspacing="3" class="normalBold">
                        <tr>
                            <td class="style15">
                                <asp:Label ID="lblId" runat="server" Height="15px" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                Name:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:TextBox ID="Nombre" runat="server" CssClass="normalBold" 
                                    Height="19px" Width="280px" TabIndex="10" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Crew:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:DropDownList ID="ddCrew" runat="server" CssClass="normalBold" 
                                    Width="280px" TabIndex="20">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                    <asp:ListItem>G</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                    <asp:ListItem>PEMEX/3rd Party</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Position: </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:TextBox ID="Posicion" runat="server" CssClass="normalBold" 
                                    Height="19px" Width="280px" TabIndex="30" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Department:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                            <asp:DropDownList ID="dlDpt" runat="server" 
                                                CssClass="normalBold" Width="280px" TabIndex="40">
                                            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Company:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:DropDownList ID="ddEmpresa" runat="server" CssClass="normalBold" 
                                    Width="280px" TabIndex="50">
                                </asp:DropDownList>
                                <asp:Button ID="btnAddNacion0" runat="server" CssClass="ButtonVerde" Text="( + )" 
                                    Width="32px" TabIndex="800" Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Sex:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:DropDownList ID="ddSexo" runat="server" CssClass="normalBold" 
                                    Width="280px" TabIndex="60">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Man</asp:ListItem>
                                    <asp:ListItem>Woman</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                Nacionality:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:DropDownList ID="ddNacionalidad" runat="server" CssClass="normalBold" 
                                    Width="280px" TabIndex="70">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnAddNacion" runat="server" CssClass="ButtonVerde" Text="( + )" 
                                    Width="32px" TabIndex="900" Visible="False" />
                                </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                Birth Date:</td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:TextBox ID="Nacimiento" runat="server" CssClass="normalBold" 
                                    Height="19px" Width="280px" TabIndex="80" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style18">
                                Active: <asp:CheckBox ID="cbActive" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="style5">
                                
                                </td>
                        </tr>
                        <tr>
                            <td class="style6" 
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                <asp:Button ID="btnCancel" runat="server" CssClass="button1" Text="Cancel" 
                                    Width="102px" TabIndex="100" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="button" Text="Save" 
                                    Width="77px" TabIndex="90" />
                                
                                &nbsp;&nbsp;&nbsp;
                                
                                <asp:Button ID="Modify" runat="server" CssClass="buttonGreen" Text="Modify" 
                                    Width="76px" TabIndex="90" />
                                    <div id="divPais" runat=server style="border: thin solid #37332F; position: absolute; left: 59%; top: 87%; height: 98px; width: 385px; visibility: visible;" 
        class="estiloEtiquetasA">
        <table style="width: 98%; height: 44px;" id="tblBusquedas3">
            <tr>
                <td class="style2" colspan="3">
                    ADD, MODIFY OR DELETE COUNTRYdas3">
            <tr>
                <td class="style2" colspan="3">
                    ADD, MODIFY OR DELETE COUNTRY</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="lPais_ID" runat="server" Visible="False"></asp:Label>
                                <asp:Button ID="bPaisNew" runat="server" CssClass="Button2" Text="+" 
                                    Width="27px" TabIndex="140" />
                &nbsp;<asp:TextBox ID="tPaisNombre" runat="server" TabIndex="100" Width="253px" 
                        CssClass="estiloEtiquetasA"></asp:TextBox>
                                <asp:Button ID="bPaisSave" runat="server" CssClass="Button2" Text="Save" 
                                    Width="42px" TabIndex="140" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    
                    <asp:Repeater ID="gvPais" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD2">
                                    <td colspan="6">
                                        <asp:Label ID="TagNo6" runat="server" 
                                            Text="COUNTRIES"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="estiloRptHD">
                                   <td align="left">
                                        <asp:Label ID="Label17" runat="server" Text="Name" Width="250px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label18" runat="server" Text="Sel." Width="50px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label19" runat="server" Text="Del" Width="50px"></asp:Label>
                                   </td>
                                 </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" class="repeater">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre4" runat="server" Text='<%#Container.DataItem("Nac_Desc")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Button ID="btnGuardar5" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nac_ID")%>' CommandName="seleccionar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nac_ID")%>' CommandName="Borrar" 
                                            Text="Delete" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre5" runat="server" Text='<%#Container.DataItem("Nac_Desc")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                                                        <td>
                                        <asp:Button ID="btnGuardar6" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nac_ID")%>' CommandName="seleccionar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button3" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nac_ID")%>' CommandName="Borrar" 
                                            Text="Delete" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:370px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo7" runat="server" Text="IT services"></asp:Label>
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
                    <asp:Button ID="btnPaisCerrar" runat="server" CssClass="estiloRojo" Text="Close" 
                        Width="97px" TabIndex="101" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="divCompany" runat=server style="border: 6px solid #2580A2; position: absolute; left: 2%; top: 107%; height: 98px; width: 385px; visibility: visible;" 
        class="estiloEtiquetasA">
        <table style="width: 98%; height: 44px;" id="tblBusquedas1">
            <tr>
                <td class="style2" colspan="3">
                    ADD, MODIFY OR DELETE COMPANY</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="lCompany_Id" runat="server" Visible="False"></asp:Label>
                                <asp:Button ID="bNewCompany" runat="server" CssClass="Button2" Text="+" 
                                    Width="27px" TabIndex="140" />
                &nbsp;<asp:TextBox ID="tNombreCompania" runat="server" TabIndex="100" Width="253px" 
                        CssClass="estiloEtiquetasA"></asp:TextBox>
                                <asp:Button ID="btnUpdate2" runat="server" CssClass="Button2" Text="Save" 
                                    Width="42px" TabIndex="140" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td align="center" class="style18">
                    
                    <asp:Repeater ID="gvCompanies" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr class="estiloRptHD2">
                                    <td colspan="6">
                                        <asp:Label ID="TagNo4" runat="server" 
                                            Text="COMPANIES"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="estiloRptHD">
                                   <td align="left">
                                        <asp:Label ID="Label15" runat="server" Text="Name" Width="250px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label16" runat="server" Text="Sel." Width="50px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label1" runat="server" Text="Del" Width="50px"></asp:Label>
                                   </td>
                                 </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table border="0" class="repeater">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre2" runat="server" Text='<%#Container.DataItem("Empresa_Desc")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                    
                                    <td>
                                        <asp:Button ID="btnGuardar3" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Empresa_ID")%>' CommandName="seleccionar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Empresa_ID")%>' CommandName="Borrar" 
                                            Text="Delete" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <table border="0" class="repeaterAlterno">
                                <tr>
                                    <td>
                                        <asp:Label ID="Nombre3" runat="server" Text='<%#Container.DataItem("Empresa_Desc")%>' 
                                            Width="250px"></asp:Label>
                                    </td>
                                                                        <td>
                                        <asp:Button ID="btnGuardar4" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Empresa_ID")%>' CommandName="seleccionar" 
                                            Text="&#94;" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Empresa_ID")%>' CommandName="Borrar" 
                                            Text="Delete" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:370px">
                                <tr class="estiloRptHD">
                                    <td align="center" colspan="6">
                                        <asp:Label ID="TagNo5" runat="server" Text="IT services"></asp:Label>
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
                    <asp:Button ID="btnClose1" runat="server" CssClass="estiloRojo" Text="Close" 
                        Width="97px" TabIndex="101" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="divBusqueda0" runat=server style="border: thin solid #37332F; position: absolute; left: 59%; top: 22%; height: 100%; width: 750px; visibility: visible;" 
        class="estiloEtiquetasA">
        <table style="width: 725px; height: 44px;" id="tblBusquedas0">
            <tr>
                <td class="style2" colspan="3">
                    SEARCH NAMES</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td align="center" class="style18">
                    <asp:TextBox ID="Busqueda" runat="server" TabIndex="100" Width="253px" 
                        CssClass="estiloEtiquetasA"></asp:TextBox>
                                <asp:Button ID="btnUpdate1" runat="server" CssClass="button" Text="Search" 
                                    Width="114px" TabIndex="100" />
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
                                        <asp:Label ID="Label9" runat="server" Text="Name" Width="250px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="Crew" Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label3" runat="server" Text="Position" Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label4" runat="server" Text="Dpt." Width="80px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label10" runat="server" Text="Cards" Width="50px"></asp:Label>
                                   </td>                                             
                                   <td align="center">
                                        <asp:Label ID="Label14" runat="server" Text="Sel." Width="50px"></asp:Label>
                                   </td>
                                    <td align="center">
                                        <asp:Label ID="Label19" runat="server" Text="Del" Width="50px"></asp:Label>
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
                                    <td align="left">
                                        <asp:Label ID="Label12" runat="server" Text='<%#Container.DataItem("Crew")%>' Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label13" runat="server" Text='<%#Container.DataItem("Puesto")%>' Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label14" runat="server" Text='<%#Container.DataItem("Desc")%>' Width="80px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label11" runat="server" Text='<%#Container.DataItem("Tarjetas")%>' Width="50px" Font-Bold="True" Font-Italic="True" ForeColor="#007100"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:Button ID="btnGuardar1" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nombre")%>' CommandName="seleccionar" 
                                            Text="Select" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Empleado_ID")%>' CommandName="Borrar" 
                                            Text="Delete" Width="50px" />
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
                                    <td align="left">
                                        <asp:Label ID="Label12" runat="server" Text='<%#Container.DataItem("Crew")%>' Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label13" runat="server" Text='<%#Container.DataItem("Puesto")%>' Width="100px"></asp:Label>
                                   </td>
                                   <td align="left">
                                        <asp:Label ID="Label14" runat="server" Text='<%#Container.DataItem("Desc")%>' Width="80px"></asp:Label>
                                   </td>
                                   <td align="center">
                                        <asp:Label ID="Label11" runat="server" Text='<%#Container.DataItem("Tarjetas")%>' Width="50px" Font-Bold="True" Font-Italic="True" ForeColor="#007100"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:Button ID="btnGuardar2" runat="server" 
                                            CommandArgument='<%#Container.DataItem("Nombre")%>' CommandName="seleccionar" 
                                            Text="Select" Width="50px" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" CommandArgument='<%#Container.DataItem("Empleado_ID")%>' CommandName="Borrar" Text="Delete" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <table style="width:735px">
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
                    <asp:Button ID="btnClose0" runat="server" CssClass="button1" Text="Close" 
                        Width="97px" TabIndex="101" />
                </td>
                <td class="style19">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="divEmpleadoEliminar" runat="server" class="estiloEtiquetasA" 
                                
                                    
                                    
                                        
                                        
                                        style="background-color:#dfdfdf; border: 4PX solid #770000; position: absolute; left: 7%; top:52%; height: 98px; width: 385px; visibility: visible;">
                                    <table id="tblBusquedas5" style="width: 98%; height: 44px;">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                ¿Are you sure you want Delete this Employe?</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnClose4" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Cancel" Width="75px" />
                                                &nbsp;&nbsp;
                                <asp:Button ID="bYes0" runat="server" CssClass="Button2" Text="Yes" 
                                    Width="73px" TabIndex="140" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
    <div id="divPaisEliminar" runat="server" class="estiloEtiquetasA" 
                                
                                    
                                    
                                        
                                        
                                    style="background-color:#dfdfdf; border: 4PX solid #770000; position: absolute; left: -1%; top:21%; height: 98px; width: 385px; visibility: visible;">
                                    <table id="tblBusquedas4" style="width: 98%; height: 44px;">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                ¿Are you sure you want Delete this Country?</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnClose3" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Cancel" Width="75px" />
                                                &nbsp;&nbsp;
                                <asp:Button ID="bYes" runat="server" CssClass="Button2" Text="Yes" 
                                    Width="73px" TabIndex="140" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
    <div id="divEliminarCompany" runat="server" class="estiloEtiquetasA" 
                                
                                    
                                    
                                    style="background-color:#dfdfdf; border: 4PX solid #770000; position: absolute; left: -1%; top: 34%; height: 98px; width: 385px; visibility: visible;">
                                    <table id="tblBusquedas2" style="width: 98%; height: 44px;">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                ¿Are you sure you want Delete this Company?</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnClose2" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Cancel" Width="75px" />
                                            &nbsp;&nbsp;
                                <asp:Button ID="btnUpdate3" runat="server" CssClass="Button2" Text="Yes" 
                                    Width="73px" TabIndex="140" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
        <td class="style3">
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        </table>
    
    </div>
    </form>
</body>
</html>