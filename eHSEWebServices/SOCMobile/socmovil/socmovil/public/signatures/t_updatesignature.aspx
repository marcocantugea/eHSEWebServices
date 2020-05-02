<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_updatesignature.aspx.vb" Inherits="socmovil.t_updatesignature" %>

<%

    'actualiza user login a que no tenga firma
    Dim upt_userlogin As New eservices_core.com.objects.UserObj
    upt_userlogin.idinfocompany = -1
    upt_userlogin.idInfoUser = -1
    upt_userlogin.idprofile = -1
    upt_userlogin.idsignature = 0
    upt_userlogin.userid = SessionUser.UserObjSession.userid
    upt_userlogin.active = SessionUser.UserObjSession.active

    
   

    'actualiza firma electornica
    Dim upt_esignarure As New eservices_core.com.objects.eSignatureObj
    upt_esignarure.idsignature = SessionUser.UserObjSession.eSignature.idsignature
    upt_esignarure.iduser = 0
    
    
    
    Try
        UnitOfWork.User.UpdateUserLogin(upt_userlogin)
        UnitOfWork.Signatures.UpdateSignature(upt_esignarure)
        
        'actualizar session de usuario
        SessionUser.UserObjSession.idsignature = 0
        SessionUser.UserObjSession.AgreeSignatureTerms = False
        SessionUser.UserObjSession.eSignature = Nothing
    Catch ex As Exception
        Response.Redirect("../index.aspx?p=signatures/p_usersignature&e=true")
    End Try
    Response.Redirect("../index.aspx?p=signatures/p_usersignature")

%>