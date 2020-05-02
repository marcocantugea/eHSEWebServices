<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_saveuserreg.aspx.vb" Inherits="socmovil.t_saveuserreg" %>
<% 
    'utilidad para convertir string a base64
    Dim Base64Con As New eservices_core.com.utilities.Base64Conversions
    
    Dim new_user As eservices_core.com.objects.UserObj
    If Not IsNothing(Me.Session("new_user")) Then
        new_user = CType(Me.Session("new_user"), eservices_core.com.objects.UserObj)
        
        
        Try
            UnitOfWork.User.RegisterUser(new_user)
            Response.Redirect("../index.aspx?p=usrregistration/p_messagesavereg&m=" & Base64Con.EncodeBase64("p_messagesavereg_lblerror_userconfirm") & "&t=c")
        Catch ex As Exception
            If ex.Message.Contains(":") Then
                Dim error_msg As String() = ex.Message.Split(":")
                Dim str_error As String = error_msg(1)
                
                Select Case str_error
                    Case "FULLNAMEDUPLICATED"
                        Response.Redirect("../index.aspx?p=usrregistration/p_messagesavereg&m=" & Base64Con.EncodeBase64("p_messagesavereg_lblerror_usernamereg") & "&t=e")
                    Case "LOGINDUPLICATED"
                        Response.Redirect("../index.aspx?p=usrregistration/p_messagesavereg&m=" & Base64Con.EncodeBase64("p_messagesavereg_lblerror_userlogre") & "&t=e")
                End Select
                
            End If
           
        End Try
    Else
        Response.Redirect("../index.aspx")
    End If
    
    
        
%>