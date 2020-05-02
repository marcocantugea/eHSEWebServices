Public Class t_savesignature
    Inherits PageBaseController
    Implements IntUserSession

    Private _SessionUser As UserStateClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadUserSession()
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

    Public Function EncrypSignature(filename As String, newfilename As String) As String

        Dim tmpfile As New System.IO.FileInfo(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("imgtempfolder") & "\" & filename)
        Dim folderout As String = HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationSettings.AppSettings("dsignaturesfolder") & "\"
        Dim encrypter As New eservices_core.com.utilities.EncriptWrapper(System.Configuration.ConfigurationSettings.AppSettings("enc-key") & SessionUser.UserObjSession.FullName)
        encrypter.EncryptFile(tmpfile, folderout)

        Dim filecreated As String = folderout & filename & ".dat"
        If Not IO.File.Exists(filecreated) Then           
            Throw New Exception("can not create ecripted signature")
        End If
        My.Computer.FileSystem.RenameFile(filecreated, newfilename & ".dat")
        IO.File.Delete(tmpfile.FullName)

        Dim return_file As String = newfilename & ".dat"

        Return return_file

    End Function
End Class