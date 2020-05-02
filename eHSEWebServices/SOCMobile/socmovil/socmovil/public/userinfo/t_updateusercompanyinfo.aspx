<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_updateusercompanyinfo.aspx.vb" Inherits="socmovil.t_updateusercompanyinfo" %>
<%
    
    LoadConfiguration()
    
    Dim SQLSanitize As New eservices_core.com.database.SQLSanitizeClass
    Dim encrypt As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationManager.AppSettings("enc-key"))
    
    
    If Not IsNothing(Request.Form("transaction")) Then
        If Not IsNothing(Me.Session("transaction_valid_num")) Then
            Dim requested_string As String = Request.Form("transaction")
            Dim requested_transaction As String
            Dim session_transaction As String = Me.Session("transaction_valid_num")
            
            requested_transaction = encrypt.DecryptData(requested_string)
            If requested_transaction.Equals(session_transaction) Then
                'sanitiza los campos manuales
                Dim guardia As String = SQLSanitize.SanitizeSTR(Request.Form("guard"))
                Dim str_idcompany As String = Request.Form("company")
                Dim str_idWorkUnit As String = Request.Form("workunit")
                Dim str_deparment As String = Request.Form("deparment")
                Dim str_category As String = Request.Form("category")
                
                Try
                    Dim upt_user As New eservices_core.com.objects.UserInfoCompanyObj
                    upt_user.idinfocompany = SessionUser.UserObjSession.idinfocompany 
                    upt_user.guard = guardia
                    upt_user.idCompany = Integer.Parse(str_idcompany)
                    upt_user.idWorkUnit = Integer.Parse(PageGlobalConfigReader.GetValue("DefaultIDWorkUnit"))
                    upt_user.idDeparment = Integer.Parse(str_deparment)
                    upt_user.idcategory = Integer.Parse(str_category)
                    
                 
                    
                    UnitOfWork.User.UpdateInfoUserCompany(upt_user)
                    
                    'actualizar la info de session del usuario.
                    SessionUser.UserObjSession.UserInfoCompanyObj.guard = guardia
                    SessionUser.UserObjSession.UserInfoCompanyObj.idCompany = upt_user.idCompany
                    SessionUser.UserObjSession.UserInfoCompanyObj.idWorkUnit = upt_user.idWorkUnit
                    SessionUser.UserObjSession.UserInfoCompanyObj.idDeparment = upt_user.idDeparment
                    SessionUser.UserObjSession.UserInfoCompanyObj.idcategory = upt_user.idcategory
                    SessionUser.RefreshUserSession()
                    
                Catch ex As Exception
                    Response.Redirect("../index.aspx?p=userinfo/p_useraccount&ie=true")
                End Try
                Response.Redirect("../index.aspx?p=userinfo/p_useraccount&is=true")
            Else
                Response.Redirect("../index.aspx") 
            End If
        Else
            Response.Redirect("../index.aspx")
        End If
    Else
        Response.Redirect("../index.aspx")
    End If
    
    
    
%>