<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_signdocument.aspx.vb" Inherits="socmovil.t_signdocument" %>
<%
    
    LoadConfiguration()
    LoadLanguage()
    
    
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
    
    If IsNothing(Request.Form("transacction")) Then
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
    
    Dim session_transaction As String = Me.Session("signature_transaction_valid_num")
    Dim requested_string As String = Request.Form("transacction")
    Dim requested_transaction As String = encrypt.DecryptData(requested_string)
    Dim post_iddocument As Integer
    Try
        post_iddocument = Integer.Parse(Base64Encoder.DecodeBase64(Request.Form("document")))
    Catch ex As Exception
        Response.Redirect("../index.aspx")
    End Try
   
    If session_transaction.Equals(requested_transaction) Then
        Dim sanitize_password As String = SQLSanitize.SanitizeSTR(Request.Form("password"))
        Dim real_pass As String = encrypt.EncryptData(System.Configuration.ConfigurationSettings.AppSettings("enc-key") & sanitize_password)
        Me.Session("signature_transaction_valid_num") = Nothing
        
        If Not SessionUser.UserObjSession.eSignature.password.Equals(real_pass) Then
            Dim referrelpage As String = Request.UrlReferrer.ToString
            Dim errorparam As String = "&ep=true"
            If referrelpage.Contains(errorparam) Then
                referrelpage = referrelpage.Remove(referrelpage.IndexOf(errorparam), errorparam.Length)
            End If
            Response.Redirect(referrelpage & errorparam)
        End If
        
        Dim updateDocument As eservices_core.com.objects.DocumentGeneric
        updateDocument = UnitOfWork.Documents.GetById(post_iddocument)
  
        
        updateDocument.idDocument = post_iddocument
        updateDocument.DocumentAprovalByID = SessionUser.UserObjSession.userid
        updateDocument.DocumentAprovalDate = Date.Now
        updateDocument.eSignatureFile = SessionUser.UserObjSession.eSignature.signaturepath
        updateDocument.idDocumentStatus = eservices_core.com.ado.DocumentStatus.Signed
        
        Try
            UnitOfWork.Documents.Update(updateDocument)
            UnitOfWork.Documents.CloseDocumentPendingForApproval(post_iddocument, SessionUser.UserObjSession.userid)
        Catch ex As Exception
            Response.Write(ex.Message.ToString)
            Response.Redirect("../index.aspx")
        End Try
      
        Response.Redirect("../index.aspx?p=supervisor/p_signeddocumentsuccess&d=" & Base64Encoder.EncodeBase64(post_iddocument))
        Response.Write(post_iddocument)
      
    End If
    
%>