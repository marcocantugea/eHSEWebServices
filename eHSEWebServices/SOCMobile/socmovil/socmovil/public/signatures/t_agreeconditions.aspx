<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_agreeconditions.aspx.vb" Inherits="socmovil.t_agreeconditions" %>

<%
    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("signature_transaction_valid_num")) Then
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("signature_transaction_valid_num")
            
            'Desencripta el numero de transaccion
            Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
            requested_transaction = encrypt.DecryptData(requested_string)
            'valida transaccion y realiza proceso de que el usuario firmo los terminos
            If requested_transaction.Equals(session_transaction) And Not IsNothing(Request.Form("agreeterms")) Then
                If Request.Form("agreeterms").Equals("agreeterms") Then
                    
                    Dim UpdateUserObj As New eservices_core.com.objects.UserObj
                    UpdateUserObj.userid = SessionUser.UserObjSession.userid
                    UpdateUserObj.AgreeSignatureTerms = True
                    'llena los campos con -1 para no actualizar informacion por el querybulder.
                    UpdateUserObj.active = SessionUser.UserObjSession.active
                    UpdateUserObj.idinfocompany = -1
                    UpdateUserObj.idInfoUser = -1
                    UpdateUserObj.idprofile = -1
                    
                    Dim ADOUser As New eservices_core.com.ado.ADOUser
                    ADOUser.UpdateUserLogin(UpdateUserObj)
                    
                    SessionUser.UserObjSession.AgreeSignatureTerms = True
                    
                    
                End If
            End If
            Response.Redirect(Request.UrlReferrer.ToString)
        End If
    Else
        Response.Redirect("../index.aspx")
    End If
%>