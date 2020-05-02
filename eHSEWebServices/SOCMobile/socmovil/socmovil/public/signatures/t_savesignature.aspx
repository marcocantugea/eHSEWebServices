<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_savesignature.aspx.vb" Inherits="socmovil.t_savesignature" %>
<% 
    LoadConfiguration()
    
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))

    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("signature_transaction_valid_num")) Then
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("signature_transaction_valid_num")
            requested_transaction = encrypt.DecryptData(requested_string)
            If requested_transaction.Equals(session_transaction) Then
                'sanitiza los campos manuales
                Dim new_pass As String = SQLSanitize.SanitizeSTR(Request.Form("password"))
                Dim imagepath As String = Session("tmp_saved_img")
                Dim real_pass As String = System.Configuration.ConfigurationSettings.AppSettings("enc-key") & new_pass
                
                Dim new_signature As New eservices_core.com.objects.eSignatureObj
                new_signature.iduser = SessionUser.UserObjSession.userid
                new_signature.password = encrypt.EncryptData(real_pass)
                
                'encripta la imagen cardada
                Dim file As New IO.FileInfo(imagepath)
                Dim NewFileName As String = Base64Con.EncodeBase64(SessionUser.UserObjSession.FullName() & Date.Now().ToString("yyyyMMddhhmm"))
                Try
                    new_signature.signaturepath = EncrypSignature(file.Name, NewFileName)
                Catch ex As Exception
                    Response.Redirect("../index.aspx?p=signatures/p_usersignature&e=true")
                End Try
              
                
                Try
                    UnitOfWork.Signatures.RegisterSignature(new_signature)
                    
                    'actualiza la informacion en session
                    SessionUser.UserObjSession.idsignature = new_signature.idsignature
                    SessionUser.UserObjSession.eSignature = new_signature
                    
                    'actiualiza la informacion de login en la base de datos
                    Dim upt_userlogin As New eservices_core.com.objects.UserObj
                    upt_userlogin.userid = SessionUser.UserObjSession.userid
                    upt_userlogin.idsignature = new_signature.idsignature
                    upt_userlogin.idinfocompany = -1
                    upt_userlogin.idInfoUser = -1
                    upt_userlogin.idprofile = -1
                    upt_userlogin.active = SessionUser.UserObjSession.active
                    upt_userlogin.AgreeSignatureTerms = SessionUser.UserObjSession.AgreeSignatureTerms
                    
                    UnitOfWork.User.UpdateUserLogin(upt_userlogin)
                    
                Catch ex As Exception
                    Response.Redirect("../index.aspx?p=signatures/p_usersignature&e=true")
                End Try
                Response.Redirect("../index.aspx?p=signatures/p_usersignature")
            End If
        End If
    Else
        Response.Redirect("../index.aspx")
    End If
%>