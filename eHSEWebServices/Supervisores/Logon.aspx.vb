Imports System.Web.Security
Imports FormsAuth
Partial Class Logon
    Inherits System.Web.UI.Page
    Sub Login_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim adPath As String = "LDAP://GRM4" 'Path to your LDAP directory server
        Dim adAuth As LdapAuthentication = New LdapAuthentication(adPath)
        Try
            If (True = adAuth.IsAuthenticated(txtDomain.Text, txtUsername.Text, txtPassword.Text)) Then
                Dim groups As String = adAuth.GetGrupos 'adAuth.GetGroups() "Electrical"
                If IsNothing(groups) Then
                    groups = "Unknow"
                End If
                'Create the ticket, and add the groups.
                Dim isCookiePersistent As Boolean = chkPersist.Checked
                Dim authTicket As FormsAuthenticationTicket = New FormsAuthenticationTicket(1, _
                     txtUsername.Text, DateTime.Now, DateTime.Now.AddMinutes(500000000), isCookiePersistent, groups)

                'Encrypt the ticket.
                Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)

                'Create a cookie, and then add the encrypted ticket to the cookie as data.
                Dim authCookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)

                If (isCookiePersistent = True) Then
                    authCookie.Expires = authTicket.Expiration
                End If
                'Add the cookie to the outgoing cookies collection.
                Response.Cookies.Add(authCookie)

                'You can redirect now.
                Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, False))

            Else
                errorLabel.Text = "Authentication did not succeed. Check user name and password."
            End If

        Catch ex As Exception
            errorLabel.Text = "Error authenticating. " & ex.Message
        End Try
    End Sub
End Class
