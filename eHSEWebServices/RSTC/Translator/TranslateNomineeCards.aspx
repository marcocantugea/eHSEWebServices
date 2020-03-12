<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TranslateNomineeCards.aspx.vb" Inherits="Translator_TranslateNomineeCards" %>
<link href="../Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Translate Nominee Cards</title>
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
            font-size: small;
            text-indent: 3px;
            height: 20px;
            width: 160px;
        }
        .style3
        {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: small;
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
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            width: 160px;
            padding-bottom: 5px
        }
        .auto-style1 {
            width: 160px;
        }
        .auto-style2 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            width: 198px;
            padding-bottom: 5px;
        }
        .auto-style3 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: small;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 198px;
        }
        .auto-style4 {
            background-color: #e2dfdf;
            color: #333333;
            font-weight: bold;
            font-size: small;
            text-indent: 3px;
            height: 20px;
            width: 198px;
        }
    </style>
    </head>
<body class="estiloError">
    <form id="form1" runat="server">
    <div>
    
        <table style="width:720px; top: 0px; left: 0px;">
            <tr>
                <td class="style1">
                    TRANSLATION OF THE SOC CARDS </td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin ridge #808080; width: 100%;">
                        <tr>
                            <td class="style23">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="style23" rowspan="2">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Search" 
                                    Width="119px" Height="50px" />
                            </td>
                            <td class="style23">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                To:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateA" runat="server" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin solid #333333; width:100%;" cellpadding="0" 
                        cellspacing="0">
                        <tr>
                            <td class="auto-style2" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                ID:</td>
                            <td class="style23">
                                <asp:Label ID="lblId" runat="server" Height="15px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Name:</td>
                            <td class="style23">
                                <asp:Label ID="Nombre" runat="server" Height="15px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Date:</td>
                            <td class="style23">
                                <asp:TextBox ID="Fecha" runat="server" 
                                    Height="19px" Width="168px" TabIndex="10" 
                                    ToolTip="Date must be in MM/dd/YYY Format"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Location:</td>
                            <td class="style23">
                                <asp:TextBox ID="Ubicacion" runat="server" 
                                    Height="44px" Width="620px" TabIndex="20" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Observation:</td>
                            <td class="style23">
                                <asp:TextBox ID="Observacion" runat="server" 
                                    Height="60px" Width="620px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" 
                                
                                
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                What was the concern</td>
                            <td class="style23">
                                <asp:TextBox ID="tSituation" runat="server" 
                                    Height="50px" Width="620px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                Action:</td>
                            <td class="style23">
                                <asp:TextBox ID="Accion" runat="server" 
                                    Height="60px" Width="620px" TextMode="MultiLine" TabIndex="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                What can be done to mitigate this risk?</td>
                            <td class="style23">
                                <asp:TextBox ID="tMinimize" runat="server" 
                                    Height="50px" Width="620px" TextMode="MultiLine" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" 
                                
                                style="border-right-style: solid; border-right-width: thin; border-right-color: #333333">
                                &nbsp;</td>
                            <td class="estiloEti2">
                                <asp:Button ID="btnCancel" runat="server" CssClass="button1" Text="Cancel" 
                                    Width="102px" TabIndex="100" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="button" Text="Update" 
                                    Width="105px" TabIndex="90" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
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
            </tr>
            <tr>
                <td class="style23">
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                    &nbsp; </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>