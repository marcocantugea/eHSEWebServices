<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_updateuserinfo.aspx.vb" Inherits="socmovil.t_updateuserinfo" %>
<% 
    
    LoadConfiguration()
    
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))

    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("userinfo_transaction_num")) Then
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("userinfo_transaction_num")
            requested_transaction = encrypt.DecryptData(requested_string)
            If requested_transaction.Equals(session_transaction) Then
                'sanitiza los campos manuales
                Dim day_birthday As String = SQLSanitize.SanitizeSTR(Request.Form("day_birdthday"))
                Dim month_birdthday As String = SQLSanitize.SanitizeSTR(Request.Form("month_birdthday"))
                Dim year_birdthday As String = SQLSanitize.SanitizeSTR(Request.Form("year_birdthday"))
                Dim adress As String = SQLSanitize.SanitizeSTR(Request.Form("adress"))
                Dim rfc As String = SQLSanitize.SanitizeSTR(Request.Form("rfc"))
                Dim rfchomoclave As String = SQLSanitize.SanitizeSTR(Request.Form("rfchomoclave"))
                Dim phone_movile As String = SQLSanitize.SanitizeSTR(Request.Form("phone_movile"))
                Dim phone_emergency As String = SQLSanitize.SanitizeSTR(Request.Form("phone_emergency"))
                Dim emergency_contact_name As String = SQLSanitize.SanitizeSTR(Request.Form("emergency_contact_name"))
                
                Dim infouser As New eservices_core.com.objects.InfoUserObj
                infouser.idInfoUser = SessionUser.UserObjSession.idInfoUser
                Try
                    Dim birthday As New Date(Integer.Parse(year_birdthday), Integer.Parse(month_birdthday), Integer.Parse(day_birthday))
                    infouser.fecha_nac = birthday
                Catch ex As Exception
                    Response.Redirect("../index.aspx?p=userinfo/p_userinfo&de=true")
                End Try
                infouser.direccion = adress
                infouser.RFC = rfc & rfchomoclave
                infouser.telefono_movil = phone_movile
                infouser.phone_emergency = phone_emergency
                infouser.name_emerg_contanct = emergency_contact_name
                
                Try
                    Dim ADOUser As New eservices_core.com.ado.ADOUser
                    ADOUser.UpdateUserInfo(infouser)
                    'actualiza session
                    SessionUser.RefreshUserSession()
                    
                Catch ex As Exception
                    Response.Redirect("../index.aspx?p=userinfo/p_userinfo&e=true")
                End Try
                Response.Redirect("../index.aspx?p=userinfo/p_userinfo")
            End If
        End If
    Else
        Response.Redirect("../index.aspx")
    End If
    
    
%>