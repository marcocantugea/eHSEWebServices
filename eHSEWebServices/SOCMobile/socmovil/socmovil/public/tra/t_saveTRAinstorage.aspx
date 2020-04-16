<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_saveTRAinstorage.aspx.vb" Inherits="socmovil.t_saveTRAinstorage" %>

<% 

    Dim tra_new As etra.com.objects.TRAObj
    Dim ADOTra As New etra.com.ado.ole.ADOTRA
    
    If Not IsNothing(Me.Session("new_tra_insession")) Then
        tra_new = CType(Me.Session("new_tra_insession"), etra.com.objects.TRAObj)
        Try
            'agrega la unfo del usuario si esta en session
            If Not IsNothing(Session("user_loged")) Then
                Dim user_logged As eservices_core.com.objects.UserObj = Session("user_loged")
                tra_new.setDocumentDate(Date.Now)
                tra_new.setCreatedByUserObj(user_logged)
            End If
            
            ADOTra.SaveTRA(tra_new)
            Me.Session("new_tra_insession") = tra_new
            Response.Write("TRA-Saved:PIN:" & tra_new.pin_save)
        Catch ex As Exception
            'Throw
            Response.Redirect("../index.aspx?p=errorcode")
        End Try
        
    Else
        Response.Redirect("../index.aspx")
    End If
    
%>