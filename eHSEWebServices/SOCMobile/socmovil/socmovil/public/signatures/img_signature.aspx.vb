﻿Imports System.Drawing
Public Class img_signature
    Inherits System.Web.UI.Page
    Implements IntUserSession, IntPageControllerClass

    Private _SessionUser As UserStateClass
    Private pagecontrollerclass As New PageControllerClass
    Private _ShowWatermark As Boolean = True

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadUserSession()

        If Not IsNothing(Request.QueryString("unlock")) Then
            If Not IsNothing(SessionUser.UserObjSession.eSignature) And Request.QueryString("unlock").Equals("true") Then
                _ShowWatermark = False
            End If
        End If

        GetSignatureUser()
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload

    End Sub

    Public Sub GetLbl(value As String) Implements IntPageControllerClass.GetLbl
        Response.Write(pagecontrollerclass.lang_configreader.Getlbl(value))
    End Sub

    Public ReadOnly Property GlobalConfigReader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.GlobalConfigReader
        Get
            Return pagecontrollerclass.GlobalConfigReader.Configuration
        End Get
    End Property

    Public ReadOnly Property lang_configreader As socmobile_core.com.configuration.GlobalConfReader Implements IntPageControllerClass.lang_configreader
        Get
            Return pagecontrollerclass.lang_configreader.Configuration
        End Get
    End Property

    Public Sub LoadConfiguration() Implements IntPageControllerClass.LoadConfiguration
        pagecontrollerclass.LoadConfiguration(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    End Sub

    Public Sub LoadLanguage() Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadLanguage(session As HttpSessionState) Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadUserSession() Implements IntUserSession.LoadUserSession
        _SessionUser = New socmovil.UserStateClass(Me.Session, Me.Response)
    End Sub

    Public Sub RefreshUserSessionData() Implements IntUserSession.RefreshUserSessionData
        If Not IsNothing(_SessionUser) Then
            _SessionUser.UserObjSession.Loadinfo()
        End If
    End Sub

    Public Property SessionUser As UserStateClass Implements IntUserSession.SessionUser
        Get
            Return _SessionUser
        End Get
        Set(value As UserStateClass)
            _SessionUser = value
        End Set
    End Property

    Public Sub GetSignatureUser()

        If Not IsNothing(SessionUser.UserObjSession) And SessionUser.UserObjSession.idsignature > 0 Then

            Dim filename As String = SessionUser.UserObjSession.eSignature.signaturepath

            Dim full_sig_filename = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("dsignaturesfolder") & "\" & filename
            Dim temp_folder As String = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\"
            Dim uncrypt_temp_file As String = temp_folder & filename.Substring(0, filename.Length - 3) & "sig"
            If IO.File.Exists(full_sig_filename) Then
                Dim imgenct As New System.IO.FileInfo(full_sig_filename)
                Dim folderout As String = temp_folder
                Dim encrypter As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key") & SessionUser.UserObjSession.FullName)

                encrypter.DecryptFile(imgenct, folderout)

                Dim image As Image = image.FromFile(uncrypt_temp_file)
                Dim canvas As Graphics
                If _ShowWatermark Then
                    Dim image_center_x As Long = (image.Width / 2)
                    Dim image_center_y As Long = image.Height / 2
                    canvas = Graphics.FromImage(image)
                    Dim opacity As Integer = 25  ' 1 * 255
                    Dim font As Font = New Font("Verdana", 18, FontStyle.Regular)
                    Dim messasge As String = "INVALID COPY"
                    Dim x_offset As Single = 0
                    Dim Y_offset As Single = 10
                    canvas.DrawString(messasge, font, New SolidBrush(Color.White), x_offset, image_center_y - Y_offset)

                End If

                Dim ms As New System.IO.MemoryStream

                image.Save(ms, System.Drawing.Imaging.ImageFormat.Png)
                If _ShowWatermark Then
                    canvas.Dispose()
                End If

                image.Dispose()

                IO.File.Delete(uncrypt_temp_file)
                Response.ContentType = "image/png"
                Response.BinaryWrite(ms.ToArray())
            Else
                Throw New Exception("No such file exist")
            End If
        End If

    End Sub

    Private Sub ConfirmPassword()

    End Sub
End Class