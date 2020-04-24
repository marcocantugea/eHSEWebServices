<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_loaddocument.aspx.vb" Inherits="socmovil.t_loaddocument" %>
<%

    LoadConfiguration()
    LoadLanguage()
    Dim base64 As New eservices_core.com.utilities.Base64Conversions
    Dim open_tra As Boolean = False
    Dim tra_id As String
    
    If Not IsNothing(Request.QueryString("d")) Then
        'decodificar el id en base64
        Dim idDocument As Integer
        Dim ADODocument As New eservices_core.com.ado.ADODocument()
        Dim document_loaded As Object
        Try
            idDocument = Integer.Parse(base64.DecodeBase64(Request.QueryString("d")))
        Catch ex As Exception
            Response.Redirect(Request.UrlReferrer.ToString)
        End Try
        'cargar el objeto del documento
        If idDocument > 0 Then
            document_loaded = ADODocument.GetDocumentByID(idDocument, SessionUser.UserObjSession)
            Dim doc As eservices_core.com.objects.DocumentObj = CType(document_loaded, eservices_core.com.objects.DocumentObj)
            
            'ver que tipo de documento es 
            If doc.getTypeOfObj().Contains("TRA") Then
                'Dim tra As etra.com.objects.TRAObj = CType(doc, etra.com.objects.TRAObj)
                open_tra = True
                tra_id = base64.EncodeBase64(doc.getIdOfDocument)
            End If  
        End If
        
    Else
       Response.Redirect("../index.aspx")
        
   End If
        

%>
<script>
    <%
    ' mandar a llamar la pagina para visualizar deacuer al tipo de documento
    If open_tra Then
    %>
    document.location.href = "../tra/TRAFormat.aspx?tra_id=<%=tra_id%>";
    <%
End If
    %>
</script>