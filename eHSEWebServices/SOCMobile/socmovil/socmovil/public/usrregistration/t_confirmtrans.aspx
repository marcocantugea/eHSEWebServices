<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_confirmtrans.aspx.vb" Inherits="socmovil.t_confirmtrans" %>
<%
    LoadConfiguration()
    
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    
    
    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("transaction_valid_num")) Then
            
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("transaction_valid_num")
            
            'Encripta el numero de transaccion
            Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
            requested_transaction = encrypt.DecryptData(requested_string)
            
            If requested_transaction.Equals(session_transaction) Then
                Dim name As String = SQLSanitize.SanitizeSTR(Request.Form("name"))
                Dim lastname As String = SQLSanitize.SanitizeSTR(Request.Form("lastname1"))
                Dim lastname2 As String = SQLSanitize.SanitizeSTR(Request.Form("lastname2"))
                Dim email As String = SQLSanitize.SanitizeSTR(Request.Form("email"))
                Dim userlogin As String = SQLSanitize.SanitizeSTR(Request.Form("userlogin"))
                Dim rqs_passwor As String = SQLSanitize.SanitizeSTR(Request.Form("password"))
                
                Dim new_UserObj As New eservices_core.com.objects.UserObj
         
                
                new_UserObj.active = True
                new_UserObj.user_login = userlogin
                new_UserObj.user_email = email
                new_UserObj.user_pwd = encrypt.EncryptData(rqs_passwor)
                Try
                    new_UserObj.idprofile = Integer.Parse(PageGlobalConfigReader.GetValue("publicprofileid"))
                Catch ex As Exception
                    new_UserObj.idprofile = 1
                End Try
                
               
                Dim new_UserInfoCompany As New eservices_core.com.objects.UserInfoCompanyObj

                new_UserInfoCompany.employeenum = userlogin
                Try
                    new_UserInfoCompany.idCompany = Integer.Parse(PageGlobalConfigReader.GetValue("DefaultIdCompany"))
                Catch ex As Exception
                    new_UserInfoCompany.idCompany = 0
                End Try
                Try
                    new_UserInfoCompany.idWorkUnit = Integer.Parse(PageGlobalConfigReader.GetValue("DefaultIdCompany"))
                Catch ex As Exception
                    new_UserInfoCompany.idWorkUnit = 0
                End Try
                new_UserObj.UserInfoCompanyObj = new_UserInfoCompany
                
                
                Dim new_UserInfo As New eservices_core.com.objects.InfoUserObj
                
                new_UserInfo.Nombre = name.ToUpper
                new_UserInfo.apellido_pat = lastname.ToUpper
                new_UserInfo.apellido_mat = lastname2.ToUpper

                new_UserObj.InfoUserObj = new_UserInfo
                
                Me.Session("new_user") = new_UserObj
                
                Response.Redirect("../index.aspx?p=usrregistration/p_confirmregistration")
            End If
        Else
            Response.Redirect("../index.aspx")
        End If
    Else
        Response.Redirect("../index.aspx")
    End If
    
%>
