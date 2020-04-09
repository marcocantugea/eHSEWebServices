<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_loginuser.aspx.vb" Inherits="socmovil.t_loginuser" %>

<% 
    'Enrypt tool
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
    ' sql sanitize variables
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    'Data access obj
    Dim ADOUsers As New eservices_core.com.ado.ADOUser
    
    If Not IsNothing(Request.Form("transaction")) Then
        Dim raw_transaction As String = Request.Form("transaction")
        Dim dencryp_transaction As String = encrypt.DecryptData(raw_transaction)
        Dim session_trasnsacion As String = Me.Session("login_transaction_num")
        If IsNothing(session_trasnsacion) Then
            Response.Redirect("index.aspx?p=p_login")
        End If
        If session_trasnsacion.Equals(dencryp_transaction) Then
            If Not IsNothing(Request.Form("user")) And Not IsNothing(Request.Form("password")) Then
                Dim str_user As String = SQLSanitize.SanitizeSTR(Request.Form("user"))
                Dim str_pass As String = SQLSanitize.SanitizeSTR(Request.Form("password"))
                
                Dim log_user As New eservices_core.com.objects.UserObj
                log_user.user_login = str_user
                log_user.user_pwd = encrypt.EncryptData(str_pass)
                
                Try
                    ADOUsers.LoginUser(log_user)
                    Me.Session("user_loged") = log_user
                Catch ex As Exception
                    Response.Redirect("index.aspx?p=p_login&e=true")
                End Try
            Else
                Response.Redirect("index.aspx?p=p_login")
            End If
            Response.Redirect("index.aspx")
        Else
            Response.Redirect("index.aspx")
        End If
    Else
        Response.Redirect("index.aspx")
    End If
    
%>