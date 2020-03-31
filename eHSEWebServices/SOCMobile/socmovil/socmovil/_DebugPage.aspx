<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_DebugPage.aspx.vb" Inherits="socmovil._DebugPage" %>
<%
    'Dim pingenerator As New eservices_core.com.utilities.PINGenerator
    
    'Response.Write(pingenerator.GeneratePIN4digit)
    
    Dim ADO As New etra.com.ado.ole.ADOTRA
    
    'Dim traobj As New etra.com.objects.TRAObj
    
    'traobj.pin_save = 5767
    
    'ADO.GetTRAbyPIN(traobj)
    
    'Response.Write(traobj.ToString)
    Dim tra_fields As New etra.com.objects.TRAObj
    tra_fields.tra_ID = -7
    tra_fields.tra_Activity_Job = "-7"
    tra_fields.tra_Dept = "-7"
    tra_fields.tra_Location = "-7"
    
    Dim dept As New etra.com.objects.TRADeparment
    dept.cDep_Name = "Electrical"
    
    Dim listoftra As New List(Of etra.com.objects.TRAObj)
    
    'ADO.GetTRAsByDeparment(tra_fields, dept, listoftra, "tra_id=954")
    'ADO.GetTRABy(tra_fields, listoftra, "tra_activity_job like ""%abrir%""")
    
    'Response.Write("<h3> Total of records: " & listoftra.Count & "</h3>")
    
    'For Each item As etra.com.objects.TRAObj In listoftra
    '    Response.Write(item.ToString + "<br/>")
    'Next
    
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h1>Debug Page</h1>

    </div>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <asp:Button ID="Button4" runat="server" Text="Button" />
    </form>
</body>
</html>
