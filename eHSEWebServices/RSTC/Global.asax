﻿<%@ Application Language="VB" %>
<%@ import Namespace="System.Web.Security" %>
<%@ import Namespace="System.Security.Principal" %>

<script runat="server">
    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
        Dim cookieName As String = FormsAuthentication.FormsCookieName
        Dim authCookie As HttpCookie = Context.Request.Cookies(cookieName)

        If (authCookie Is Nothing) Then
            'There is no authentication cookie.
            Return
        End If

        Dim authTicket As FormsAuthenticationTicket = Nothing

        Try
            authTicket = FormsAuthentication.Decrypt(authCookie.Value)
        Catch ex As Exception
            'Write the exception to the Event Log.
            Return
        End Try

        If (authTicket Is Nothing) Then
            'Cookie failed to decrypt.
            Return
        End If

        'When the ticket was created, the UserData property was assigned a
        'pipe-delimited string of group names.
        Dim groups As String() = authTicket.UserData.Split(New Char() {"|"})

        'Create an Identity.
        Dim id As GenericIdentity = New GenericIdentity(authTicket.Name, "LdapAuthentication")

        'This principal flows throughout the request.
        Dim principal As GenericPrincipal = New GenericPrincipal(id, groups)

        Context.User = principal

    End Sub
</script>