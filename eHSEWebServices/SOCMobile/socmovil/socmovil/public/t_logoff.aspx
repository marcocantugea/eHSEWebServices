<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="t_logoff.aspx.vb" Inherits="socmovil.t_logoff" %>
<% 
    If Not IsNothing(Me.Session("user_loged")) Then
        Me.Session("user_loged") = Nothing
    End If
    
   Response.Redirect("index.aspx")
%>