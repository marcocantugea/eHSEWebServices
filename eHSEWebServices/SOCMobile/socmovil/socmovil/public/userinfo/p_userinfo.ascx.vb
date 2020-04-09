Public Class p_userinfo
    Inherits System.Web.UI.UserControl
    Implements IntUserSession, IntPageControllerClass

    Private pagecontrollerclass As New PageControllerClass
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
        pagecontrollerclass.LoadLangConfig(CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadLanguage() Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub

    Public Sub LoadLanguage(session As HttpSessionState) Implements IntPageControllerClass.LoadLanguage
        pagecontrollerclass.LoadLangConfig(CType(session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader))
    End Sub
End Class