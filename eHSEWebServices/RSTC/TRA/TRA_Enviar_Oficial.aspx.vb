Imports System.Net.Mail
Imports System.Net.Mime
Imports clsDataBase
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.Data
Partial Class TRA_TRA_Enviar_Oficial
    Inherits System.Web.UI.Page
    Public clsDB As New clsDataBase

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Page.IsPostBack Then
            Try
                ltraId.Text = Request.QueryString("TraId").ToString()
                lDepartamento.Text = Request.QueryString("Departamento").ToString

                enviarBorrador()
            Catch ex As Exception
                Response.Write("Error, The Email couldn't be sent... " & ex.Message)
            End Try
        End If
    End Sub
    Protected Sub enviarBorrador()
        Dim dts As DataSet
        Dim i As Integer = 0
        Dim contentId As String = "Image1"
        Dim contentId2 As String = "Image2"
        Dim contentId3 As String = "Image3"
        Dim contentId4 As String = "Image4"
        Dim path As String = Server.MapPath("~") & "\"
        Dim filename As String = path & "Images\email_Header.jpg"
        Dim filename2 As String = path & "Images\email_Home.jpg"
        Dim filename3 As String = path & "Images\email_Acceder.jpg"
        Dim filename4 As String = path & "Images\email_footer.jpg"
        Dim Email As New MailMessage
        dts = clsDB.QueryDataSet("Select Correo FROM ctgTRALineaMando WHERE Departamento='" & lDepartamento.Text & "'")
        clsDB.Close()

        Email.From = New MailAddress("e-tra@grbic.com", "e-TRA - Bicentenario")
        Email.Priority = MailPriority.High

        Email.CC.Add(New MailAddress("rigsupt@grbic.com"))
        Email.CC.Add(New MailAddress("Captain@grbic.com"))


        'Email.CC.Add(New MailAddress("it@grbic.com"))
        If dts.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In dts.Tables(0).Rows
                If i = 0 Then
                    Email.To.Add(New MailAddress(row("Correo")))
                    'Email.To.Add(New MailAddress("it.BIC@grupor.com.mx"))
                Else
                    If row("correo") = "it@grbic.com" Then
                        Email.Bcc.Add(New MailAddress(row("Correo")))
                    Else
                        Email.CC.Add(New MailAddress(row("Correo")))
                    End If

                End If
                i = i + 1
            Next
        End If




        Email.Subject = "Notificación de un Nuevo TRA"
        Dim av1 As AlternateView
        av1 = AlternateView.CreateAlternateViewFromString(cuerpoCorreo, Nothing, _
            MediaTypeNames.Text.Html)
        Dim linkedResource As LinkedResource = New LinkedResource(filename)
        Dim linkedResource2 As LinkedResource = New LinkedResource(filename2)
        Dim linkedResource3 As LinkedResource = New LinkedResource(filename3)
        Dim linkedResource4 As LinkedResource = New LinkedResource(filename4)
        linkedResource.ContentId = contentId
        linkedResource2.ContentId = contentId2
        linkedResource3.ContentId = contentId3
        linkedResource4.ContentId = contentId4
        linkedResource.ContentType.Name = filename
        linkedResource2.ContentType.Name = filename2
        linkedResource3.ContentType.Name = filename3
        linkedResource4.ContentType.Name = filename4

        av1.LinkedResources.Add(linkedResource)
        av1.LinkedResources.Add(linkedResource2)
        av1.LinkedResources.Add(linkedResource3)
        av1.LinkedResources.Add(linkedResource4)
        Email.AlternateViews.Add(av1)
        Email.IsBodyHtml = True

        'Email.Body = cuerpoMensaje()
        'linkImage1.ContentId = "LogotipoIPC"
        'linkImage2.ContentId = "LogoRSTC"
        'Email.IsBodyHtml = True

        Try

            Dim mailClient As New System.Net.Mail.SmtpClient()
            'This object stores the authentication values
            Dim basicAuthenticationInfo As _
            New System.Net.NetworkCredential("mainserver@grm4.com", "111222rrr")
            'Put your own, or your ISPs, mail server name onthis next line
            mailClient.Host = "192.168.45.4"
            mailClient.UseDefaultCredentials = True
            mailClient.Credentials = basicAuthenticationInfo

            mailClient.Send(Email)
            Response.Write("Correo enviado satisfactoriamente")
        Catch ex As Exception
            Response.Write("Error sending email: " & ex.Message)
        End Try
    End Sub
    Function cuerpoCorreo() As String
        Dim cuerpo As String
        cuerpo = "<table width=""621"" height=""310"">" & _
        "<tr><td height=""73""> " & _
            "<table width=""81"" height=""49"" align=""center"" border=""0"" cellpadding=""0"" cellspacing=""0"">" & _
                "<tr>" & _
                    "<td><img src=""'cid:Image1'"" style=""height: 46px; width: 174px"" /></td>" & _
                    "<td><a href=""http://192.168.45.6/TRA/main.aspx""><img src=""'cid:Image2'"" style=""height: 46px; width: 174px"" /></td>" & _
                "</tr>" & _
            "</table>" & _
            "</td></tr>" & _
        "<tr><td height=""122"" align=""left"" valign=""middle"" style=""font-family: Verdana; font-size: small; font-weight: bold; font-style: normal;""><blockquote>" & _
            "<p>" & _
            "This TRA with the ID - " & ltraId.Text & " - has become Oficial to be used on board Bicentenario." & _
            "" & _
            "</p>" & _
            "<p>" & _
            "To Print this Document click in the next Link" & _
          "</p>" & _
            "</blockquote></td>" & _
        "</tr>" & _
        "<tr><td>" & _
        "<table align=""center"">" & _
        "<tr><td></td><td></td><td></td></tr>" & _
        "<tr><td></td><td><a href=""http://192.168.45.6/Reports/TRA_Format_Viewer.aspx?Param=" & ltraId.Text & """><img src=""'cid:Image3'"" style=""height: 39px; width: 156px"" /></td><td></td></tr>" & _
        "<tr><td></td><td></td><td></td></tr>" & _
        "</table>" & _
        "</td></tr>" & _
        "<tr><td><img src=""'cid:Image4'"" style=""height: 39px; width: 156px"" /></td></tr>" & _
    "</table>"
        Return cuerpo
    End Function
End Class
