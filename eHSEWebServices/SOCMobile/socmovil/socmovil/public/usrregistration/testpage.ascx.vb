Public Class testpage
    Inherits PageControllerClass
    Implements IntUserSession



    Private _UserSession As socmovil.UserStateClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadUserSession()

    End Sub

    Public Sub LoadUserSession() Implements IntUserSession.LoadUserSession
        _UserSession = New socmovil.UserStateClass(Me.Session, Me.Response)
    End Sub

    Public Sub RefreshUserSessionData() Implements IntUserSession.RefreshUserSessionData
        If Not IsNothing(_UserSession) Then
            _UserSession.UserObjSession.Loadinfo()
        End If
    End Sub

    Public Property SessionUser As UserStateClass Implements IntUserSession.SessionUser
        Get
            Return _UserSession
        End Get
        Set(value As UserStateClass)
            _UserSession = value
        End Set
    End Property
End Class