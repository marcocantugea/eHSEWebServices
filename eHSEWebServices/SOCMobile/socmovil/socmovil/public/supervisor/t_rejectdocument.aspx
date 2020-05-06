<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_rejectdocument.aspx.vb" Inherits="socmovil.t_rejectdocument" %>
<% 
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))

    If IsNothing(Request.QueryString) Then
        Response.Redirect("../index.aspx")
    End If
    
    If IsNothing(Request.QueryString("d")) Or IsNothing(Request.QueryString("t")) Then
        Response.Redirect("../index.aspx")
    End If
    
    Dim request_srt As String = Request.QueryString("d")
    Dim session_transaction As String = Me.Session("rejectsignature_transaction_valid_num")
    Dim requested_string As String = Request.QueryString("t")
    Dim requested_transaction As String = encrypt.DecryptData(requested_string)
    Dim idDocument As Integer
    Try
        idDocument = Integer.Parse(Base64Encoder.DecodeBase64(request_srt))
    Catch ex As Exception
        Response.Redirect("../index.aspx")
    End Try
    
    
    If session_transaction.Equals(requested_transaction) Then
        Me.Session("rejectsignature_transaction_valid_num") = Nothing
        
        Dim updateDocument As eservices_core.com.objects.DocumentGeneric
        updateDocument = UnitOfWork.Documents.GetById(idDocument)
        updateDocument.idDocumentStatus = 1
        updateDocument.locked = 0
        
        UnitOfWork.Documents.Update(updateDocument)
        
        Dim removeDocumentforaproval As New eservices_core.com.objects.DocumentPendingForApprovalObj
        removeDocumentforaproval.idDocument = idDocument
        
        UnitOfWork.Documents.RemoveDocumentForApproval(removeDocumentforaproval)
        
        Response.Redirect("../index.aspx?p=supervisor/p_docforsig")
    End If
    
%>