<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRA_Format.aspx.vb" Inherits="TRA_Format" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<link href="Styles/CQS.css" rel="stylesheet" type="text/css"><script language="VB" runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <title>TRA Format</title>
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
            height: 9px;
        }
        .style25
        {
            height: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:79%; height: 384px;">
            <tr>
                <td class="style1">
                    SOC - STADISTICS </td>
            </tr>
            <tr>
                <td class="style24">
                    <table style="border: thin ridge #808080; width: 937px;">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500">5/1/2013</asp:TextBox>
                            </td>
                            <td class="style7">
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
                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                        <tr>
                            <td class="style23" valign=top>
                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                                    Font-Size="8pt" Height="400px" Width="1104px">
                                    <LocalReport ReportPath="Reporte2.rdlc">
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
