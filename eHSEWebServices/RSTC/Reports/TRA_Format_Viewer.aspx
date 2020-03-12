<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRA_Format_Viewer.aspx.vb" Inherits="Reports_TRA_Format_Viewer" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="921px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" >
            <LocalReport ReportPath="Reports\TRA_Print_DBFormat.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>
   </form>
</body>
</html>
