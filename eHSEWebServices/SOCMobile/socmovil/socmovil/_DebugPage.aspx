﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_DebugPage.aspx.vb" Inherits="socmovil._DebugPage" %>
<%
    
    Dim UnitOfWork As New eservices_datamanager.UnitOfWork
    UnitOfWork.TRA.GetTRAbyPIN(New etra.com.objects.TRAObj())
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
    
    'ADO.GetTRABy(tra_fields, listoftra, "tra_ID>0")
    
    'Response.Write("<h3> Total of records: " & listoftra.Count & "</h3>")
    
    'For Each item As etra.com.objects.TRAObj In listoftra
    '    Response.Write(item.ToString + "<br/>")
    'Next
    
    Dim list As SortedList(Of Integer, eservices_core.com.objects.DocumentObj)
    Dim user As New eservices_core.com.objects.UserObj
    user.userid = 3
    list = UnitOfWork.Documents.GetDocuemntsByUser(user)
    
    For Each item As KeyValuePair(Of Integer, eservices_core.com.objects.DocumentObj) In list.Where(Function(c) c.Value.getidDocumentStatus().Equals(3))
        Response.Write(item.Value.getDocumentStatusObj.label)
    Next
   
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
        <asp:Button ID="Button15" runat="server" Text="Test unit of work" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <asp:Button ID="Button4" runat="server" Text="Button" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Button" />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" Text="test login" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="Test get companies" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" Text="test img encrip" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button9" runat="server" Text="test img dencript" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button13" runat="server" Text="debug ADODocuments insert query" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button10" runat="server" Text="test document imp" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button11" runat="server" Text="Test profile module obj" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button12" runat="server" Text="SOC Card by name" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button14" runat="server" Text="test adodocuments getdocumentsbyuser" />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
