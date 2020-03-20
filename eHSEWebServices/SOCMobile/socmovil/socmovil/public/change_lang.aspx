﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="change_lang.aspx.vb" Inherits="socmovil.change_lang" %>
<%
    Dim GlobalConfigReader As New socmobile_core.com.configuration.GlobalConfReader
    GlobalConfigReader.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))

    
    If Request.QueryString.Count > 0 Then
        Dim new_lang As String = Request.QueryString("lang")
        If GlobalConfigReader.GetValue("language").Contains(new_lang) Then
            If Not IsNothing(Me.Session("LANG")) Then
                Me.Session("LANG") = new_lang
                Dim aCookie As HttpCookie = HttpContext.Current.Request.Cookies("LANG")
                aCookie.Value = new_lang
                aCookie.Expires = DateTime.Now.AddDays(60)
                Response.Cookies.Add(aCookie)
            Else
                Me.Session("LANG") = new_lang
                If Request.Cookies("LANG") Is Nothing Then
                    Dim aCookie As New HttpCookie("LANG")
                    aCookie.Value = new_lang
                    aCookie.Expires = DateTime.Now.AddDays(60)
                    Response.Cookies.Add(aCookie)
                Else
                    Dim aCookie As HttpCookie = HttpContext.Current.Request.Cookies("LANG")
                    aCookie.Value = new_lang
                    aCookie.Expires = DateTime.Now.AddDays(60)
                    Response.Cookies.Add(aCookie)
                End If
            End If
        End If
        Response.Redirect(Request.UrlReferrer.ToString)
    End If
    
%>