<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rTotales.aspx.vb" Inherits="rTotales" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            height: 17px;
        }
        .style24
        {
            height: 64px;
        }
        .auto-style1 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 527px;
        }
        .auto-style3 {
            background-color: #ffffff;
            color: #333333;
            font-weight: 700;
            font-size: small;
            text-indent: 3px;
            font-family: Verdana;
            width: 62px;
        }
        .auto-style4 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 183px;
        }
        .auto-style5 {
            background-color: #ffffff;
            color: #333333;
            font-weight: bold;
            font-size: 7pt;
            text-indent: 3px;
            height: 20px;
            font-family: Verdana;
            width: 263px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Totals of SOC Card by Categories</td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin ridge #808080; width: 100%;">
                        <tr>
                            <td class="auto-style3">
                                From:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                &nbsp;</td>
                            <td class="auto-style1">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                To:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                &nbsp;</td>
                            <td class="auto-style1">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td class="auto-style4">
                                <asp:Button ID="btnExport0" runat="server" CssClass="button" Text="Search" 
                                    Width="160px" />
                            </td>
                            <td class="auto-style5">
                                &nbsp;</td>
                            <td class="auto-style1">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style24">
                                <asp:Button ID="btnExport" runat="server" CssClass="buttonGreen" Text="by Crew" 
                                    Width="93px" />
                            &nbsp;&nbsp;&nbsp;<asp:Button ID="btnExport1" runat="server" CssClass="buttonGreen" Text="by Safety Observations" 
                                    Width="208px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnExport2" runat="server" 
                                    CssClass="buttonGreen" Text="by Department" 
                                    Width="170px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnExport3" runat="server" 
                                    CssClass="buttonGreen" Text="by Risks" 
                                    Width="180px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="style23">
                    <table style="border: thin ridge #808080; width: 700PX;">
                        <tr>
                            <td class="estiloRptHD2">
                                SOC Cards by Period:&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" CssClass="Identificadores"></asp:Label>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvResultados" runat="server" Width="559px">
                        <RowStyle BackColor="#E2E2E2" ForeColor="#333333" />
                        <FooterStyle BackColor="#333333" />
                        <HeaderStyle BackColor="#333333" Font-Names="Verdana" Font-Size="X-Small" 
                            ForeColor="White" />
                    </asp:GridView>
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