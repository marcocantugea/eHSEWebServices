<%@ Page Language="VB" EnableEventValidation="true" AutoEventWireup="false" CodeFile="NewStopCards.aspx.vb" Inherits="NewStopCards" %>

<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            width: 160px;
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
            width: 160px;
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
            width: 160px;
        }
    </style>
    </head>
<body class="estiloError">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:720px; top: 0px; left: 0px;">
            <tr>
                <td class="style1" colspan="3">
                    UPDATE SOC CARDS </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table style="border: thin ridge #808080; width: 508px;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="estiloEtiquetasA">
                                Status:</td>
                            <td class="style6">
                                <asp:DropDownList ID="dStatus" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="163px" TabIndex="500">
                                    <asp:ListItem Value="o">All</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                    <asp:ListItem>Open</asp:ListItem>
                                </asp:DropDownList>
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
                    <table style="border: thin solid #333333; width:500px;" cellpadding="0" 
                        cellspacing="0">
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                ID:</td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="lblId" runat="server" Height="15px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Name:</td>
                            <td class="estiloEtiquetasA">
                                <asp:Label ID="Nombre" runat="server" Height="15px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Date:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="Fecha" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="10" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Location:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="Ubicacion" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="276px" TabIndex="20"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Observation:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="Observacion" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="50px" Width="388px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Action:</td>
                            <td class="estiloEtiquetasA">
                                <asp:TextBox ID="Accion" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="50px" Width="388px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                A/C:</td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="dlAC" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="130px" TabIndex="50">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Act</asp:ListItem>
                                    <asp:ListItem>Condition</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                U/P:</td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="dlUP" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="130px" TabIndex="60">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Unsafe</asp:ListItem>
                                    <asp:ListItem Value="Positive Feedback">Positive Feedback</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Status:
                            </td>
                            <td class="estiloEtiquetasA">
                                <asp:DropDownList ID="dlStatus" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="130px" TabIndex="70">
                                    <asp:ListItem Value="Open">Open</asp:ListItem>
                                    <asp:ListItem Value="Closed">Closed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Department:</td>
                            <td class="estiloEtiquetasA">
                                            <asp:DropDownList ID="dlDpt" runat="server" AutoPostBack="True" 
                                                CssClass="estiloEtiquetasA" Width="130px" TabIndex="80">
                                            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Weekly Nominee:</td>
                            <td class="estiloEtiquetasA">
                                            <asp:CheckBox ID="cbWeek" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style23" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Monthy Nominee:</td>
                            <td class="estiloEtiquetasA">
                                            <asp:CheckBox ID="cbMonth" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                <div id="divBusqueda0" runat="server" class="estiloEtiquetasA" 
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    style="border: thin solid #37332F; position: absolute; top: 286px; left: 609px; height: 98px; width: 385px; visibility: visible;">
                                    <table id="tblBusquedas0" style="width: 98%; height: 44px;">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                <asp:Label ID="Label11" runat="server" Text="Delete SOC"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="estiloEtiquetasA">
                                                The Next SOC will be deleted:</td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="estiloEtiquetasA">
                                <asp:Label ID="lblId0" runat="server" Height="15px" style="font-size: 15pt"></asp:Label>
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="estiloEtiquetasA">
                                                You cannot undo this change. Are you really sure you want to delete this SOC?</td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                &nbsp;</td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnDeleteOK" runat="server" CssClass="Button2" TabIndex="101" 
                                                    Text="OK" Width="84px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnDeleteCancel" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Cancel" Width="84px" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                                </td>
                            <td class="estiloEti2">
                                <asp:Button ID="btnCancel" runat="server" CssClass="estiloRojo" Text="Cancel" 
                                    Width="102px" TabIndex="100" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="Button2" Text="Update" 
                                    Width="57px" TabIndex="90" />
                                &nbsp;&nbsp;&nbsp;
                                <div id="divBusqueda" runat="server" class="estiloEtiquetasA" 
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    style="border: thin solid #37332F; position: absolute; top: 112px; left: 204px; height: 98px; width: 388px; visibility: visible;">
                                    <table id="tblBusquedas" style="width: 98%; height: 44px;">
                                        <tr>
                                            <td class="estiloRptHD" colspan="3">
                                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="estiloEtiquetasA">
                                                to the follow receipient</td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style17">
                                                &nbsp;</td>
                                            <td align="center" class="style18">
                                                <asp:GridView ID="gvDestinatarios" runat="server" BackColor="White" 
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
                                            <td align="center" class="style18">
                                                <asp:Button ID="btnClose" runat="server" CssClass="estiloRojo" TabIndex="101" 
                                                    Text="Close" Width="97px" />
                                            </td>
                                            <td class="style19">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Button ID="btnUpdate0" runat="server" CssClass="ButtonVerde" Text="Send" 
                                    Width="56px" Enabled="False" TabIndex="150" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel0" runat="server" CssClass="estiloRojo" Text="Delete SOC" 
                                    Width="72px" TabIndex="100" Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
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
                                                    <asp:Label ID="Label1" runat="server" Text="ID" Width="50px"></asp:Label>
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
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="estiloEtiquetasA">
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                    &nbsp; Powered by <span class="style22">Johnny Rivers</span></td>
                <td class="estiloEtiquetasA">
                    <br />
                    <br />
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
