

Public Class UserStateClass

    Private _UserSessionState As eservices_core.com.objects.UserObj
    Private _Session As HttpSessionState

    Public ReadOnly Property UserObjSession As eservices_core.com.objects.UserObj
        Get
            Return _UserSessionState
        End Get
    End Property

    Sub New(Session As HttpSessionState, Response As HttpResponse)
        CheckSessionClass(Session, Response)
    End Sub
    Public Sub CheckSessionClass(Session As HttpSessionState, Response As HttpResponse)
        _UserSessionState = New eservices_core.com.objects.UserObj
        _Session = Session
        If Not IsNothing(Session("user_loged")) Then
            _UserSessionState = CType(Session("user_loged"), eservices_core.com.objects.UserObj)
        Else
            Response.Redirect("index.aspx?p=p_login")
        End If
    End Sub

    Public Sub RefreshUserSession()
        _UserSessionState.Loadinfo()

        _Session("user_loged") = _UserSessionState
    End Sub



End Class
