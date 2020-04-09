Public Class t_updateusercompanyinfo
    Inherits System.Web.UI.Page
    Implements IntUserSession, IntConfig

    Private _Globalconfiguration As socmobile_core.com.configuration.GlobalConfReader
    Private _SessionUser As UserStateClass

    Public ReadOnly Property GlobalConfigReader
        Get
            Return _Globalconfiguration
        End Get
    End Property
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

    Public Property Configuration As socmobile_core.com.configuration.GlobalConfReader Implements IntConfig.Configuration
        Get
            Return _Globalconfiguration
        End Get
        Set(value As socmobile_core.com.configuration.GlobalConfReader)
            _Globalconfiguration = value
        End Set
    End Property

    Public Function GetValue(value As String) As String Implements IntConfig.GetValue
        Return _Globalconfiguration.GetValue(value)
    End Function

    Public Sub LoadConfig() Implements IntConfig.LoadConfig
        _Globalconfiguration = New socmobile_core.com.configuration.GlobalConfReader
        _Globalconfiguration.LoadFileSetting(HttpContext.Current.Request.PhysicalApplicationPath & System.Configuration.ConfigurationManager.AppSettings("GlobalConfigFile"))
    End Sub
End Class