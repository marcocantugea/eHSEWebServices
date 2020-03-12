<%@ Page Language="VB" Debug="true"  AutoEventWireup="false" CodeFile="rReporteo.aspx.vb" Inherits="rReporteo" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Tracking a SOC</title>
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
            width: 431px;
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
            width: 95px;
        }
        .style24
        {
            width: 556px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%; height: 384px;">
            <tr>
                <td class="style1">
                    SOC - STADISTICS </td>
            </tr>
            <tr>
                <td>
                    <table style="border: thin ridge #808080; width: 100%;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500">5/1/2013</asp:TextBox>
                            </td>
                            <td class="estiloEtiquetasA">
                                To:</td>
                            <td class="style6">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500">6/28/2013</asp:TextBox>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td>
                <table style="width:100%; height: 8px;">
                <tr class="estiloRptHD2">
                                    <td >
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        TOTAL SOC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                                            ID="Label7" runat="server" style="font-size: x-small; color: #FFFFFF"></asp:Label>
                                    </td>
                </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td class="style23" valign=top>
                                <table style="border: thin ridge #808080; width: 100PX;" align="center">
                                    <tr>
                                        <td align="center">
                                <asp:Button ID="btnExport0" runat="server" CssClass="buttonGreen" Text="By Dptos" 
                                    Width="190px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                <asp:Button ID="btnExport1" runat="server" CssClass="buttonGreen" Text="By Risks" 
                                    Width="190px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                <asp:Button ID="btnExport2" runat="server" CssClass="buttonGreen" Text="By Safety Observation" 
                                    Width="190px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                <asp:Button ID="btnExport3" runat="server" CssClass="buttonGreen" Text="By Rolls" 
                                    Width="190px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td class="style24" valign="top">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="807px">
                                    <LocalReport ReportPath="Reporte.rdlc">
                                    </LocalReport>
                                </rsweb:ReportViewer>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="estiloEtiquetasA">
                                <br /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
