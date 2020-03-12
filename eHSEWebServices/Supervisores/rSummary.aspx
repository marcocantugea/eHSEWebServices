<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rSummary.aspx.vb" Inherits="rSummary" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SOC Summary</title>
    <style type="text/css">
        .Button2
        {
            height: 26px;
        }
        .misEstilos{ 
            background-color:#ffffff; 
            color:#333333; 
            font-weight:700; 
            font-size:small; 
            text-indent:3px;
            height:20px;
	        font-family: Verdana;
            padding-bottom: 5px;

        }
    </style>
    <link href="Styles/CQS.css" rel="stylesheet" type="text/css"/>
    <script language="VB" runat="server"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 862px">
    
        <table style="width:100%;">
            <tr>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td class="estiloRptHD">
                                <br />
                                &nbsp;&nbsp; SOC Summary<br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                    <table style="border: thin ridge #808080; width: 845px;" class="estiloEtiquetasA">
                        <tr>
                            <td class="estiloEtiquetasA">
                                From:</td>
                            <td class="style5">
                                <asp:TextBox ID="tDateDel" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                            <td class="estiloEtiquetasA">
                                To:</td>
                            <td class="style6">
                                <asp:TextBox ID="tDateA" runat="server" CssClass="estiloEtiquetasA" 
                                    Height="19px" Width="168px" TabIndex="500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloEtiquetasA">
                                Department:</td>
                            <td class="style5">
                                <asp:DropDownList ID="dDpt" runat="server" CssClass="estiloEtiquetasA" 
                                    Width="163px" Enabled="False">
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
                            <td class="style5">
                                <asp:Button ID="btnExport0" runat="server" CssClass="Button2" Text="SOC by Day" 
                                    Width="73px" />
                            &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnTotal" runat="server" CssClass="Button2" Text="SOC Total" 
                                    Width="73px" />
                            </td>
                            <td class="style7">
                                <asp:Button ID="btnTotal0" runat="server" CssClass="Button2" Text="No Participation" 
                                    Width="108px" />
                            </td>
                            <td class="style6">
                                <asp:Label ID="UserID" runat="server" Text="UserID" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="estiloRptHD2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="850px">
                    </rsweb:ReportViewer>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
