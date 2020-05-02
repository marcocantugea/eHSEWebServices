<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_changepass.aspx.vb" Inherits="socmovil.t_changepass" %>
<% 
   
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    'Encripta el numero de transaccion
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
    
    
    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("transaction_valid_num")) Then
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("transaction_valid_num")
            
            requested_transaction = encrypt.DecryptData(requested_string)
            If requested_transaction.Equals(session_transaction) Then
                If Not IsNothing(Request.Form("password")) Then
                    'recibir variables y despues sanitizarlas
                    Dim new_pass As String = SQLSanitize.SanitizeSTR(Request.Form("password"))
                
                    Dim new_userobj As New eservices_core.com.objects.UserObj
                    new_userobj.userid = SessionUser.UserObjSession.userid
                    new_userobj.user_pwd = encrypt.EncryptData(new_pass)
                    new_userobj.active = SessionUser.UserObjSession.active
                    new_userobj.idinfocompany = SessionUser.UserObjSession.idinfocompany
                    new_userobj.idInfoUser = SessionUser.UserObjSession.idInfoUser
                    new_userobj.idprofile = SessionUser.UserObjSession.idprofile

                    Try
                        UnitOfWork.User.UpdateUserPass(new_userobj)
                    Catch ex As Exception
                        Response.Redirect("../index.aspx?p=userinfo/p_useraccount&pe=true")
                    End Try
                End If
                
            End If
        End If
        Response.Redirect("../index.aspx?p=userinfo/p_useraccount&ps=true")
    Else
        
        Response.Redirect("../index.aspx")
    End If
    
%>