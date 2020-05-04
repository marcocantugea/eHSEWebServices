<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_sendforapproval.aspx.vb" Inherits="socmovil.t_sendforapproval" %>
 <%
     
     LoadConfiguration()
     LoadLanguage()
     
     If Not IsNothing(Request.QueryString("d")) And Not IsNothing(Request.QueryString("pp")) Then
         Dim idDocument As Integer
         
         Dim Process As New eservices_core.com.process.DocumentForApprovalProcess
         Dim document_loaded As Object
         Dim parentpage As String
         
         Try
             idDocument = Integer.Parse(Base64Encoder.DecodeBase64(Request.QueryString("d")))
             parentpage = Base64Encoder.DecodeBase64(Request.QueryString("pp"))
         Catch ex As Exception
             Response.Redirect(Request.UrlReferrer.ToString)
         End Try
         
         If idDocument > 0 Then
             document_loaded = UnitOfWork.Documents.GetDocumentByID(idDocument, SessionUser.UserObjSession)
             Dim doc As eservices_core.com.objects.DocumentObj = CType(document_loaded, eservices_core.com.objects.DocumentObj)
             doc.LoadInfoByID()
             Try
                 Process.SendDocumentForApproval(doc)
                 Response.Redirect(parentpage)
             Catch ex As Exception
                 Response.Redirect(parentpage & "&ed=true")
             End Try
         End If
     End If

     
     
%>